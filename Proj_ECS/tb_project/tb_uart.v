`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:02 04/10/2018
// Design Name:   uart
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg/Proj_ECS/tb_project/tb_uart.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_uart;

	// Inputs
	reg clk_25m;
	reg rst;
	reg uart_rx;
	reg [7:0] DataTX_1;
	reg [7:0] DataTX_2;
	reg [7:0] DataTX_3;
	reg [7:0] DataTX_4;
	reg EnTxData;

	// Outputs
	wire uart_tx;
	wire RX_rdy;
	wire [7:0] DataRX_1;
	wire [7:0] DataRX_2;
	wire [7:0] DataRX_3;
	wire [7:0] DataRX_4;
	wire [7:0] DataRX_5;

	// Instantiate the Unit Under Test (UUT)
	uart uut (
		.clk_25m(clk_25m), 
		.rst(rst), 
		.uart_rx(uart_rx), 
		.uart_tx(uart_tx), 
		.DataTX_1(DataTX_1), 
		.DataTX_2(DataTX_2), 
		.DataTX_3(DataTX_3), 
		.DataTX_4(DataTX_4), 
		.EnTxData(EnTxData), 
		.RX_rdy(RX_rdy), 
		.DataRX_1(DataRX_1), 
		.DataRX_2(DataRX_2), 
		.DataRX_3(DataRX_3), 
		.DataRX_4(DataRX_4), 
		.DataRX_5(DataRX_5)
	);

	initial begin
		// Initialize Inputs
		clk_25m = 0;
		rst = 1;
		uart_rx = 1;
		DataTX_1 = 0;
		DataTX_2 = 0;
		DataTX_3 = 0;
		DataTX_4 = 0;
		EnTxData = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      rst=0;
		#10 uart_rx=1;
		#20 uart_rx=0;
		//
		#20 uart_rx=1;
		#20 uart_rx=1;
		#20 uart_rx=1;
		#20 uart_rx=0;
		#20 uart_rx=1;
		#20 uart_rx=1;
		#20 uart_rx=1;
		#20 uart_rx=0;
		#6000
		#10 uart_rx=1;
		#20 uart_rx=0;
		//
		#20 uart_rx=1;
		#20 uart_rx=1;
		#20 uart_rx=1;
		#20 uart_rx=0;
		#20 uart_rx=1;
		#20 uart_rx=1;
		#20 uart_rx=1;
		#20 uart_rx=0;
		
		
		
	end
     always #10 clk_25m=~clk_25m; 
endmodule

