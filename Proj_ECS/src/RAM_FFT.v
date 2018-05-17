`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    RAM_ADC
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
/////////////////////////////////////////////////////////////////////////////////
`define ND_FFT          23     // Data Width of ADC (number of bits)
`define NA_FFT          8      // Address Width of DAC1 (number of bits)
`define N_Depth_FFT     256     // The depth of ADC_RAM = 7 


module RAM_FFT(clk_W, clk_R, WriteEn, Addr_W, Data_I_Re, Data_I_Im, 
			   ReadEn_Re, ReadEn_Im, Addr_R, Data_O);

input clk_W, clk_R;
input [`NA_FFT-1:0] Addr_W, Addr_R; //RAM address，NA_FFT=3，读写的深度都是4
input WriteEn; //Write enable (active high)
input ReadEn_Re, ReadEn_Im; //Read enable   (active hign)
output [`ND_FFT-1:0] Data_O;                              //ND_FFT=10'd23
input [`ND_FFT-1:0] Data_I_Re, Data_I_Im;

//signal declarations
reg [`ND_FFT-1:0] Mem_Re[`N_Depth_FFT-1:0]; // the real part         ND_FFT=23
reg [`ND_FFT-1:0] Mem_Im[`N_Depth_FFT-1:0]; // the imaginary part    N_Depth_FFT=7
reg [`ND_FFT-1:0] Data_O=23'd0;

// the real part and the imaginary is writen simultaneously
always @ (posedge clk_W) 
if (WriteEn)
begin
	Mem_Re[Addr_W] <= Data_I_Re;
	Mem_Im[Addr_W] <= Data_I_Im;
end
else
begin
	Mem_Re[Addr_W] <= Mem_Re[Addr_W];
	Mem_Im[Addr_W] <= Mem_Im[Addr_W];
end
	
always @(posedge clk_R)
if (ReadEn_Re)
	Data_O <= Mem_Re[Addr_R];
else if (ReadEn_Im)
	Data_O <= Mem_Im[Addr_R];
else
	Data_O <= Data_O;

endmodule
