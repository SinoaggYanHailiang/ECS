`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:52:31 04/13/2018
// Design Name:   my_FFT
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg/Proj_ECS/tb_FFT.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: my_FFT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FFT;

	// Inputs
	reg clk_R;
	reg clk_FFT;
	reg rst;
	reg start_FFT;
	reg En_FFT1;
	reg [13:0] FFT_xn_re;
	reg [7:0] AddrFFT_ADC;
	reg ReadFFTEn_ADC1;
	reg ReadFFTEn_ADC2;

	// Outputs
	wire dv_FFT;
	wire [27:0] Data_send_FFT1;
	wire [27:0] Data_send_FFT2;

	// Instantiate the Unit Under Test (UUT)
	my_FFT uut (
		.clk_R(clk_R), 
		.clk_FFT(clk_FFT), 
		.rst(rst), 
		.start_FFT(start_FFT), 
		.En_FFT1(En_FFT1), 
		.FFT_xn_re(FFT_xn_re), 
		.AddrFFT_ADC(AddrFFT_ADC), 
		.dv_FFT(dv_FFT), 
		.ReadFFTEn_ADC1(ReadFFTEn_ADC1), 
		.Data_send_FFT1(Data_send_FFT1), 
		.ReadFFTEn_ADC2(ReadFFTEn_ADC2), 
		.Data_send_FFT2(Data_send_FFT2)
	);

	initial begin
		// Initialize Inputs
		clk_R = 0;
		clk_FFT = 0;
		rst = 1;
		start_FFT = 0;
		En_FFT1 = 0;
		FFT_xn_re = 0;
		AddrFFT_ADC = 0;
		ReadFFTEn_ADC1 = 0;
		ReadFFTEn_ADC2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		FFT_xn_re=14'd238;
      rst=0;
		start_FFT=1;
		AddrFFT_ADC=7'd3;
		ReadFFTEn_ADC1 = 0;
		ReadFFTEn_ADC2 =1;
		#5000
		start_FFT=0;
		#1000
		start_FFT=1;
		#10
		start_FFT=0;
    
	end

always #10  clk_FFT=~clk_FFT;
always #1000 clk_R=~clk_R;  
  
endmodule

