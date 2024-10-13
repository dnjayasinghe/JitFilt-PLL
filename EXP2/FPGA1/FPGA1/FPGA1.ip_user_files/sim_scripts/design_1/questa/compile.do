vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/util_idelay_ctrl_v1_0_3
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap util_idelay_ctrl_v1_0_3 questa_lib/msim/util_idelay_ctrl_v1_0_3
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../simon.gen/sources_1/bd/design_1/ipshared/c2c6" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work util_idelay_ctrl_v1_0_3  -incr -mfcu  "+incdir+../../../../simon.gen/sources_1/bd/design_1/ipshared/c2c6" \
"../../../../simon.gen/sources_1/bd/design_1/ipshared/6e31/hdl/util_idelay_ctrl_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../simon.gen/sources_1/bd/design_1/ipshared/c2c6" \
"../../../bd/design_1/ip/design_1_util_idelay_ctrl_0_0/sim/design_1_util_idelay_ctrl_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

