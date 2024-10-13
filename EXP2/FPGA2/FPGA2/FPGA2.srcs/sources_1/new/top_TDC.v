

`timescale 1ns / 1ps



module top_TDC_ZED_BOARD 
    (
    input clk,  // JB1
    input rx,   // JB7
    input trig, // JB2
    input rx_TDC,
    output [5:0] led,
    output tx,  // JB8
    output test_pin,
    input sw,
    output clk_filt
    
    );

    
    localparam COUNTER_SIZE = 31,
        SAMPLES_TO_COLLECT = 600,
        NUM_AES_CIRCUITS = 4;


    // signal definition
    //reg reset_signal;            
   
    wire [5:0] s_done ;
    wire clk0_fifoout;
    reg led_reg;
    reg delay_counter;
    reg rst, en;
    
    // CLK
    wire clk0, clk1, clk5, clk0t, clk3t, clk4t, clk2, clk3, clk4, clk5t; 
    wire clk_cou_in, clk_cou_out;
    wire locked;
    wire clkref;
    //wire clk1;
  
   clkFilter_PLL cf( .clk_in(clk), .clk_out(clk1) ); //
   
    // UART
    wire  TXDone, txActive, rxReady_TDC, delClk, err, done;
    reg   transmitReg;
    reg   [7:0] TXdata;
    wire  [7:0] RXdata;
    reg   [COUNTER_SIZE-1:0] counter;
    reg   [COUNTER_SIZE-1:0] counter1;
    
    //reg [23:0] count;

    uart_tx uartTX(.i_Clock(clk1), .i_Tx_DV(transmitReg), .i_Tx_Byte(TXdata), .o_Tx_Active(txActive), .o_Tx_Serial(tx), .o_Tx_Done(TXDone) );		
    uart_rx uartRX(.i_Clock(clk1), .i_Rx_Serial(rx_TDC), .o_Rx_DV(rxReady_TDC), .o_Rx_Byte(RXdata) );		
    
    // TDC
    
    reg [7:0] tdc_data [SAMPLES_TO_COLLECT-1:0];
    reg [7:0] tdc_data1 [SAMPLES_TO_COLLECT-1:0];
    reg [9:0] tdc_addr;
    reg [9:0] SEN_FSM = 0;
    
    localparam ADSIZE = 160;
    reg 	[ADSIZE-1:0] outReg;
    reg 	[ADSIZE-1:0] outReg1;
    wire 	[ADSIZE-1:0] out;
    wire    [ADSIZE-1:0] out1;		
    wire	[7:0] processedOut;
    wire	[7:0] processedOut1;
    
    // TDC Delay Signals
    reg [7:0]  TDC1_delay;
    reg [7:0]  TDC2_delay;
    wire       TDC1_clk_delay;
    wire       TDC2_clk_delay;
    reg  [9:0] UART_counter;
    reg  trig_reg;
    
    wire pwrdwn_signal =0;
    wire locked_signal;
    wire rst_signal = 0;
    
    assign clk_filt = clk1;
    
    
    PLL_instance pll_inst (
        .CLKIN1(clk1), 
        .RST(rst_signal), 
        .PWRDWN(pwrdwn_signal), 
        .CLKOUT0(clk_out0), 
        .CLKOUT1(),
        .CLKOUT2(),
        .CLKOUT3(),
        .CLKOUT4(),
        .CLKOUT5(),
        .LOCKED(locked_signal) 
    );
    
    
    // TDC1
    tdc_top tp (clk1, clk1, out);					// TDC sensor
    tdc_decode tdc_decode(.clk(clk1), .rst(rst), .chainvalue_i(outReg), .coded_o(processedOut));   // calculate number of 1's in the TDC Sensor
    

// 2nd tdc
    tdc_top tp1 (clk1, clk_out0, out1); // TDC sensor
    tdc_decode tdc1_decode(.clk(clk1), .rst(rst), .chainvalue_i(outReg1), .coded_o(processedOut1));   // calculate number of 1's in the TDC Sensor
    
    assign clkref       = clk2;
    assign test_pin     = rxReady_TDC;
    
    reg [12:0] tdc_uart_addr;
    
    
    localparam 	SEN_RESET 	  = 8'h00,  //  states of the onchip Sensor FSM
		SEN_WAIT  	          = 8'h01,
		SEN_RECEIVE_PARA1  	  = 8'h02,
		SEN_RECEIVE_PARA2     = 8'h03,
		SEN_CAPTURE	          = 8'h04,
		SEN_WRAP_UP	          = 8'h05,
		SEN_SEND_TDC1         = 8'h06,
        SEN_WAIT_TDC1_UART    = 8'h07,
        SEN_WAITRX_READY1     = 8'h08,
        SEN_WAITRX_READY2     = 8'h09,
        SEN_DELAY1            = 8'h0A,
        SEN_DELAY2            = 8'h0B,
        SEN_SEND_TDC2         = 8'h0C,
        SEN_WAIT_TDC2_UART    = 8'h0D,
        SEN_RX_READY1         = 8'h0E ,
        SEN_RX_READY2         = 8'h0F ;
    
    always @(posedge clk1) begin
        //if(trig==1)
        counter <= counter +1;
        if(led_reg==1)
            counter1 <= counter1 +1;
        trig_reg <=trig;    
    end
    
    always @(posedge clk1) begin
        case (SEN_FSM)
            SEN_RESET: begin
                tdc_addr <= 0;
                rst      <=0;
                SEN_FSM <= SEN_RECEIVE_PARA1;	
            end
            SEN_RECEIVE_PARA1: begin
            rst      <=1;
             if(rxReady_TDC==1) begin
                TDC1_delay <= RXdata;
                SEN_FSM <= SEN_RECEIVE_PARA2;
             end
                
            end
            SEN_RECEIVE_PARA2: begin
             if(rxReady_TDC==1) begin
                TDC2_delay <= RXdata;
                SEN_FSM <= SEN_WAIT;
             end
            end
            SEN_WAIT: begin
                tdc_data[tdc_addr] <= TDC1_delay;//250; // Flag to detect start of AES; to be removed later
                tdc_data1[tdc_addr] <= TDC2_delay;//250;
                outReg <= out;
                outReg1 <= out1;
                tdc_addr <= 0;
                if (trig == 1) begin
                    tdc_addr <= tdc_addr + 1;
                    SEN_FSM <= SEN_CAPTURE;
                    led_reg <= 1;
                end
            end
    
            SEN_CAPTURE: begin
                outReg <= out;
                outReg1 <= out1;       
                tdc_addr <= tdc_addr + 1;
                
                if (trig == 0) begin
                    // Indicate CT ready in onchip sensor trace
                    tdc_data[tdc_addr]  <= 249;
                    tdc_data1[tdc_addr] <= 249;
                    led_reg             <= 0;
                end else begin
                    tdc_data[tdc_addr]  <= processedOut; // Sample and save TDC sensor's data
                    tdc_data1[tdc_addr] <= processedOut1;
                end
                
                if (tdc_addr == SAMPLES_TO_COLLECT - 1) begin
                    // Once required number of samples are collected
                    SEN_FSM <= SEN_WRAP_UP;
                end
            end
    
            SEN_WRAP_UP: begin
                // Clear the address and move to WAIT state
                UART_counter <=0;
                tdc_addr <= 0;
              //  if(trig ==1) 
                    SEN_FSM  <= SEN_RX_READY1;
            end
            SEN_RX_READY1: begin
            UART_counter <=0;
            //if(rx_ready == 1) begin
                   //UART_counter <=  UART_counter +1;
                  // if(UART_counter==31)
                   SEN_FSM  <= SEN_WAITRX_READY1;       
              // end
            end
            SEN_WAITRX_READY1: begin
                 UART_counter <=  UART_counter +1;
                   if(UART_counter==511) begin
                     SEN_FSM  <= SEN_SEND_TDC1; 
                   end
            end
            SEN_SEND_TDC1: begin
            
                transmitReg <= 1;
                TXdata      <= tdc_data[tdc_uart_addr];
                delay_counter   <= 0;
                SEN_FSM  <= SEN_WAIT_TDC1_UART;          
            
            end
                    
            SEN_WAIT_TDC1_UART: begin
            
                transmitReg <= 0;
                if(TXDone == 1) begin
                    if(tdc_uart_addr == SAMPLES_TO_COLLECT - 1) begin
                        tdc_uart_addr <= 0;
                        SEN_FSM  <= SEN_SEND_TDC2;//SEN_SEND_TDC2;
                    end else begin
                        SEN_FSM  <= SEN_RX_READY1;
                        tdc_uart_addr <= tdc_uart_addr + 1;
                    end
                        
                end
                    
            
            end
           SEN_RX_READY2: begin
           UART_counter  =0;
            //if( rx_ready == 1)
                   //UART_counter <=  UART_counter +1;
                   //if(UART_counter==15)
                    SEN_FSM  <= SEN_WAITRX_READY2;        
            
            end
            SEN_WAITRX_READY2: begin
                 UART_counter <=  UART_counter +1;
                   if(UART_counter==511) begin
                     SEN_FSM  <= SEN_SEND_TDC2; 
                   end
            end
            SEN_SEND_TDC2: begin
            
                transmitReg <= 1;
                TXdata <= tdc_data1[tdc_uart_addr];
                
                SEN_FSM  <= SEN_WAIT_TDC2_UART;          
            
            end
                    
            SEN_WAIT_TDC2_UART: begin
            
                transmitReg <= 0;
                if(TXDone == 1) begin
                    if(tdc_uart_addr == SAMPLES_TO_COLLECT - 1) begin
                        tdc_uart_addr <= 0;
                        SEN_FSM  <= SEN_WAIT;
                    end else begin
                        SEN_FSM  <= SEN_RX_READY2;
                        UART_counter <= 0;
                        tdc_uart_addr <= tdc_uart_addr + 1;
                    end
                        
                end
                    
            
            end
            
                      
    
            default: begin
                // Optional default case to handle unexpected states
            end
        endcase
    end

 assign clock_signal =  clk1;
assign led[2:0]      =  counter[25:23];
assign led[5:3]      =  counter1[5:3];
 //assign reset_signal = rst;    
 //assign enc_dec_signal =    
// AES instantiation

    
endmodule
