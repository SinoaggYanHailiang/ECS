`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:09:46 04/21/2018
// Design Name:   Dram_fft_re
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg_v1_fft256/Proj_ECS/tb_Dram_fft_re.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dram_fft_re
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Dram_fft_re;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [7:0] addra;
	reg [22:0] dina;
	reg clkb;
	reg [7:0] addrb;

	// Outputs
	wire [22:0] doutb;

	// Instantiate the Unit Under Test (UUT)
	Dram_fft_re uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.clkb(clkb), 
		.addrb(addrb), 
		.doutb(doutb)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;
		clkb = 0;
		addrb = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      wea=0;
		#1000;
		wea=1;
		#1000;
		wea=0;
	end
	always @(posedge clka)
	   begin
        addra<=addra+1;		
		end
	always @(posedge clkb)
	   begin
        addrb<=addrb+1;		
		end
	always #20 dina<=dina+1'b1;
   always #10 clka<=~clka;
   always #10 clkb<=~clkb;     
endmodule

