`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2024 13:33:13
// Design Name: 
// Module Name: TDC_delay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TDC_delay(
    input [7:0] TDC1_delay,
    input [7:0] TDC2_delay,
    input       TDC1_clk_in,
    input       TDC2_clk_in,
    input       clk_ref,
    input       en,
    input       rst,
    input       CE,
    input       INC,
    output      TDC1_clk_out,
    output      TDC2_clk_out
        
    );
    
    
    //(*LOC="IDELAY_X1Y1"*)
    (* IODELAY_GROUP = "Group_ADS1" *)
    IDELAYCTRL IDELAYCTRL_inst (
        .RDY(), // 1-bit output: Ready output
        .REFCLK(clk_ref), // 1-bit input: Reference clock input  //CLKOUTREF
        .RST(rst) // 1-bit input: Active high reset input
    );

    
    (* IODELAY_GROUP = "Group_ADS1" *)
    IDELAYE2 #(
        .CINVCTRL_SEL("FALSE"), // Enable dynamic clock inversion (FALSE, TRUE)
        .DELAY_SRC("DATAIN"), // Delay input (IDATAIN, DATAIN)
        .HIGH_PERFORMANCE_MODE("TRUE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
        .IDELAY_TYPE("VAR_LOAD"), // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
        .IDELAY_VALUE(0), // Input delay tap setting (0-31)
        .PIPE_SEL("FALSE"), // Select pipelined mode, FALSE, TRUE
        .REFCLK_FREQUENCY(200.0), // IDELAYCTRL clock input frequency in MHz (190.0-210.0).
        .SIGNAL_PATTERN("CLOCK") // DATA, CLOCK input signal
    )
    IDELAYE2_TDC1 (
        .CNTVALUEOUT(), // 5-bit output: Counter value output
        .DATAOUT(TDC1_clk_out), // 1-bit output: Delayed data output
        .C(TDC1_clk_in), // 1-bit input: Clock input  refclk
        .CE(1'b0), // 1-bit input: Active high enable increment/decrement input
        .CINVCTRL(1'b0), // 1-bit input: Dynamic clock inversion input
        .CNTVALUEIN(TDC1_delay), // 5-bit input: Counter value input
        .DATAIN(TDC1_clk_in), // 1-bit input: Internal delay data input
        .IDATAIN(), // 1-bit input: Data input from the I/O
        .INC(1'b0), // 1-bit input: Increment / Decrement tap delay input
        .LD(1'b1), // 1-bit input: Load IDELAY_VALUE input
        .LDPIPEEN(1'b0), // 1-bit input: Enable PIPELINE register to load data input
        .REGRST(rst) // 1-bit input: Active-high reset tap-delay input
    );

 
    (* IODELAY_GROUP = "Group_ADS1" *)
    IDELAYE2 #(
        .CINVCTRL_SEL("FALSE"), // Enable dynamic clock inversion (FALSE, TRUE)
        .DELAY_SRC("DATAIN"), // Delay input (IDATAIN, DATAIN)
        .HIGH_PERFORMANCE_MODE("TRUE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
        .IDELAY_TYPE("VAR_LOAD"), // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
        .IDELAY_VALUE(0), // Input delay tap setting (0-31)
        .PIPE_SEL("FALSE"), // Select pipelined mode, FALSE, TRUE
        .REFCLK_FREQUENCY(200.0), // IDELAYCTRL clock input frequency in MHz (190.0-210.0).
        .SIGNAL_PATTERN("CLOCK") // DATA, CLOCK input signal
    )
    IDELAYE2_TDC2 (
        .CNTVALUEOUT(), // 5-bit output: Counter value output
        .DATAOUT(TDC2_clk_out), // 1-bit output: Delayed data output
        .C(TDC2_clk_in), // 1-bit input: Clock input  refclk
        .CE(1'b0), // 1-bit input: Active high enable increment/decrement input
        .CINVCTRL(1'b0), // 1-bit input: Dynamic clock inversion input
        .CNTVALUEIN(TDC2_delay), // 5-bit input: Counter value input
        .DATAIN(TDC2_clk_in), // 1-bit input: Internal delay data input
        .IDATAIN(), // 1-bit input: Data input from the I/O
        .INC(1'b0), // 1-bit input: Increment / Decrement tap delay input
        .LD(1'b1), // 1-bit input: Load IDELAY_VALUE input
        .LDPIPEEN(1'b0), // 1-bit input: Enable PIPELINE register to load data input
        .REGRST(rst) // 1-bit input: Active-high reset tap-delay input
    );

    
    
    
endmodule

