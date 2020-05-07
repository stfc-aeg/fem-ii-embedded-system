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
                    "DONE":(lambda: self.DONE, None),
                    "P1V0_MGT_PGOOD":(lambda: self.P1V0_MGT_PGOOD, None),
                    "QDR_TERM_PGOOD":(lambda: self.QDR_TERM_PGOOD, None),
                    "DDR3_TERM_PGOOD":(lambda: self.DDR3_TERM_PGOOD, None),
                    "P1V8_MGT_PGOOD":(lambda: self.P1V8_MGT_PGOOD, None),
                    "P1V2_PGOOD":(lambda: self.P1V2_PGOOD, None),
                    "P1V5_PGOOD":(lambda: self.P1V5_PGOOD, None),
                    "P1V8_PGOOD":(lambda: self.P1V8_PGOOD, None),
                    "P2V0_PGOOD":(lambda: self.P2V0_PGOOD, None),
                    "P1V0_PGOOD":(lambda: self.P1V0_PGOOD, None),
                    "P5V0_PGOOD":(lambda: self.P5V0_PGOOD, None),
                    "P3V3_PGOOD":(lambda: self.P3V3_PGOOD, None)
                },
                "reset":{
                    "ZYNC_F_RST": (None, self.reset_Check),
                    "ZYNC_FW_RST_N": (None, self.reset_Check),
                    "RESETL0": (None, self.reset_Check),
                    "RESETL1": (None, self.reset_Check),
                    "V7_INIT_B": (None, self.reset_Check),
                    "V7_PRG_ZY": (None, self.reset_Check)
                },
                "control":{
                    "FSEL_1_DE":(lambda: self.FSEL_1_DE, self.FSEL_1_DE_set),
                    "FSEL_0_DE":(lambda: self.FSEL_0_DE, self.FSEL_0_DE_set),
                    "SELECTED_FLASH_DEVICE":(self.flash_get, self.flash_set),
                    "F_CLK_SEL":(lambda: self.F_CLK_SEL, self.F_CLK_SEL_set),
                    "QSFP_I2C_SEL0":(lambda: self.QSFP_I2C_SEL0,self.QSFP_I2C_SEL0_set),
                    "LPMODE0":(lambda: self.LPMODE0, self.LPMODE0_set),
                    "MODPRSL0":(lambda: self.MODPRSL0, self.MODPRSL0_set),
                    "LPMODE1":(lambda: self.LPMODE1, self.LPMODE1_set),
                    "MODPRSL1":(lambda: self.MODPRSL1, self.MODPRSL1_set),
                    "P1V0_EN_ZYNC":(lambda: self.P1V0_EN_ZYNC, self.P1V0_EN_ZYNC_set)
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
