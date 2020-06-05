""" Fem Adapter

Adapter which emulates the FEM-II modules onboard hardware
Benjamin Edwards, DSSG, STFC. 2020
"""
from odin.adapters.parameter_tree import ParameterTree, ParameterTreeError
from random import randrange

class Fem():
    """
    FEM object, representing a single FEM-II module.
    """

    def __init__(self):
        try:
            #Initialise the get values for status parameters
            self.update_status()
            self.DONE = 0

            #Initialise the get values for control parameters
            self.FSEL_1_DE = randrange(2)
            self.FSEL_0_DE = randrange(2)
            self.F_CLK_SEL = randrange(2)
            self.QSFP_I2C_SEL0 = randrange(2)
            self.LPMODE0 = randrange(2)
            self.MODPRSL0 = randrange(2)
            self.LPMODE1 = randrange(2)
            self.MODPRSL1 = randrange(2)
            self.P1V0_EN_ZYNC = randrange(2)

        #exception error handling needs further improvement
        except ValueError:
            print('Non-numeric input detected.')

        try: #populate the parameter tree
            self.param_tree = ParameterTree({
                "status":{
                    "FPGA_Configured":(lambda: self.DONE, None),
                    "Voltage_MGT_OK":(lambda: self.P1V0_MGT_PGOOD, None),
                    "Voltage_QDR_OK":(lambda: self.QDR_TERM_PGOOD, None),
                    "Voltage_DDR3_OK":(lambda: self.DDR3_TERM_PGOOD, None),
                    "Voltage_MGT_1V8_OK":(lambda: self.P1V8_MGT_PGOOD, None),
                    "Voltage_P1V2_OK":(lambda: self.P1V2_PGOOD, None),
                    "Voltage_P1V5_OK":(lambda: self.P1V5_PGOOD, None),
                    "Voltage_P1V8_OK":(lambda: self.P1V8_PGOOD, None),
                    "Voltage_P2V0_OK":(lambda: self.P2V0_PGOOD, None),
                    "Voltage_P1V0_OK":(lambda: self.P1V0_PGOOD, None),
                    "Voltage_P5V0_OK":(lambda: self.P5V0_PGOOD, None),
                    "Voltage_P3V3_OK":(lambda: self.P3V3_PGOOD, None)
                },
                "reset":{
                    "FPGA_FLASH_RST": (None, self.reset_Check),
                    "FPGA_SYSTEM_RST": (None, self.reset_Check),
                    "QSFP_U20_RST": (None, self.reset_Check),
                    "QSFP_U13_RST": (None, self.reset_Check),
                    "FPGA_INIT": (None, self.reset_Check),
                    "FPGA_RE-PROGRAM": (None, self.reset_Check)
                },
                "control":{
                    "FPGA_FLASH_SEL1":(lambda: self.FSEL_1_DE, self.FSEL_1_DE_set),
                    "FPGA_FLASH_SEL0":(lambda: self.FSEL_0_DE, self.FSEL_0_DE_set),
                    "SELECTED_FLASH_DEVICE":(self.flash_get, self.flash_set),
                    "FPGA_FLASH_CLK":(lambda: self.F_CLK_SEL, self.F_CLK_SEL_set),
                    "QSFP_I2C_BUS_SEL":(lambda: self.QSFP_I2C_SEL0,self.QSFP_I2C_SEL0_set),
                    "QSFP_U20_LPMODE":(lambda: self.LPMODE0, self.LPMODE0_set),
                    "QSFP_U20_MODPRS":(lambda: self.MODPRSL0, self.MODPRSL0_set),
                    "QSFP_U13_LPMODE":(lambda: self.LPMODE1, self.LPMODE1_set),
                    "QSFP_U13_MODPRS":(lambda: self.MODPRSL1, self.MODPRSL1_set),
                    "FEM_MODE-LPOWER":(lambda: self.P1V0_EN_ZYNC, self.P1V0_EN_ZYNC_set)
                }
            })
        except ValueError: #excepts need revision to be meaningful
            print('Non-numeric input detected.')


    #parameter tree wrapper functions for control registers
    def FSEL_1_DE_set(self, value):
        self.FSEL_1_DE = value
    def FSEL_0_DE_set(self, value):
        self.FSEL_0_DE = value
    def F_CLK_SEL_set(self, value):
        self.F_CLK_SEL = value
    def QSFP_I2C_SEL0_set(self, value):
        self.QSFP_I2C_SEL0 = value
    def LPMODE0_set(self, value):
        self.LPMODE0 = value
    def MODPRSL0_set(self, value):
        self.MODPRSL0 = value
    def LPMODE1_set(self, value):
        self.LPMODE1 = value
    def MODPRSL1_set(self, value):
        self.MODPRSL1 = value
    def P1V0_EN_ZYNC_set(self, value):
        self.P1V0_EN_ZYNC =value

    def reset_Check(self, value):
        '''To check reset put commands flips the state of the DONE status'''
        self.DONE = int(not self.DONE)

    # SELECTED_FLASH is the combination of FSEL_DE's with FSEL_0 as Least Significant Bit
    def flash_set(self, value):
        value = int(value)
        self.FSEL_0_DE = (value%2)
        self.FSEL_1_DE = (value/2)
    def flash_get(self):
        return (self.FSEL_0_DE + (2 * self.FSEL_1_DE))

    def update_status(self):
        '''randomise all status values between 0 and 1'''
        self.P1V0_MGT_PGOOD = randrange(2)
        self.QDR_TERM_PGOOD = randrange(2)
        self.DDR3_TERM_PGOOD = randrange(2)
        self.P1V8_MGT_PGOOD = randrange(2)
        self.P1V2_PGOOD = randrange(2)
        self.P1V5_PGOOD = randrange(2)
        self.P1V8_PGOOD = randrange(2)
        self.P2V0_PGOOD = randrange(2)
        self.P1V0_PGOOD = randrange(2)
        self.P5V0_PGOOD = randrange(2)
        self.P3V3_PGOOD = randrange(2)

    def get(self, path, wants_metadata=False):
        """Main get method for the parameter tree"""
        return self.param_tree.get(path, wants_metadata)

    def set(self, path, data):
        """Main set method for the parameter tree"""
        return self.param_tree.set(path, data)
