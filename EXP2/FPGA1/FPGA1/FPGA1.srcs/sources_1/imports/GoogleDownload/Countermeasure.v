`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/01/18 10:55:22
// Design Name: 
// Module Name: Countermeasure
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

//module SRL16E(Q,A0,A1,A2,A3,CLK,D,CE);

//    input A0,A1,A2,A3,CLK,D,CE;
//    output Q;
    
//    reg [15:0] shift_reg;
//    reg Q;
    
//    always @(posedge CLK) begin
//        if (CE) begin
//            shift_reg <= {shift_reg[14:0],D};
//            Q <= D;
//        end
//    end
    
//    always @(A3,A2,A1,A0,shift_reg) begin
//        case({A3,A2,A1,A0})
//            4'b0000: Q = shift_reg[0];
//            4'b0001: Q = shift_reg[1];
//            4'b0010: Q = shift_reg[2];
//            4'b0011: Q = shift_reg[3];
//            4'b0100: Q = shift_reg[4];
//            4'b0101: Q = shift_reg[5];
//            4'b0110: Q = shift_reg[6];
//            4'b0111: Q = shift_reg[7];
//            4'b1000: Q = shift_reg[8];
//            4'b1001: Q = shift_reg[9];
//            4'b1010: Q = shift_reg[10];
//            4'b1011: Q = shift_reg[11];
//            4'b1100: Q = shift_reg[12];
//            4'b1101: Q = shift_reg[13];
//            4'b1110: Q = shift_reg[14];
//            4'b1111: Q = shift_reg[15];
//            default: Q = 1'b0;
//         endcase
//     end

//endmodule
     
     
module Countermeasure(,CLKin,CE, clkOut);
      input  CLKin,CE;
      output clkOut;
    
     // reg [15:0] shift_reg;
     // reg Q;
wire D;

SRL16E #(  
    .INIT(16'b1010_1010_1010_1010)
   ) SRL16E_inst(
         .Q(clkOut),
         .A0(1),
         .A1(1),
         .A2(1),
         .A3(1),
         .CE(CE),
         .CLK(CLKin),
         .D(D)
    );

assign D = clkOut;

endmodule
