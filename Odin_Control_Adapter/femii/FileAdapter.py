"""File Adapter.

Adapter which allows files to be uploaded to the FEM, and for a QSPI script to be run server side
Ben Edwards, DSSG, STFC. 2020
"""
import logging
import os
import subprocess

import base64

from tornado.escape import json_decode

from odin.adapters.adapter import ApiAdapter, ApiAdapterResponse, request_types, response_types
from odin.adapters.parameter_tree import ParameterTree, ParameterTreeError


class FileAdapter(ApiAdapter):
    """ApiAdapter for handling files on the FEM-II Module.

    Adapter which allows files to be uploaded to the FEM-II Module
    and to program the onboard flash
    """

    def __init__(self, **kwargs):
        """Initialize the FileAdapter object.

        This constructor initializes the FileAdapter object.

        :param kwargs: keyword arguments specifying options
        """
        # Intialise superclass
        super(FileAdapter, self).__init__(**kwargs)
        fileDirectory = self.options.get('fpga_location', 'fpgafiles/')
        self.serverFileHandler = ServerFileHandler(fileDirectory)
        logging.debug('File Adapter loaded')

    @response_types('application/json', default='application/json')
    def get(self, path, request):
        """Handle an HTTP GET request.

        This method handles an HTTP GET request, returning a JSON response.

        :param path: URI path of request
        :param request: HTTP request object
        :return: an ApiAdapterResponse object containing the appropriate response
        """
        try:
            response = self.serverFileHandler.get(path)
            status_code = 200
        except ParameterTreeError as e:
            response = {'error': str(e)}
            status_code = 500

        content_type = 'application/json'

        return ApiAdapterResponse(response, content_type=content_type,
                                  status_code=status_code)

    @request_types('application/json')
    @response_types('application/json', default='application/json')
    def put(self, path, request):
        """Handle an HTTP PUT request.

        This method handles an HTTP PUT request, returning a JSON response.

        :param path: URI path of request
        :param request: HTTP request object
        :return: an ApiAdapterResponse object containing the appropriate response
        """
        content_type = 'application/json'

        try:
            data = json_decode(request.body)
            self.serverFileHandler.set(path, data)
            response = self.serverFileHandler.get(path)
            status_code = 200
        except (TypeError, ValueError) as e:
            response = {'error': 'Failed to decode PUT request body: {}'.format(str(e))}
            status_code = 400

        logging.debug(response)
        return ApiAdapterResponse(response, content_type=content_type,
                                  status_code=status_code)

    def delete(self, path, request):
        """Handle an HTTP DELETE request.

        This method handles an HTTP DELETE request, returning a JSON response.

        :param path: URI path of request
        :param request: HTTP request object
        :return: an ApiAdapterResponse object containing the appropriate response
        """
        response = 'File Adapter: DELETE on path {}'.format(path)
        status_code = 200

        logging.debug(response)

        return ApiAdapterResponse(response, status_code=status_code)


class ServerFileHandler():
    """File Handler object.

    Allows the client side to send files to the server side and to program the FEM Flash.
    """

    def __init__(self, fileDirectory):
        """Initialize the File Handler Object.

        This constructer initialises the File Handler object by setting the server side file path
        and setting up the parameter tree
        """
        self.filePath = fileDirectory

        try:  # populate the parameter tree
            self.param_tree = ParameterTree({
                "files": {
                    "program": (self.listFiles, self.programQSPI),
                    "upload": (None, self.uploadFile)
                }
            })
        except ValueError:
            print('Non-numeric input detected.')

        self.fileName = ""
        self.expectedChunks = 0
        self.receivedChunks = 0
        self.fileChunks = [None] * 2

    def uploadFile(self, data):
        """Store uploaded file chunks and reconstruct the file.

        This method prepares the adapter to receive a file when receiving a negative number,
        Then stores the received chunks till all expected chunks are received,
        Then reconstructs the file from the chunks
        """
        if (data[0] < 0):
            self.fileName = data[1]
            self.expectedChunks = -1 * data[0]
            self.receivedChunks = 0
            self.fileChunks = [None] * self.expectedChunks
        else:
            self.fileChunks[data[0]] = base64.b64decode(data[1])
            self.receivedChunks += 1

        if (self.receivedChunks == self.expectedChunks):
            fileAsBinary = ''.join(self.fileChunks)
            fout = open(self.filePath + "copy_" + self.fileName, "wb")
            fout.write(fileAsBinary)

    def listFiles(self):
        """List all bin files in the file directory from the config."""
        return [x for x in os.listdir(self.filePath) if x.endswith(".bin")]

    def programQSPI(self, data):
        """Program the QSPI Flash.

        Uses a subprocess to program the flash via the qspi_programmer
        """
        proc = subprocess.Popen(["ls", "-l"], stdout=subprocess.PIPE)
#        proc = subprocess.Popen(["qspi_programmer","--input_file", self.filePath + data[0],
#                "--operation", "program", "--flash_chip", data[1], "--size",  "28734812"],
#                stdout=subprocess.PIPE)
        while proc.poll() is None:
            line = proc.stdout.readline()
            if line:
                logging.debug("out:" + line.strip())

    def get(self, path, wants_metadata=False):
        """Get the parameter tree."""
        return self.param_tree.get(path, wants_metadata)

    def set(self, path, data):
        """Set the parameter tree."""
        return self.param_tree.set(path, data)
