`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2024 14:37:12
// Design Name: 
// Module Name: clkFilter
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


module clkFilter_PLL(
input  clk_in,
output clk_out
);
     
      wire CLKFBin,CLKFBOut, CLKFBOUT,clkInBuf;
      wire locked;
      wire clkOutBuf, clkOurBuf1;
    
    BUFG BUFG_inst0 (.O(clk_out), .I(clkOutBuf) );
    BUFG BUFG_inst2 (.O(CLKFBin), .I(CLKFBOut) );
    
   IBUFG BUFG_inst1 (.O(clkInBuf), .I(clk_in) );
 
   // PLLE2_ADV: Advanced Phase Locked Loop (PLL)
// 7 Series
// Xilinx HDL Libraries Guide, version 2012.2
PLLE2_ADV #(
.BANDWIDTH("LOW"), // OPTIMIZED, HIGH, LOW
.CLKFBOUT_MULT(7), // Multiply value for all CLKOUT, (2-64)
.CLKFBOUT_PHASE(0.0), // Phase offset in degrees of CLKFB, (-360.000-360.000).
// CLKIN_PERIOD: Input clock period in nS to ps resolution (i.e. 33.333 is 30 MHz).
.CLKIN1_PERIOD(8.333),
.CLKIN2_PERIOD(0.0),
// CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT (1-128)
.CLKOUT0_DIVIDE(7),
.CLKOUT1_DIVIDE(1),
.CLKOUT2_DIVIDE(1),
.CLKOUT3_DIVIDE(1),
.CLKOUT4_DIVIDE(1),
.CLKOUT5_DIVIDE(1),
// CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.001-0.999).
.CLKOUT0_DUTY_CYCLE(0.5),
.CLKOUT1_DUTY_CYCLE(0.5),
.CLKOUT2_DUTY_CYCLE(0.5),
.CLKOUT3_DUTY_CYCLE(0.5),
.CLKOUT4_DUTY_CYCLE(0.5),
.CLKOUT5_DUTY_CYCLE(0.5),
// CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
.CLKOUT0_PHASE(0.0),
.CLKOUT1_PHASE(0.0),
.CLKOUT2_PHASE(0.0),
.CLKOUT3_PHASE(0.0),
.CLKOUT4_PHASE(0.0),
.CLKOUT5_PHASE(0.0),
.COMPENSATION("ZHOLD"), // ZHOLD, BUF_IN, EXTERNAL, INTERNAL
.DIVCLK_DIVIDE(1), // Master division value (1-56)
// REF_JITTER: Reference input jitter in UI (0.000-0.999).
.REF_JITTER1(0.030),
.REF_JITTER2(0.0),
.STARTUP_WAIT("FALSE") // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
)
PLLE2_ADV_inst (
// Clock Outputs: 1-bit (each) output: User configurable clock outputs
.CLKOUT0(clkOutBuf), // 1-bit output: CLKOUT0
.CLKOUT1(), // 1-bit output: CLKOUT1
.CLKOUT2(), // 1-bit output: CLKOUT2
.CLKOUT3(), // 1-bit output: CLKOUT3
.CLKOUT4(), // 1-bit output: CLKOUT4
.CLKOUT5(), // 1-bit output: CLKOUT5
.DO(), // 16-bit output: DRP data
.DRDY(), // 1-bit output: DRP ready
// Feedback Clocks: 1-bit (each) output: Clock feedback ports
.CLKFBOUT(CLKFBOut), // 1-bit output: Feedback clock
// Status Ports: 1-bit (each) output: PLL status ports
.LOCKED(), // 1-bit output: LOCK
// Clock Inputs: 1-bit (each) input: Clock inputs
.CLKIN1(clkInBuf), // 1-bit input: Primary clock
.CLKIN2(), // 1-bit input: Secondary clock
// Control Ports: 1-bit (each) input: PLL control ports
.CLKINSEL(1'b1), // 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
.PWRDWN(), // 1-bit input: Power-down
.RST(), // 1-bit input: Reset
// DRP Ports: 7-bit (each) input: Dynamic reconfiguration ports
.DADDR(), // 7-bit input: DRP address
.DCLK(), // 1-bit input: DRP clock
.DEN(), // 1-bit input: DRP enable
.DI(), // 16-bit input: DRP data
.DWE(), // 1-bit input: DRP write enable
// Feedback Clocks: 1-bit (each) input: Clock feedback ports
.CLKFBIN(CLKFBin) // 1-bit input: Feedback clock
);
// End of PLLE2_ADV_inst instantiation
// DRP Ports: 16-bit (each) output: Dynamic reconfiguration ports


endmodule


