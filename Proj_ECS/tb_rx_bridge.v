`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:58:57 04/23/2018
// Design Name:   rx_bridge
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg_v1_fft256/Proj_ECS/tb_rx_bridge.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rx_bridge
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_rx_bridge;

	// Inputs
	reg clk;
	reg rst;
	reg rxen;
	reg [7:0] rxdb;

	// Outputs
	wire RX_rdy;
	wire [7:0] Data1;
	wire [7:0] Data2;
	wire [7:0] Data3;
	wire [7:0] Data4;
	wire [7:0] Data5;

	// Instantiate the Unit Under Test (UUT)
	rx_bridge uut (
		.clk(clk), 
		.rst(rst), 
		.rxen(rxen), 
		.rxdb(rxdb), 
		.RX_rdy(RX_rdy), 
		.Data1(Data1), 
		.Data2(Data2), 
		.Data3(Data3), 
		.Data4(Data4), 
		.Data5(Data5)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		rxen = 0;
		rxdb = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      rst=1;
		// 第一个循环
		#160;
		rxen=1'd1;
		rxdb=8'hAA;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h04;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h02;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h01;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h00;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h07;
		#20;
		rxen=1'd0;
		
		
		#1000;   //第二个循环
		
		#160;
		rxen=1'd1;
		rxdb=8'hAA;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h04;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h02;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h01;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h00;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h07;
		#20;
		rxen=1'd0;
		
		#1000;   //第三个循环
		
		#160;
		rxen=1'd1;
		rxdb=8'hAA;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h04;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h02;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h01;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h00;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h07;
		#20;
		rxen=1'd0;
		
		#1000;   //第四个循环
		
		#160;
		rxen=1'd1;
		rxdb=8'hAA;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h04;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h02;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h01;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h00;
		#20;
		rxen=1'd0;
		
		#160;
		rxen=1'd1;
		rxdb=8'h07;
		#20;
		rxen=1'd0;
		
	end
	
    always #10 clk=~clk;  
endmodule

