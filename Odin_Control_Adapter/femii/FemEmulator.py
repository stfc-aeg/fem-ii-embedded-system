"""Fem Adapter.

Adapter which emulates the FEM-II modules onboard hardware
Benjamin Edwards, DSSG, STFC. 2020
"""
from odin.adapters.parameter_tree import ParameterTree
from random import randrange


class Fem():
    """FEM object, emulating a single FEM-II module.

    Emulates communication to the underlying hardware
    """

    def __init__(self):
        """Initialize the Fem Object.

        This constructer initialises the FEM object by creating dummy vlaues for the registers
        """
        try:
            # Initialise the get values for status parameters
            self.update_status()
            self.DONE = 0

            # Initialise the get values for control parameters
            self.FSEL_1_DE = randrange(2)
            self.FSEL_0_DE = randrange(2)
            self.F_CLK_SEL = randrange(2)
            self.QSFP_I2C_SEL0 = randrange(2)
            self.LPMODE0 = randrange(2)
            self.MODPRSL0 = randrange(2)
            self.LPMODE1 = randrange(2)
            self.MODPRSL1 = randrange(2)
            self.P1V0_EN_ZYNC = randrange(2)

        except ValueError:
            print('Non-numeric input detected.')

        try:  # populate the parameter tree
            self.param_tree = ParameterTree({
                "status": {
                    "FPGA_Configured": (lambda: self.DONE, None),
                    "Voltage_MGT_OK": (lambda: self.P1V0_MGT_PGOOD, None),
                    "Voltage_QDR_OK": (lambda: self.QDR_TERM_PGOOD, None),
                    "Voltage_DDR3_OK": (lambda: self.DDR3_TERM_PGOOD, None),
                    "Voltage_MGT_1V8_OK": (lambda: self.P1V8_MGT_PGOOD, None),
                    "Voltage_P1V2_OK": (lambda: self.P1V2_PGOOD, None),
                    "Voltage_P1V5_OK": (lambda: self.P1V5_PGOOD, None),
                    "Voltage_P1V8_OK": (lambda: self.P1V8_PGOOD, None),
                    "Voltage_P2V0_OK": (lambda: self.P2V0_PGOOD, None),
                    "Voltage_P1V0_OK": (lambda: self.P1V0_PGOOD, None),
                    "Voltage_P5V0_OK": (lambda: self.P5V0_PGOOD, None),
                    "Voltage_P3V3_OK": (lambda: self.P3V3_PGOOD, None)
                },
                "reset": {
                    "FPGA_FLASH_RST": (None, self.reset_Check),
                    "FPGA_SYSTEM_RST": (None, self.reset_Check),
                    "QSFP_U20_RST": (None, self.reset_Check),
                    "QSFP_U13_RST": (None, self.reset_Check),
                    "FPGA_INIT": (None, self.reset_Check),
                    "FPGA_RE-PROGRAM": (None, self.reset_Check)
                },
                "control": {
                    "FPGA_FLASH_SEL1": (lambda: self.FSEL_1_DE, self.FSEL_1_DE_set),
                    "FPGA_FLASH_SEL0": (lambda: self.FSEL_0_DE, self.FSEL_0_DE_set),
                    "SELECTED_FLASH_DEVICE": (self.flash_get, self.flash_set),
                    "FPGA_FLASH_CLK": (lambda: self.F_CLK_SEL, self.F_CLK_SEL_set),
                    "QSFP_I2C_BUS_SEL": (lambda: self.QSFP_I2C_SEL0, self.QSFP_I2C_SEL0_set),
                    "QSFP_U20_LPMODE": (lambda: self.LPMODE0, self.LPMODE0_set),
                    "QSFP_U20_MODPRS": (lambda: self.MODPRSL0, self.MODPRSL0_set),
                    "QSFP_U13_LPMODE": (lambda: self.LPMODE1, self.LPMODE1_set),
                    "QSFP_U13_MODPRS": (lambda: self.MODPRSL1, self.MODPRSL1_set),
                    "FEM_MODE-LPOWER": (lambda: self.P1V0_EN_ZYNC, self.P1V0_EN_ZYNC_set)
                }
            })
        except ValueError:  # excepts need revision to be meaningful
            print('Non-numeric input detected.')

    # parameter tree wrapper functions for control registers
    def FSEL_1_DE_set(self, value):
        """Set the dummy control register."""
        self.FSEL_1_DE = value

    def FSEL_0_DE_set(self, value):
        """Set the dummy control register."""
        self.FSEL_0_DE = value

    def F_CLK_SEL_set(self, value):
        """Set the dummy control register."""
        self.F_CLK_SEL = value

    def QSFP_I2C_SEL0_set(self, value):
        """Set the dummy control register."""
        self.QSFP_I2C_SEL0 = value

    def LPMODE0_set(self, value):
        """Set the dummy control register."""
        self.LPMODE0 = value

    def MODPRSL0_set(self, value):
        """Set the dummy control register."""
        self.MODPRSL0 = value

    def LPMODE1_set(self, value):
        """Set the dummy control register."""
        self.LPMODE1 = value

    def MODPRSL1_set(self, value):
        """Set the dummy control register."""
        self.MODPRSL1 = value

    def P1V0_EN_ZYNC_set(self, value):
        """Set the dummy control register."""
        self.P1V0_EN_ZYNC = value

    def reset_Check(self, value):
        """Check reset commands are received by flipping the DONE status register."""
        self.DONE = int(not self.DONE)

    def flash_set(self, value):
        """Set the selected flash.

        This method Set the currently selected flash by setting the FSEL registers
        as the binary interpretation with FSEL_0 the LSB
        :param value: Integer representing the flash to be selected
        """
        value = int(value)
        self.FSEL_0_DE = (value % 2)
        self.FSEL_1_DE = (value / 2)

    def flash_get(self):
        """Get the currently selected flash.

        This method calculates and returns the currently selected flash from the FSEL registers
        :return : An integer denoting the selected flash
        """
        return (self.FSEL_0_DE + (2 * self.FSEL_1_DE))

    def update_status(self):
        """Randomise status registers.

        Emulates registes chaniging on the hardware by randomising status registers
        Except the DONE register which is reserved for checking Reset register functionality
        """
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
        """Get the parameter tree."""
        return self.param_tree.get(path, wants_metadata)

    def set(self, path, data):
        """Set the parameter tree."""
        return self.param_tree.set(path, data)
