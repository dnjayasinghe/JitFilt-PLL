

`timescale 1ns / 1ps

`include "utility.vh"


module top #(parameter n=`N, m=`M)
    (
    input clk,
    input rx,
    input rx_TDC,
    output [4:0] led,
    output tx,
    output tx_TDC,
    output clk_TDC,
    output trig,
   // output rx_ready,
    output testpin
    );

    
    localparam COUNTER_SIZE = 31,
        SAMPLES_TO_COLLECT = 600,  // per TDC
        NUM_AES_CIRCUITS = 4;


    // signal definition
    //reg reset_signal;            
    wire clock_signal;     
    reg enc_dec_signal;          
    reg key_exp_signal;          
    reg aes_start_signal;        
    wire [NUM_AES_CIRCUITS-1:0] key_val_signal;         
    wire [NUM_AES_CIRCUITS-1:0] text_val_signal;        
    reg [127:0] key_input;       
    reg [127:0] text_input;      
    wire [127:0] text_output [NUM_AES_CIRCUITS-1:0];    
    wire [NUM_AES_CIRCUITS-1:0] aes_busy_signal; 
   
    wire key_val;
    wire text_val;
    wire [127:0] text_output_combine;
    wire aes_busy;
    
    wire [127:0] plaintext;
    reg [127:0] pt_store;
    reg [127:0] key = 64'h1918111009080100;
    wire [2*n-1:0] ciphertext [4:0];
    reg [127:0] result = 32'h03e9d82d;
    wire [5:0] s_done ;
    wire clk0_fifoout;
    
    reg  [7:0]  TDC_data;
    wire rx_TDC_temp;
    
    reg rst, en;
    
    // CLK
    wire clk0, clk1, clk5, clk0t, clk3t, clk4t, clk2, clk3, clk4, clk5t; 
    wire clk_cou_in, clk_cou_out;
    wire locked;
    wire clkref;
   
    clock clock(clk, clk0, clk1, clk2, clk3, clk4, clk5t, locked);
    
    
    // TDC FPGA Design
    wire clk_temp, clk_temp_bufg;
   //top_TDC_ZED_BOARD     (  .clk(clk_TDC),  .rx(), .trig(trig),  .rx_ready(rx_ready), .led(), .tx(rx_TDC_temp),  .test_pin() );
    assign clk_TDC  = clk0;
 
   
    // UART
    wire        TXDone, txActive, rxReady, delClk, err, done, TXDone_TDC, txActive_TDC;
    reg         transmitReg, transmitReg_TDC;
    reg   [7:0] TXdata, TXdata_TDC;
    wire  [7:0] RXdata, RXdata_TDC;
    wire        rxReady_TDC;
    reg         en_UART_TDC_EN;
    reg         uart_rstn;
    //reg [23:0] count;

    uart_tx uartTX(.i_Clock(clk1), .i_Tx_DV(transmitReg), .i_Tx_Byte(TXdata), .o_Tx_Active(txActive), .o_Tx_Serial(tx), .o_Tx_Done(TXDone) );
   		
    uart_rx uartRX(.i_Clock(clk1), .i_Rx_Serial(rx), .o_Rx_DV(rxReady), .o_Rx_Byte(RXdata) );
    		
    uart_tx uartTX_TDC(.i_Clock(clk1), .i_Tx_DV(transmitReg_TDC), .i_Tx_Byte(TXdata_TDC), .o_Tx_Active(txActive_TDC), .o_Tx_Serial(tx_TDC), .o_Tx_Done(TXDone_TDC) );
    
    uart_rxNew new(.clk(clk1), .resetn(rst), .uart_rxd(rx_TDC),.uart_rx_en(en_UART_TDC_EN),.uart_rx_break(),.uart_rx_valid(rxReady_TDC),.uart_rx_data(RXdata_TDC));
    // TDC
    
    reg [7:0] tdc_data1 [SAMPLES_TO_COLLECT-1:0];
    reg [7:0] tdc_data2 [SAMPLES_TO_COLLECT-1:0];
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
    reg        trig_reg;
    
        
    assign clkref       = clk2;
    assign testpin      = rxReady_TDC;
   // assign rx_ready     = rxReady_TDC;
    //assign tx           = rx_TDC;
    
  
 assign clock_signal = clk1;
 
 assign trig     = trig_reg;
// assign led[3]   = trig_reg;
// assign led[4]   = trig_reg;
 //assign reset_signal = rst;    
 //assign enc_dec_signal =    
// AES instantiation

genvar i;
generate 
    for (i=0; i< NUM_AES_CIRCUITS; i= i+1) begin
        (* dont_touch = "yes" *) aes128_table_ecb aes_instance (
            .resetn(rst),       
            .clock(clock_signal),        
            .enc_dec(enc_dec_signal),    
            .key_exp(key_exp_signal),    
            .start(aes_start_signal),    
            .key_val(key_val_signal[i]),    
            .text_val(text_val_signal[i]),  
            .key_in(key_input),          
            .text_in(text_input),        
            .text_out(text_output[i]),      
            .busy(aes_busy_signal[i])       
           );
   
        
    end


