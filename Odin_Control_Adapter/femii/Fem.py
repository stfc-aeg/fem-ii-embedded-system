"""Fem.

Adllows access to the FEM-II module and it's onboard hardware
including GPIO access, the QSPI driver and internal monitoring devices.
Sophie Kirkham, Application Engineering Group, STFC. 2019
"""
import gpio
from odin.adapters.parameter_tree import ParameterTree


class Fem():
    """FEM object, representing a single FEM-II module.

    Facilitates communication to the underlying hardware resources
    onboard the FEM-II.
    GPIO    0x00
    """

    def __init__(self):
        """Initialize the Fem Object.

        This constructer initialises the FEM object by linking register names to GPIO ports
        """
        try:
            # BELOW: list of status register names and the corresponding GPIO port address
            self.status_register = {"DONE": 1006, "P1V0_MGT_PGOOD": 1005, "QDR_TERM_PGOOD": 1004,
                                    "DDR3_TERM_PGOOD": 1003, "P1V8_MGT_PGOOD": 1002,
                                    "P1V2_PGOOD": 1001, "P1V5_PGOOD": 1000, "P1V8_PGOOD": 999,
                                    "P2V0_PGOOD": 998, "P1V0_PGOOD": 997, "P5V0_PGOOD": 996,
                                    "P3V3_PGOOD": 995}
            self.status_names = self.status_register.keys()

            # BELOW: list of reset register names and the corresponding GPIO port address
            self.reset_register = {"ZYNC_F_RST": 1010, "ZYNC_FW_RST_N": 1011, "RESETL0": 1012,
                                   "RESETL1": 1013, "V7_INIT_B": 1014, "V7_PRG_ZY": 1015}
            self.reset_names = self.reset_register.keys()
            """
            from firmware
            ZYNC_F_RST           <= reset_gpio_wo(0);
            ZYNC_FW_RST_N        <= reset_gpio_wo(1); -- active HIGH!!! signal
            RESETL0              <= NOT reset_gpio_wo(2); -- active low signal
            RESETL1              <= NOT reset_gpio_wo(3); -- active low signal
            V7_INIT_B            <= NOT reset_gpio_wo(4); -- active low signal
            V7_PRG_ZY            <= reset_gpio_wo(5);
            """

            # BELOW: list of control register names and the corresponding GPIO port address
            self.control_register = {"FSEL_1_DE": 986, "FSEL_0_DE": 987, "F_CLK_SEL": 988,
                                     "QSFP_I2C_SEL0": 989, "LPMODE0": 990, "MODPRSL0": 991,
                                     "LPMODE1": 992, "MODPRSL1": 993, "P1V0_EN_ZYNC": 994}
            self.control_names = self.control_register.keys()
            self.control_register_local = {"FSEL_1_DE": 0, "FSEL_0_DE": 0, "F_CLK_SEL": 0,
                                           "QSFP_I2C_SEL0": 0, "LPMODE0": 0, "MODPRSL0": 0,
                                           "LPMODE1": 0, "MODPRSL1": 0, "P1V0_EN_ZYNC": 1}

            """
             -- *** Control Register bis assignments for register control ***
            FSEL_1_DE <= control_reg(0);
            FSEL_0_DE <= control_reg(1);
            F_CLK_SEL <= control_reg(2);
            QSFP_I2C_SEL0 <= control_reg(3);
            LPMODE0 <= control_reg(4);
            MODPRSL0 <= control_reg(5);
            LPMODE1 <= control_reg(6);
            MODPRSL1 <= control_reg(7);
            P1V0_EN_ZYNC <= control_reg(8);

            """
        # exception error handling needs further improvement
        except ValueError:
            print('Non-numeric input detected.')

        try:  # setup the gpio registers
            self.gpio_setup()
        except BaseException as e:
            print("Failed to do something: ", e)
        finally:
            print("Closing all gpio instances")
            gpio.cleanup()

        try:  # populate the parameter tree
            self.param_tree = ParameterTree({
                "status": {
                    "FPGA_Configured": (lambda: gpio.read(
                            self.status_register.get("DONE")), None),
                    "Voltage_MGT_OK": (lambda: gpio.read(
                            self.status_register.get("P1V0_MGT_PGOOD")), None),
                    "Voltage_QDR_OK": (lambda: gpio.read(
                            self.status_register.get("QDR_TERM_PGOOD")), None),
                    "Voltage_DDR3_OK": (lambda: gpio.read(
                            self.status_register.get("DDR3_TERM_PGOOD")), None),
                    "Voltage_MGT_1V8_OK": (lambda: gpio.read(
                            self.status_register.get("P1V8_MGT_PGOOD")), None),
                    "Voltage_P1V2_OK": (lambda: gpio.read(
                            self.status_register.get("P1V2_PGOOD")), None),
                    "Voltage_P1V5_OK": (lambda: gpio.read(
                            self.status_register.get("P1V5_PGOOD")), None),
                    "Voltage_P1V8_OK": (lambda: gpio.read(
                            self.status_register.get("P1V8_PGOOD")), None),
                    "Voltage_P2V0_OK": (lambda: gpio.read(
                            self.status_register.get("P2V0_PGOOD")), None),
                    "Voltage_P1V0_OK": (lambda: gpio.read(
                            self.status_register.get("P1V0_PGOOD")), None),
                    "Voltage_P5V0_OK": (lambda: gpio.read(
                            self.status_register.get("P5V0_PGOOD")), None),
                    "Voltage_P3V3_OK": (lambda: gpio.read(
                            self.status_register.get("P3V3_PGOOD")), None)
                },
                "reset": {
                    "FPGA_FLASH_RST": (None, self.ZYNC_F_RST_set),
                    "FPGA_SYSTEM_RST": (None, self.ZYNC_FW_RST_N_set),
                    "QSFP_U20_RST": (None, self.RESETL0_set),
                    "QSFP_U13_RST": (None, self.RESETL1_set),
                    "FPGA_INIT": (None, self.V7_INIT_B_set),
                    "FPGA_RE-PROGRAM": (None, self.V7_PRG_ZY_set)
                },
                "control": {
                    "FPGA_FLASH_SEL1": (lambda: self.read_control_reg("FSEL_1_DE"),
                                        self.FSEL_1_DE_set),
                    "FPGA_FLASH_SEL0": (lambda: self.read_control_reg("FSEL_0_DE"),
                                        self.FSEL_0_DE_set),
                    "SELECTED_FLASH_DEVICE": (self.get_selected_flash, self.set_flash),
                    "FPGA_FLASH_CLK": (lambda: self.read_control_reg("F_CLK_SEL"),
                                       self.F_CLK_SEL_set),
                    "QSFP_I2C_BUS_SEL": (lambda: self.read_control_reg("QSFP_I2C_SEL0"),
                                         self.QSFP_I2C_SEL0_set),
                    "QSFP_U20_LPMODE": (lambda: self.read_control_reg("LPMODE0"),
                                        self.LPMODE0_set),
                    "QSFP_U20_MODPRS": (lambda: self.read_control_reg("MODPRSL0"),
                                        self.MODPRSL0_set),
                    "QSFP_U13_LPMODE": (lambda: self.read_control_reg("LPMODE1"),
                                        self.LPMODE1_set),
                    "QSFP_U13_MODPRS": (lambda: self.read_control_reg("MODPRSL1"),
                                        self.MODPRSL1_set),
                    "FEM_MODE-LPOWER": (lambda: self.read_control_reg("P1V0_EN_ZYNC"),
                                        self.P1V0_EN_ZYNC_set)
                }
            })
        except ValueError:  # excepts need revision to be meaningful
            print('Non-numeric input detected.')

    def read_control_reg(self, value):
        """Read the current value of a control register.

        This method returns the binary value last set to a control register.
        :param value: Name of control register
        :return: the binary value of the control register
        """
        return self.control_register_local.get(value)

    # parameter tree wrapper functions for control registers
    def FSEL_1_DE_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["FSEL_1_DE"] = value
        gpio.set(self.control_register.get("FSEL_1_DE"), value)

    def FSEL_0_DE_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["FSEL_0_DE"] = value
        gpio.set(self.control_register.get("FSEL_0_DE"), value)

    def F_CLK_SEL_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["F_CLK_SEL"] = value
        gpio.set(self.control_register.get("F_CLK_SEL"), value)

    def QSFP_I2C_SEL0_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["QSFP_I2C_SEL0"] = value
        gpio.set(self.control_register.get("QSFP_I2C_SEL0"), value)

    def LPMODE0_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["LPMODE0"] = value
        gpio.set(self.control_register.get("LPMODE0"), value)

    def MODPRSL0_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["MODPRSL0"] = value
        gpio.set(self.control_register.get("MODPRSL0"), value)

    def LPMODE1_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["LPMODE1"] = value
        gpio.set(self.control_register.get("LPMODE1"), value)

    def MODPRSL1_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["MODPRSL1"] = value
        gpio.set(self.control_register.get("MODPRSL1"), value)

    def P1V0_EN_ZYNC_set(self, value):
        """Set the control register via GPIO."""
        self.control_register_local["P1V0_EN_ZYNC"] = value
        gpio.set(self.control_register.get("P1V0_EN_ZYNC"), value)

    # SELECTED_FLASH is derived from FSEL_#_DE with FSEL_0 as the Least Significant bit
    def get_selected_flash(self):
        """Get the currently selected flash.

        This method calculates and returns the currently selected flash from the FSEL registers
        :return : An integer denoting the selected flash
        """
        return (self.read_control_reg("FSEL_0_DE") + (2 * self.read_control_reg("FSEL_1_DE")))

    def set_flash(self, value):
        """Set the selected flash.

        This method Set the currently selected flash by setting the FSEL registers
        as the binary interpretation with FSEL_0 the LSB
        :param value: Integer representing the flash to be selected
        """
        value = int(value)
        if value == 0:
            gpio.set(self.control_register.get("FSEL_1_DE"), 0)
            self.control_register_local["FSEL_1_DE"] = 0
            gpio.set(self.control_register.get("FSEL_0_DE"), 0)
            self.control_register_local["FSEL_0_DE"] = 0
        elif value == 1:
            gpio.set(self.control_register.get("FSEL_1_DE"), 0)
            self.control_register_local["FSEL_1_DE"] = 0
            gpio.set(self.control_register.get("FSEL_0_DE"), 1)
            self.control_register_local["FSEL_0_DE"] = 1
        elif value == 2:
            gpio.set(self.control_register.get("FSEL_1_DE"), 1)
            self.control_register_local["FSEL_1_DE"] = 1
            gpio.set(self.control_register.get("FSEL_0_DE"), 0)
            self.control_register_local["FSEL_0_DE"] = 0
        elif value == 3:
            gpio.set(self.control_register.get("FSEL_1_DE"), 1)
            self.control_register_local["FSEL_1_DE"] = 1
            gpio.set(self.control_register.get("FSEL_0_DE"), 1)
            self.control_register_local["FSEL_0_DE"] = 1
        else:
            print("Not a valid number, no change!")

    # parameter tree wrapper functions for gpio.set for reset registers
    def ZYNC_F_RST_set(self, value):
        """Set the reset register via GPIO."""
        gpio.set(self.reset_register.get("ZYNC_F_RST"), value)

    def ZYNC_FW_RST_N_set(self, value):
        """Set the reset register via GPIO."""
        gpio.set(self.reset_register.get("ZYNC_FW_RST_N"), value)

    def RESETL0_set(self, value):
        """Set the reset register via GPIO."""
        gpio.set(self.reset_register.get("RESETL0"), value)

    def RESETL1_set(self, value):
        """Set the reset register via GPIO."""
        gpio.set(self.reset_register.get("RESETL1"), value)

    def V7_INIT_B_set(self, value):
        """Set the reset register via GPIO."""
        gpio.set(self.reset_register.get("V7_INIT_B"), value)

    def V7_PRG_ZY_set(self, value):
        """Set the reset register via GPIO."""
        gpio.set(self.reset_register.get("V7_PRG_ZY"), value)

    def gpio_setup(self):
        """Set up the GPIO registers."""
        for key, val in self.status_register.items():
            gpio.setup(val, "in")
        for key, val in self.reset_register.items():
            gpio.setup(val, "out")
        for key, val in self.control_register.items():
            gpio.setup(val, "out")
            gpio.set(val, self.control_register_local[key])

    def get(self, path, wants_metadata=False):
        """Get the parameter tree."""
        return self.param_tree.get(path, wants_metadata)

    def set(self, path, data):
        """Set the parameter tree."""
        return self.param_tree.set(path, data)
