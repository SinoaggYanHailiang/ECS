`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:03:51 04/20/2018
// Design Name:   FFTRAM_IP_RE
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg_v1_fft256/Proj_ECS/tb_FFTRAM_IP_RE.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FFTRAM_IP_RE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FFTRAM_IP_RE;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [7:0] addra;
	reg [22:0] dina;

	// Outputs
	wire [22:0] douta;

	// Instantiate the Unit Under Test (UUT)
	FFTRAM_IP_RE uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      wea=1;
		#3000
		wea=0;
      #1000
		wea=1;
		#5000
		wea=0;
	end
 always #10 clka=~clka;
 always #20 addra=addra+1;
 always #20 dina=dina+2;
endmodule

