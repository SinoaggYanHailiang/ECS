`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:31:17 04/13/2018
// Design Name:   FFT
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg/Proj_ECS/tb_FFT_IPCORE.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FFT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FFT_IPCORE;

	// Inputs
	reg clk;
	reg start;
	reg unload;
	reg fwd_inv;
	reg fwd_inv_we;
	reg [13:0] xn_re;
	reg [13:0] xn_im;

	// Outputs
	wire rfd;
	wire busy;
	wire edone;
	wire done;
	wire dv;
	wire [7:0] xn_index;
	wire [7:0] xk_index;
	wire [22:0] xk_re;
	wire [22:0] xk_im;

	// Instantiate the Unit Under Test (UUT)
	FFT uut (
		.clk(clk), 
		.start(start), 
		.unload(unload), 
		.fwd_inv(fwd_inv), 
		.fwd_inv_we(fwd_inv_we), 
		.rfd(rfd), 
		.busy(busy), 
		.edone(edone), 
		.done(done), 
		.dv(dv), 
		.xn_re(xn_re), 
		.xn_im(xn_im), 
		.xn_index(xn_index), 
		.xk_index(xk_index), 
		.xk_re(xk_re), 
		.xk_im(xk_im)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		unload = 0;
		fwd_inv = 0;
		fwd_inv_we = 0;
		xn_re = 0;
		xn_im = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      start=0;
		unload=1;
		fwd_inv=1;
		fwd_inv_we=1;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#300;
		start=1;
		#20;
		start=0;
		#19000
		start=1;
		
		
	end


always #10  xn_re=14'd888;
always #10 clk=~clk; 

endmodule

/*

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
FFT your_instance_name (
  .clk(clk), // input clk
  .start(start), // input start
  .unload(unload), // input unload
  .xn_re(xn_re), // input [13 : 0] xn_re
  .xn_im(xn_im), // input [13 : 0] xn_im
  .fwd_inv(fwd_inv), // input fwd_inv
  .fwd_inv_we(fwd_inv_we), // input fwd_inv_we
  .rfd(rfd), // output rfd
  .xn_index(xn_index), // output [7 : 0] xn_index
  .busy(busy), // output busy
  .edone(edone), // output edone
  .done(done), // output done
  .dv(dv), // output dv
  .xk_index(xk_index), // output [7 : 0] xk_index
  .xk_re(xk_re), // output [22 : 0] xk_re
  .xk_im(xk_im) // output [22 : 0] xk_im
);
// INST_TAG_END ------ End INSTANTIATION Template ---------
*/