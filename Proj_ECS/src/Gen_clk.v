`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    Gen_clk
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////////////////////////////

`include "ECS_Define.v"

module Gen_clk( clk_in_50m, rst, cnt_DAC904, cnt_AD9244_W,  
				clk_DAC8551, clk_DAC8551_Bias, clk_FFT, clk_25m, clk_50m, clk_DAC904, clk_R_Serial, clk_W_AD9244,clk_W_AD9244_fir);
				
input clk_in_50m, rst;
input [`N_div_clk_DAC-1:0] cnt_DAC904;
input [`N_div_clk_ADC_W-1:0] cnt_AD9244_W;

 
output clk_DAC8551, clk_DAC8551_Bias, clk_FFT, clk_25m, clk_50m, clk_DAC904, clk_R_Serial, clk_W_AD9244,clk_W_AD9244_fir;

reg [`N_div_clk_DAC-1:0] count_clk_DAC=40'd0;           //40位，计数值寄存器，count_clk_ADC_R去最高位分频，DAC和ADC_W与外部输入控制字对比，确定分频
reg [`N_div_clk_ADC_R-1:0] count_clk_ADC_R=21'd0;       //21位，
reg [`N_div_clk_ADC_W-1:0] count_clk_ADC_W=40'd0;       //40位

reg clk_DAC904=1'b0;    //当声明为reg clk_DAC904；，没有为寄存器变量赋初始值时，仿真出错；     
reg clk_W_AD9244=1'b0;
reg clk_W_AD9244_fir=1'b0;
reg clk_DAC8551 = 1'b0;
reg clk_25m = 1'b0;

wire clk_80m, clkDAC_200m, clk_Ref;

pll_controller pll_contr_1
	(
	.CLK_IN1(clk_in_50m),
	.CLK_OUT1(clk_50m), // generate the clk of 50MHz
	.CLK_OUT2(clk_80m),  // generate the clk of 80MHz，和50Mhz结合产生ADC读和写时钟
	.CLK_OUT3(clkDAC_200m),  // generate the clk of 200MHz，用于产生DAC时钟
	.CLK_OUT4(clk_Ref),  // generate the clk of 5MHz
	.CLK_OUT5(clk_FFT)   // generate the clk of 20MHz，产生FFT时钟
	);
	
//---------------DAC904数模转换时钟-----------------
// generate the clk for DAC904
//原程序

always @ (posedge clkDAC_200m)     //clk_DAC904=2*cnt_DAC904分频对clkDAC_200m
if (!rst)
begin
	clk_DAC904 <= 1'b0; 
end
else
begin
	if (count_clk_DAC < cnt_DAC904)
	begin
		clk_DAC904 <= clk_DAC904;
	end
   else     //原程序
	begin
		clk_DAC904 <= ~clk_DAC904;
	end	

end	

always @ (posedge clkDAC_200m)
if (!rst)
begin
	count_clk_DAC <= {`N_div_clk_DAC{1'b0}};
end
else
begin
	if (count_clk_DAC < cnt_DAC904)
	begin
		count_clk_DAC <= count_clk_DAC + 1'b1;
	end
	else 
	begin
		count_clk_DAC <= {`N_div_clk_DAC{1'b0}};
	end	

end	



//由于clk_W_AD9244和clk_W_AD9244_时钟引脚没有分配在专用全局时钟引脚上，因此用输入时钟作为分频信号
//------------AD9244写时钟-------------
// clkin1 来自pll的hdl语言例化模块

always @ (posedge clk_80m)
    if (!rst)
    begin 
    	count_clk_ADC_W <= {`N_div_clk_ADC_W{1'b0}};
    	clk_W_AD9244 <= 1'b0;
      clk_W_AD9244_fir<=1'b0;		
    end
    else if (count_clk_ADC_W < cnt_AD9244_W)                //cnt_AD9244_W由电脑输入确定
    begin
    	count_clk_ADC_W <= count_clk_ADC_W + 1'b1;
    	clk_W_AD9244 <= clk_W_AD9244;
		clk_W_AD9244_fir<=clk_W_AD9244_fir;
    end
    else 
    begin
    	count_clk_ADC_W <= {`N_div_clk_ADC_W{1'b0}};
    	clk_W_AD9244 <= ~clk_W_AD9244;
		clk_W_AD9244_fir<=~clk_W_AD9244_fir;
    end







/*
//*******************************************************************************************************************
//例化oddr2

ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) ODDR2_adc (
      .Q(clk_W_AD9244_out),   // 1-bit DDR output data
      .C0(clk_W_AD9244),   // 1-bit clock input
      .C1(~clk_W_AD9244),   // 1-bit clock input
      .CE(1'd1), // 1-bit clock enable input
      .D0(1'd1), // 1-bit data input (associated with C0)
      .D1(1'd0), // 1-bit data input (associated with C1)
      .R(1'd0),   // 1-bit reset input
      .S(1'd0)    // 1-bit set input
   );

ODDR2 #(
      .DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1" 
      .INIT(1'b0),    // Sets initial state of the Q output to 1'b0 or 1'b1
      .SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
   ) ODDR2_adc1 (
      .Q(clk_W_AD9244_out1),   // 1-bit DDR output data
      .C0(clk_W_AD9244),   // 1-bit clock input
      .C1(~clk_W_AD9244),   // 1-bit clock input
      .CE(1'd1), // 1-bit clock enable input
      .D0(1'd1), // 1-bit data input (associated with C0)
      .D1(1'd0), // 1-bit data input (associated with C1)
      .R(1'd0),   // 1-bit reset input
      .S(1'd0)    // 1-bit set input
   );
*/
//----------------AD9244读时钟---------------------
// generate the clk for AD9244 of clk_R，读取AD9244也就是UART从AD9244读取数据，也即clk_R_Serial
//50m/(2^21)=23.8=23hz
always @ (posedge clk_50m)     
if (!rst)
begin
	count_clk_ADC_R <= {`N_div_clk_ADC_R{1'b0}};
end
else
begin
	count_clk_ADC_R <= count_clk_ADC_R + 1'b1;
end
 assign clk_R_Serial = count_clk_ADC_R[`N_div_clk_ADC_R-1];


//assign clk_R_Serial = clk_W_AD9244; // 用于加快仿真速度


// generate the clk of 25MHz,用在uart_1模块中
always @ (posedge clk_50m)
	clk_25m <= ~clk_25m;

// generate the clk of 2.5MHz for DAC8551，两个数控稳压电源的频率为2.5MHZ
always @ (posedge clk_Ref)
	clk_DAC8551 <= ~clk_DAC8551;
assign clk_DAC8551_Bias = clk_DAC8551;

endmodule
