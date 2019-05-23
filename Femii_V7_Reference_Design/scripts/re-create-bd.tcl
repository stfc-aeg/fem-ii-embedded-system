
################################################################
# This is a generated script based on design: c2c_top
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source c2c_top_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7vx690tffg1930-2

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name c2c_top

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set SPI_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 SPI_0 ]

  # Create ports
  set DDR3_PGADD [ create_bd_port -dir O -from 2 -to 0 DDR3_PGADD ]
  set axi_c2c_selio_rx_clk_in [ create_bd_port -dir I -type clk axi_c2c_selio_rx_clk_in ]
  set_property -dict [ list CONFIG.FREQ_HZ {200000000}  ] $axi_c2c_selio_rx_clk_in
  set axi_c2c_selio_rx_data_in [ create_bd_port -dir I -from 8 -to 0 axi_c2c_selio_rx_data_in ]
  set axi_c2c_selio_tx_clk_out [ create_bd_port -dir O -type clk axi_c2c_selio_tx_clk_out ]
  set axi_c2c_selio_tx_data_out [ create_bd_port -dir O -from 8 -to 0 axi_c2c_selio_tx_data_out ]
  set led_c [ create_bd_port -dir O -from 0 -to 0 led_c ]
  set led_d [ create_bd_port -dir O -from 0 -to 0 led_d ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_0 ]
  set_property -dict [ list CONFIG.SINGLE_PORT_BRAM {1}  ] $axi_bram_ctrl_0

  # Create instance: axi_bram_ctrl_0_bram, and set properties
  set axi_bram_ctrl_0_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.2 axi_bram_ctrl_0_bram ]

  # Create instance: axi_chip2chip_0, and set properties
  set axi_chip2chip_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_chip2chip:4.2 axi_chip2chip_0 ]
  set_property -dict [ list CONFIG.C_AXI_ID_WIDTH {6} CONFIG.C_AXI_WUSER_WIDTH {0} CONFIG.C_COMMON_CLK {1} CONFIG.C_INTERFACE_MODE {2} CONFIG.C_MASTER_FPGA {0} CONFIG.C_NUM_OF_IO {20} CONFIG.C_SELECTIO_PHY_CLK {200}  ] $axi_chip2chip_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list CONFIG.NUM_MI {6}  ] $axi_interconnect_0

  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [ list CONFIG.C_FIFO_DEPTH {256} CONFIG.C_SCK_RATIO {2} CONFIG.C_SPI_MEMORY {3} CONFIG.C_SPI_MODE {2} CONFIG.C_USE_STARTUP {0}  ] $axi_quad_spi_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 clk_wiz_0 ]
  set_property -dict [ list CONFIG.CLKOUT1_JITTER {135.255} CONFIG.CLKOUT1_PHASE_ERROR {89.971} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {40} CONFIG.MMCM_CLKFBOUT_MULT_F {5.000} CONFIG.MMCM_CLKOUT0_DIVIDE_F {25.000} CONFIG.MMCM_DIVCLK_DIVIDE {1} CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} CONFIG.RESET_PORT {resetn} CONFIG.RESET_TYPE {ACTIVE_LOW}  ] $clk_wiz_0

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:5.1 ila_0 ]

  # Create instance: ila_1, and set properties
  set ila_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:5.1 ila_1 ]
  set_property -dict [ list CONFIG.C_ENABLE_ILA_AXI_MON {false} CONFIG.C_MONITOR_TYPE {Native} CONFIG.C_NUM_OF_PROBES {4}  ] $ila_1

  # Create instance: page_reg, and set properties
  set page_reg [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 page_reg ]
  set_property -dict [ list CONFIG.C_GPIO_WIDTH {3}  ] $page_reg

  # Create instance: rst_mig_7series_0_200M, and set properties
  set rst_mig_7series_0_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_200M ]

  # Create instance: status_control, and set properties
  set status_control [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 status_control ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_ALL_OUTPUTS_2 {0} CONFIG.C_GPIO2_WIDTH {32} CONFIG.C_GPIO_WIDTH {32} CONFIG.C_IS_DUAL {1}  ] $status_control

  # Create instance: version_reg, and set properties
  set version_reg [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 version_reg ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_ALL_INPUTS_2 {1} CONFIG.C_IS_DUAL {1}  ] $version_reg

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list CONFIG.NUM_PORTS {5}  ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list CONFIG.CONST_VAL {0xAAAAAAAA} CONFIG.CONST_WIDTH {32}  ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list CONFIG.CONST_VAL {0xBADDA555} CONFIG.CONST_WIDTH {32}  ] $xlconstant_2

  # Create instance: xlconstant_3, and set properties
  set xlconstant_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3 ]
  set_property -dict [ list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {28}  ] $xlconstant_3

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list CONFIG.DIN_FROM {0} CONFIG.DIN_TO {0}  ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list CONFIG.DIN_FROM {1} CONFIG.DIN_TO {1} CONFIG.DOUT_WIDTH {1}  ] $xlslice_1

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_chip2chip_0_m_axi [get_bd_intf_pins axi_chip2chip_0/m_axi] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
connect_bd_intf_net -intf_net axi_chip2chip_0_m_axi [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins ila_0/SLOT_0_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins page_reg/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_interconnect_0/M02_AXI] [get_bd_intf_pins version_reg/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins axi_interconnect_0/M04_AXI] [get_bd_intf_pins status_control/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M05_AXI [get_bd_intf_pins axi_interconnect_0/M05_AXI] [get_bd_intf_pins axi_quad_spi_0/AXI_LITE]
  connect_bd_intf_net -intf_net axi_quad_spi_0_SPI_0 [get_bd_intf_ports SPI_0] [get_bd_intf_pins axi_quad_spi_0/SPI_0]

  # Create port connections
  connect_bd_net -net axi_c2c_selio_rx_clk_in_1 [get_bd_ports axi_c2c_selio_rx_clk_in] [get_bd_pins axi_chip2chip_0/axi_c2c_selio_rx_clk_in]
  connect_bd_net -net axi_c2c_selio_rx_data_in_1 [get_bd_ports axi_c2c_selio_rx_data_in] [get_bd_pins axi_chip2chip_0/axi_c2c_selio_rx_data_in]
  connect_bd_net -net axi_chip2chip_0_axi_c2c_link_status_out [get_bd_pins axi_chip2chip_0/axi_c2c_link_status_out] [get_bd_pins ila_1/probe0] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net axi_chip2chip_0_axi_c2c_multi_bit_error_out [get_bd_pins axi_chip2chip_0/axi_c2c_multi_bit_error_out] [get_bd_pins ila_1/probe1] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net axi_chip2chip_0_axi_c2c_selio_tx_clk_out [get_bd_ports axi_c2c_selio_tx_clk_out] [get_bd_pins axi_chip2chip_0/axi_c2c_selio_tx_clk_out]
  connect_bd_net -net axi_chip2chip_0_axi_c2c_selio_tx_data_out [get_bd_ports axi_c2c_selio_tx_data_out] [get_bd_pins axi_chip2chip_0/axi_c2c_selio_tx_data_out]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axi_quad_spi_0/ext_spi_clk] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins ila_1/probe2] [get_bd_pins ila_1/probe3] [get_bd_pins rst_mig_7series_0_200M/dcm_locked] [get_bd_pins xlconcat_0/In2] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net mig_7series_0_ui_clk [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_chip2chip_0/idelay_ref_clk] [get_bd_pins axi_chip2chip_0/m_aclk] [get_bd_pins axi_chip2chip_0/m_aclk_out] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_quad_spi_0/s_axi_aclk] [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins ila_0/clk] [get_bd_pins ila_1/clk] [get_bd_pins page_reg/s_axi_aclk] [get_bd_pins rst_mig_7series_0_200M/slowest_sync_clk] [get_bd_pins status_control/s_axi_aclk] [get_bd_pins version_reg/s_axi_aclk]
  connect_bd_net -net page_reg_gpio_io_o [get_bd_ports DDR3_PGADD] [get_bd_pins page_reg/gpio_io_i] [get_bd_pins page_reg/gpio_io_o]
  connect_bd_net -net rst_mig_7series_0_200M_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins clk_wiz_0/resetn] [get_bd_pins rst_mig_7series_0_200M/peripheral_aresetn] [get_bd_pins status_control/s_axi_aresetn]
  connect_bd_net -net status_control_gpio2_io_t [get_bd_pins status_control/gpio2_io_i] [get_bd_pins status_control/gpio2_io_o] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins status_control/gpio_io_i] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins axi_chip2chip_0/m_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_quad_spi_0/s_axi_aresetn] [get_bd_pins page_reg/s_axi_aresetn] [get_bd_pins rst_mig_7series_0_200M/ext_reset_in] [get_bd_pins version_reg/s_axi_aresetn] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins version_reg/gpio_io_i] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins version_reg/gpio2_io_i] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlconstant_3_dout [get_bd_pins xlconcat_0/In4] [get_bd_pins xlconstant_3/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_ports led_c] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_ports led_d] [get_bd_pins xlslice_1/Dout]

  # Create address segments
  create_bd_addr_seg -range 0x1000 -offset 0xBFFFF000 [get_bd_addr_spaces axi_chip2chip_0/MAXI] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x10000 -offset 0xA0010000 [get_bd_addr_spaces axi_chip2chip_0/MAXI] [get_bd_addr_segs page_reg/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0xA0000000 [get_bd_addr_spaces axi_chip2chip_0/MAXI] [get_bd_addr_segs version_reg/S_AXI/Reg] SEG_axi_gpio_1_Reg
  create_bd_addr_seg -range 0x10000 -offset 0xA0030000 [get_bd_addr_spaces axi_chip2chip_0/MAXI] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0xA0020000 [get_bd_addr_spaces axi_chip2chip_0/MAXI] [get_bd_addr_segs status_control/S_AXI/Reg] SEG_status_control_Reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


