`timescale 1ns / 1ps

module  fir_mult(
input rst,
input clk,
input [13:0] data,      //ԭʼ����Ϊ14λ
input [3:0] coe,       //�˲���ϵ������18λ����������λ��Խ�࣬�������������ԽС
output [17:0] fltd);    //�˲��������

reg [17:0] fltd=18'd0;

reg [17:0] s0=18'd0;
reg [17:0] s1=18'd0;
reg [17:0] s2=18'd0;
reg [17:0] s3=18'd0;

reg [17:0] a0=18'd0;
reg [17:0] a1=18'd0;

always @(posedge clk)
  begin
    if(!rst)
	   begin
		  s0<=18'd0;
		  s1<=18'd0;
		  s2<=18'd0;
		  s3<=18'd0;
		  
		  a0<=18'd0;
		  a1<=18'd0;
		  
        fltd<=18'd0;
		end
	 else
	   begin
		  s0<=coe[0]?{4'b0,data}:18'b0;
		  s1<=coe[1]?{3'b0,data,1'b0}:18'b0;
		  s2<=coe[2]?{2'b0,data,2'b0}:18'b0;
		  s3<=coe[3]?{1'b0,data,3'b0}:18'b0;
		  
		  a0<=s0+s1;
		  a1<=s2+s3;
		  		  
		  fltd<=a0+a1;
		end
  end
endmodule  
