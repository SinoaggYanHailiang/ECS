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
//////////////////////////////////////////////////////////////////////////////////
`include "ECS_Define.v"

module RAM_ADC(clk_W, clk_R_Serial, clk_R_FFT, Data_I, 
			   Addr_W, Addr_R_Serial, Addr_R_FFT, ReadEn_Serial, ReadEn_FFT, 
			   WriteEn, Data_O_Serial, Data_O_FFT);

//inputs
input clk_W, clk_R_Serial, clk_R_FFT;
input [`NA_ADC-1:0] Addr_W, Addr_R_Serial, Addr_R_FFT; //RAM address，NA_ADC=8
input WriteEn; //Write enable (active high)       AD9244采集的数据是向里面写的   
input ReadEn_Serial, ReadEn_FFT; //Read enable   (active hign)   输出数据一方面到UART，一方面到FFT变换模块
//output
output [`ND_ADC-1:0] Data_O_Serial, Data_O_FFT;      //ND_ADC=14,NA_ADC=8,2^8=256;  输出包括原始数据和FFT变换结果
input [`ND_ADC-1:0] Data_I;                          //输入数据为ADC9244采集的数据

//signal declarations
reg [`ND_ADC-1:0] Mem[`N_Depth_ADC-1:0];              //N_Depth_ADC=256 ,14*256 
reg [`ND_ADC-1:0] Data_O_Serial=14'd0, Data_O_FFT=14'd0;


//------------向ADC_RAM中写入ADC采集的数据----------------
always @ (posedge clk_W)                                //Addr_w[13:0]  Addr_R_Serial[13:0] Addr_R_FFT[13:0] 均为外部输入信号
if (WriteEn)         
	Mem[Addr_W] <= Data_I;
else
	Mem[Addr_W] <= Mem[Addr_W];

//------------串口发送从ADC_RAM读取数据发送到电脑----------------	
always @(posedge clk_R_Serial)                     
if (ReadEn_Serial)      //ReadEn从Ctr_UART到AD9244再到RAM_ADC的ReadEn_Serial
	Data_O_Serial <= Mem[Addr_R_Serial];
else
	Data_O_Serial <= Data_O_Serial;


//------------FFT模块从ADC_RAM读取数据进行傅里叶变换----------------
always @ (posedge clk_R_FFT)
if (ReadEn_FFT)
	Data_O_FFT <= Mem[Addr_R_FFT];
else
	Data_O_FFT <= Data_O_FFT;	

endmodule
