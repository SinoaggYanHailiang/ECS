`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    flop
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////////////////////////////
module flop #(parameter WIDTH = 8)
          (clk, d, q);
//@@inputs
input clk;
input [WIDTH - 1 : 0] d;
//@@outputs
output [WIDTH - 1 : 0] q;	
 
reg [WIDTH - 1 : 0] q;

always @(posedge clk)
begin
  q <= d;
end
endmodule
