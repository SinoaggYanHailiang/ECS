`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: CangLiu
// 
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    DDS_Core 
// Project Name:   Electrochemical Workstation
// Target Devices: 
// Tool versions: ISE 14.4
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "ECS_Define.v"
//理解该程序关键输入输出信号
//1.Sel_WaveFunc  输出波形选择信号
//2.Out_Mode      输出模式选择，波形是连续还是单次输出 
//3.freq          频率控制字选择
//4.Data_Out      输出到DAC904数字输入端
module DDS_Core(clk, rst, Sel_WaveFunc, DutyCyc, Out_Mode, freq, Data_Out);
                                                         //Sel_WaveFunc, DutyCyc, Out_Mode, freq都需要外部输入，
input clk, rst;
// input Dir_DC;   // 1'b1 --> '-' ; 1'b0 --> '+'
// input Scal_DC;  // 1'b1 --> scal ; 1'b0 --> nonscal
input Out_Mode;  // 1'b1 --> single ; 1'b0 --> continuous
input [2:0] Sel_WaveFunc;
input [`N_Freq-1:0]  freq;     //N_Freq=12,

input [`ND_DAC1-1:0] DutyCyc;
output[`ND_DAC1-1:0] Data_Out;  // the output value of data 

wire [`ND_DAC1-1:0] Sin_out;  // sin wave         正弦波
wire [`ND_DAC1-1:0] Stw_out;  // sawtooth wave    锯齿波
wire [`ND_DAC1-1:0] Tri_out;  // triangular wave  三角波
wire [`ND_DAC1-1:0] Squ_out;  // square wave      方波

reg [`ND_DAC1-1:0]   Data_temp=14'd0;           //Data_temp 位数是否应该和Data_out 位数一致
reg [`ND_DAC1-1:0] Data_Out=14'd0;
reg [2:0] Sel_WaveFunc_pre=3'd0;
wire [2:0]Sel_WaveFunc_post=3'd0;

reg AC_Wave;  // 1'b1 --> 'abrupt change' ; 1'b0 --> 'unchange'  //需要根据外部输入，确定波形是否改变。

GenWave GenWave_1(.clk(clk), 
				  .rst(rst), 
				  .AC_Wave(AC_Wave),         //产生波形形状选择，根据外部输入决定是否改变输出波形
				  .Out_Mode(Out_Mode),      //输出模式选择含义，在Proj_ECS中令out_mode=0,即不断输出连续波形
				  .freq(freq), 
				  .DutyCyc(DutyCyc),
				  .Sin_out(Sin_out), 
				  .Stw_out(Stw_out), 
				  .Tri_out(Tri_out), 
				  .Squ_out(Squ_out));				  	
					  
floper_N #(3, 4) floper_N_1(.clk(clk), .en(1'b1), .rst(rst),
							.d(Sel_WaveFunc_pre),
					        .q(Sel_WaveFunc_post));					  

/************************************/
always @ (posedge clk) 
begin
  Sel_WaveFunc_pre <= Sel_WaveFunc;
end

always @ (posedge clk)
begin
	if (Sel_WaveFunc_pre != Sel_WaveFunc)
		AC_Wave <= 1'b1;  // abrupt change the wave
	else
		AC_Wave <= 1'b0;
end	

/*************  choose the wave  ************/				  
always @ (posedge clk)
begin	
	if (rst)
		Data_temp <= 0;
	else if (Sel_WaveFunc==3'b001) // output sin wave 
		Data_temp <= Sin_out;
	else if (Sel_WaveFunc==3'b010) // output sawtooth wave 
		Data_temp <= Stw_out;
	else if (Sel_WaveFunc==3'b011) // output triangular wave 
		Data_temp <= Tri_out;
	else if (Sel_WaveFunc==3'b100) // output square wave 
		Data_temp <= Squ_out;
	else
		Data_temp <= `MAXD_DAC1>>1;          //MAXD_DAC1=2的14次方，等于10'd16384=11_1111_1111_1111
end
/*************  output  ************/		
always @ (posedge clk)
begin
	if (rst)
		Data_Out <= 14'b10_1010_1010_1010;
	else
		Data_Out <= Data_temp[`ND_DAC1-1:0];       //波形值为ND_DAC1-1位，Data_tmep为ND_DAC1位，前者为14位，后者为15位
end
endmodule
