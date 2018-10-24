"""
    Script interface to QSPI Controller
    Using DEVMEM access through subprocess

"""


import sys
import argparse
import subprocess
import binascii
  

MUX_BASE = 0x41210008
MUX_SET = 0x104
MUX_DESET = 0x100
MUX_WIDTH = 32 #MUX Commands are in 32 bit

QSPI_CR_WIDTH = 32 #control register is 32 bit
QSPI_STD_WIDTH = 8 # all other QSPI commands are in 8 bit
QSPI_BASE = 0xA0030000
QSPI_CONFIG_R = 0x60
QSPI_STATUS_R = 0x64
QSPI_DTR = 0x68
QSPI_DRR = 0x6C
QSPI_SSR = 0x70

#Flash instruction codes
READ_ID = 0x90
WRITE_ENABLE = 0x06
WRITE_REG = 0x01
READ_STATUS = 0x05
READ_CONFIG = 0x35
READ_BAR = 0x16
READ_QUAD_OUT = 0x6B
READ_QUAD_IO = 0xEB


look_up = {"READ_ID" : READ_ID, 
        "WRITE_ENABLE" : WRITE_ENABLE, 
        "WRITE_REG" : WRITE_REG, 
        "READ_STATUS": READ_STATUS, 
        "READ_CONFIG": READ_CONFIG, 
        "READ_BAR": READ_BAR, 
        "READ_QUAD_OUT" : READ_QUAD_OUT, 
        "READ_QUAD_IO": READ_QUAD_IO
    }

#Reads the Spansion Flash ID, printing to terminal out 
def read_id():

    print("Reading SPANSION Flash ID")

    read_id_sequence = "devmem 0x41210008 32 0x104\n\
                        devmem 0xA0030060 32 0x000001E6\n\
                        devmem 0xA0030060 32 0x000001E6\n\
                        devmem 0xA0030068 8 0x90\n\
                        devmem 0xA0030068 8 0x00\n\
                        devmem 0xA0030068 8 0x00\n\
                        devmem 0xA0030068 8 0x00\n\
                        devmem 0xA0030068 8 0xAB\n\
                        devmem 0xA0030068 8 0xAB\n\
                        devmem 0xA0030070 8 0x00\n\
                        devmem 0xA0030060 32 0x00000086\n\
                        devmem 0xA0030070 8 0x01\n\
                        devmem 0xA0030060 32 0x00000186\n\
                        devmem 0xA003006C 8\n\
                        devmem 0xA003006C 8\n\
                        devmem 0xA003006C 8\n\
                        devmem 0xA003006C 8\n\
                        devmem 0xA003006C 8\n\
                        devmem 0xA003006C 8\n\
                        devmem 0x41210008 32 0x100\n"

    id_pipe = subprocess.Popen(read_id_sequence, shell=True, stdout=subprocess.PIPE)

    output, error = id_pipe.communicate()
    print(output.decode('utf8'))
  
#Reads the Spansion Flash Status Register, printing to terminal out, returns the status value 
def read_status_register():

    print("Reading SPANSION Flash Status Register")

    read_status_sequence = "devmem 0x41210008 32 0x104 \n\
                            devmem 0xA0030060 32 0x000001E6 \n\
                            devmem 0xA0030068 8 0x05\n\
                            devmem 0xA0030068 8 0x00\n\
                            devmem 0xA0030070 8 0x00\n\
                            devmem 0xA0030060 32 0x00000086\n\
                            devmem 0xA0030070 8 0x01\n\
                            devmem 0xA0030060 32 0x00000186\n\
                            devmem 0xA003006C 8\n\
                            devmem 0xA003006C 8\n\
                            devmem 0x41210008 32 0x100\n"

    id_pipe = subprocess.Popen(read_status_sequence, shell=True, stdout=subprocess.PIPE)
        
    output, error = id_pipe.communicate()
    
    status_register = output[5:] #first byte is dummy data, we only want the second byte
    print(status_register.decode('utf8'))
    return status_register

