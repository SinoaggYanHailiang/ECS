`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:38:21 04/14/2018
// Design Name:   Gen_clk
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg/Proj_ECS/tb_project/tb_gen_clk.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Gen_clk
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_gen_clk;

	// Inputs
	reg clk_in_50m;
	reg rst;
	reg [39:0] cnt_DAC904;
	reg [39:0] cnt_AD9244_W;

	// Outputs
	wire clk_DAC8551;
	wire clk_DAC8551_Bias;
	wire clk_FFT;
	wire clk_25m;
	wire clk_50m;
	wire clk_DAC904;
	wire clk_R_Serial;
	wire clk_W_AD9244;

	// Instantiate the Unit Under Test (UUT)
	Gen_clk uut (
		.clk_in_50m(clk_in_50m), 
		.rst(rst), 
		.cnt_DAC904(cnt_DAC904), 
		.cnt_AD9244_W(cnt_AD9244_W), 
		.clk_DAC8551(clk_DAC8551), 
		.clk_DAC8551_Bias(clk_DAC8551_Bias), 
		.clk_FFT(clk_FFT), 
		.clk_25m(clk_25m), 
		.clk_50m(clk_50m), 
		.clk_DAC904(clk_DAC904), 
		.clk_R_Serial(clk_R_Serial), 
		.clk_W_AD9244(clk_W_AD9244)
	);

	initial begin
		// Initialize Inputs
		clk_in_50m = 0;
		rst = 0;
		cnt_DAC904 = 0;
		cnt_AD9244_W = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      rst=1;
	end
always #10 clk_in_50m=~clk_in_50m;
endmodule

