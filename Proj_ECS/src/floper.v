`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    floper 
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////////////////////////////

module floper #(parameter WIDTH = 8)
	           (clk, en, rst, d, q);
	
//inputs      
input  clk, en, rst;
input  [WIDTH - 1 : 0] d;
//outputs
output [WIDTH - 1 : 0] q;
	
reg    [WIDTH - 1 : 0] q={WIDTH{1'b0}};	
	
always @(posedge clk)
begin
	if     (rst) q <= {WIDTH{1'b0}};
	else if(en)  q <= d;
	else         q <= q;
end
endmodule
