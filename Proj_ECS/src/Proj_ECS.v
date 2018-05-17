`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    Proj_ECS
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////////////////////////////
`include "ECS_Define.v"

`define N_div_clk_DAC      40   //the count width of DAC (number of bits)
`define N_div_clk_ADC_R    21   //the count width of ADC read (number of bits)
`define N_div_clk_ADC_W    40   //the count width of ADC write (number of bits)
//--------------- For DAC -----------------// 
`define ND_DAC1          14     // Data Width of DAC1 (number of bits)
`define NA_DAC1          15     // Address Width of DAC1 (number of bits)
`define N_Freq			 12     // width of frequence input
`define MAXD_DAC1        16383  // The max Addr value of DAC1  2^(ND_DAC1) - 1
`define Half_MAXD_DAC1   8191   // half of MAXD_DAC1
//--------------- For ADC -----------------//
`define ND_ADC          14     // Data Width of ADC (number of bits)
`define NA_ADC          8     // Address Width of DAC1 (number of bits)
`define N_Depth_ADC     256   // The depth of ADC_RAM = 0.375k
//--------------- For FFT -----------------//
`define ND_FFT          23     // Data Width of ADC (number of bits)
`define NA_FFT          3      // Address Width of DAC1 (number of bits)
`define N_Depth_FFT     7      // The depth of ADC_RAM = 7 
// `define debug           1





module Proj_ECS(clk_in, rst_btn,
				DIO_OUT1, DIO_OUT2, DIO_OUT3, uart_rx, uart_tx,
				clk_DAC8551, SYNC_DAC8551, D_DAC8551,
				clk_DAC8551_Bias, SYNC_DAC8551_Bias, D_DAC8551_Bias,
				clk_DAC904, Data_Out_DAC904,
				clk_W_AD9244, 
				Data_I_AD9244, OTR_AD9244,
				clk_W_AD9244_1, 
				Data_I_AD9244_1, OTR_AD9244_1);

input clk_in; 
input rst_btn;  
input uart_rx;		

output [7:0] DIO_OUT1, DIO_OUT2, DIO_OUT3;

output uart_tx;
	
output clk_DAC8551, SYNC_DAC8551, D_DAC8551;
output clk_DAC8551_Bias, SYNC_DAC8551_Bias, D_DAC8551_Bias;
output clk_DAC904;
output [`ND_DAC1-1:0] Data_Out_DAC904;

output clk_W_AD9244,clk_W_AD9244_1;
wire clk_W_AD9244_fir;

input [`ND_ADC-1:0] Data_I_AD9244, Data_I_AD9244_1;
input OTR_AD9244, OTR_AD9244_1;

localparam S0 = 3'b000;
localparam S1 = 3'b001;
localparam S2 = 3'b010;
localparam S3 = 3'b011;
localparam S4 = 3'b100;


wire EnTxData;
wire [7:0] DataTX_1, DataTX_2, DataTX_3, DataTX_4;
wire [7:0] DataRX_1, DataRX_2, DataRX_3, DataRX_4, DataRX_5;
wire RX_5;
wire clk_25m, clk_50m, clk_FFT;	//generate the 25MHz clock 

wire clk_R_Serial;
wire [`ND_ADC-1:0] Data_O_AD9244, Data_O_AD9244_1;
wire [7:0] Addr_R, Addr_R_1;
wire rdy_W_AD9244, rdy_R_AD9244, rdy_R_AD9244_1;
wire [7:0] Addr_W,Addr_W_1;

reg start_FFT=1'b0, start_FFT_1=1'b0;     //不赋初始值，没有结果   

wire [27:0] Data_send_FFT, Data_send_FFT_1;
wire [`ND_ADC-1:0] FFT_xn_re_ADC1, FFT_xn_re_ADC2;
wire dv_FFT, SampleADC1_256;
reg En_FFT1=1'b0;
reg [`ND_ADC-1:0] FFT_xn_re=14'd0;
wire rdy_rfft1,rdy_rfft2;
wire [7:0] FFT_Rlength;
wire [7:0] FFT_Rlength_1;


reg [2:0] current_S=3'd0, next_S=3'd0;

wire [`ND_ADC-1:0] mean_ADC1, mean_ADC2;
wire [1:0] flag_OverFlow, flag_OverFlow_1;

