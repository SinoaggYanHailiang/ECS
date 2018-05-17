`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:05 04/13/2018
// Design Name:   AD9244
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg/Proj_ECS/tb_ad9244.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AD9244
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ad9244;

	// Inputs
	reg clk_W;
	reg clk_R;
	reg clk_FFT;
	reg rst;
	reg ReadEn;
	reg WriteEn;
	reg start_FFT;
	reg [13:0] Data_I;
	reg OTR;
	reg [15:0] ADCR_Length;
	reg [7:0] ADCM_Length;
	reg R_Restart_ADC;

	// Outputs
	wire [13:0] Data_O_Serial;
	wire [7:0] AddrR_O;
	wire rdy_W;
	wire rdy_R;
	wire Sample_256;
	wire [13:0] Mean_ADC;
	wire [13:0] FFT_xn_re;
	wire [1:0] flag_OverFlow;

	// Instantiate the Unit Under Test (UUT)
	AD9244 uut (
		.clk_W(clk_W), 
		.clk_R(clk_R), 
		.clk_FFT(clk_FFT), 
		.rst(rst), 
		.ReadEn(ReadEn), 
		.WriteEn(WriteEn), 
		.start_FFT(start_FFT), 
		.Data_I(Data_I), 
		.OTR(OTR), 
		.Data_O_Serial(Data_O_Serial), 
		.AddrR_O(AddrR_O), 
		.ADCR_Length(ADCR_Length), 
		.ADCM_Length(ADCM_Length), 
		.R_Restart_ADC(R_Restart_ADC), 
		.rdy_W(rdy_W), 
		.rdy_R(rdy_R), 
		.Sample_256(Sample_256), 
		.Mean_ADC(Mean_ADC), 
		.FFT_xn_re(FFT_xn_re), 
		.flag_OverFlow(flag_OverFlow)
	);

	initial begin
		// Initialize Inputs
		clk_W = 0;
		clk_R = 0;
		clk_FFT = 0;
		rst = 1;
		ReadEn = 0;
		WriteEn = 0;
		start_FFT = 0;
		Data_I = 0;
		OTR = 0;
		ADCR_Length = 0;
		ADCM_Length = 0;
		R_Restart_ADC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      rst=0;
		WriteEn=1;
		
		#8000;
		WriteEn=0;
		ReadEn = 1;
		ADCR_Length =16'd128;
		ADCM_Length = 8'd128;
		
		
		
		
	end
	
always #10 clk_W=~clk_W;
always #20 Data_I<=Data_I+1;
always #20 clk_FFT=~clk_FFT;
always #200 clk_R=~clk_R;   
   
endmodule