#Reads the Spansion Flash Config Register, printing to terminal out
def read_config_register():

    print("Reading SPANSION Flash Configuration Register")
    
    read_config_sequence = "devmem 0x41210008 32 0x104\n\
                            devmem 0xA0030060 32 0x000001E6\n\
                            devmem 0xA0030068 8 0x35\n\
                            devmem 0xA0030068 8 0x00\n\
                            devmem 0xA0030070 8 0x00\n\
                            devmem 0xA0030060 32 0x00000086\n\
                            devmem 0xA0030070 8 0x01\n\
                            devmem 0xA0030060 32 0x00000186\n\
                            devmem 0xA003006C 8\n\
                            devmem 0xA003006C 8\n\
                            devmem 0x41210008 32 0x100\n"
    
    id_pipe = subprocess.Popen(read_config_sequence, shell=True, stdout=subprocess.PIPE)

    output, error = id_pipe.communicate()

    config_register = output[5:] #first byte is dummy data, we only want the second byte
    print(config_register.decode('utf8'))

# Reads the Bank Address Register, used to check the addressing mode of the spansion flash device
def read_BAR_register():

    print("Reading SPANSION Flash Bank Address Register")

    read_bar_sequence = "devmem 0x41210008 32 0x104\n\
                        devmem 0xA0030060 32 0x000001E6\n\
                        devmem 0xA0030068 8 0x16\n\
                        devmem 0xA0030068 8 0x00\n\
                        devmem 0xA0030070 8 0x00\n\
                        devmem 0xA0030060 32 0x00000086\n\
                        devmem 0xA0030070 8 0x01\n\
                        devmem 0xA0030060 32 0x00000186\n\
                        devmem 0xA003006C 8\n\
                        devmem 0xA003006C 8\n\
                        devmem 0x41210008 32 0x100\n"
    
    id_pipe = subprocess.Popen(read_bar_sequence, shell=True, stdout=subprocess.PIPE)
   
    output, error = id_pipe.communicate()
    print(output.decode('utf8'))

def write_bar(bar_reg):

    print("Writing Bank Address Register in the SPANSION Flash to %s ." % (bar_reg))


    write_bar_sequence ="devmem 0x41210008 32 0x104\n\
                        devmem 0xA0030060 32 0x000001E6\n\
                        devmem 0xA0030068 8 0x17\n\
                        devmem 0xA0030068 8 " + bar_reg +"\n\
                        devmem 0xA0030070 8 0x00\n\
                        devmem 0xA0030060 32 0x00000086\n\
                        devmem 0xA0030070 8 0x01\n\
                        devmem 0xA0030060 32 0x00000186\n\
                        devmem 0x41210008 32 0x100\n"


    id_pipe = subprocess.Popen(write_bar_sequence, shell=True, stdout=subprocess.PIPE)
    output, error = id_pipe.communicate()
    print(output.decode('utf8'))

    read_BAR_register()


"""
    Writes to the status and configuration register of the spansion flash device.
    Calls write enable and read_status_register and config_register to check results
"""
def write_registers(status_reg, config_reg):

    print("Writing Status and Configuration Registers in the SPANSION Flash to %s : %s ." % (status_reg, config_reg))

    write_enable() #check that write enable is set 

    write_reigster_sequence ="devmem 0x41210008 32 0x104\n\
                            devmem 0xA0030060 32 0x000001E6\n\
                            devmem 0xA0030068 8 0x01\n\
                            devmem 0xA0030068 8 " + status_reg +"\n\
                            devmem 0xA0030068 8 " + config_reg +"\n\
                            devmem 0xA0030070 8 0x00\n\
                            devmem 0xA0030060 32 0x00000086\n\
                            devmem 0xA0030070 8 0x01\n\
                            devmem 0xA0030060 32 0x00000186\n\
                            devmem 0x41210008 32 0x100\n"

    id_pipe = subprocess.Popen(write_reigster_sequence, shell=True, stdout=subprocess.PIPE)
    output, error = id_pipe.communicate()
    print(output.decode('utf8'))

    read_status_register() #read back out the status reg
    read_config_register() #read back out the config reg

