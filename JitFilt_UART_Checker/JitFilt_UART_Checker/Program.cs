using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FTD2XX_NET;
using System.IO;
using System.Diagnostics;

namespace JitFilt_UART_checker
{
    class Program
    {
        static int samplingPoints = 600;        // number of samples points to be read from FPGA (only onchip sensor readings) pt , key and ct are handled separately.
        static int NumROs = 1;                   // not used, only need for RO -voltage sensors
        static string FPGA1_FTDI_SERIAL_NUMBER= "A50285BI";  // change this to your FTDI NUMBER
        static string FPGA2_FTDI_SERIAL_NUMBER = "AD0JIHIL";  // change this to your FTDI NUMBER
        static UInt32 write(FTDI ftdi, byte[] data, int numChars)
        {
            int i;
            UInt32 numBytesRead = 0;
            FTDI.FT_STATUS ftStatus = FTDI.FT_STATUS.FT_OK;
            //for (i = 0; i < numChars; i++)
            ftdi.Write(data, numChars, ref numBytesRead);

            return numBytesRead;
        }

        static UInt32 read(FTDI ftdi, byte[] data, int numChars)
        {
            UInt32 numBytesRead = 0;
            FTDI.FT_STATUS ftStatus = FTDI.FT_STATUS.FT_OK;
            UInt32 n = (UInt32)numChars;

            ftdi.Read(data, n, ref numBytesRead);

            return numBytesRead;
        }


     
        static void Main(string[] args)
        {
            UInt32 ftdiDeviceCount = 0;
            FTDI.FT_STATUS ftStatus = FTDI.FT_STATUS.FT_OK;
            FTDI ftdi = new FTDI();
            FTDI ftdiTDC = new FTDI();

            ///////////  get current date and time top create file names     //////////////////////

            DateTime datetime = DateTime.Now;

            String Fname = datetime.Year + "-" + datetime.Month + "-" + datetime.Day + "_" + datetime.Hour + "-" + datetime.Minute + "-" + datetime.Second;
            Console.WriteLine(Fname);
            StreamWriter fin = new StreamWriter("data-in" + Fname + ".txt");
            StreamWriter fout = new StreamWriter("data-out" + Fname + ".txt");
            StreamWriter fkey = new StreamWriter("key" + Fname + ".txt");
            FileStream writeStream1 = new FileStream("waveTDC1-" + Fname + ".data", FileMode.Create);
            FileStream writeStream2 = new FileStream("waveTDC2-" + Fname + ".data", FileMode.Create);
            BinaryWriter waveTDC1 = new BinaryWriter(writeStream1);
            BinaryWriter waveTDC2 = new BinaryWriter(writeStream2);

            ///// get FTDI device information   ///

            ftStatus = ftdi.GetNumberOfDevices(ref ftdiDeviceCount);

            if (ftStatus == FTDI.FT_STATUS.FT_OK)
            {
                Console.WriteLine("Number of FTDI devices: " + ftdiDeviceCount.ToString());
                Console.WriteLine("");
            }
            else
            {
                // Wait for a key press
                Console.WriteLine("Failed to get number of devices (error " + ftStatus.ToString() + ")");
                Console.ReadKey();
                return;
            }


            // Allocate storage for device info list
            FTDI.FT_DEVICE_INFO_NODE[] ftdiDeviceList = new FTDI.FT_DEVICE_INFO_NODE[ftdiDeviceCount];
            ftStatus = ftdi.GetDeviceList(ftdiDeviceList);

            // Open device in our list by serial number
            // Yuanhua's UART 

             ftStatus = ftdi.OpenBySerialNumber(FPGA1_FTDI_SERIAL_NUMBER);         // you need to find your FTDI chip's serial number
             

            ftdi.ResetDevice();
            if (ftStatus != FTDI.FT_STATUS.FT_OK)
            {
                // Wait for a key press
                Console.WriteLine("Failed to open device (error " + ftStatus.ToString() + ")");
                Console.ReadKey();
                return;
            }
            else
                Console.WriteLine("FTDI Device with Serial Number  AES UART : AL05SP7N OPENED");

            ftStatus = ftdiTDC.OpenBySerialNumber(FPGA2_FTDI_SERIAL_NUMBER);         // you need to find your FTDI chip's serial number
                                                                              
            if (ftStatus != FTDI.FT_STATUS.FT_OK)
            {
                // Wait for a key press
                Console.WriteLine("Failed to open TDC UART device (error " + ftStatus.ToString() + ")");
                Console.ReadKey();
                return;
            }
            else
                Console.WriteLine("FTDI Device with Serial Number TDC UART : OPENED");

            ftdi.ResetDevice();
            ftStatus = ftdi.SetBaudRate(400000);     // buad rate -- if you change clk1 this value should be changed
            ftStatus = ftdi.SetDataCharacteristics(FTDI.FT_DATA_BITS.FT_BITS_8, FTDI.FT_STOP_BITS.FT_STOP_BITS_1, FTDI.FT_PARITY.FT_PARITY_NONE);
            ftStatus = ftdi.SetTimeouts(1000, 0);


            ftdiTDC.ResetDevice();
            ftStatus = ftdiTDC.SetBaudRate(400000);     // buad rate -- if you change clk1 this value should be changed
            ftStatus = ftdiTDC.SetDataCharacteristics(FTDI.FT_DATA_BITS.FT_BITS_8, FTDI.FT_STOP_BITS.FT_STOP_BITS_1, FTDI.FT_PARITY.FT_PARITY_NONE);
            ftStatus = ftdiTDC.SetTimeouts(1000, 0);

            byte[,] readArray = new byte[NumROs, samplingPoints];
            int[,] readArrayProcessed = new int[NumROs, samplingPoints];
            int[] readProcessed1 = new int[samplingPoints];
            int[] readProcessed2 = new int[samplingPoints];
            byte[] readArray1 = new byte[samplingPoints];
            byte[] readArray2 = new byte[samplingPoints];

            byte[] readArrayCt = new byte[16];
            byte[] readArrayIn = new byte[16];
            //byte[] readArrayKey = new byte[16];
            UInt32 readbytes = 0;

           // byte[] writeData = { 250, 43, 34 }; // parameters to be written to FPGA
            byte[] writeData = { 0, 0, 0}; // parameters to be written to FPGA

            System.IO.StreamWriter file = new System.IO.StreamWriter(@"file.txt");

            uint brokenData = 0;
            ftdi.GetRxBytesAvailable(ref brokenData);
            read(ftdi, readArray1, (int)brokenData);


            ftdiTDC.GetRxBytesAvailable(ref brokenData);
            read(ftdiTDC, readArray1, (int)brokenData);

            int count=0;
            
            while (true)
            {
            
              // writeData[0]++;
                

                count++;
                for (int j = 0; j < samplingPoints; j++)
                {
                    readProcessed1[j] = 0;
                    readProcessed2[j] = 0;
                }
                System.Threading.Thread.Sleep(5);  // reduce this delay to match the max speed of your laptop/ pc


                // write parameters to FPGA 
                write(ftdi, writeData, writeData.Length);

                // read pt key and ct
                read(ftdi, readArrayIn, 16);
                read(ftdi, readArrayCt, 16);
                //read(ftdi, readArrayCt, 16);
                readbytes = 0;
                //readbytes = readbytes+ read(ftdi, readArray0, samplingPoints) ;

                System.Threading.Thread.Sleep(30);

                // read from onchip sensor(s)
                for (int i = 0; i < NumROs; i++)
                {
                    readbytes = readbytes + read(ftdiTDC, readArray1, samplingPoints);

                    for (int j = 0; j < samplingPoints; j++)
                    {
                        readArray[i, j] = (readArray1[j]);
                        readProcessed1[j] = readProcessed1[j] + ((readArray1[j]));

                        {
                            // readProcessed[j] = readProcessed[j] + 16;
                            readArrayProcessed[i, j] = readArray1[j];
                        }

                    }
                }

                // read from onchip sensor(s)
                for (int i = 0; i < NumROs; i++)
                {
                    readbytes = readbytes + read(ftdiTDC, readArray2, samplingPoints);

                    for (int j = 0; j < samplingPoints; j++)
                    {
                        readArray[i, j] = (readArray2[j]);
                        readProcessed2[j] = readProcessed2[j] + ((readArray2[j]));

                        
                        {
                            // readProcessed[j] = readProcessed[j] + 16;
                            readArrayProcessed[i, j] = readArray2[j];
                        }

                    }
                }


                //Console.Write(writeData[1] +"  "+ writeData[2]);
                Console.WriteLine("\n" + readbytes + "\t"+writeData[1] +"\t"+ writeData[2]);

                // we didnt receive expected number of bytes from FTDI chip, ERROR!!
                if (readbytes != samplingPoints * NumROs * 2)
                    Console.WriteLine("\nERROR\n\n");
                else
                {
                   // display  pt key and ct
                    for (int i = 0; i < 16; i++)
                        Console.Write(readArrayIn[i] + " ");
                    Console.Write("\n");

                    //                    for (int i = 0; i < 16; i++)
                    //                        Console.Write(readArrayKey[i] + " ");
                    //                    Console.Write("\n");

                    for (int i = 0; i < 16; i++)
                        Console.Write(readArrayCt[i] + " ");
                    Console.Write("\n TDC1 ");


                    for (int k = 0; k < NumROs; k++)   // not used ATM
                    {

                        for (int i = 0; i < samplingPoints; i++)
                        {
                            if(count<2500){
                            Console.Write(readProcessed1[i] + " ");
                            }
                            //Console.Write(readArray0[i] + " ");
                            float f = readProcessed1[i];
                            waveTDC1.Write(f);

                        }
                        // write onchip sensor data to wave file.data
                        waveTDC1.Flush();
                        Console.Write("\n");
                    }

                    Console.Write("\n TDC2 ");


                    for (int k = 0; k < NumROs; k++)   // not used ATM
                    {

                        for (int i = 0; i < samplingPoints; i++)
                        {
                            if(count<2500){
                            Console.Write(readProcessed2[i] + " ");
                            }
                            //Console.Write(readArray0[i] + " ");
                            float f = readProcessed2[i];
                            waveTDC2.Write(f);

                        }
                        // write onchip sensor data to wave file.data
                        waveTDC2.Flush();
                        Console.Write("\n");
                    }



                    String sin = "";
                    String sout = "";

                    for (int j = 0; j < 16; j++)
                    {

                        if (j == 0)
                        {
                            sin = readArrayIn[j].ToString("X2");
                            sout = readArrayCt[j].ToString("X2");
                        }
                        else
                        {
                            sin = sin + " " + readArrayIn[j].ToString("X2");
                            sout = sout + " " + readArrayCt[j].ToString("X2");
                        }
                    }

                    // write pt and ct
                    fin.WriteLine(sin);
                    fin.Flush();
                    fout.WriteLine(sout);
                    fout.Flush();


                }

            }

        }
    }
}
