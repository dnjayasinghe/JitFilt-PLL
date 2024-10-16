# JitFilt-PLL
 JitFilt-PLL Implementation


## How to Configure FTDI Serial Modules. 
We used FTDI 232RL UARTs. Other UARTs may be compatible. 

The serial numbers of FTDI UARTs must be used in the JitFilt_UART_Checker C# program

	JitFilt_UART_Checker
		|
    	|_____ JitFilt_UART_Checker 
               |
               |_____Program.cs               
	       	static string FPGA1_FTDI_SERIAL_NUMBER= "A50285BI";  // change this to your FTDI NUMBER
		static string FPGA2_FTDI_SERIAL_NUMBER = "AD0JIHIL";  // change this to your FTDI NUMBER
							


## FPGA 1 and FPGA 2 Connections

![FPGA connections](./readme-images/FPGA_Figure.png)
 
### Pmod Connections 

![FPGA Pmod connections](./readme-images/FPGA_connections.png)


## FPGA and FTDI 232RL Connections
![FPGA UART connections](./readme-images/UARTconnections.png)
