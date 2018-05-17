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
//�޸�ADC1��ϵ��
      //coe0:AA 07 F0 00 01 F6
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F0=8'b1111_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����01=8'b0000_0001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ	

      //coe1:AA 07 F1 00 02 F4
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����F1=8'b1111_0001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����01=8'b0000_0010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F4=8'b1111_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ			
		
		//coe2:AA 07 F2 00 03 F6
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F0=8'b1111_0010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ	
		
		
		//coe3:AA 07 F3 00 04 F0
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����F0=8'b1111_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F0=8'b1111_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ	
		
		//coe4:AA 07 F4 00 05 F6
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F0=8'b1111_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����01=8'b0000_0101
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ	
		
		//coe5:AA 07 F5 00 06 F4
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����F0=8'b1111_0101
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����06=8'b0000_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ	
		
		//coe6:AA 07 F6 00 07 F6
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ	
		
		//coe7:AA 07 F7 00 08 F8
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����F7=8'b1111_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����08=8'b0000_1000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_1000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ	
		
		//coe8:AA 07 F8 00 09 F6
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F0=8'b1111_1000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����09=8'b0000_1001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
      
      //coe9:AA 07 F9 00 0A F4
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����07=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����F9=8'b1111_1001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����0=8'b0000_1010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F6=8'b1111_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ			
		
		
/*
		
//************************************************************		
		//�ı佻����ֵAA 03 03 FF 00 FF
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		
*/		
		
	/*	
//************************************************************************************
		//дADC_RAM���� AA 04 01 FF 00 FA
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����01=8'b0000_0001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����FA=8'b1111_1010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		*/
/*		
		#1_000_000;
		//�ر�дADC_RAM���� AA 04 02 01 00 07
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����02=8'b0000_0010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����01=8'b0000_0001
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����FA=8'b0000_0111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
*/		

/*		
			
//***********************************************************************		
		#1_000_000;   
		//��ȡADC1_RAM���� AA 04 03 00 FF F8
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F8=8'b1111_1000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
	*/	
	/*	
		#1_000_000;  //42ms��rx_bridge����һ�����ڣ����clk_R_serial��ʱ��������42ms
		//�رն�ȡADC1_RAM���� AA 04 04 00 00 00
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����F8=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
	
		
//*******************************************************************		
		#2_000_000;  //Ϊ�˹۲�رն�ȡ���ݺ�����ݷ���״̬���ȴ�ʱ�䳤��
		//��ȡADC2_RAM���� AA 06 03 00 FF FA
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����06=8'b0000_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����03=8'b0000_0011
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����FA=8'b1111_1010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		
		
		#1_000_000;   
		//��Ҫ�ȴ���ʱ��Ϊ 42ms����6�ֽ����ݣ��رն�ȡADC2_RAM���� AA 06 04 00 00 02
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����06=8'b0000_0110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����02=8'b0000_0010
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
	*/	
		
				
/*	
		#3_000_000
//**************************************************************************
//��ȡADC1_FFT����
		//AA
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����AA=8'b1010_1010���ӵ�λ��ʼ��
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D1
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����04=8'b0000_0100
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D2
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����05=8'b0000_0101
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D3
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 1;  //����FF=8'b1111_1111
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ
		//D4
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����00=8'b0000_0000
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 0;
		#8700 uart_rx = 1;  //����λ
		//D5
		#3000 uart_rx = 0;  //��ʼλ
		#8700 uart_rx = 0;  //����FE=8'b1111_1110
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;
		#8700 uart_rx = 1;  //����λ		
		
		*/
		
		
	end
      always #10 clk_in=~clk_in;  
      always #0.5 	
        begin
		    Data_I_AD9244<=Data_I_AD9244+1'b1;
			 Data_I_AD9244_1<=Data_I_AD9244_1+1'b1;
        end		  
endmodule