wire [2:0] Sel_WaveFunc; 
wire [`ND_DAC1-1:0] DutyCyc;
wire [11:0] freq_incr;
wire [15:0] Amp_DAC904, Bias_DAC904;    //模块之间的连接需要用wire类型
wire [`N_div_clk_DAC-1:0] cnt_DAC904;
wire WriteEn_ADC, Flag_ReadADC_Samp, Flag_ReadADC_Samp_1, R_Restart_ADC, R_Restart_ADC_1;
wire ReadFFTEn_ADC, ReadFFTEn_ADC_1, rst_sys;
wire [15:0] ADCR_Length, ADCR_Length_1;
wire [`N_div_clk_ADC_W-1:0]cnt_AD9244_W;
wire [3:0] count_coe,count_coe_1;
wire [3:0] coe,coe_1;

//-------------------------------------
// generate rst signal
assign rst = rst_sys & rst_btn;

//-------------------------------------
//      generate various clocks
Gen_clk Gen_clk_1(.clk_in_50m(clk_in),   // input clk = 50MHz
		.rst(rst), 
		.cnt_DAC904(cnt_DAC904),
		.cnt_AD9244_W(cnt_AD9244_W),
		.clk_DAC8551(clk_DAC8551),                //两个DAC8551的频率都为2.5Mhz
		.clk_DAC8551_Bias(clk_DAC8551_Bias),
		.clk_FFT(clk_FFT),  // output clk_FFT = 50MHz
		.clk_25m(clk_25m),  // output clk_25m = 25MHz
		.clk_50m(clk_50m),
		.clk_DAC904(clk_DAC904), // output clk for DAC904
		.clk_R_Serial(clk_R_Serial), // output clk for AD9244 of clk_R
		.clk_W_AD9244(clk_W_AD9244),
		.clk_W_AD9244_fir(clk_W_AD9244_fir)
		);

//-------------------------------------
// configure the uart
uart uart_1(
	.clk_25m(clk_25m),		// 
	.rst(rst),			// the reset signal, 1'b0: enable
	.uart_rx(uart_rx),		// UART received signal
	.uart_tx(uart_tx),		// UART transmited signal
	.EnTxData(EnTxData),	// UART transmited valid data, hold one cycle
	.DataTX_1(DataTX_1),	// will be transmited data: Data1
	.DataTX_2(DataTX_2),	// will be transmited data: Data2
	.DataTX_3(DataTX_3),	// will be transmited data: Data3
	.DataTX_4(DataTX_4),	// will be transmited data: Data4
   
	.RX_rdy(RX_5),		      // received valid data
	.DataRX_1(DataRX_1),	// the received data: Data1
	.DataRX_2(DataRX_2),	// the received data: Data2
	.DataRX_3(DataRX_3),	// the received data: Data3
	.DataRX_4(DataRX_4),	// the received data: Data4
	.DataRX_5(DataRX_5)	// the received data: Data5   
	);

//-------------------------------------
// configure the Amp of output signal
DAC8551 DAC8551_Amp(.clk(clk_DAC8551), 
			  .rst(!rst), 
			  .Data_1(Amp_DAC904),                       //Amp_DAC904是模块Ctr_UART的输出信号
			  .SYNC(SYNC_DAC8551),         
			  .DIN(D_DAC8551));	

//-------------------------------------
// configure the Amp of output signal
DAC8551 DAC8551_Bias(.clk(clk_DAC8551_Bias), 
			  .rst(!rst), 
			  .Data_1(Bias_DAC904),                       //Bias_DAC904是模块Ctr_UART的输出信号
			  .SYNC(SYNC_DAC8551_Bias), 
			  .DIN(D_DAC8551_Bias));


//原程序
// configure the shape of the output signal	  
DDS_Core DDS_Core_1(.clk(clk_DAC904), 
					.rst(!rst),     //,该模块的rst为反逻辑
					.Sel_WaveFunc(Sel_WaveFunc),  //原程序
					//.Sel_WaveFunc(3'b010),
					.DutyCyc(DutyCyc),
					.Out_Mode(1'b0),  // 1'b1 --> single ; 1'b0 --> continuous
					.freq(freq_incr), // 1.5KHz  原来程序
					.Data_Out(Data_Out_DAC904));
					
/*
当AD9244模块加入fir滤波器之后，编译就出错，并且如果有时钟信号接入则出错，没有时钟信号输入则正确可以通过MAP过程
因此，出现这种情况的原因是问题出现在了AD9244模块中，然后确定出现在AD9244.CLK引脚驱动的模块中，则确定问题之后再
去处理模块。
*/

//clk_W_AD9244_fir 用于驱动内部控制ADC逻辑电路
//clk_W_AD9244输出用于控制外部ADC

assign clk_W_AD9244_1=clk_W_AD9244;

AD9244 AD9244_1(.clk_W(clk_W_AD9244_fir),
				.clk_R(clk_R_Serial),
				.clk_FFT(clk_FFT),
				.rst(!rst),
            .count_coe(count_coe),
				.coe(coe),				
				.ReadEn(Flag_ReadADC_Samp), 
				.WriteEn(WriteEn_ADC),
				.start_FFT(start_FFT),
				.Data_I(Data_I_AD9244), 
				.OTR(OTR_AD9244), 
				.Data_O_Serial(Data_O_AD9244),
				.Addr_W(Addr_W),
				.Addr_R(Addr_R),
				.ADCR_Length(ADCR_Length),     //ADCR_Length用在限值读取ADC原始数据长度上
				.R_Restart_ADC(R_Restart_ADC),
				.rdy_W(rdy_W_AD9244), 
				.rdy_R(rdy_R_AD9244),
				.FFT_xn_re(FFT_xn_re_ADC1)
				);

AD9244 AD9244_2(.clk_W(clk_W_AD9244_fir),
				.clk_R(clk_R_Serial),
				.clk_FFT(clk_FFT),
				.rst(!rst), 
				.count_coe(count_coe_1),
				.coe(coe_1),
				.ReadEn(Flag_ReadADC_Samp_1), 
				.WriteEn(WriteEn_ADC),
				.start_FFT(start_FFT_1),
				.Data_I(Data_I_AD9244_1), 
				.OTR(OTR_AD9244_1),
				.Data_O_Serial(Data_O_AD9244_1),
				.Addr_W(Addr_W_1),
				.Addr_R(Addr_R_1),
				.ADCR_Length(ADCR_Length_1), 
				.R_Restart_ADC(R_Restart_ADC_1),
				.rdy_W(), 
				.rdy_R(rdy_R_AD9244_1),
				.FFT_xn_re(FFT_xn_re_ADC2)
				);

//一下模块两个作用，一个作用控制AD9244和FFT数据发送出去，另一个作用是接收数据控制DDS各种波形的生成
Ctr_UART Ctr_UART_1(
  .clk_50m(clk_50m),	// The clock signal of 50MHz
	.rst(rst),	    // The reset signal, 0 --> enable reset

    
  //原信号
   .RX_ready(RX_5),
	.DataRX_1(DataRX_1),	
	.DataRX_2(DataRX_2),	
	.DataRX_3(DataRX_3),	
	.DataRX_4(DataRX_4),	
	.DataRX_5(DataRX_5), 
    
	.count_coe(count_coe),
	.coe(coe),
	.count_coe_1(count_coe_1),
	.coe_1(coe_1),
	 
   .Sample_256(SampleADC1_256),
   .Addr_W(Addr_W),
	.Addr_W_1(Addr_W_1),	
	.Addr_R(Addr_R), 
	.Addr_R_1(Addr_R_1),
	.Data_O_AD9244(Data_O_AD9244), 
	.Data_O_AD9244_1(Data_O_AD9244_1),
	.Data_send_FFT(Data_send_FFT), 
	.Data_send_FFT_1(Data_send_FFT_1),
	.rdy_R_AD9244(rdy_R_AD9244),
	.rdy_R_AD9244_1(rdy_R_AD9244_1),
	.rdy_W_AD9244(rdy_W_AD9244),
	.rdy_rfft1(rdy_rfft1),
	.rdy_rfft2(rdy_rfft2),
	.FFT_Rlength(FFT_Rlength),
	.FFT_Rlength_1(FFT_Rlength_1),

	.DIO_OUT1(DIO_OUT1), 
	.DIO_OUT2(DIO_OUT2), 
	.DIO_OUT3(DIO_OUT3),  // Configure the DIO output 

	.Sel_WaveFunc(Sel_WaveFunc),
	.DutyCyc(DutyCyc),
	.freq_incr(freq_incr),
	.Amp_DAC904(Amp_DAC904),
	.Bias_DAC904(Bias_DAC904),
	.cnt_DAC904(cnt_DAC904),

	.WriteEn_ADC(WriteEn_ADC), // start store the value of ADC
	.Flag_ReadADC_Samp(Flag_ReadADC_Samp), 
	.Flag_ReadADC_Samp_1(Flag_ReadADC_Samp_1),
	.R_Restart_ADC(R_Restart_ADC), 
	.R_Restart_ADC_1(R_Restart_ADC_1),  // Read form the pre addr or 00 
	.ADCR_Length(ADCR_Length), 
	.ADCR_Length_1(ADCR_Length_1),  // the depth of read ADC
	.ReadFFTEn_ADC(ReadFFTEn_ADC), 
	.ReadFFTEn_ADC_1(ReadFFTEn_ADC_1),
	.cnt_AD9244_W(cnt_AD9244_W),
	.rst_sys(rst_sys),

   .DataTX_1(DataTX_1),	 
   .DataTX_2(DataTX_2),	
	.DataTX_3(DataTX_3),	
	.DataTX_4(DataTX_4),	
	.EnTxData(EnTxData)     		// The enable signal of Tx data, 1 --> enable
  );				


//------------------------------------------------------------
// obtain the results of FFT and store the results into mem
my_FFT my_FFT_1(.clk_R(clk_R_Serial), 
				.clk_FFT(clk_FFT), 
				.rst(!rst), 
				.start_FFT(start_FFT || start_FFT_1),     //原程序
				//.start_FFT(1'b1),                     //测试1
				.En_FFT1(En_FFT1), 
			 	.FFT_xn_re(FFT_xn_re),   //原程序        
				.FFT_Rlength(FFT_Rlength), 
				.FFT_Rlength_1(FFT_Rlength_1),
				.dv_FFT(dv_FFT),                        //来自FFT核的输出端，输出数据有效指示，高电平表示有效信号出现在输出端
            .ReadFFTEn_ADC1(ReadFFTEn_ADC), 
				.Data_send_FFT1(Data_send_FFT), 
				.ReadFFTEn_ADC2(ReadFFTEn_ADC_1), 
				.Data_send_FFT2(Data_send_FFT_1),
				.rdy_rfft1(rdy_rfft1),
				.rdy_rfft2(rdy_rfft2)
    );
	 
	 
	 
//以下状态机是控制FFT转换模块的，用于控制AD9244_ram与FFT_ram的时序	 
//主要利用start_FFT和En_FFT1控制时序衔接	 

//---------------------------------------------------------------
// state machine: use one FFT module to complete two ADC channels
//控制S2进行ADC9244_1的fft变换，S3,S4控制ADC9244_2的FFT变换，两者利用的控制信号不同

//---------------------- change the state -----------------------//	
//SampleADC1_256来自模块AD9244
//start_FFT控制AD9244
//方案一：状态机运行时钟应该与clk_FFT，因为下面要记录读入FFT的数据，因此要与FFT模块一致
//方案二：或者用dv_fft作为触发信号，不记录读入ADC2的数据用clk_50Mhz也行
always @ (posedge clk_50m)
begin
	if(!rst)
	current_S <= S0;
	else
	current_S <= next_S;
end
//---------------------- compute the next state -----------------------//	
/*
控制信号说明：
start_FFT=1，FFT对ADC1进行转换
start_FFT_1，FFT对ADC2进行转换
En_FFT1=1，FFT_ADC写入FFT_RAM1
En_FFT1=0，FFT_ADC写入FFT_RAM2
状态机状态说明:
S0:等待Sample_256的信号到来，为装载ADC1_RAM数据做准备
S1:装载ADC1_RAM数据，start_FFT=1，并等待dv_FFT_ADC1的信号到来,为FFT_ADC1写入FFT_RAM1做准备
S2：dv_FFT=1,将FFT_ADC1的数据写入FFT_RAM1，En_FFT1=1，并为装载ADC2_RAM的数据做准备
S3:装载装载ADC2_RAM的数据，start_FFT_1=1，并且等待dv_FFT_ADC2信号的到来
S4:在dv_FFT_ADC2=1期间，装载FFT_ADC2的数据，且保证En_FFT1=0
*/
always @ (*)
begin
if (!rst)
	next_S  = S0;
else  
    case (current_S)                  //SampleADC1_256只用了ADC1的，ADC2的没用
    S0 :                              //当ADC_RAM的ADDR_W=8'hff之后，SampleADC1_256=1，正在写入时等于0；
		if (SampleADC1_256)            //SampleADC1_256来自AD9244_1的Sample_256    
			next_S      = S1;
		else
			next_S      = S0;
	 S1 :
		if (dv_FFT)
			next_S      = S2;
		else
			next_S      = S1;
	 S2 :if(dv_FFT)       //当ADC1的数据转换完成时，dv_fft=1,维持256个clk_FFT的周期
	      next_S      = S2;
		  else
			next_S      = S3;
	 S3 :
		if (dv_FFT)                    //当第一个ADC_RAM数据装载完成后，再次出现转换数据必定是ADC_RAM_2的
		begin
			next_S      = S4;
		end
		else
		begin
			next_S      = S3;
		end
	 S4 :
		if (dv_FFT)
			next_S      = S4;
		else
			next_S      = S0; //停止循环的关键地方			
    default: 
			next_S      = S0;
    endcase
end
//------------- obtain the corresponding ouput signal ----------------//
always @ (posedge clk_50m)
begin
if (!rst)
begin
	start_FFT   <= 1'b0;
	start_FFT_1 <= 1'b0;
	FFT_xn_re   <= {`ND_ADC{1'b0}};
	En_FFT1     <= 1'b0;
end
else 
    case (current_S)
    S0 : 
		if (SampleADC1_256)                     
    	begin                                 
      	start_FFT   <= 1'b1;             //为向FFT装载ADC1数据做准备 
      	start_FFT_1 <= 1'b0;             
			FFT_xn_re   <= FFT_xn_re_ADC1;    
			En_FFT1     <= 1'b1;              
   		end
		else
		begin
      	start_FFT   <= 1'b0;
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b0;
    	end
	S1 :                                     
    if (dv_FFT)                             //为记录ADC1_FFT数据做准备
	   begin
		  	start_FFT   <= 1'b0;
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b1;
		end
		else
		begin                              
      	start_FFT   <= 1'b1;              //向FFT装载ADC1数据
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= FFT_xn_re_ADC1;  
			En_FFT1     <= 1'b1;
   	end
	S2 :if(dv_FFT)                          //记录ADC1_FFT数据
	    begin
		  	start_FFT   <= 1'b0;
      	start_FFT_1 <= 1'b0;     
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b1;        
		end	
	   else
		begin
		  	start_FFT   <= 1'b0;             //为装载ADC2数据做准备
      	start_FFT_1 <= 1'b1;  
			FFT_xn_re   <= FFT_xn_re_ADC2;   
			En_FFT1     <= 1'b0;
		end
	S3 :
		if (dv_FFT)                        //等待dv_FFT_ADC2有效
		begin                   
			start_FFT   <= 1'b0; 
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b0;   
		end
		else
		begin
			start_FFT   <= 1'b0;
      	start_FFT_1 <= 1'b1;           //向FFT装载ADC2数据
			FFT_xn_re   <= FFT_xn_re_ADC2;
			En_FFT1     <= 1'b0;
		end
	S4 :
		if (dv_FFT)                      //装载FFT_ADC2数据
		begin
			start_FFT   <= 1'b0;
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b0;     
		end
		else
		begin
			start_FFT   <= 1'b0;         
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b0;
		end
    default: 
		begin
			start_FFT   <= 1'b0;
			start_FFT_1 <= 1'b0;
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b0;
		end
    endcase
end
//---------------------------------------------------------------
//					end the state machine
//---------------------------------------------------------------			
endmodule

