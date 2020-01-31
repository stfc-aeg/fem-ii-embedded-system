""" Fem Adapter

Adapter which emulates the underlying FEM-II module 
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
            self.update_status()

            self.FSEL_1_DE = randrange(2)
            self.FSEL_0_DE = randrange(2)
            self.F_CLK_SEL = randrange(2)
            self.QSFP_I2C_SEL0 = randrange(2)
            self.LPMODE0 = randrange(2)
            self.MODPRSL0 = randrange(2)
            self.LPMODE1 = randrange(2)
            self.MODPRSL1 = randrange(2)
            self.P1V0_EN_ZYNC = randrange(2)

            self.set_flash_from_FSEL()
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
                    "ZYNC_F_RST": (None, lambda value: None),
                    "ZYNC_FW_RST_N": (None, lambda value: None),
                    "RESETL0": (None, lambda value: None),
                    "RESETL1": (None, lambda value: None),
                    "V7_INIT_B": (None, lambda value: None),
                    "V7_PRG_ZY": (None, lambda value: None)
                },
                "control":{
                    "FSEL_1_DE":(lambda: self.FSEL_1_DE, self.FSEL_1_DE_set),
                    "FSEL_0_DE":(lambda: self.FSEL_0_DE, self.FSEL_0_DE_set),
                    "SELECTED_FLASH_DEVICE":(lambda: self.selected_flash, self.set_flash),
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
        self.set_flash_from_FSEL()
    def FSEL_0_DE_set(self, value):
        self.FSEL_0_DE = value
        self.set_flash_from_FSEL()
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

    def set_flash(self, value):
        value = int(value)
        self.selected_flash = value
        self.FSEL_0_DE = (value%2)
        self.FSEL_1_DE = (value/2)
        
    def set_flash_from_FSEL(self):
        self.selected_flash = self.FSEL_0_DE + (2 * self.FSEL_1_DE)

    def update_status(self):
            self.DONE = randrange(2)
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


    def get(self, path):
        """Main get method for the parameter tree"""
        return self.param_tree.get(path)

    def set(self, path, data):
        """Main set method for the parameter tree"""
        return self.param_tree.set(path, data)