#sets the write enable latch inside the status register. checking if write enable is already set first.
def write_enable():

    write_latch = int(read_status_register(), 16) #read_status_register() #check if already set..

    if write_latch != 0x02:
        
        print("Setting Write Enable in the SPANSION Flash Status Register")

        write_enable_sequence = "devmem 0x41210008 32 0x104\n\
                                devmem 0xA0030060 32 0x000001E6\n\
                                devmem 0xA0030068 8 0x06\n\
                                devmem 0xA0030068 8 0x00\n\
                                devmem 0xA0030068 8 0x01\n\
                                devmem 0xA0030070 8 0x00\n\
                                devmem 0xA0030060 32 0x00000086\n\
                                devmem 0xA0030070 8 0x01\n\
                                devmem 0xA0030060 32 0x00000186\n\
                                devmem 0x41210008 32 0x100\n"
    
        id_pipe = subprocess.Popen(write_enable_sequence, shell=True, stdout=subprocess.PIPE)
        output, error = id_pipe.communicate()
        print(output.decode('utf8'))
    

        write_latch = int(read_status_register(), 16)

        if write_latch == 0x02:
            print("Write Enabled")
        else:
            print('Write Failed to Enable')

    else:
        print("Flash Write is Already Enabled")


def read_quad_out_memory(mem_address, num_bytes):



    address = int(mem_address, 16)  #convert the memory address into a string

    #formatting this file = od -A x -t x1 qspi_bitfile.bin 
    output_file = open("qspi_bitfile_128.bin", "wb") #create a binary file to write the output to
    print_out = ""

    increment = 128
    #read in blocks of 16 bytes.
    #for x in range(0, 28734812, 16): 
    for x in range(0, num_bytes, increment): 
       
        print(x)
        read_mem_sequence = "" #clear the read_sequence every time so we dont repeat.

        #split the starting 32 bit memory address into 4 bytes 
        msb = (address & 0xFF000000) >> 24
        mid1= (address & 0x00FF0000) >> 16 
        mid2 = (address & 0x0000FF00) >> 8
        lsb = (address & 0x000000FF)
        
        '''
        print("Mem Address:  %s" % hex(address))
        print(hex(msb))
        print(hex(mid1))
        print(hex(mid2))
        print(hex(lsb))
        '''

        # first part of memory read sequence
        read_mem_sequence +="devmem 0x41210008 32 0x104\n" + "devmem 0xA0030060 32 0x000001E6\n" + "devmem 0xA0030068 8 0x6C\n" + "devmem 0xA0030068 8 " + hex(msb).rstrip('L') + "\n" + "devmem 0xA0030068 8 " + hex(mid1) + "\n" + "devmem 0xA0030068 8 " + hex(mid2) + "\n" + "devmem 0xA0030068 8 " + hex(lsb) + "\n"

        #we need to read 16 bytes of real data, plus there is ALWAYS 9 bytes (4 addressing, 5 preamble) of preamble nonsense (00's 0c cc etc), so we need increment + 9 dummy bytes
        #for x in range(0, 24):
        for x in range(0, (increment+9)):
            read_mem_sequence += "devmem 0xA0030068 8 0xAA\n"

        #add the next section to the read sequence
        read_mem_sequence +="devmem 0xA0030070 8 0x00\n\
                            devmem 0xA0030060 32 0x00000086\n\
                            devmem 0xA0030070 8 0x01\n\
                            devmem 0xA0030060 32 0x00000186\n"
        
        #print(read_mem_sequence)

       
        #perform that devmem sequence before doing any actual reads from the rx buffer
        id_pipe = subprocess.Popen(read_mem_sequence, shell=True, stdout=subprocess.PIPE)
        output, error = id_pipe.communicate()
        print_out += output
        
        
        # we want to read out the first 9 bytes of preamble but not store it in the binary file
        for x in range(0, 9):#read out and discard the first 9 bytes (preamble junk)
            read_byte = "devmem 0xA003006C 8\n"
            #print(read_byte)
            id_pipe = subprocess.Popen(read_byte, shell=True, stdout=subprocess.PIPE)
            junk, error = id_pipe.communicate()
      
        # now we want to read our the real 128 bytes, convert to binary and store in the binary file.
        #for x in range(0, 16):#read the real 16  bytes of data, convert to binary and write to bin file
        for x in range(0, increment):#read the real 128  bytes of data, convert to binary and write to bin file
            read_byte = "devmem 0xA003006C 8\n"
            id_pipe = subprocess.Popen(read_byte, shell=True, stdout=subprocess.PIPE)
            byte, error = id_pipe.communicate()
            print_out += byte
            byte = str(byte)[2:4]
            #print(byte)
            binary_data = binascii.unhexlify(byte)
            output_file.write(binary_data)

        #output = str(output)[39:]
        #print_out += output
        # add 16 to the address so we move to the next address boundary in the bin file.
        #address += 16
        
        address += 128
        #print("end of loop int address %d" % address)
        #print("end of loop hex address %s" % hex(address))
    
    #print(read_mem_sequence)
    #print(print_out)

    
