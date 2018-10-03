set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]

set_property PACKAGE_PIN AK13 [get_ports {led_c[0]}]
set_property PACKAGE_PIN BA11 [get_ports {led_d[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led_c[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led_d[0]}]

set_property PACKAGE_PIN AJ24 [get_ports axi_c2c_selio_tx_clk_out]
set_property PACKAGE_PIN AK23 [get_ports {axi_c2c_selio_tx_data_out[0]}]
set_property PACKAGE_PIN AT23 [get_ports {axi_c2c_selio_tx_data_out[1]}]
set_property PACKAGE_PIN AN24 [get_ports {axi_c2c_selio_tx_data_out[2]}]
set_property PACKAGE_PIN AT24 [get_ports {axi_c2c_selio_tx_data_out[3]}]
set_property PACKAGE_PIN AU21 [get_ports {axi_c2c_selio_tx_data_out[4]}]
set_property PACKAGE_PIN AT21 [get_ports {axi_c2c_selio_tx_data_out[5]}]
set_property PACKAGE_PIN AV22 [get_ports {axi_c2c_selio_tx_data_out[6]}]
set_property PACKAGE_PIN AW22 [get_ports {axi_c2c_selio_tx_data_out[7]}]
set_property PACKAGE_PIN AY24 [get_ports {axi_c2c_selio_tx_data_out[8]}]
#set_property PACKAGE_PIN AK24 [get_ports axi_c2c_selio_tx_data_out[9]]

set_property PACKAGE_PIN AH24 [get_ports spi_0_io0_io]
set_property PACKAGE_PIN AH25 [get_ports spi_0_io1_io]
set_property PACKAGE_PIN AH22 [get_ports spi_0_io2_io]
set_property PACKAGE_PIN AH23 [get_ports spi_0_io3_io]
set_property PACKAGE_PIN AL23 [get_ports spi_0_sck_io]
set_property PACKAGE_PIN AJ22 [get_ports {spi_0_ss_io[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports spi_0_io0_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_0_io1_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_0_io2_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_0_io3_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_0_sck_io]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_0_ss_io[0]}]

#constraints for the top address bits of the memory
set_property PACKAGE_PIN J10 [get_ports {DDR3_PGADD[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {DDR3_PGADD[2]}]

set_property PACKAGE_PIN H10 [get_ports {DDR3_PGADD[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {DDR3_PGADD[1]}]

set_property PACKAGE_PIN B7 [get_ports {DDR3_PGADD[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {DDR3_PGADD[0]}]

#set_property PACKAGE_PIN AL21 [get_ports axi_c2c_selio_tx_data_out[10]]
#set_property PACKAGE_PIN AV23 [get_ports axi_c2c_selio_tx_data_out[11]]
#set_property PACKAGE_PIN AU22 [get_ports axi_c2c_selio_tx_data_out[12]]
set_property PACKAGE_PIN AR21 [get_ports axi_c2c_selio_rx_clk_in]
set_property PACKAGE_PIN AY22 [get_ports {axi_c2c_selio_rx_data_in[0]}]

set_property PACKAGE_PIN BB22 [get_ports {axi_c2c_selio_rx_data_in[1]}]
set_property PACKAGE_PIN BA23 [get_ports {axi_c2c_selio_rx_data_in[2]}]
set_property PACKAGE_PIN BC23 [get_ports {axi_c2c_selio_rx_data_in[3]}]
set_property PACKAGE_PIN BC22 [get_ports {axi_c2c_selio_rx_data_in[4]}]
set_property PACKAGE_PIN BB23 [get_ports {axi_c2c_selio_rx_data_in[5]}]
set_property PACKAGE_PIN BA24 [get_ports {axi_c2c_selio_rx_data_in[6]}]
set_property PACKAGE_PIN AY23 [get_ports {axi_c2c_selio_rx_data_in[7]}]
set_property PACKAGE_PIN AK21 [get_ports {axi_c2c_selio_rx_data_in[8]}]
#set_property PACKAGE_PIN AW24 [get_ports axi_c2c_selio_rx_data_in[9]]


#set_property PACKAGE_PIN AV24 [get_ports axi_c2c_selio_rx_data_in[10]]
#set_property PACKAGE_PIN AK22 [get_ports axi_c2c_selio_rx_data_in[11]]
#set_property PACKAGE_PIN AU23 [get_ports axi_c2c_selio_rx_data_in[12]]
set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_tx_clk_out]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_tx_data_out[8]}]
#set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_tx_data_out[9]]
#set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_tx_data_out[10]]
#set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_tx_data_out[11]]
#set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_tx_data_out[12]]
set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_rx_clk_in]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {axi_c2c_selio_rx_data_in[8]}]
#set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_rx_data_in[9]]
#set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_rx_data_in[10]]
#set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_rx_data_in[11]]
#set_property IOSTANDARD LVCMOS18 [get_ports axi_c2c_selio_rx_data_in[12]]

#set_property PACKAGE_PIN AU22 [get_ports {reset_rtl}]
#set_property IOSTANDARD LVCMOS18 [get_ports {reset_rtl}]
#set_property PULLUP TRUE [get_ports {reset_rtl}]

#set_property VCCAUX_IO HIGH [get_ports {DDR3_PGADD[2]}]
#set_property SLEW FAST [get_ports {DDR3_PGADD[2]}]
#set_property IOSTANDARD SSTL15 [get_ports {DDR3_PGADD[2]}]
#set_property PACKAGE_PIN H10 [get_ports {DDR3_PGADD[2]}]

## PadFunction: IO_L18N_T2_37
#set_property VCCAUX_IO HIGH [get_ports {DDR3_PGADD[1]}]
#set_property SLEW FAST [get_ports {DDR3_PGADD[1]}]
#set_property IOSTANDARD SSTL15 [get_ports {DDR3_PGADD[1]}]
#set_property PACKAGE_PIN J10 [get_ports {DDR3_PGADD[1]}]

## PadFunction: IO_L4N_T0_37
#set_property VCCAUX_IO HIGH [get_ports {DDR3_PGADD[0]}]
#set_property SLEW FAST [get_ports {DDR3_PGADD[0]}]
#set_property IOSTANDARD SSTL15 [get_ports {DDR3_PGADD[0]}]
#set_property PACKAGE_PIN B7 [get_ports {DDR3_PGADD[0]}]

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clk]

set_property BITSTREAM.CONFIG.CONFIGRATE 26 [current_design]

