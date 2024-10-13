set_property SRC_FILE_INFO {cfile:C:/Users/Darshana/Documents/GitHub/JitFilt/EXP2/FPGA2/FPGA2/FPGA2.srcs/constrs_1/imports/new/our_constraints.xdc rfile:../../../FPGA2.srcs/constrs_1/imports/new/our_constraints.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]
set_property src_info {type:XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_property LOC PLLE2_ADV_X1Y0 [get_cells cf/PLLE2_ADV_inst]
set_property src_info {type:XDC file:1 line:104 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W12 [get_ports clk];       # "JB1"
set_property src_info {type:XDC file:1 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W11 [get_ports trig];      # "JB2"
set_property src_info {type:XDC file:1 line:106 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V10 [get_ports rx];        # "JB3"
set_property src_info {type:XDC file:1 line:107 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W8  [get_ports test_pin];  # "JB4"
set_property src_info {type:XDC file:1 line:108 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V12 [get_ports tx];        # "JB7"
set_property src_info {type:XDC file:1 line:109 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W10 [get_ports rx_TDC];    # "JB8"
set_property src_info {type:XDC file:1 line:117 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB7 [get_ports {tx}];  # "JC1_P"
set_property src_info {type:XDC file:1 line:131 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V5 [get_ports {clk_filt}];  # "JD2_P"
set_property src_info {type:XDC file:1 line:179 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T22 [get_ports {led[0]}]
set_property src_info {type:XDC file:1 line:180 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T21 [get_ports {led[1]}]
set_property src_info {type:XDC file:1 line:181 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U22 [get_ports {led[2]}]
set_property src_info {type:XDC file:1 line:182 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U21 [get_ports {led[3]}];  # "LD3"
set_property src_info {type:XDC file:1 line:183 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V22 [get_ports {led[4]}];  # "LD4"
set_property src_info {type:XDC file:1 line:184 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W22 [get_ports {led[5]}];  # "LD5"
set_property src_info {type:XDC file:1 line:241 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F22 [get_ports {sw}];  # "SW0"
set_property src_info {type:XDC file:1 line:366 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]
set_property src_info {type:XDC file:1 line:377 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]
set_property src_info {type:XDC file:1 line:378 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]]
set_property src_info {type:XDC file:1 line:387 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[39].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[39].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[39].CARRY4_insti} {tp/gen_code_label2[156].LDPE_insti} {tp/gen_code_label2[157].LDPE_insti} {tp/gen_code_label2[158].LDPE_insti} {tp/gen_code_label2[159].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[39].CARRY4_insti}] -add {SLICE_X42Y44:SLICE_X43Y44}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[39].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:393 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[38].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[38].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[38].CARRY4_insti} {tp/gen_code_label2[152].LDPE_insti} {tp/gen_code_label2[153].LDPE_insti} {tp/gen_code_label2[154].LDPE_insti} {tp/gen_code_label2[155].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[38].CARRY4_insti}] -add {SLICE_X42Y43:SLICE_X43Y43}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[38].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:399 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[37].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[37].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[37].CARRY4_insti} {tp/gen_code_label2[148].LDPE_insti} {tp/gen_code_label2[149].LDPE_insti} {tp/gen_code_label2[150].LDPE_insti} {tp/gen_code_label2[151].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[37].CARRY4_insti}] -add {SLICE_X42Y42:SLICE_X43Y42}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[37].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:405 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[36].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[36].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[36].CARRY4_insti} {tp/gen_code_label2[144].LDPE_insti} {tp/gen_code_label2[145].LDPE_insti} {tp/gen_code_label2[146].LDPE_insti} {tp/gen_code_label2[147].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[36].CARRY4_insti}] -add {SLICE_X42Y41:SLICE_X43Y41}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[36].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:411 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[35].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[35].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[35].CARRY4_insti} {tp/gen_code_label2[140].LDPE_insti} {tp/gen_code_label2[141].LDPE_insti} {tp/gen_code_label2[142].LDPE_insti} {tp/gen_code_label2[143].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[35].CARRY4_insti}] -add {SLICE_X42Y40:SLICE_X43Y40}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[35].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:417 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[34].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[34].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[34].CARRY4_insti} {tp/gen_code_label2[136].LDPE_insti} {tp/gen_code_label2[137].LDPE_insti} {tp/gen_code_label2[138].LDPE_insti} {tp/gen_code_label2[139].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[34].CARRY4_insti}] -add {SLICE_X42Y39:SLICE_X43Y39}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[34].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:423 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[33].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[33].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[33].CARRY4_insti} {tp/gen_code_label2[132].LDPE_insti} {tp/gen_code_label2[133].LDPE_insti} {tp/gen_code_label2[134].LDPE_insti} {tp/gen_code_label2[135].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[33].CARRY4_insti}] -add {SLICE_X42Y38:SLICE_X43Y38}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[33].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:429 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[32].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[32].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[32].CARRY4_insti} {tp/gen_code_label2[128].LDPE_insti} {tp/gen_code_label2[129].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[32].CARRY4_insti}] -add {SLICE_X42Y37:SLICE_X43Y37}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[32].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:435 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[31].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[31].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[31].CARRY4_insti} {tp/gen_code_label2[124].LDPE_insti} {tp/gen_code_label2[125].LDPE_insti} {tp/gen_code_label2[126].LDPE_insti} {tp/gen_code_label2[127].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[31].CARRY4_insti}] -add {SLICE_X42Y36:SLICE_X43Y36}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[31].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:441 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[30].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[30].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[30].CARRY4_insti} {tp/gen_code_label2[120].LDPE_insti} {tp/gen_code_label2[121].LDPE_insti} {tp/gen_code_label2[122].LDPE_insti} {tp/gen_code_label2[123].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[30].CARRY4_insti}] -add {SLICE_X42Y35:SLICE_X43Y35}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[30].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:447 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[29].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[29].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[29].CARRY4_insti} {tp/gen_code_label2[116].LDPE_insti} {tp/gen_code_label2[117].LDPE_insti} {tp/gen_code_label2[118].LDPE_insti} {tp/gen_code_label2[119].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[29].CARRY4_insti}] -add {SLICE_X42Y34:SLICE_X43Y34}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[29].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:453 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[28].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[28].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[28].CARRY4_insti} {tp/gen_code_label2[112].LDPE_insti} {tp/gen_code_label2[113].LDPE_insti} {tp/gen_code_label2[114].LDPE_insti} {tp/gen_code_label2[115].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[28].CARRY4_insti}] -add {SLICE_X42Y33:SLICE_X43Y33}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[28].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:460 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[27].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[27].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[27].CARRY4_insti} {tp/gen_code_label2[108].LDPE_insti} {tp/gen_code_label2[109].LDPE_insti} {tp/gen_code_label2[110].LDPE_insti} {tp/gen_code_label2[111].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[27].CARRY4_insti}] -add {SLICE_X42Y32:SLICE_X43Y32}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[27].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:466 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[26].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[26].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[26].CARRY4_insti} {tp/gen_code_label2[104].LDPE_insti} {tp/gen_code_label2[105].LDPE_insti} {tp/gen_code_label2[106].LDPE_insti} {tp/gen_code_label2[107].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[26].CARRY4_insti}] -add {SLICE_X42Y31:SLICE_X43Y31}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[26].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:472 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[25].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[25].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[25].CARRY4_insti} {tp/gen_code_label2[100].LDPE_insti} {tp/gen_code_label2[101].LDPE_insti} {tp/gen_code_label2[102].LDPE_insti} {tp/gen_code_label2[103].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[25].CARRY4_insti}] -add {SLICE_X42Y30:SLICE_X43Y30}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[25].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:478 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[24].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[24].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[24].CARRY4_insti} {tp/gen_code_label2[96].LDPE_insti} {tp/gen_code_label2[97].LDPE_insti} {tp/gen_code_label2[98].LDPE_insti} {tp/gen_code_label2[99].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[24].CARRY4_insti}] -add {SLICE_X42Y29:SLICE_X43Y29}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[24].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:484 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[23].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[23].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[23].CARRY4_insti} {tp/gen_code_label2[92].LDPE_insti} {tp/gen_code_label2[93].LDPE_insti} {tp/gen_code_label2[94].LDPE_insti} {tp/gen_code_label2[95].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[23].CARRY4_insti}] -add {SLICE_X42Y28:SLICE_X43Y28}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[23].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:490 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[22].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[22].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[22].CARRY4_insti} {tp/gen_code_label2[88].LDPE_insti} {tp/gen_code_label2[89].LDPE_insti} {tp/gen_code_label2[90].LDPE_insti} {tp/gen_code_label2[91].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[22].CARRY4_insti}] -add {SLICE_X42Y27:SLICE_X43Y27}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[22].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:496 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[21].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[21].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[21].CARRY4_insti} {tp/gen_code_label2[84].LDPE_insti} {tp/gen_code_label2[85].LDPE_insti} {tp/gen_code_label2[86].LDPE_insti} {tp/gen_code_label2[87].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[21].CARRY4_insti}] -add {SLICE_X42Y26:SLICE_X43Y26}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[21].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:502 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[20].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[20].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[20].CARRY4_insti} {tp/gen_code_label2[80].LDPE_insti} {tp/gen_code_label2[81].LDPE_insti} {tp/gen_code_label2[82].LDPE_insti} {tp/gen_code_label2[83].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[20].CARRY4_insti}] -add {SLICE_X42Y25:SLICE_X43Y25}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[20].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:508 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[19].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[19].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[19].CARRY4_insti} {tp/gen_code_label2[76].LDPE_insti} {tp/gen_code_label2[77].LDPE_insti} {tp/gen_code_label2[78].LDPE_insti} {tp/gen_code_label2[79].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[19].CARRY4_insti}] -add {SLICE_X42Y24:SLICE_X43Y24}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[19].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:514 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[18].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[18].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[18].CARRY4_insti} {tp/gen_code_label2[72].LDPE_insti} {tp/gen_code_label2[73].LDPE_insti} {tp/gen_code_label2[74].LDPE_insti} {tp/gen_code_label2[75].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[18].CARRY4_insti}] -add {SLICE_X42Y23:SLICE_X43Y23}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[18].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:520 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[17].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[17].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[17].CARRY4_insti} {tp/gen_code_label2[68].LDPE_insti} {tp/gen_code_label2[69].LDPE_insti} {tp/gen_code_label2[70].LDPE_insti} {tp/gen_code_label2[71].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[17].CARRY4_insti}] -add {SLICE_X42Y22:SLICE_X43Y22}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[17].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:526 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[16].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[16].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[16].CARRY4_insti} {tp/gen_code_label2[64].LDPE_insti} {tp/gen_code_label2[65].LDPE_insti} {tp/gen_code_label2[66].LDPE_insti} {tp/gen_code_label2[67].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[16].CARRY4_insti}] -add {SLICE_X42Y21:SLICE_X43Y21}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[16].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:532 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[15].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[15].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[15].CARRY4_insti} {tp/gen_code_label2[60].LDPE_insti} {tp/gen_code_label2[61].LDPE_insti} {tp/gen_code_label2[62].LDPE_insti} {tp/gen_code_label2[63].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[15].CARRY4_insti}] -add {SLICE_X42Y20:SLICE_X43Y20}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[15].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:538 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[14].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[14].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[14].CARRY4_insti} {tp/gen_code_label2[56].LDPE_insti} {tp/gen_code_label2[57].LDPE_insti} {tp/gen_code_label2[58].LDPE_insti} {tp/gen_code_label2[59].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[14].CARRY4_insti}] -add {SLICE_X42Y19:SLICE_X43Y19}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[14].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:544 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[13].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[13].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[13].CARRY4_insti} {tp/gen_code_label2[52].LDPE_insti} {tp/gen_code_label2[53].LDPE_insti} {tp/gen_code_label2[54].LDPE_insti} {tp/gen_code_label2[55].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[13].CARRY4_insti}] -add {SLICE_X42Y18:SLICE_X43Y18}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[13].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:550 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[12].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[12].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[12].CARRY4_insti} {tp/gen_code_label2[48].LDPE_insti} {tp/gen_code_label2[49].LDPE_insti} {tp/gen_code_label2[50].LDPE_insti} {tp/gen_code_label2[51].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[12].CARRY4_insti}] -add {SLICE_X42Y17:SLICE_X43Y17}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[12].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:556 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[11].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[11].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[11].CARRY4_insti} {tp/gen_code_label2[44].LDPE_insti} {tp/gen_code_label2[45].LDPE_insti} {tp/gen_code_label2[46].LDPE_insti} {tp/gen_code_label2[47].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[11].CARRY4_insti}] -add {SLICE_X42Y16:SLICE_X43Y16}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[11].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:562 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[10].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[10].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[10].CARRY4_insti} {tp/gen_code_label2[40].LDPE_insti} {tp/gen_code_label2[41].LDPE_insti} {tp/gen_code_label2[42].LDPE_insti} {tp/gen_code_label2[43].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[10].CARRY4_insti}] -add {SLICE_X42Y15:SLICE_X43Y15}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[10].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:568 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[9].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[9].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[9].CARRY4_insti} {tp/gen_code_label2[36].LDPE_insti} {tp/gen_code_label2[37].LDPE_insti} {tp/gen_code_label2[38].LDPE_insti} {tp/gen_code_label2[39].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[9].CARRY4_insti}] -add {SLICE_X42Y14:SLICE_X43Y14}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[9].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:574 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[8].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[8].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[8].CARRY4_insti} {tp/gen_code_label2[32].LDPE_insti} {tp/gen_code_label2[33].LDPE_insti} {tp/gen_code_label2[34].LDPE_insti} {tp/gen_code_label2[35].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[8].CARRY4_insti}] -add {SLICE_X42Y13:SLICE_X43Y13}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[8].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:580 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[7].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[7].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[7].CARRY4_insti} {tp/gen_code_label2[28].LDPE_insti} {tp/gen_code_label2[29].LDPE_insti} {tp/gen_code_label2[30].LDPE_insti} {tp/gen_code_label2[31].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[7].CARRY4_insti}] -add {SLICE_X42Y12:SLICE_X43Y12}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[7].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:586 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[6].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[6].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[6].CARRY4_insti} {tp/gen_code_label2[24].LDPE_insti} {tp/gen_code_label2[25].LDPE_insti} {tp/gen_code_label2[26].LDPE_insti} {tp/gen_code_label2[27].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[6].CARRY4_insti}] -add {SLICE_X42Y11:SLICE_X43Y11}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[6].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:592 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[5].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[5].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[5].CARRY4_insti} {tp/gen_code_label2[20].LDPE_insti} {tp/gen_code_label2[21].LDPE_insti} {tp/gen_code_label2[22].LDPE_insti} {tp/gen_code_label2[23].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[5].CARRY4_insti}] -add {SLICE_X42Y10:SLICE_X43Y10}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[5].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:598 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[4].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[4].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[4].CARRY4_insti} {tp/gen_code_label2[16].LDPE_insti} {tp/gen_code_label2[17].LDPE_insti} {tp/gen_code_label2[18].LDPE_insti} {tp/gen_code_label2[19].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[4].CARRY4_insti}] -add {SLICE_X42Y9:SLICE_X43Y9}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[4].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:604 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[3].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[3].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[3].CARRY4_insti} {tp/gen_code_label2[12].LDPE_insti} {tp/gen_code_label2[13].LDPE_insti} {tp/gen_code_label2[14].LDPE_insti} {tp/gen_code_label2[15].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[3].CARRY4_insti}] -add {SLICE_X42Y8:SLICE_X43Y8}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[3].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:610 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[2].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[2].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[2].CARRY4_insti} {tp/gen_code_label2[10].LDPE_insti} {tp/gen_code_label2[11].LDPE_insti} {tp/gen_code_label2[8].LDPE_insti} {tp/gen_code_label2[9].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[2].CARRY4_insti}] -add {SLICE_X42Y7:SLICE_X43Y7}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[2].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:616 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[1].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[1].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[1].CARRY4_insti} {tp/gen_code_label2[4].LDPE_insti} {tp/gen_code_label2[5].LDPE_insti} {tp/gen_code_label2[6].LDPE_insti} {tp/gen_code_label2[7].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[1].CARRY4_insti}] -add {SLICE_X42Y6:SLICE_X43Y6}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[1].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:622 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_2[0].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_2[0].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label1[0].CARRY4_insti} {tp/gen_code_label2[0].LDPE_insti} {tp/gen_code_label2[1].LDPE_insti} {tp/gen_code_label2[2].LDPE_insti} {tp/gen_code_label2[3].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_2[0].CARRY4_insti}] -add {SLICE_X42Y5:SLICE_X43Y5}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_2[0].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:630 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_idelay1[3]}
resize_pblock [get_pblocks {pblock_idelay1[3]}] -add {SLICE_X42Y4:SLICE_X43Y4}
set_property IS_SOFT FALSE [get_pblocks {pblock_idelay1[3]}]
set_property src_info {type:XDC file:1 line:635 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_idelay1[2]}
resize_pblock [get_pblocks {pblock_idelay1[2]}] -add {SLICE_X42Y3:SLICE_X43Y3}
set_property IS_SOFT FALSE [get_pblocks {pblock_idelay1[2]}]
set_property src_info {type:XDC file:1 line:640 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_idelay1[1]}
resize_pblock [get_pblocks {pblock_idelay1[1]}] -add {SLICE_X42Y2:SLICE_X43Y2}
set_property IS_SOFT FALSE [get_pblocks {pblock_idelay1[1]}]
set_property src_info {type:XDC file:1 line:645 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_idelay1[0]}
resize_pblock [get_pblocks {pblock_idelay1[0]}] -add {SLICE_X42Y1:SLICE_X43Y1}
set_property IS_SOFT FALSE [get_pblocks {pblock_idelay1[0]}]
set_property src_info {type:XDC file:1 line:920 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[39].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[39].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[39].CARRY4_insti} {tp1/gen_code_label2[156].LDPE_insti} {tp1/gen_code_label2[157].LDPE_insti} {tp1/gen_code_label2[158].LDPE_insti} {tp1/gen_code_label2[159].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[39].CARRY4_insti}] -add {SLICE_X32Y44:SLICE_X33Y44}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[39].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:926 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[38].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[38].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[38].CARRY4_insti} {tp1/gen_code_label2[152].LDPE_insti} {tp1/gen_code_label2[153].LDPE_insti} {tp1/gen_code_label2[154].LDPE_insti} {tp1/gen_code_label2[155].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[38].CARRY4_insti}] -add {SLICE_X32Y43:SLICE_X33Y43}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[38].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:932 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[37].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[37].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[37].CARRY4_insti} {tp1/gen_code_label2[148].LDPE_insti} {tp1/gen_code_label2[149].LDPE_insti} {tp1/gen_code_label2[150].LDPE_insti} {tp1/gen_code_label2[151].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[37].CARRY4_insti}] -add {SLICE_X32Y42:SLICE_X33Y42}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[37].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:938 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[36].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[36].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[36].CARRY4_insti} {tp1/gen_code_label2[144].LDPE_insti} {tp1/gen_code_label2[145].LDPE_insti} {tp1/gen_code_label2[146].LDPE_insti} {tp1/gen_code_label2[147].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[36].CARRY4_insti}] -add {SLICE_X32Y41:SLICE_X33Y41}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[36].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:944 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[35].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[35].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[35].CARRY4_insti} {tp1/gen_code_label2[140].LDPE_insti} {tp1/gen_code_label2[141].LDPE_insti} {tp1/gen_code_label2[142].LDPE_insti} {tp1/gen_code_label2[143].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[35].CARRY4_insti}] -add {SLICE_X32Y40:SLICE_X33Y40}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[35].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:950 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[34].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[34].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[34].CARRY4_insti} {tp1/gen_code_label2[136].LDPE_insti} {tp1/gen_code_label2[137].LDPE_insti} {tp1/gen_code_label2[138].LDPE_insti} {tp1/gen_code_label2[139].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[34].CARRY4_insti}] -add {SLICE_X32Y39:SLICE_X33Y39}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[34].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:956 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[33].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[33].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[33].CARRY4_insti} {tp1/gen_code_label2[132].LDPE_insti} {tp1/gen_code_label2[133].LDPE_insti} {tp1/gen_code_label2[134].LDPE_insti} {tp1/gen_code_label2[135].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[33].CARRY4_insti}] -add {SLICE_X32Y38:SLICE_X33Y38}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[33].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:962 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[32].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[32].CARRY4_insti}] [get_cells -quiet [list {tp/gen_code_label2[130].LDPE_insti} {tp/gen_code_label2[131].LDPE_insti} {tp1/gen_code_label1[32].CARRY4_insti} {tp1/gen_code_label2[128].LDPE_insti} {tp1/gen_code_label2[129].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[32].CARRY4_insti}] -add {SLICE_X32Y37:SLICE_X33Y37}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[32].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:968 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[31].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[31].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[31].CARRY4_insti} {tp1/gen_code_label2[124].LDPE_insti} {tp1/gen_code_label2[125].LDPE_insti} {tp1/gen_code_label2[126].LDPE_insti} {tp1/gen_code_label2[127].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[31].CARRY4_insti}] -add {SLICE_X32Y36:SLICE_X33Y36}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[31].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:974 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[30].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[30].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[30].CARRY4_insti} {tp1/gen_code_label2[120].LDPE_insti} {tp1/gen_code_label2[121].LDPE_insti} {tp1/gen_code_label2[122].LDPE_insti} {tp1/gen_code_label2[123].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[30].CARRY4_insti}] -add {SLICE_X32Y35:SLICE_X33Y35}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[30].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:980 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[29].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[29].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[29].CARRY4_insti} {tp1/gen_code_label2[116].LDPE_insti} {tp1/gen_code_label2[117].LDPE_insti} {tp1/gen_code_label2[118].LDPE_insti} {tp1/gen_code_label2[119].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[29].CARRY4_insti}] -add {SLICE_X32Y34:SLICE_X33Y34}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[29].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:986 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[28].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[28].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[28].CARRY4_insti} {tp1/gen_code_label2[112].LDPE_insti} {tp1/gen_code_label2[113].LDPE_insti} {tp1/gen_code_label2[114].LDPE_insti} {tp1/gen_code_label2[115].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[28].CARRY4_insti}] -add {SLICE_X32Y33:SLICE_X33Y33}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[28].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:993 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[27].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[27].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[27].CARRY4_insti} {tp1/gen_code_label2[108].LDPE_insti} {tp1/gen_code_label2[109].LDPE_insti} {tp1/gen_code_label2[110].LDPE_insti} {tp1/gen_code_label2[111].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[27].CARRY4_insti}] -add {SLICE_X32Y32:SLICE_X33Y32}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[27].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:999 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[26].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[26].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[26].CARRY4_insti} {tp1/gen_code_label2[104].LDPE_insti} {tp1/gen_code_label2[105].LDPE_insti} {tp1/gen_code_label2[106].LDPE_insti} {tp1/gen_code_label2[107].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[26].CARRY4_insti}] -add {SLICE_X32Y31:SLICE_X33Y31}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[26].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1005 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[25].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[25].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[25].CARRY4_insti} {tp1/gen_code_label2[100].LDPE_insti} {tp1/gen_code_label2[101].LDPE_insti} {tp1/gen_code_label2[102].LDPE_insti} {tp1/gen_code_label2[103].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[25].CARRY4_insti}] -add {SLICE_X32Y30:SLICE_X33Y30}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[25].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1011 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[24].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[24].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[24].CARRY4_insti} {tp1/gen_code_label2[96].LDPE_insti} {tp1/gen_code_label2[97].LDPE_insti} {tp1/gen_code_label2[98].LDPE_insti} {tp1/gen_code_label2[99].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[24].CARRY4_insti}] -add {SLICE_X32Y29:SLICE_X33Y29}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[24].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1017 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[23].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[23].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[23].CARRY4_insti} {tp1/gen_code_label2[92].LDPE_insti} {tp1/gen_code_label2[93].LDPE_insti} {tp1/gen_code_label2[94].LDPE_insti} {tp1/gen_code_label2[95].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[23].CARRY4_insti}] -add {SLICE_X32Y28:SLICE_X33Y28}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[23].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1023 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[22].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[22].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[22].CARRY4_insti} {tp1/gen_code_label2[88].LDPE_insti} {tp1/gen_code_label2[89].LDPE_insti} {tp1/gen_code_label2[90].LDPE_insti} {tp1/gen_code_label2[91].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[22].CARRY4_insti}] -add {SLICE_X32Y27:SLICE_X33Y27}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[22].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1029 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[21].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[21].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[21].CARRY4_insti} {tp1/gen_code_label2[84].LDPE_insti} {tp1/gen_code_label2[85].LDPE_insti} {tp1/gen_code_label2[86].LDPE_insti} {tp1/gen_code_label2[87].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[21].CARRY4_insti}] -add {SLICE_X32Y26:SLICE_X33Y26}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[21].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1035 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[20].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[20].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[20].CARRY4_insti} {tp1/gen_code_label2[80].LDPE_insti} {tp1/gen_code_label2[81].LDPE_insti} {tp1/gen_code_label2[82].LDPE_insti} {tp1/gen_code_label2[83].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[20].CARRY4_insti}] -add {SLICE_X32Y25:SLICE_X33Y25}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[20].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1041 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[19].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[19].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[19].CARRY4_insti} {tp1/gen_code_label2[76].LDPE_insti} {tp1/gen_code_label2[77].LDPE_insti} {tp1/gen_code_label2[78].LDPE_insti} {tp1/gen_code_label2[79].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[19].CARRY4_insti}] -add {SLICE_X32Y24:SLICE_X33Y24}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[19].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1047 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[18].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[18].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[18].CARRY4_insti} {tp1/gen_code_label2[72].LDPE_insti} {tp1/gen_code_label2[73].LDPE_insti} {tp1/gen_code_label2[74].LDPE_insti} {tp1/gen_code_label2[75].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[18].CARRY4_insti}] -add {SLICE_X32Y23:SLICE_X33Y23}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[18].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1053 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[17].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[17].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[17].CARRY4_insti} {tp1/gen_code_label2[68].LDPE_insti} {tp1/gen_code_label2[69].LDPE_insti} {tp1/gen_code_label2[70].LDPE_insti} {tp1/gen_code_label2[71].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[17].CARRY4_insti}] -add {SLICE_X32Y22:SLICE_X33Y22}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[17].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1059 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[16].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[16].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[16].CARRY4_insti} {tp1/gen_code_label2[64].LDPE_insti} {tp1/gen_code_label2[65].LDPE_insti} {tp1/gen_code_label2[66].LDPE_insti} {tp1/gen_code_label2[67].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[16].CARRY4_insti}] -add {SLICE_X32Y21:SLICE_X33Y21}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[16].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1065 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[15].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[15].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[15].CARRY4_insti} {tp1/gen_code_label2[60].LDPE_insti} {tp1/gen_code_label2[61].LDPE_insti} {tp1/gen_code_label2[62].LDPE_insti} {tp1/gen_code_label2[63].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[15].CARRY4_insti}] -add {SLICE_X32Y20:SLICE_X33Y20}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[15].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1071 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[14].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[14].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[14].CARRY4_insti} {tp1/gen_code_label2[56].LDPE_insti} {tp1/gen_code_label2[57].LDPE_insti} {tp1/gen_code_label2[58].LDPE_insti} {tp1/gen_code_label2[59].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[14].CARRY4_insti}] -add {SLICE_X32Y19:SLICE_X33Y19}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[14].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1077 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[13].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[13].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[13].CARRY4_insti} {tp1/gen_code_label2[52].LDPE_insti} {tp1/gen_code_label2[53].LDPE_insti} {tp1/gen_code_label2[54].LDPE_insti} {tp1/gen_code_label2[55].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[13].CARRY4_insti}] -add {SLICE_X32Y18:SLICE_X33Y18}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[13].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1083 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[12].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[12].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[12].CARRY4_insti} {tp1/gen_code_label2[48].LDPE_insti} {tp1/gen_code_label2[49].LDPE_insti} {tp1/gen_code_label2[50].LDPE_insti} {tp1/gen_code_label2[51].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[12].CARRY4_insti}] -add {SLICE_X32Y17:SLICE_X33Y17}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[12].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1089 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[11].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[11].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[11].CARRY4_insti} {tp1/gen_code_label2[44].LDPE_insti} {tp1/gen_code_label2[45].LDPE_insti} {tp1/gen_code_label2[46].LDPE_insti} {tp1/gen_code_label2[47].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[11].CARRY4_insti}] -add {SLICE_X32Y16:SLICE_X33Y16}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[11].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1095 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[10].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[10].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[10].CARRY4_insti} {tp1/gen_code_label2[40].LDPE_insti} {tp1/gen_code_label2[41].LDPE_insti} {tp1/gen_code_label2[42].LDPE_insti} {tp1/gen_code_label2[43].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[10].CARRY4_insti}] -add {SLICE_X32Y15:SLICE_X33Y15}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[10].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1101 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[9].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[9].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[9].CARRY4_insti} {tp1/gen_code_label2[36].LDPE_insti} {tp1/gen_code_label2[37].LDPE_insti} {tp1/gen_code_label2[38].LDPE_insti} {tp1/gen_code_label2[39].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[9].CARRY4_insti}] -add {SLICE_X32Y14:SLICE_X33Y14}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[9].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1107 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[8].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[8].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[8].CARRY4_insti} {tp1/gen_code_label2[32].LDPE_insti} {tp1/gen_code_label2[33].LDPE_insti} {tp1/gen_code_label2[34].LDPE_insti} {tp1/gen_code_label2[35].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[8].CARRY4_insti}] -add {SLICE_X32Y13:SLICE_X33Y13}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[8].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1113 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[7].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[7].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[7].CARRY4_insti} {tp1/gen_code_label2[28].LDPE_insti} {tp1/gen_code_label2[29].LDPE_insti} {tp1/gen_code_label2[30].LDPE_insti} {tp1/gen_code_label2[31].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[7].CARRY4_insti}] -add {SLICE_X32Y12:SLICE_X33Y12}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[7].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1119 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[6].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[6].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[6].CARRY4_insti} {tp1/gen_code_label2[24].LDPE_insti} {tp1/gen_code_label2[25].LDPE_insti} {tp1/gen_code_label2[26].LDPE_insti} {tp1/gen_code_label2[27].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[6].CARRY4_insti}] -add {SLICE_X32Y11:SLICE_X33Y11}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[6].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1125 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[5].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[5].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[5].CARRY4_insti} {tp1/gen_code_label2[20].LDPE_insti} {tp1/gen_code_label2[21].LDPE_insti} {tp1/gen_code_label2[22].LDPE_insti} {tp1/gen_code_label2[23].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[5].CARRY4_insti}] -add {SLICE_X32Y10:SLICE_X33Y10}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[5].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1131 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[4].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[4].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[4].CARRY4_insti} {tp1/gen_code_label2[16].LDPE_insti} {tp1/gen_code_label2[17].LDPE_insti} {tp1/gen_code_label2[18].LDPE_insti} {tp1/gen_code_label2[19].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[4].CARRY4_insti}] -add {SLICE_X32Y9:SLICE_X33Y9}
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[4].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1137 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[3].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[3].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[3].CARRY4_insti} {tp1/gen_code_label2[12].LDPE_insti} {tp1/gen_code_label2[13].LDPE_insti} {tp1/gen_code_label2[14].LDPE_insti} {tp1/gen_code_label2[15].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[3].CARRY4_insti}] -add {SLICE_X32Y8:SLICE_X33Y8}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_tp_1[3].CARRY4_insti}]
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[3].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1144 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[2].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[2].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[2].CARRY4_insti} {tp1/gen_code_label2[10].LDPE_insti} {tp1/gen_code_label2[11].LDPE_insti} {tp1/gen_code_label2[8].LDPE_insti} {tp1/gen_code_label2[9].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[2].CARRY4_insti}] -add {SLICE_X32Y7:SLICE_X33Y7}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_tp_1[2].CARRY4_insti}]
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[2].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1151 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[1].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[1].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[1].CARRY4_insti} {tp1/gen_code_label2[4].LDPE_insti} {tp1/gen_code_label2[5].LDPE_insti} {tp1/gen_code_label2[6].LDPE_insti} {tp1/gen_code_label2[7].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[1].CARRY4_insti}] -add {SLICE_X32Y6:SLICE_X33Y6}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_tp_1[1].CARRY4_insti}]
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[1].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1158 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_tp_1[0].CARRY4_insti}
add_cells_to_pblock [get_pblocks {pblock_tp_1[0].CARRY4_insti}] [get_cells -quiet [list {tp1/gen_code_label1[0].CARRY4_insti} {tp1/gen_code_label2[0].LDPE_insti} {tp1/gen_code_label2[1].LDPE_insti} {tp1/gen_code_label2[2].LDPE_insti} {tp1/gen_code_label2[3].LDPE_insti}]]
resize_pblock [get_pblocks {pblock_tp_1[0].CARRY4_insti}] -add {SLICE_X32Y5:SLICE_X33Y5}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_tp_1[0].CARRY4_insti}]
set_property IS_SOFT FALSE [get_pblocks {pblock_tp_1[0].CARRY4_insti}]
set_property src_info {type:XDC file:1 line:1166 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_idelay2[3]}
resize_pblock [get_pblocks {pblock_idelay2[3]}] -add {SLICE_X32Y4:SLICE_X33Y4}
set_property IS_SOFT FALSE [get_pblocks {pblock_idelay2[3]}]
set_property src_info {type:XDC file:1 line:1171 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_idelay2[2]}
resize_pblock [get_pblocks {pblock_idelay2[2]}] -add {SLICE_X32Y3:SLICE_X33Y3}
set_property IS_SOFT FALSE [get_pblocks {pblock_idelay2[2]}]
set_property src_info {type:XDC file:1 line:1176 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_idelay2[1]}
resize_pblock [get_pblocks {pblock_idelay2[1]}] -add {SLICE_X32Y2:SLICE_X33Y2}
set_property IS_SOFT FALSE [get_pblocks {pblock_idelay2[1]}]
set_property src_info {type:XDC file:1 line:1181 export:INPUT save:INPUT read:READ} [current_design]
create_pblock {pblock_idelay2[0]}
resize_pblock [get_pblocks {pblock_idelay2[0]}] -add {SLICE_X32Y1:SLICE_X33Y1}
set_property IS_SOFT FALSE [get_pblocks {pblock_idelay2[0]}]
