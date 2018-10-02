# ----------------------------------------------------------------------------------------------------
# --  Customer         : Enclustra GmbH
# --  Project          : Mars ZX3 Vivado Reference Design
# --  File description : Pin assignment constraints file for Mars PM3
# --  File name        : MarsZX3_PM3.xdc
# --  Authors          : Christoph Glattfelder
# ----------------------------------------------------------------------------------------------------
# --  Copyright (c) 2014 by Enclustra GmbH, Switzerland
# --  All rights reserved.
# ----------------------------------------------------------------------------------------------------

set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN ENABLE [current_design]

# ----------------------------------------------------------------------------------
# Important! Do not remove this constraint!
# This property ensures that all unused pins are set to high impedance.
# If the constraint is removed, all unused pins have to be set to HiZ in the top level file.
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
# ----------------------------------------------------------------------------------

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# ----------------------------------------------------------------------------------
# -- revision detection
# ----------------------------------------------------------------------------------
set_property PACKAGE_PIN Y21 [get_ports Rev5]
set_property IOSTANDARD LVCMOS33 [get_ports Rev5]
set_property PULLUP TRUE [get_ports Rev5]

set_property PACKAGE_PIN AB21 [get_ports Rev4]
set_property IOSTANDARD LVCMOS33 [get_ports Rev4]
set_property PULLUP TRUE [get_ports Rev4]

# ----------------------------------------------------------------------------------
# -- system pins
# ----------------------------------------------------------------------------------

set_property PACKAGE_PIN U14 [get_ports Usb_Rst_N]
set_property IOSTANDARD LVCMOS33 [get_ports Usb_Rst_N]

set_property PACKAGE_PIN AB11 [get_ports Eth_Rst_N]
set_property IOSTANDARD LVCMOS33 [get_ports Eth_Rst_N]

# ----------------------------------------------------------------------------------
# -- eth I/Os connected in parallel with MIO pins, set to high impedance if not used
# ----------------------------------------------------------------------------------

set_property PACKAGE_PIN U12 [get_ports ETH_Link]
set_property IOSTANDARD LVCMOS33 [get_ports ETH_Link]

set_property PACKAGE_PIN AA12 [get_ports ETH_MDC]
set_property IOSTANDARD LVCMOS33 [get_ports ETH_MDC]

set_property PACKAGE_PIN AB12 [get_ports ETH_MDIO]
set_property IOSTANDARD LVCMOS33 [get_ports ETH_MDIO]
set_property PULLUP TRUE [get_ports ETH_MDIO]

set_property PACKAGE_PIN Y9 [get_ports ETH_RX_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports ETH_RX_CLK]

set_property PACKAGE_PIN Y8 [get_ports ETH_RX_CTL]
set_property IOSTANDARD LVCMOS33 [get_ports ETH_RX_CTL]

