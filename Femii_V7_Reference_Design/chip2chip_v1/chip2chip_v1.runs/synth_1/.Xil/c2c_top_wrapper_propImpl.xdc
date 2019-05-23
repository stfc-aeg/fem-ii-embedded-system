set_property SRC_FILE_INFO {cfile:/scratch/qem/adam/development/fem-ii-embedded-system/Femii_V7_Reference_Design/chip2chip_v1/chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_axi_chip2chip_0_0/c2c_top_axi_chip2chip_0_0.xdc rfile:../../../chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_axi_chip2chip_0_0/c2c_top_axi_chip2chip_0_0.xdc id:1 order:EARLY scoped_inst:c2c_top_i/axi_chip2chip_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/scratch/qem/adam/development/fem-ii-embedded-system/Femii_V7_Reference_Design/chip2chip_v1/chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_clk_wiz_0_0/c2c_top_clk_wiz_0_0.xdc rfile:../../../chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_clk_wiz_0_0/c2c_top_clk_wiz_0_0.xdc id:2 order:EARLY scoped_inst:c2c_top_i/clk_wiz_0/U0} [current_design]
set_property SRC_FILE_INFO {cfile:/scratch/qem/adam/development/fem-ii-embedded-system/Femii_V7_Reference_Design/chip2chip_v1/chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_mig_7series_0_0/c2c_top_mig_7series_0_0/user_design/constraints/c2c_top_mig_7series_0_0.xdc rfile:../../../chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_mig_7series_0_0/c2c_top_mig_7series_0_0/user_design/constraints/c2c_top_mig_7series_0_0.xdc id:3 order:EARLY scoped_inst:c2c_top_i/mig_7series_0} [current_design]
set_property SRC_FILE_INFO {cfile:/scratch/qem/adam/development/fem-ii-embedded-system/Femii_V7_Reference_Design/chip2chip_v1/chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_axi_chip2chip_0_0/c2c_top_axi_chip2chip_0_0_clocks.xdc rfile:../../../chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_axi_chip2chip_0_0/c2c_top_axi_chip2chip_0_0_clocks.xdc id:4 order:LATE scoped_inst:c2c_top_i/axi_chip2chip_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/scratch/qem/adam/development/fem-ii-embedded-system/Femii_V7_Reference_Design/chip2chip_v1/chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_axi_quad_spi_0_0/c2c_top_axi_quad_spi_0_0_clocks.xdc rfile:../../../chip2chip_v1.srcs/sources_1/bd/c2c_top/ip/c2c_top_axi_quad_spi_0_0/c2c_top_axi_quad_spi_0_0_clocks.xdc id:5 order:LATE scoped_inst:c2c_top_i/axi_quad_spi_0/U0} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_pins slave_fpga_gen.axi_chip2chip_slave_phy_inst/slave_sio_phy.rx_reset_sync_inst/sync_reset_out_reg/C] -datapath_only 5.000
set_property src_info {type:SCOPED_XDC file:1 line:68 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_pins slave_fpga_gen.axi_chip2chip_slave_phy_inst/axi_chip2chip_phy_init_inst/calib_error_flop_reg/C] -to [get_pins slave_fpga_gen.axi_chip2chip_slave_phy_inst/axi_chip2chip_phy_init_inst/axi_chip2chip_sync_cell_inst/sync_flop_0_reg[1]/D] -datapath_only 5.000
set_property src_info {type:SCOPED_XDC file:1 line:69 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_pins slave_fpga_gen.axi_chip2chip_slave_phy_inst/axi_chip2chip_phy_init_inst/calib_done_flop_reg/C] -to [get_pins slave_fpga_gen.axi_chip2chip_slave_phy_inst/axi_chip2chip_phy_init_inst/axi_chip2chip_sync_cell_inst/sync_flop_0_reg[2]/D] -datapath_only 5.000
set_property src_info {type:SCOPED_XDC file:2 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.05
set_property src_info {type:SCOPED_XDC file:3 line:723 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y27 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:724 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y26 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:725 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y25 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:726 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y24 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:727 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y31 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:728 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y30 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:729 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y29 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:730 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y28 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:731 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y35 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:732 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y34 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:733 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y33 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:734 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_OUT_PHY_X1Y32 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out}]
set_property src_info {type:SCOPED_XDC file:3 line:736 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_IN_PHY_X1Y27 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in}]
set_property src_info {type:SCOPED_XDC file:3 line:737 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_IN_PHY_X1Y26 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in}]
set_property src_info {type:SCOPED_XDC file:3 line:738 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_IN_PHY_X1Y25 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in}]
set_property src_info {type:SCOPED_XDC file:3 line:739 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_IN_PHY_X1Y24 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_in_gen.phaser_in}]
set_property src_info {type:SCOPED_XDC file:3 line:744 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_IN_PHY_X1Y35 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in}]
set_property src_info {type:SCOPED_XDC file:3 line:745 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_IN_PHY_X1Y34 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in}]
set_property src_info {type:SCOPED_XDC file:3 line:746 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_IN_PHY_X1Y33 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in}]
set_property src_info {type:SCOPED_XDC file:3 line:747 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_IN_PHY_X1Y32 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_in_gen.phaser_in}]
set_property src_info {type:SCOPED_XDC file:3 line:751 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y27 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:752 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y26 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:753 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y25 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:754 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y24 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:755 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y31 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:756 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y30 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:757 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y29 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:758 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y28 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:759 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y35 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:760 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y34 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:761 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y33 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:762 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OUT_FIFO_X1Y32 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:764 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IN_FIFO_X1Y27 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/in_fifo_gen.in_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:765 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IN_FIFO_X1Y26 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/in_fifo_gen.in_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:766 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IN_FIFO_X1Y25 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/in_fifo_gen.in_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:767 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IN_FIFO_X1Y24 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/in_fifo_gen.in_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:768 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IN_FIFO_X1Y35 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/in_fifo_gen.in_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:769 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IN_FIFO_X1Y34 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/in_fifo_gen.in_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:770 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IN_FIFO_X1Y33 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/in_fifo_gen.in_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:771 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC IN_FIFO_X1Y32 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/in_fifo_gen.in_fifo}]
set_property src_info {type:SCOPED_XDC file:3 line:773 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHY_CONTROL_X1Y6 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/phy_control_i}]
set_property src_info {type:SCOPED_XDC file:3 line:774 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHY_CONTROL_X1Y7 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/phy_control_i}]
set_property src_info {type:SCOPED_XDC file:3 line:775 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHY_CONTROL_X1Y8 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/phy_control_i}]
set_property src_info {type:SCOPED_XDC file:3 line:777 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_REF_X1Y6 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/phaser_ref_i}]
set_property src_info {type:SCOPED_XDC file:3 line:778 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_REF_X1Y7 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_1.u_ddr_phy_4lanes/phaser_ref_i}]
set_property src_info {type:SCOPED_XDC file:3 line:779 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PHASER_REF_X1Y8 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/phaser_ref_i}]
set_property src_info {type:SCOPED_XDC file:3 line:781 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OLOGIC_X1Y343 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/ddr_byte_group_io/*slave_ts}]
set_property src_info {type:SCOPED_XDC file:3 line:782 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OLOGIC_X1Y331 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/ddr_byte_group_io/*slave_ts}]
set_property src_info {type:SCOPED_XDC file:3 line:783 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OLOGIC_X1Y319 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/ddr_byte_group_io/*slave_ts}]
set_property src_info {type:SCOPED_XDC file:3 line:784 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OLOGIC_X1Y307 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_2.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/ddr_byte_group_io/*slave_ts}]
set_property src_info {type:SCOPED_XDC file:3 line:785 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OLOGIC_X1Y443 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/ddr_byte_group_io/*slave_ts}]
set_property src_info {type:SCOPED_XDC file:3 line:786 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OLOGIC_X1Y431 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/ddr_byte_group_io/*slave_ts}]
set_property src_info {type:SCOPED_XDC file:3 line:787 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OLOGIC_X1Y419 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/ddr_byte_group_io/*slave_ts}]
set_property src_info {type:SCOPED_XDC file:3 line:788 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC OLOGIC_X1Y407 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/ddr_byte_group_io/*slave_ts}]
set_property src_info {type:SCOPED_XDC file:3 line:790 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PLLE2_ADV_X1Y7 [get_cells -hier -filter {NAME =~ */u_ddr3_infrastructure/plle2_i}]
set_property src_info {type:SCOPED_XDC file:3 line:791 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC MMCME2_ADV_X1Y7 [get_cells -hier -filter {NAME =~ */u_ddr3_infrastructure/gen_ui_extra_clocks.mmcm_i}]
set_property src_info {type:SCOPED_XDC file:3 line:809 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/* && IS_SEQUENTIAL}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/device_temp_sync_r1*}] 20
set_property src_info {type:SCOPED_XDC file:3 line:810 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells -hier *rstdiv0_sync_r1_reg*] -to [get_pins -filter {NAME =~ */RESET} -of [get_cells -hier -filter {REF_NAME == PHY_CONTROL}]] -datapath_only 5
set_property src_info {type:SCOPED_XDC file:3 line:812 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *ddr3_infrastructure/rstdiv0_sync_r1_reg*}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/xadc_supplied_temperature.rst_r1*}] 20
set_property src_info {type:SCOPED_XDC file:4 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]] -to [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]] -datapath_only 5.0
set_property src_info {type:SCOPED_XDC file:4 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_ar_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]] -to [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_ar_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]] -datapath_only 5.0
set_property src_info {type:SCOPED_XDC file:4 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_w_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]] -to  [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_w_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]] -datapath_only 5.0
set_property src_info {type:SCOPED_XDC file:4 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_r_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]] -to [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_r_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_chip2chip_0/inst/m_aclk]]]
set_property src_info {type:SCOPED_XDC file:4 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]] -to [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_aw_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]]  -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_chip2chip_0/inst/m_aclk]]]
set_property src_info {type:SCOPED_XDC file:4 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_ar_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]] -to [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_ar_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]]  -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_chip2chip_0/inst/m_aclk]]]
set_property src_info {type:SCOPED_XDC file:4 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_w_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]] -to  [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_w_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]]   -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_chip2chip_0/inst/m_aclk]]]
set_property src_info {type:SCOPED_XDC file:4 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_r_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]] -to [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_r_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]]  -datapath_only 5.0
set_property src_info {type:SCOPED_XDC file:4 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_b_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]] -to [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_b_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_chip2chip_0/inst/m_aclk]]]
set_property src_info {type:SCOPED_XDC file:4 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_b_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]] -to [get_cells slave_fpga_gen.axi_chip2chip_slave_inst/axi_chip2chip_b_fifo_inst/axi_chip2chip_async_fifo_inst/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]]  -datapath_only 5.0
set_property src_info {type:SCOPED_XDC file:4 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_disable_timing -from CLK -to O [filter [all_fanout -from [get_ports m_aclk] -flat -endpoints_only -only_cells] {PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==LUTRAM}]
set_property src_info {type:SCOPED_XDC file:5 line:51 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*RX_FIFO_II/USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*RX_FIFO_II/USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]}] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_quad_spi_0/U0/s_axi_aclk]]]
set_property src_info {type:SCOPED_XDC file:5 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*RX_FIFO_II/USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*RX_FIFO_II/USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]}] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_quad_spi_0/U0/ext_spi_clk]]]
set_property src_info {type:SCOPED_XDC file:5 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*TX_FIFO_II/USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*TX_FIFO_II/USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].wr_stg_inst/Q_reg_reg[*]}] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_quad_spi_0/U0/ext_spi_clk]]]
set_property src_info {type:SCOPED_XDC file:5 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells -hierarchical -filter {NAME =~*TX_FIFO_II/USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_gc_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*TX_FIFO_II/USE_2N_DEPTH.V6_S6_AND_LATER.I_ASYNC_FIFO_BRAM/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gcx.clkx/gsync_stage[*].rd_stg_inst/Q_reg_reg[*]}] -datapath_only [get_property -min PERIOD [get_clocks -of_objects [get_pins c2c_top_i/axi_quad_spi_0/U0/s_axi_aclk]]]