"""Fem Adapter.

Adapter which exposes the underlying FEM-II module and access to
it's onboard hardware including GPIO access, the QSPI driver and internal monitoring devices,
or emulates said device.
Sophie Kirkham, Application Engineering Group, STFC. 2019
"""
import logging
from time import sleep
from concurrent import futures

from tornado.ioloop import IOLoop
from tornado.concurrent import run_on_executor
from tornado.escape import json_decode

from odin.adapters.adapter import ApiAdapter, ApiAdapterResponse, request_types, response_types
from odin.adapters.parameter_tree import ParameterTreeError


class FemAdapter(ApiAdapter):
    """ApiAdapter for the FEM-II Module.

    Adapter which exposes the underlying FEM-II module and access to
    it's onboard hardware including GPIO access, the QSPI driver and internal monitoring devices,
    or emulates said device.
    """

    executor = futures.ThreadPoolExecutor(max_workers=1)

    def __init__(self, **kwargs):
        """Initialize the FemAdapter object.

        This constructor initializes the FemAdapter object.
        :param kwargs: keyword arguments specifying options including emulation
        """
        # Intialise superclass
        super(FemAdapter, self).__init__(**kwargs)

        if not int(self.options.get('emulator_enable', 0)):
            from Fem import Fem
        else:
            from FemEmulator import Fem
            logging.debug('Emulating Fem')
            refresh_interval = float(self.options.get('emulator_refresh_interval', 0))
            if (refresh_interval > 0):
                logging.debug(
                    "Launching background task with interval %.2f secs", refresh_interval
                )
                self.refresh_status(refresh_interval)
            logging.debug('Fem Adapter loaded with emulated Fem')

        self.fem = Fem()
        logging.debug('Fem Adapter loaded')

    @response_types('application/json', default='application/json')
    def get(self, path, request):
        """Handle an HTTP GET request.

        This method handles an HTTP GET request, returning a JSON response.
        :param path: URI path of request
        :param request: HTTP request object
        :return: an ApiAdapterResponse object containing the appropriate response
        """
        try:
            response = self.fem.get(path)
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
            self.fem.set(path, data)
            response = self.fem.get(path)
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
        response = 'FemAdapter: DELETE on path {}'.format(path)
        status_code = 200

        logging.debug(response)

        return ApiAdapterResponse(response, status_code=status_code)

    @run_on_executor
    def refresh_status(self, refresh_interval):
        """Run the emulator background refresh.

        This randomizes the values of the status controls of the emulated fem,
        before adding itself as a callback to the IOLoop instance to be called again.
        :param task_interval: time to sleep until task is run again
        """
        logging.debug("%s: refreshing status", self.name)
        sleep(refresh_interval)
        self.fem.update_status()
        IOLoop.instance().add_callback(self.refresh_status, refresh_interval)