def read_quad_io_memory():
    pass


def main():

    parser = argparse.ArgumentParser()

    parser.add_argument("-operation", "--operation", help="Function to perform, \
                        default = READ_ID, 0x90", default="READ_ID")

    parser.add_argument("-status_val", "--status_val", help="Status Register Value to Write, \
                        default = 0x00", default= 0x00)

    parser.add_argument("-config_val", "--config_val", help="Configuration Register Value to Write, \
                        default = 0x02 - Latency Code 00, Quad Mode Enabled", default= 0x02)

    parser.add_argument("-bar_val", "--bar_val", help="Bank Address Register Value to Write, \
                        default = 0x40 - 4 Byte Addressing", default= 0x40)
    
    parser.add_argument("-read_address", "--read_address", help="24 Bit Address to Start Reading Flash Memory, \
                        default = 0x000120", default= "0x000120")

    parser.add_argument("-num_bytes", "--num_bytes", help="Number of Bytes to Read From Flash Memory, \
                        default = 28734812", default=28734812)
    
    args = parser.parse_args()

    if args.operation not in look_up:
        print("Invalid operation.. quiting")
        exit(1)
    else:
        operation = look_up[args.operation]

    # Set up the echo command and direct the output to a pipe
    p1 = subprocess.Popen(['echo', args.operation], stdout=subprocess.PIPE)
    p2 = subprocess.Popen(['echo', str(operation)], stdout=subprocess.PIPE)

    # Run the command
    output = "String operation: " + p1.communicate()[0] + "Instruction Code: " + p2.communicate()[0]
    
    print(output)

    if args.operation == "READ_ID":
        read_id()
    elif args.operation == "WRITE_ENABLE":
        write_enable()
    elif args.operation == "WRITE_REG":
        write_registers(args.status_val, args.config_val)
    elif args.operation == "READ_STATUS":
        read_status_register()
    elif args.operation == "READ_CONFIG":
        read_config_register()
    elif args.operation == "READ_BAR":
        read_BAR_register()
    elif args.operation == "WRITE BAR":
        write_bar(args.bar_val)
    elif args.operation == "READ_QUAD_OUT":

    
        if args.num_bytes is not 28734812:
            int_num_bytes = int(args.num_bytes, 10)
        else: 
            int_num_bytes = args.num_bytes

        #print(int_num_bytes)

        read_quad_out_memory(args.read_address, int_num_bytes)
    elif args.operation == "READ_QUAD_IO":
        read_quad_io_memory()
    else:
        pass


if __name__ == "__main__":
    main()
