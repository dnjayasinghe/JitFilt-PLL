# JitFilt-PLL
 JitFilt-PLL Implementation


## How to configure FTDI Serial modules. 
We used FTDI 232RL as UARTS. Other UARTs may be compatible. 

The serial numbers of FTDI UARTs must be used in the JitFilt_UART_Checker C# program

	JitFilt_UART_Checker
	|
    |_____ JitFilt_UART_Checker 
               |
               |_____Program.cs               
			   static string FPGA1_FTDI_SERIAL_NUMBER= "A50285BI";  // change this to your FTDI NUMBER
	  		   static string FPGA2_FTDI_SERIAL_NUMBER = "AD0JIHIL";  // change this to your FTDI NUMBER
							


## FPGA 1 and FPGA 2 are connections


 

