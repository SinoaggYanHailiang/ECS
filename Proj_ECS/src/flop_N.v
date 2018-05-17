`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:23 05/16/2016 
// Design Name: 
// Module Name:    flop_N 
// Project Name: 
// Target Devices: 
//////////////////////////////////////////////////////////////////////////////////
module flop_N #(parameter WIDTH = 16, parameter Delay_a11 = 8)
          ( 
				//@@inputs
				 input                      clk,
				 input      [WIDTH - 1 : 0] d,
				 //@@outputs
				 output [WIDTH - 1 : 0] q
           );

wire [WIDTH-1:0] d_Del [0:Delay_a11-1];  //16*8�Ĵ洢�ṹ
//GENERATE PIPELINE
genvar i;
/* produce all pipeline delay 16 clocks */
flop #(WIDTH) flop(.clk(clk), .q(d_Del[0]), .d(d));  //d_del[0]��16*8�Ĵ洢�ṹ�еĵ�һ����������d[15:0]��d_del[0]
generate
	for(i=0; i<Delay_a11-1; i=i+1) begin: d_pipe 
		flop #(WIDTH) flop_0(.clk(clk), .q(d_Del[i+1]), .d(d_Del[i]));
	end
endgenerate	 
 
assign q = d_Del[Delay_a11-1];    //���d_Del[7]��q����������d�������d_Del��8����ˮ���ӳ�
  
endmodule