set_property PACKAGE_PIN U10 [get_ports {ETH_RXD[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ETH_RXD[0]}]

set_property PACKAGE_PIN Y11 [get_ports {ETH_RXD[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ETH_RXD[1]}]

set_property PACKAGE_PIN W11 [get_ports {ETH_RXD[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ETH_RXD[2]}]

set_property PACKAGE_PIN U11 [get_ports {ETH_RXD[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ETH_RXD[3]}]

set_property PACKAGE_PIN W10 [get_ports ETH_TX_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports ETH_TX_CLK]

set_property PACKAGE_PIN V10 [get_ports ETH_TX_CTL]
set_property IOSTANDARD LVCMOS33 [get_ports ETH_TX_CTL]

set_property PACKAGE_PIN V8 [get_ports {ETH_TXD[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ETH_TXD[0]}]

set_property PACKAGE_PIN W8 [get_ports {ETH_TXD[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ETH_TXD[1]}]

set_property PACKAGE_PIN U6 [get_ports {ETH_TXD[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ETH_TXD[2]}]

set_property PACKAGE_PIN V9 [get_ports {ETH_TXD[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ETH_TXD[3]}]

# ----------------------------------------------------------------------------------
# -- led
# ----------------------------------------------------------------------------------

set_property PACKAGE_PIN H18 [get_ports {Led_N[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led_N[0]}]

set_property PACKAGE_PIN AA14 [get_ports {Led_N[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led_N[1]}]

set_property PACKAGE_PIN AA13 [get_ports {Led_N[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led_N[2]}]

set_property PACKAGE_PIN AB15 [get_ports {Led_N[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Led_N[3]}]


# ----------------------------------------------------------------------------------
# -- system pins, set to high impedance if not used
# ----------------------------------------------------------------------------------

set_property PACKAGE_PIN Y6 [get_ports CLK33]
set_property IOSTANDARD LVCMOS33 [get_ports CLK33]

set_property PACKAGE_PIN AA22 [get_ports DDR3_VSEL]
set_property IOSTANDARD LVCMOS33 [get_ports DDR3_VSEL]

set_property PACKAGE_PIN AB14 [get_ports PWR_GOOD_R]
set_property IOSTANDARD LVCMOS33 [get_ports PWR_GOOD_R]

set_property PACKAGE_PIN V13 [get_ports NAND_WP]
set_property IOSTANDARD LVCMOS33 [get_ports NAND_WP]

set_property PACKAGE_PIN U9 [get_ports Vref0]
set_property IOSTANDARD LVCMOS33 [get_ports Vref0]

set_property PACKAGE_PIN T6 [get_ports Vref1]
set_property IOSTANDARD LVCMOS33 [get_ports Vref1]

# ----------------------------------------------------------------------------------
# -- i2-port
# ----------------------------------------------------------------------------------

set_property PACKAGE_PIN H15 [get_ports I2C0_SDA]
set_property IOSTANDARD LVCMOS18 [get_ports I2C0_SDA] 

set_property PACKAGE_PIN R15 [get_ports I2C0_SCL]
set_property IOSTANDARD LVCMOS18 [get_ports I2C0_SCL]

set_property PACKAGE_PIN H17 [get_ports I2C0_INT_N_pin]
set_property IOSTANDARD LVCMOS33 [get_ports I2C0_INT_N_pin]

# ----------------------------------------------------------------------------------
# Mars PM3 specific signals
# ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# -- UART 
# ----------------------------------------------------------------------------------

set_property PACKAGE_PIN T17 [get_ports UART0_TX]
set_property IOSTANDARD LVCMOS18 [get_ports UART0_TX]

set_property PACKAGE_PIN T16 [get_ports UART0_RX]
set_property IOSTANDARD LVCMOS18 [get_ports UART0_RX]


#FEM-II signals

#LEDs
set_property PACKAGE_PIN A21 [get_ports {ZY_A_LED}]
set_property IOSTANDARD LVCMOS33 [get_ports {ZY_A_LED}]

set_property PACKAGE_PIN A22 [get_ports {ZY_B_LED}]
set_property IOSTANDARD LVCMOS33 [get_ports {ZY_B_LED}]

## Control register signals
set_property PACKAGE_PIN N18 [get_ports {FSEL_0_DE}]
set_property IOSTANDARD LVCMOS18 [get_ports {FSEL_0_DE}]

set_property PACKAGE_PIN N15 [get_ports {FSEL_1_DE}]
set_property IOSTANDARD LVCMOS18 [get_ports {FSEL_1_DE}]

set_property PACKAGE_PIN T18 [get_ports {F_CLK_SEL}]
set_property IOSTANDARD LVCMOS18 [get_ports {F_CLK_SEL}]

set_property PACKAGE_PIN B17 [get_ports {LPMODE0}]
set_property IOSTANDARD LVCMOS33 [get_ports {LPMODE0}]

set_property PACKAGE_PIN B20 [get_ports {LPMODE1}]
set_property IOSTANDARD LVCMOS33 [get_ports {LPMODE1}]

set_property PACKAGE_PIN U16 [get_ports {MODPRSL0}]
set_property IOSTANDARD LVCMOS33 [get_ports {MODPRSL0}]

set_property PACKAGE_PIN F22 [get_ports {MODPRSL1}]
set_property IOSTANDARD LVCMOS33 [get_ports {MODPRSL1}]

set_property PACKAGE_PIN B16 [get_ports {QSFP_I2C_SEL0}]
set_property IOSTANDARD LVCMOS33 [get_ports {QSFP_I2C_SEL0}]

set_property PACKAGE_PIN D17 [get_ports {P1V0_EN_ZYNC}]
set_property IOSTANDARD LVCMOS33 [get_ports {P1V0_EN_ZYNC}]


##I2C / SMBUS interface 
#set_property PACKAGE_PIN G21 [get_ports I2C1_SDA]
#set_property IOSTANDARD LVCMOS33 [get_ports I2C1_SDA] 

#set_property PACKAGE_PIN G20 [get_ports I2C1_SCL]
#set_property IOSTANDARD LVCMOS33 [get_ports I2C1_SCL]

#set_property PACKAGE_PIN G19 [get_ports I2C1_INT_N_pin]
#set_property PULLUP TRUE [get_ports I2C1_INT_N_pin]
#set_property IOSTANDARD LVCMOS33 [get_ports I2C1_INT_N_pin]

set_property PACKAGE_PIN P21 [get_ports I2C1_SDA]
set_property IOSTANDARD LVCMOS18 [get_ports I2C1_SDA] 
set_property PULLUP TRUE [get_ports I2C1_SDA]

set_property PACKAGE_PIN P16 [get_ports I2C1_SCL]
set_property IOSTANDARD LVCMOS18 [get_ports I2C1_SCL]
set_property PULLUP TRUE [get_ports I2C1_SCL]

set_property PACKAGE_PIN G17 [get_ports I2C1_INT_N_pin]
set_property PULLUP TRUE [get_ports I2C1_INT_N_pin]
set_property IOSTANDARD LVCMOS33 [get_ports I2C1_INT_N_pin]

## status register signals
set_property PACKAGE_PIN K15 [get_ports {P1V0_MGT_PGOOD}]
set_property IOSTANDARD LVCMOS18 [get_ports {P1V0_MGT_PGOOD}]

set_property PACKAGE_PIN A18 [get_ports {P1V0_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {P1V0_PGOOD}]

set_property PACKAGE_PIN D15 [get_ports {P1V2_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {P1V2_PGOOD}]

set_property PACKAGE_PIN W16 [get_ports {P1V5_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {P1V5_PGOOD}]

set_property PACKAGE_PIN E15 [get_ports {P1V8_MGT_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {P1V8_MGT_PGOOD}]

set_property PACKAGE_PIN Y16 [get_ports {P1V8_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {P1V8_PGOOD}]

set_property PACKAGE_PIN C18 [get_ports {P2V0_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {P2V0_PGOOD}]

set_property PACKAGE_PIN H19 [get_ports {P3V3_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {P3V3_PGOOD}]

set_property PACKAGE_PIN F18 [get_ports {P5V0_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {P5V0_PGOOD}]

set_property PACKAGE_PIN C15 [get_ports {DDR3_TERM_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {DDR3_TERM_PGOOD}]

set_property PACKAGE_PIN B15 [get_ports {QDR_TERM_PGOOD}]
set_property IOSTANDARD LVCMOS33 [get_ports {QDR_TERM_PGOOD}]

set_property PACKAGE_PIN R19 [get_ports {DONE}]
set_property IOSTANDARD LVCMOS18 [get_ports {DONE}]


# ----------------------------------------------------------------------------------
# -- FEM-II RESETS
# ----------------------------------------------------------------------------------

set_property PACKAGE_PIN J15 [get_ports ZYNC_F_RST]
set_property IOSTANDARD LVCMOS18 [get_ports ZYNC_F_RST]

set_property PACKAGE_PIN E16 [get_ports ZYNC_FW_RST_N]
set_property IOSTANDARD LVCMOS33 [get_ports ZYNC_FW_RST_N]

set_property PACKAGE_PIN E18 [get_ports RESETL0]
set_property IOSTANDARD LVCMOS33 [get_ports RESETL0]

set_property PACKAGE_PIN B19 [get_ports RESETL1]
set_property IOSTANDARD LVCMOS33 [get_ports RESETL1]

set_property PACKAGE_PIN R21 [get_ports V7_INIT_B]
set_property IOSTANDARD LVCMOS18 [get_ports V7_INIT_B]

set_property PACKAGE_PIN M22 [get_ports V7_PRG_ZY]
set_property IOSTANDARD LVCMOS18 [get_ports V7_PRG_ZY]


#chip 2 chip
set_property PACKAGE_PIN M19 [get_ports V7_2_ZY_CK]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_CK]
set_property PACKAGE_PIN N22 [get_ports V7_2_ZY_D[0]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[0]]
set_property PACKAGE_PIN N17 [get_ports V7_2_ZY_D[1]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[1]]
set_property PACKAGE_PIN T19 [get_ports V7_2_ZY_D[2]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[2]]
set_property PACKAGE_PIN R18 [get_ports V7_2_ZY_D[3]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[3]]
set_property PACKAGE_PIN J22 [get_ports V7_2_ZY_D[4]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[4]]
set_property PACKAGE_PIN L22 [get_ports V7_2_ZY_D[5]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[5]]
set_property PACKAGE_PIN M21 [get_ports V7_2_ZY_D[6]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[6]]
set_property PACKAGE_PIN R20 [get_ports V7_2_ZY_D[7]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[7]]
set_property PACKAGE_PIN N20 [get_ports V7_2_ZY_D[8]]
set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[8]]
#set_property PACKAGE_PIN M20 [get_ports {V7_2_ZY_D[9]}]
#set_property IOSTANDARD LVCMOS18 [get_ports V7_2_ZY_D[9]]

#set_property PACKAGE_PIN P15 [get_ports {V7_2_ZY_D[10]}]
#set_property PACKAGE_PIN P20 [get_ports {V7_2_ZY_D[11]}]
#set_property PACKAGE_PIN R16 [get_ports {V7_2_ZY_D[12]}]

set_property PACKAGE_PIN E21 [get_ports spi_0_io0_io]
set_property PACKAGE_PIN D21 [get_ports spi_0_io1_io]
set_property PACKAGE_PIN D22 [get_ports spi_0_io2_io]
set_property PACKAGE_PIN C22 [get_ports spi_0_io3_io]
set_property PACKAGE_PIN B21 [get_ports spi_0_sck_io]
set_property PACKAGE_PIN B22 [get_ports spi_0_ss_io[0]]

set_property IOSTANDARD LVCMOS33 [get_ports spi_0_io0_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_0_io1_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_0_io2_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_0_io3_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_0_sck_io]
set_property IOSTANDARD LVCMOS33 [get_ports spi_0_ss_io[0]]


set_property PACKAGE_PIN L19 [get_ports ZY_2_V7_CK]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_CK]
set_property PACKAGE_PIN K18 [get_ports ZY_2_V7_D[0]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[0]]
set_property PACKAGE_PIN J18 [get_ports ZY_2_V7_D[1]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[1]]
set_property PACKAGE_PIN L16 [get_ports ZY_2_V7_D[2]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[2]]
set_property PACKAGE_PIN K16 [get_ports ZY_2_V7_D[3]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[3]]
set_property PACKAGE_PIN J17 [get_ports ZY_2_V7_D[4]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[4]]
set_property PACKAGE_PIN J16 [get_ports ZY_2_V7_D[5]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[5]]
set_property PACKAGE_PIN K21 [get_ports ZY_2_V7_D[6]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[6]]
set_property PACKAGE_PIN J20 [get_ports ZY_2_V7_D[7]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[7]]
set_property PACKAGE_PIN M17 [get_ports ZY_2_V7_D[8]]
set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[8]]
#set_property PACKAGE_PIN L17 [get_ports ZY_2_V7_D[9]]
#set_property IOSTANDARD LVCMOS18 [get_ports ZY_2_V7_D[9]]

#set_property PACKAGE_PIN M16 [get_ports ZY_2_V7_D[10]]
#set_property PACKAGE_PIN M15 [get_ports ZY_2_V7_D[11]]
#set_property PACKAGE_PIN P22 [get_ports ZY_2_V7_D[12]]


## for SD card operation
#set_property PACKAGE_PIN Y18 [get_ports ZYNC_SD_CLK]
#set_property IOSTANDARD LVCMOS33 [get_ports ZYNC_SD_CLK]
#set_property PULLUP TRUE [get_ports ZYNC_SD_CLK]

#set_property PACKAGE_PIN AA18 [get_ports ZYNC_SD_CMD]     
#set_property IOSTANDARD LVCMOS33 [get_ports ZYNC_SD_CMD]
#set_property PULLUP TRUE [get_ports ZYNC_SD_CMD]
  
#set_property PACKAGE_PIN AA17 [get_ports ZYNC_SD_DAT0]
#set_property IOSTANDARD LVCMOS33 [get_ports ZYNC_SD_DAT0]
#set_property PULLUP TRUE [get_ports ZYNC_SD_DAT0]

#set_property PACKAGE_PIN AB17 [get_ports ZYNC_SD_DAT1]
#set_property IOSTANDARD LVCMOS33 [get_ports ZYNC_SD_DAT1]
#set_property PULLUP TRUE [get_ports ZYNC_SD_DAT1]

#set_property PACKAGE_PIN U17 [get_ports ZYNC_SD_DAT2]
#set_property IOSTANDARD LVCMOS33 [get_ports ZYNC_SD_DAT2]
#set_property PULLUP TRUE [get_ports ZYNC_SD_DAT2]

#set_property PACKAGE_PIN V17 [get_ports ZYNC_SD_DAT3]
#set_property IOSTANDARD LVCMOS33 [get_ports ZYNC_SD_DAT3]
#set_property PULLUP TRUE [get_ports ZYNC_SD_DAT3]

# ----------------------------------------------------------------------------------
# -- timing constraints
# ----------------------------------------------------------------------------------

create_clock -name CLK33 -period 30.000 [get_ports CLK33]


# ----------------------------------------------------------------------------------------------------
# eof
# ----------------------------------------------------------------------------------------------------
