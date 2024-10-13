`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/20 11:10:05
// Design Name: 
// Module Name: PLL_instance
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


module PLL_instance(
    input CLKIN1,
    input RST,
    input PWRDWN,
    output CLKOUT0,
    output CLKOUT1,
    output CLKOUT2,
    output CLKOUT3,
    output CLKOUT4,
    output CLKOUT5,
    output LOCKED
    );
    
    
    wire CLKFBOUT, CLKFBIN, temp;
    
    
    assign CLKFBIN = CLKFBOUT;
    // PLLE2_BASE: Base Phase Locked Loop (PLL)
// 7 Series
// Xilinx HDL Libraries Guide, version 2012.2
PLLE2_BASE #(
.BANDWIDTH("OPTIMIZED"), // OPTIMIZED, HIGH, LOW
.CLKFBOUT_MULT(12), // Multiply value for all CLKOUT, (2-64)
.CLKFBOUT_PHASE(0.0), // Phase offset in degrees of CLKFB, (-360.000-360.000).
.CLKIN1_PERIOD(8.333), // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
// CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
.CLKOUT0_DIVIDE(12),
.CLKOUT1_DIVIDE(1),
.CLKOUT2_DIVIDE(1),
.CLKOUT3_DIVIDE(1),
.CLKOUT4_DIVIDE(1),
.CLKOUT5_DIVIDE(1),
// CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
.CLKOUT0_DUTY_CYCLE(0.5),
.CLKOUT1_DUTY_CYCLE(0.5),
.CLKOUT2_DUTY_CYCLE(0.5),
.CLKOUT3_DUTY_CYCLE(0.5),
.CLKOUT4_DUTY_CYCLE(0.5),
.CLKOUT5_DUTY_CYCLE(0.5),
// CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
.CLKOUT0_PHASE(0.0),
.CLKOUT1_PHASE(0.0),
.CLKOUT2_PHASE(0.0),
.CLKOUT3_PHASE(0.0),
.CLKOUT4_PHASE(0.0),
.CLKOUT5_PHASE(0.0),
.DIVCLK_DIVIDE(1), // Master division value, (1-56)
.REF_JITTER1(0.0), // Reference input jitter in UI, (0.000-0.999).
.STARTUP_WAIT("FALSE") // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
)
PLLE2_BASE_inst (
// Clock Outputs: 1-bit (each) output: User configurable clock outputs
.CLKOUT0(CLKOUT0),
.CLKOUT1(CLKOUT1),
.CLKOUT2(CLKOUT2),
.CLKOUT3(CLKOUT3),
.CLKOUT4(CLKOUT4),
.CLKOUT5(CLKOUT5),
// Feedback Clocks: 1-bit (each) output: Clock feedback ports
.CLKFBOUT(CLKFBOUT), // 1-bit output: Feedback clock
// Status Port: 1-bit (each) output: PLL status ports
.LOCKED(LOCKED), // 1-bit output: LOCK
// Clock Input: 1-bit (each) input: Clock input
.CLKIN1(CLKIN1), // 1-bit input: Input clock
// Control Ports: 1-bit (each) input: PLL control ports
.PWRDWN(PWRDWN), // 1-bit input: Power-down
.RST(RST), // 1-bit input: Reset
// Feedback Clocks: 1-bit (each) input: Clock feedback ports
.CLKFBIN(CLKFBIN) // 1-bit input: Feedback clock
);
// End of PLLE2_BASE_inst instantiation

endmodule