endgenerate
  
  assign   key_val              = &key_val_signal;
  assign   text_val             = &text_val_signal;
  assign   aes_busy             = &aes_busy_signal;
  assign   text_output_combine  = text_output[0] & text_output[1] & text_output[2] & text_output[3];// & text_output[4] & text_output[5];
    
    
    // FSM
    
    localparam FSM_IDLE = 8'h00,
                FSM_LOAD_PARA1      = 8'h01,
                FSM_LOAD_PARA2      = 8'h02,
                FSM_SEND_PARA1      = 8'h03,
                FSM_SEND_PARA1WAIT  = 8'h04,
                FSM_SEND_PARA2      = 8'h05,
                FSM_SEND_PARA2WAIT  = 8'h06,
                FSM_LOAD_START      = 8'h07,
                FSM_LOAD            = 8'h08,
                FSM_KEY_LOAD        = 8'h09,
                FSM_WAIT_KEY_LOAD   = 8'h0A,
                FSM_LOAD_PLAINT     = 8'h0B,
                FSM_BUSY            = 8'h0C,
                FSM_DONE            = 8'h0D,
                FSM_SEND_PT         = 8'h0E,
                FSM_WAIT_PT_UART    = 8'h0F,
                FSM_SEND_CT         = 8'h10,
                FSM_WAIT_CT_UART    = 8'h11,
                FSM_SEND_TDC        = 8'h12,
                FSM_WAIT_TDC_UART   = 8'h13,
                FSM_DELAY           = 8'h14,
                FSM_SEND_TDC1       = 8'h15,
                FSM_WAIT_TDC_UART1  = 8'h16,
                FSM_RECEIVE_TDC1    = 8'h17,
                FSM_RECEIVE_TDC1_WAIT= 8'h18,
                FSM_RECEIVE_TDC2    = 8'h19,
                FSM_RECEIVE_TDC2_WAIT= 8'h2A;
           
    reg [7:0] fsm_state = FSM_IDLE;
    
    
    assign plaintext = result;
    
    reg [4:0] uart_counter;
    reg [5:0] uart_delay_counter;
    
    reg [11:0] tdc_uart_addr=0;
    reg [11:0] tdc_uart_addr1=0;
    
    // State machine should send
    // PT
    // CT
    // 512 samples
    
    reg [12:0] delay_counter;
    
    always @(posedge clk1) begin
    
        case(fsm_state)
        
            FSM_IDLE: begin
            
                delay_counter <= 0;
                uart_counter <= 5'b10000;
                rst <= 0;
                en <= 0;
                trig_reg  <= 0;
                enc_dec_signal <= 0;
                en_UART_TDC_EN <= 0;
                uart_rstn      <= 0;
                //if(!s_done[0]) fsm_state <= FSM_LOAD; //why?
               // if(rxReady == 1 && RXdata ==250) begin
                    fsm_state <= FSM_LOAD_PARA1;
                    
                // end
             //fsm_state  <= FSM_SEND_PT;
                          
            end 
            FSM_LOAD_PARA1: begin
            uart_rstn      <= 1;
                if(rxReady == 1 ) begin
                    TDC1_delay <= RXdata;
                    fsm_state  <= FSM_LOAD_PARA2;
                    
                end
            end
            
            FSM_LOAD_PARA2: begin
                if(rxReady == 1 ) begin
                    TDC2_delay <= RXdata;
                    fsm_state <= FSM_SEND_PARA1;
                end
            end

            FSM_SEND_PARA1: begin
                transmitReg_TDC <= 1;
                TXdata_TDC <= TDC1_delay;
                fsm_state <= FSM_SEND_PARA1WAIT;
            end
            FSM_SEND_PARA1WAIT: begin
                transmitReg_TDC <= 0;
                if(TXDone_TDC == 1) begin
                    fsm_state <= FSM_SEND_PARA2;
                end

            end
            FSM_SEND_PARA2: begin
                transmitReg_TDC <= 1;
                TXdata_TDC <= TDC2_delay;
                fsm_state <= FSM_SEND_PARA2WAIT;

            end
            FSM_SEND_PARA2WAIT: begin
                
                transmitReg_TDC <= 0;
                if(TXDone_TDC == 1) begin
                    fsm_state <= FSM_KEY_LOAD;
                end

            end
            FSM_KEY_LOAD: begin
                rst <= 1;
                en <= 1;
                trig_reg  <= 1;
                en_UART_TDC_EN <= 1;
                key_input       <= 128'h000102030405060708090a0b0c0d0e0f;
                key_exp_signal  <= 1;
                
                fsm_state <= FSM_WAIT_KEY_LOAD;
            end
            
            FSM_WAIT_KEY_LOAD:begin
                key_exp_signal      <= 0;
                en                  <= 0;
                if(key_val ==1) begin           
                    fsm_state   <=  FSM_LOAD_PLAINT;
                 end  
            end 
            
            FSM_LOAD_PLAINT:begin
                text_input          <= {TDC1_delay,TDC2_delay, result[111:0]};//128'h0001020304050607ffff0000ffff0000;
                aes_start_signal    <= 1;
            
                fsm_state <=  FSM_BUSY;
            end
           
            
            FSM_BUSY: begin
                 aes_start_signal   <= 0;
                 
                 if(text_val == 1) begin
                       fsm_state <= FSM_DONE;
                       trig_reg   <= 0;   
                       end        
                //if(s_done[0]) fsm_state <= FSM_DONE;
                //delay_counter <= delay_counter + 1;
                //if(delay_counter[10]) fsm_state <= FSM_DONE;
                
            end
            
            //rxReady_TDC
            //tdc_data1
            FSM_DONE: begin
            
               delay_counter <= 0;
               pt_store <= text_input;
               result <= text_output_combine;
               fsm_state <= FSM_SEND_PT;//FSM_SEND_PT;
               
            end
            
            FSM_SEND_PT: begin
            
                transmitReg <= 1;
                TXdata <= pt_store[8*(uart_counter)-1-:8];
                
                uart_counter <= uart_counter - 1;
                fsm_state <= FSM_WAIT_PT_UART;
            
            
            end
            
            FSM_WAIT_PT_UART: begin
            
                transmitReg <= 0;
                if(TXDone == 1) begin
                    if(uart_counter == 5'b000) begin
                        tdc_uart_addr <= 0;
                        fsm_state <= FSM_SEND_CT;
                        uart_counter <= 5'b10000;
                    end else
                        fsm_state <= FSM_SEND_PT;
                        
                 end
            
            end
            
            FSM_SEND_CT: begin
            
                           
                transmitReg <= 1;
                TXdata <= result[8*(uart_counter)-1-:8];
                
                uart_counter <= uart_counter - 1;
                uart_delay_counter  <= 0;
                fsm_state <= FSM_WAIT_CT_UART;
            
            end
            
            FSM_WAIT_CT_UART: begin
            
                transmitReg <= 0;
                if(TXDone == 1) begin
                    if(uart_counter == 5'b000) begin
                        tdc_uart_addr1 <= 0;
                        //trig_reg       <=1;
                        uart_delay_counter  <= uart_delay_counter +1; 
                        //if(uart_delay_counter == 31) begin
                            fsm_state <=  FSM_DELAY;//FSM_RECEIVE_TDC1;
                        //end
                    end else
                        fsm_state <= FSM_SEND_CT;
                        
                 end
                    
            end
            // TDC1 data from other FPGA
            FSM_RECEIVE_TDC1: begin
              //  trig_reg       <=0;
                if(rxReady_TDC ==1) begin
                    tdc_data1[tdc_uart_addr1]  <= RXdata_TDC;
                    fsm_state <= FSM_RECEIVE_TDC1_WAIT;
                    
                end          
                
            end
                    
            FSM_RECEIVE_TDC1_WAIT: begin
            
                    if(tdc_uart_addr1 == SAMPLES_TO_COLLECT - 1) begin
                        tdc_uart_addr1 <= 0;
                        tdc_uart_addr <= 0;
                        fsm_state <=  FSM_SEND_TDC;
                    end else begin
                        fsm_state <= FSM_RECEIVE_TDC1;
                        tdc_uart_addr1 <= tdc_uart_addr1 + 1;
                    end
                        
                    
            
            end
             // TDC1 data from FPGA to PC 
            FSM_SEND_TDC: begin
            
                transmitReg <= 1;
                TXdata <= tdc_data1[tdc_uart_addr];
                fsm_state <= FSM_WAIT_TDC_UART;          
            
            end
                    
            FSM_WAIT_TDC_UART: begin
            
                transmitReg <= 0;
                if(TXDone == 1) begin
                    if(tdc_uart_addr == SAMPLES_TO_COLLECT - 1) begin
                        tdc_uart_addr <= 0;
                        fsm_state <= FSM_DELAY;
                    end else begin
                        fsm_state <= FSM_SEND_TDC;
                        tdc_uart_addr <= tdc_uart_addr + 1;
                    end
                        
                end
                        
            end

            
            FSM_DELAY: begin
            
                delay_counter <= delay_counter + 1;
                if(delay_counter[12] == 1) fsm_state <= FSM_IDLE;
            
            end
            
                                    
        endcase
          
    end
    
    assign led[4:0] = fsm_state;
    
endmodule
