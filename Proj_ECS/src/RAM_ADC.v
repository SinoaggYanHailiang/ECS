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
input [`NA_ADC-1:0] Addr_W, Addr_R_Serial, Addr_R_FFT; //RAM address��NA_ADC=8
input WriteEn; //Write enable (active high)       AD9244�ɼ���������������д��   
input ReadEn_Serial, ReadEn_FFT; //Read enable   (active hign)   �������һ���浽UART��һ���浽FFT�任ģ��
//output
output [`ND_ADC-1:0] Data_O_Serial, Data_O_FFT;      //ND_ADC=14,NA_ADC=8,2^8=256;  �������ԭʼ���ݺ�FFT�任���
input [`ND_ADC-1:0] Data_I;                          //��������ΪADC9244�ɼ�������

//signal declarations
reg [`ND_ADC-1:0] Mem[`N_Depth_ADC-1:0];              //N_Depth_ADC=256 ,14*256 
reg [`ND_ADC-1:0] Data_O_Serial=14'd0, Data_O_FFT=14'd0;


//------------��ADC_RAM��д��ADC�ɼ�������----------------
always @ (posedge clk_W)                                //Addr_w[13:0]  Addr_R_Serial[13:0] Addr_R_FFT[13:0] ��Ϊ�ⲿ�����ź�
if (WriteEn)         
	Mem[Addr_W] <= Data_I;
else
	Mem[Addr_W] <= Mem[Addr_W];

//------------���ڷ��ʹ�ADC_RAM��ȡ���ݷ��͵�����----------------	
always @(posedge clk_R_Serial)                     
if (ReadEn_Serial)      //ReadEn��Ctr_UART��AD9244�ٵ�RAM_ADC��ReadEn_Serial
	Data_O_Serial <= Mem[Addr_R_Serial];
else
	Data_O_Serial <= Data_O_Serial;


//------------FFTģ���ADC_RAM��ȡ���ݽ��и���Ҷ�任----------------
always @ (posedge clk_R_FFT)
if (ReadEn_FFT)
	Data_O_FFT <= Mem[Addr_R_FFT];
else
	Data_O_FFT <= Data_O_FFT;	

endmodule
