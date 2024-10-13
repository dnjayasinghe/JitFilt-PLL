transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/util_idelay_ctrl_v1_0_3
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap util_idelay_ctrl_v1_0_3 activehdl/util_idelay_ctrl_v1_0_3
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../simon.gen/sources_1/bd/design_1/ipshared/c2c6" -l xpm -l util_idelay_ctrl_v1_0_3 -l xil_defaultlib \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work util_idelay_ctrl_v1_0_3  -v2k5 "+incdir+../../../../simon.gen/sources_1/bd/design_1/ipshared/c2c6" -l xpm -l util_idelay_ctrl_v1_0_3 -l xil_defaultlib \
"../../../../simon.gen/sources_1/bd/design_1/ipshared/6e31/hdl/util_idelay_ctrl_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../simon.gen/sources_1/bd/design_1/ipshared/c2c6" -l xpm -l util_idelay_ctrl_v1_0_3 -l xil_defaultlib \
"../../../bd/design_1/ip/design_1_util_idelay_ctrl_0_0/sim/design_1_util_idelay_ctrl_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

