proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.cache/wt [current_project]
  set_property parent.project_path /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.xpr [current_project]
  set_property ip_repo_paths /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.cache/ip [current_project]
  set_property ip_output_repo /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.cache/ip [current_project]
  add_files -quiet /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.runs/MarsFEMII_synth/system_top.dcp
  add_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/MarsZX3.bmm
  set_property SCOPED_TO_REF MarsZX3 [get_files -all /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/MarsZX3.bmm]
  set_property SCOPED_TO_CELLS {} [get_files -all /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/MarsZX3.bmm]
  read_xdc -ref MarsZX3_axi_chip2chip_0_0 -cells inst /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_chip2chip_0_0/MarsZX3_axi_chip2chip_0_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_chip2chip_0_0/MarsZX3_axi_chip2chip_0_0.xdc]
  read_xdc -prop_thru_buffers -ref MarsZX3_axi_gpio_0_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_gpio_0_0/MarsZX3_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_gpio_0_0/MarsZX3_axi_gpio_0_0_board.xdc]
  read_xdc -ref MarsZX3_axi_gpio_0_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_gpio_0_0/MarsZX3_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_gpio_0_0/MarsZX3_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref MarsZX3_axi_quad_spi_0_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_quad_spi_0_0/MarsZX3_axi_quad_spi_0_0_board.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_quad_spi_0_0/MarsZX3_axi_quad_spi_0_0_board.xdc]
  read_xdc -ref MarsZX3_axi_quad_spi_0_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_quad_spi_0_0/MarsZX3_axi_quad_spi_0_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_quad_spi_0_0/MarsZX3_axi_quad_spi_0_0.xdc]
  read_xdc -ref MarsZX3_processing_system7_0_0 -cells inst /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_processing_system7_0_0/MarsZX3_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_processing_system7_0_0/MarsZX3_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref MarsZX3_reset_reg_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_reset_reg_0/MarsZX3_reset_reg_0_board.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_reset_reg_0/MarsZX3_reset_reg_0_board.xdc]
  read_xdc -ref MarsZX3_reset_reg_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_reset_reg_0/MarsZX3_reset_reg_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_reset_reg_0/MarsZX3_reset_reg_0.xdc]
  read_xdc -prop_thru_buffers -ref MarsZX3_rst_processing_system7_0_50M_0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_rst_processing_system7_0_50M_0/MarsZX3_rst_processing_system7_0_50M_0_board.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_rst_processing_system7_0_50M_0/MarsZX3_rst_processing_system7_0_50M_0_board.xdc]
  read_xdc -ref MarsZX3_rst_processing_system7_0_50M_0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_rst_processing_system7_0_50M_0/MarsZX3_rst_processing_system7_0_50M_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_rst_processing_system7_0_50M_0/MarsZX3_rst_processing_system7_0_50M_0.xdc]
  read_xdc -prop_thru_buffers -ref MarsZX3_rst_processing_system7_0_50M1_0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_rst_processing_system7_0_50M1_0/MarsZX3_rst_processing_system7_0_50M1_0_board.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_rst_processing_system7_0_50M1_0/MarsZX3_rst_processing_system7_0_50M1_0_board.xdc]
  read_xdc -ref MarsZX3_rst_processing_system7_0_50M1_0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_rst_processing_system7_0_50M1_0/MarsZX3_rst_processing_system7_0_50M1_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_rst_processing_system7_0_50M1_0/MarsZX3_rst_processing_system7_0_50M1_0.xdc]
  read_xdc -prop_thru_buffers -ref MarsZX3_status_control_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_status_control_0/MarsZX3_status_control_0_board.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_status_control_0/MarsZX3_status_control_0_board.xdc]
  read_xdc -ref MarsZX3_status_control_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_status_control_0/MarsZX3_status_control_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_status_control_0/MarsZX3_status_control_0.xdc]
  read_xdc -ref MarsZX3_xadc_wiz_0_0 -cells inst /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_xadc_wiz_0_0/MarsZX3_xadc_wiz_0_0.xdc
  set_property processing_order EARLY [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_xadc_wiz_0_0/MarsZX3_xadc_wiz_0_0.xdc]
  read_xdc /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/src/MarsZX3_FEMII.xdc
  read_xdc -ref MarsZX3_axi_chip2chip_0_0 -cells inst /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_chip2chip_0_0/MarsZX3_axi_chip2chip_0_0_clocks.xdc
  set_property processing_order LATE [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_chip2chip_0_0/MarsZX3_axi_chip2chip_0_0_clocks.xdc]
  read_xdc -ref MarsZX3_axi_quad_spi_0_0 -cells U0 /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_quad_spi_0_0/MarsZX3_axi_quad_spi_0_0_clocks.xdc
  set_property processing_order LATE [get_files /scratch/qem/adam/development/fem-ii-embedded-system/Mars_ZX3_Reference_Design_for_FEMII/Vivado_FEMII/MarsZX3_FEMII.srcs/sources_1/bd/MarsZX3/ip/MarsZX3_axi_quad_spi_0_0/MarsZX3_axi_quad_spi_0_0_clocks.xdc]
  link_design -top system_top -part xc7z020clg484-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force system_top_opt.dcp
  catch {report_drc -file system_top_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file system_top.hwdef}
  place_design 
  write_checkpoint -force system_top_placed.dcp
  catch { report_io -file system_top_io_placed.rpt }
  catch { report_utilization -file system_top_utilization_placed.rpt -pb system_top_utilization_placed.pb }
  catch { report_control_sets -verbose -file system_top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force system_top_routed.dcp
  catch { report_drc -file system_top_drc_routed.rpt -pb system_top_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file system_top_timing_summary_routed.rpt -rpx system_top_timing_summary_routed.rpx }
  catch { report_power -file system_top_power_routed.rpt -pb system_top_power_summary_routed.pb }
  catch { report_route_status -file system_top_route_status.rpt -pb system_top_route_status.pb }
  catch { report_clock_utilization -file system_top_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force system_top.mmi }
  catch { write_bmm -force system_top_bd.bmm }
  write_bitstream -force system_top.bit 
  catch { write_sysdef -hwdef system_top.hwdef -bitfile system_top.bit -meminfo system_top.mmi -ltxfile debug_nets.ltx -file system_top.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

