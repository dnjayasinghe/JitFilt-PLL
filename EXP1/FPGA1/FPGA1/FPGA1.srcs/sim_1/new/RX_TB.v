`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2024 13:56:16
// Design Name: 
// Module Name: RX_TB
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


module RX_TB();

parameter CLOCK = 4;

reg clk1;
reg rst;
reg rx_TDC;
reg en_UART_TDC_EN;
wire rxReady_TDC;
wire [7:0]  RXdata_TDC;


uart_rxNew new(.clk(clk1), .resetn(rst), .uart_rxd(rx_TDC),.uart_rx_en(en_UART_TDC_EN),.uart_rx_break(),.uart_rx_valid(rxReady_TDC),.uart_rx_data(RXdata_TDC));



initial clk1 = 1;
always #(CLOCK/2)
  clk1 <= ~clk1;


initial begin

#(CLOCK/2)
    rst <= 1;

// Eecryption key set
#(CLOCK)
    rst <= 0;
    
// Cipher text set
#(CLOCK)
    rst <= 1;
    en_UART_TDC_EN  <= 1;
    rx_TDC          <= 1;

#(CLOCK*1)
    rst <= 1;
         

#(CLOCK*10)
    rx_TDC  <= ~rx_TDC;
 
 #(CLOCK*100000)   
  $finish;


end
  
endmodule
