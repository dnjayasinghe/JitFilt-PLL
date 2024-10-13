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


module clkFilter(
input  clk_in,
output clk_out
);
     
      wire CLKFB, CLKFBOUT;
      wire locked;
    
    
    MMCME2_ADV #(
		.BANDWIDTH("LOW"), // Jitter programming (OPTIMIZED, HIGH, LOW)
		.CLKFBOUT_MULT_F(6.0), // Multiply value for all CLKOUT (2.000-64.000).
		.CLKFBOUT_PHASE(0.0), // Phase offset in degrees of CLKFB (-360.000-360.000).
		.CLKIN1_PERIOD(8.333), // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
		// CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
		.CLKOUT1_DIVIDE(1),
		.CLKOUT2_DIVIDE(1),
		.CLKOUT3_DIVIDE(1),
		.CLKOUT4_DIVIDE(1),
		.CLKOUT5_DIVIDE(1),
		.CLKOUT6_DIVIDE(1),
		.CLKOUT0_DIVIDE_F(6), // Divide amount for CLKOUT0 (1.000-128.000).
		// CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
		.CLKOUT0_DUTY_CYCLE(0.5),
		.CLKOUT1_DUTY_CYCLE(0.5),
		.CLKOUT2_DUTY_CYCLE(0.5),
		.CLKOUT3_DUTY_CYCLE(0.5),
		.CLKOUT4_DUTY_CYCLE(0.5),
		.CLKOUT5_DUTY_CYCLE(0.5),
		.CLKOUT6_DUTY_CYCLE(0.5),
		// CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
		.CLKOUT0_PHASE(0.0),
		.CLKOUT1_PHASE(0.0),
		.CLKOUT2_PHASE(0.0),
		.CLKOUT3_PHASE(0.0),
		.CLKOUT4_PHASE(0.0),
		.CLKOUT5_PHASE(0.0),
		.CLKOUT6_PHASE(0.0),
		.CLKOUT4_CASCADE("FALSE"), // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
		.DIVCLK_DIVIDE(1), // Master division value (1-106)
		.REF_JITTER1(0.055), // Reference input jitter in UI (0.000-0.999).
		.STARTUP_WAIT("FALSE") // Delays DONE until MMCM is locked (FALSE, TRUE)
	)
	MMCME2_BASE_inst1 (
		// Clock Outputs: 1-bit (each) output: User configurable clock outputs
		.CLKOUT0(clk_out), // 1-bit output: CLKOUT0
		.CLKOUT1(), // 1-bit output: CLKOUT1
		.CLKOUT2(), // 1-bit output: CLKOUT2
		.CLKOUT3(),
		.CLKOUT4(),
		//.CLKOUT3(CLKOUT3), // 1-bit output: CLKOUT3
		//.CLKOUT4(CLKOUT4), // 1-bit output: CLKOUT4
		.CLKOUT5(), // 1-bit output: CLKOUT5
		//.CLKOUT6(), // 1-bit output: CLKOUT6
		// Feedback Clocks: 1-bit (each) output: Clock feedback ports
		.CLKFBOUT(CLKFB), // 1-bit output: Feedback clock
		.CLKFBOUTB(CLKFBOUT), // 1-bit output: Inverted CLKFBOUT
		// Status Ports: 1-bit (each) output: MMCM status ports
		.LOCKED(locked), // 1-bit output: LOCK
		// Clock Inputs: 1-bit (each) input: Clock input
		.CLKIN1(clk_in), // 1-bit input: Clock
		// Control Ports: 1-bit (each) input: MMCM control ports
		.PWRDWN(), // 1-bit input: Power-down
		.RST(1'b0), // 1-bit input: Reset
		// Feedback Clocks: 1-bit (each) input: Clock feedback ports
		.CLKINSEL(1'b1),
		.CLKFBIN(CLKFB) // 1-bit input: Feedback clock
		
	);
	// End of MMCME2_BASE_inst instantiation			




endmodule
