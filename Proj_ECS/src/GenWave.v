`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: CangLiu
// 
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    GenWave 
// Project Name:   Electrochemical Workstation
// Target Devices: 
// Tool versions: ISE 14.4
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
/*
本模块会产生4中波形，但是具体输出哪一个波形还是在模块DDS_Core中决定，由DDS_Core模块中的输入引脚Sel_WaveFunc决定
*/


`include "ECS_Define.v"

module GenWave(clk, rst, AC_Wave, Out_Mode, freq, DutyCyc, Sin_out, Stw_out, Tri_out, Squ_out);

input  clk, rst;
input AC_Wave;    // 1选择改变，0选择不变还是输入原来的波形;即函数选择和前面一样了，不用改变，不一样了用改变。   //根据外部输入，在DDS_CORE 中参数该变量确定值
input Out_Mode;   // 1'b1 --> single ; 1'b0 --> continuous                                        //外部输入决定  
input  [`N_Freq-1:0]  freq;       //N_Freq=12                                                      //外部输入决定
input [`ND_DAC1-1:0] DutyCyc;    //ND_DAC1=14 
output [`ND_DAC1-1:0] Sin_out;  // sin wave
output [`ND_DAC1-1:0] Stw_out;  // sawtooth wave
output [`ND_DAC1-1:0] Tri_out;  // triangular wave
output [`ND_DAC1-1:0] Squ_out;  // square wave

reg [`ND_DAC1-1:0] Stw_out=14'd0;  // sawtooth wave
reg [`ND_DAC1-1:0] Tri_out=14'd0;  // triangular wave
reg [`ND_DAC1-1:0] Squ_out=14'd0;  // square wave
reg [`NA_DAC1-1:0] addra=15'd0;    //产生的正弦波数据个数为2^15
// reg [`ND_DAC1-1:0] Sin_out;  // sin wave

wire [`ND_DAC1-1:0] Sin_DDS;  // sin wave

rom_sin rom_sin_1 (  
		.clka(clk), 
		.rsta(rst),
		.addra(addra), 
		.douta(Sin_out)
	);


//addra决定ram的读出数据，addra的变化直接控制Stw_out，Stw_out通过变换转换成Tri_out和Squ_out输出
//因此改变频率字freq时，四种波形的输出频率都可以改变，其实Stw_out、Tri_out和Squ_out三者频率一样，因为锯齿波运行一个周期，三角波和方波也运行一个周期
//由于addr运行一个周期sin也运行一个周期，Stw_out也运行一个周期，因此Stw_out和sin波的周期一样子

/************ calculate the value of addra ***********/	
always @ (posedge clk)	                                  // 产生DDS模块地址
begin
	if (rst)  
		addra <= 0;
	else if (AC_Wave)
		addra   <= 0;
	else if (Out_Mode)                                     //out_mode=0,连续输出波形
		if (addra > addra + freq)  
			addra <= {`NA_DAC1{1'b1}};                       //15'b111_1111_1111_1111
		else
			addra   <= addra + freq;
	else
		addra   <= addra + freq;
end
/******************* generate the sawtooth wave ***********************/	
always @ (posedge clk)	
begin
	if (rst)  
		Stw_out <= {`ND_DAC1{1'b0}};          //ND_DAC1=14,DAC数据宽度
	else if (Out_Mode)                       //NA_DAC1=15,DAC地址宽度
		if (addra == {`NA_DAC1{1'b1}})                           //地址为最大值时，地址归零
			Stw_out <= {`ND_DAC1{1'b0}};
		else
			Stw_out <= addra[`NA_DAC1-1:(`NA_DAC1-`ND_DAC1)];     //地址为15位，输出为14位，因此只要地址高14位 
	else 
		Stw_out <= addra[`NA_DAC1-1:(`NA_DAC1-`ND_DAC1)];
end
/********************* generate the triangular wave *********************/	   
always @ (posedge clk)                //思路：Stw_out 范围是0->2^14,即0->16383 ,当Stw_out 运行到自身1/2的幅度时，需要翻转，通过MAXD_DAC=16383        
begin
	if (rst)                           //减去Stw_out 即可，然后得到的数值都左移，放大两倍
	begin
		Tri_out <= {`ND_DAC1{1'b0}};
	end
	else if (Stw_out <= (`MAXD_DAC1>>1))  //the value of sawtooth wave is smaller than 0.5*max_value 
	begin                                 //MAXD_DAC1=16383=2^14，即ADC输入数据最大范围14'b11_1111_1111_1111
		Tri_out <= Stw_out<<1;  
	end
	else if (Stw_out > (`MAXD_DAC1>>1))  //the value of sawtooth wave is bigger than 0.5*max_value
	begin
		Tri_out <= (`MAXD_DAC1-Stw_out)<<1;  
	end
	else
	begin
		Tri_out <= `MAXD_DAC1>>1;
	end
end
/********************* generate the square wave *********************/	
always @ (posedge clk)
begin
	if (rst)                          //Stw_out的最大值为MAXD_DAC1>>1，即16383，其在0->16383之间取值，当DutyCyc其大于等于Stw_out时，方波为1，小于时，方波为0
	begin
		Squ_out <= {`ND_DAC1{1'b0}};
	end
	else if (Stw_out <= DutyCyc)  //the value of sawtooth wave is smaller than 0.5*max_value
	begin  
		Squ_out <= {`ND_DAC1{1'b0}};
	end
	else if (Stw_out > DutyCyc)  //the value of sawtooth wave is bigger than 0.5*max_value
	begin  
		Squ_out <= `MAXD_DAC1;
	end
	else
	begin
		Squ_out <= `MAXD_DAC1>>1;
	end	
end	

endmodule
