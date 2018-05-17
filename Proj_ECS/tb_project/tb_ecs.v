`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:34:33 04/10/2018
// Design Name:   Proj_ECS
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg/Proj_ECS/tb_project/tb_ecs.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Proj_ECS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


`define N_div_clk_DAC      40   //the count width of DAC (number of bits)
`define N_div_clk_ADC_R    21   //the count width of ADC read (number of bits)
`define N_div_clk_ADC_W    40   //the count width of ADC write (number of bits)
//--------------- For DAC -----------------// 
`define ND_DAC1          14     // Data Width of DAC1 (number of bits)
`define NA_DAC1          15     // Address Width of DAC1 (number of bits)
`define N_Freq			 12     // width of frequence input
`define MAXD_DAC1        16383  // The max Addr value of DAC1  2^(ND_DAC1) - 1
`define Half_MAXD_DAC1   8191   // half of MAXD_DAC1
//--------------- For ADC -----------------//
`define ND_ADC          14     // Data Width of ADC (number of bits)
`define NA_ADC          8     // Address Width of DAC1 (number of bits)
`define N_Depth_ADC     256   // The depth of ADC_RAM = 0.375k
//--------------- For FFT -----------------//
`define ND_FFT          23     // Data Width of ADC (number of bits)
`define NA_FFT          3      // Address Width of DAC1 (number of bits)
`define N_Depth_FFT     7      // The depth of ADC_RAM = 7 
// `define debug           1





module tb_ecs;

	// Inputs
	reg clk_in;
	reg rst_btn;
	reg uart_rx;
	reg [13:0] Data_I_AD9244;
	reg OTR_AD9244;
	reg [13:0] Data_I_AD9244_1;
	reg OTR_AD9244_1;

	// Outputs
	wire [7:0] DIO_OUT1;
	wire [7:0] DIO_OUT2;
	wire [7:0] DIO_OUT3;
	wire uart_tx;
	wire clk_DAC8551;
	wire SYNC_DAC8551;
	wire D_DAC8551;
	wire clk_DAC8551_Bias;
	wire SYNC_DAC8551_Bias;
	wire D_DAC8551_Bias;
	wire clk_DAC904;
	wire [13:0] Data_Out_DAC904;
	wire clk_W_AD9244_out;
	wire clk_W_AD9244_out1;

	// Instantiate the Unit Under Test (UUT)
	Proj_ECS uut (
		.clk_in(clk_in), 
		.rst_btn(rst_btn), 
		.DIO_OUT1(DIO_OUT1), 
		.DIO_OUT2(DIO_OUT2), 
		.DIO_OUT3(DIO_OUT3), 
		.uart_rx(uart_rx), 
		.uart_tx(uart_tx), 
		.clk_DAC8551(clk_DAC8551), 
		.SYNC_DAC8551(SYNC_DAC8551), 
		.D_DAC8551(D_DAC8551), 
		.clk_DAC8551_Bias(clk_DAC8551_Bias), 
		.SYNC_DAC8551_Bias(SYNC_DAC8551_Bias), 
		.D_DAC8551_Bias(D_DAC8551_Bias), 
		.clk_DAC904(clk_DAC904), 
		.Data_Out_DAC904(Data_Out_DAC904), 
		.clk_W_AD9244_out(clk_W_AD9244_out), 
		.Data_I_AD9244(Data_I_AD9244), 
		.OTR_AD9244(OTR_AD9244), 
		.clk_W_AD9244_out1(clk_W_AD9244_out1), 
		.Data_I_AD9244_1(Data_I_AD9244_1), 
		.OTR_AD9244_1(OTR_AD9244_1)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;
		rst_btn = 0;
		uart_rx = 0;
		Data_I_AD9244 = 0;
		OTR_AD9244 = 0;
		Data_I_AD9244_1 = 0;
		OTR_AD9244_1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst_btn=1;
		#1000 uart_rx = 1;
//*************************************************************************************************************
//修改ADC1的系数
      //coe0:AA 07 F0 00 01 F6
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F0=8'b1111_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入01=8'b0000_0001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位	

      //coe1:AA 07 F1 00 02 F4
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入F1=8'b1111_0001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入01=8'b0000_0010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F4=8'b1111_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位			
		
		//coe2:AA 07 F2 00 03 F6
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F0=8'b1111_0010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位	
		
		
		//coe3:AA 07 F3 00 04 F0
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入F0=8'b1111_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F0=8'b1111_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位	
		
		//coe4:AA 07 F4 00 05 F6
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F0=8'b1111_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入01=8'b0000_0101
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位	
		
		//coe5:AA 07 F5 00 06 F4
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入F0=8'b1111_0101
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入06=8'b0000_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位	
		
		//coe6:AA 07 F6 00 07 F6
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位	
		
		//coe7:AA 07 F7 00 08 F8
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入F7=8'b1111_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入08=8'b0000_1000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_1000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位	
		
		//coe8:AA 07 F8 00 09 F6
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F0=8'b1111_1000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入09=8'b0000_1001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
      
      //coe9:AA 07 F9 00 0A F4
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入F9=8'b1111_1001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入0=8'b0000_1010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F6=8'b1111_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位			
		
		
/*
		
//************************************************************		
		//改变交流幅值AA 03 03 FF 00 FF
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		
*/		
		
	/*	
//************************************************************************************
		//写ADC_RAM命令 AA 04 01 FF 00 FA
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入01=8'b0000_0001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入FA=8'b1111_1010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		*/
/*		
		#1_000_000;
		//关闭写ADC_RAM命令 AA 04 02 01 00 07
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入02=8'b0000_0010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入01=8'b0000_0001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入FA=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
*/		

/*		
			
//***********************************************************************		
		#1_000_000;   
		//读取ADC1_RAM命令 AA 04 03 00 FF F8
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F8=8'b1111_1000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
	*/	
	/*	
		#1_000_000;  //42ms，rx_bridge计数一个周期，因此clk_R_serial的时钟周期是42ms
		//关闭读取ADC1_RAM命令 AA 04 04 00 00 00
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入F8=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
	
		
//*******************************************************************		
		#2_000_000;  //为了观察关闭读取数据后的数据发送状态，等待时间长点
		//读取ADC2_RAM命令 AA 06 03 00 FF FA
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入06=8'b0000_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入FA=8'b1111_1010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		
		
		#1_000_000;   
		//需要等待的时间为 42ms发送6字节数据；关闭读取ADC2_RAM命令 AA 06 04 00 00 02
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入06=8'b0000_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入02=8'b0000_0010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
	*/	
		
				
/*	
		#3_000_000
//**************************************************************************
//读取ADC1_FFT数据
		//AA
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入AA=8'b1010_1010，从低位开始，
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D1
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D2
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入05=8'b0000_0101
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D3
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 1;  //输入FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位
		//D4
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //结束位
		//D5
		#3000 uart_rx = 0;  //起始位
		#8700 uart_rx = 0;  //输入FE=8'b1111_1110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //结束位		
		
		*/
		
		
	end
      always #10 clk_in=~clk_in;  
      always #0.5 	
        begin
		    Data_I_AD9244<=Data_I_AD9244+1'b1;
			 Data_I_AD9244_1<=Data_I_AD9244_1+1'b1;
        end		  
endmodule

