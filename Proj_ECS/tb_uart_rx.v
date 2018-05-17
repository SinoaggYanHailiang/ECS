`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:23:07 04/19/2018
// Design Name:   my_uart_rx
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg_v1/Proj_ECS/tb_uart_rx.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: my_uart_rx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_uart_rx;

	// Inputs
	reg clk;
	reg rst;
	reg uart_rx;
	reg clk_bps;

	// Outputs
	wire bps_start;
	wire [7:0] rx_data;
	wire rx_rdy;

	// Instantiate the Unit Under Test (UUT)
	my_uart_rx uut (
		.clk(clk), 
		.rst(rst), 
		.uart_rx(uart_rx), 
		.clk_bps(clk_bps), 
		.bps_start(bps_start), 
		.rx_data(rx_data), 
		.rx_rdy(rx_rdy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		uart_rx = 0;
		clk_bps = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

