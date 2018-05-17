`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    floper_N 
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////////////////////////////

//本模块主要作用是产生一个流水线结构



module floper_N #(parameter WIDTH = 16, parameter Delay_a11 = 8)
          ( 
				//@@inputs
				 input      clk, en, rst,
				 input      [WIDTH - 1 : 0] d,
				 //@@outputs
				 output [WIDTH - 1 : 0] q
           );

wire [WIDTH-1:0] d_Del [0:Delay_a11-1];    //16*8
//GENERATE PIPELINE
genvar i;
/* produce all pipeline delay 16 clocks */
floper #(WIDTH) floper(.clk(clk), .en(en), .rst(rst), .d(d), .q(d_Del[0]));
generate
	for(i=0; i<Delay_a11-1; i=i+1) begin: d_pipe 
		flop #(WIDTH) flop_0(.clk(clk), .q(d_Del[i+1]), .d(d_Del[i]));
	end
endgenerate	 
 
assign q = d_Del[Delay_a11-1];
  
endmodule