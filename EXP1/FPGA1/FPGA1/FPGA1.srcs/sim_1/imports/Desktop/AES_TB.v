///////////////////////////////////
//    AES TestBench encryption   //
///////////////////////////////////
`timescale 1ns/1ns

module AES_TB;
parameter CLOCK = 50;

reg  [127:0] Din;
reg  [127:0] Key;
reg  Drdy;
reg  Krdy;
reg  RSTn;
reg  EN_E, EN_D;
reg  CLK;
wire [127:0] Dout_E, Dout_D;
wire BSY_E, BSY_D;
wire Dvld_E, Dvld_D;

aes128_table_ecb AES_ENC(
  .text_in(Din),
  .key_in(Key),
  .text_out(Dout_E),
  //.DoutD(Dout_D),
  .start(Drdy),
  .key_exp(Krdy),
  .resetn(RSTn),
  //.EN(EN_E),
  .clock(CLK),
  .busy(BSY_E),
  .text_val(Dvld_E),
  .enc_dec(1),
  .key_val()
);


// FIPS-197 Test Vectors
reg [127:0] KE, KD, CT, PT;
initial KE = 128'h000102030405060708090a0b0c0d0e0f; // Encryption Key
initial KD = 128'h13111d7fe3944a17f307a78b4d2b30c5; // Decryption Key (Encryption finlarl round key)
initial PT = 128'h00112233445566778899aabbccddeeff; // Plain Text
//initial CT = 128'h69c4e0d86a7b0430d8cdb78070b4c55a; // Cipher Text

initial CLK = 1;
always #(CLOCK/2)
  CLK <= ~CLK;

initial begin

#(CLOCK/2)
// Reset
  EN_E <= 0;
  EN_D <= 0;
  RSTn <= 0;
  Krdy <= 0;
  Drdy <= 0;

// Eecryption key set
#(CLOCK)
  RSTn <= 1;
  EN_E <= 1;
  //EN_D <= 1;
  Key  <= KE;
  Krdy <= 1;

// Cipher text set
#(CLOCK)
  Krdy <= 0;
  Din  <= PT;
  Drdy <= 1;

#(CLOCK*1)
  Drdy <= 0;
#(CLOCK*10)

  $finish;
   
end
endmodule
