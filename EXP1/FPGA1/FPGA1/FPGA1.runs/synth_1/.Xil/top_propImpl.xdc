set_property SRC_FILE_INFO {cfile:C:/Users/Darshana/Documents/GitHub/JitFilt/JitFilt-PLL/EXP1/FPGA1/FPGA1/FPGA1.srcs/constrs_1/imports/new/our_constraints.xdc rfile:../../../FPGA1.srcs/constrs_1/imports/new/our_constraints.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:81 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property src_info {type:XDC file:1 line:86 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y11 [get_ports tx]
set_property src_info {type:XDC file:1 line:88 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA11 [get_ports rx]
set_property src_info {type:XDC file:1 line:99 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W12 [get_ports testpin];  # "JB1"
set_property src_info {type:XDC file:1 line:111 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB6 [get_ports trig];  # "JC1_N"
set_property src_info {type:XDC file:1 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y4  [get_ports clk_TDC];  # "JC2_P"
set_property src_info {type:XDC file:1 line:117 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T6  [get_ports tx_TDC];  # "JC3_N"
set_property src_info {type:XDC file:1 line:119 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T4  [get_ports rx_TDC];  # "JC4_P"
set_property src_info {type:XDC file:1 line:175 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T22 [get_ports {led[0]}]
set_property src_info {type:XDC file:1 line:176 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T21 [get_ports {led[1]}]
set_property src_info {type:XDC file:1 line:177 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U22 [get_ports {led[2]}]
set_property src_info {type:XDC file:1 line:178 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U21 [get_ports {led[3]}];  # "LD3"
set_property src_info {type:XDC file:1 line:179 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V22 [get_ports {led[4]}];  # "LD4"
set_property src_info {type:XDC file:1 line:362 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]
set_property src_info {type:XDC file:1 line:373 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]
set_property src_info {type:XDC file:1 line:1208 export:INPUT save:INPUT read:READ} [current_design]
create_pblock pblock_aes1
add_cells_to_pblock [get_pblocks pblock_aes1] [get_cells -quiet [list {genblk1[0].aes_instance} {genblk1[1].aes_instance} {genblk1[2].aes_instance} {genblk1[3].aes_instance}]]
resize_pblock [get_pblocks pblock_aes1] -add {SLICE_X26Y50:SLICE_X113Y100}
resize_pblock [get_pblocks pblock_aes1] -add {DSP48_X2Y20:DSP48_X4Y39}
resize_pblock [get_pblocks pblock_aes1] -add {RAMB18_X2Y20:RAMB18_X5Y39}
resize_pblock [get_pblocks pblock_aes1] -add {RAMB36_X2Y10:RAMB36_X5Y19}
