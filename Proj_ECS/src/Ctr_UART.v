`timescale 1ns / 1ps

`include "ECS_Define.v"


module Ctr_UART(
  input clk_50m,	// The clock signal of 50MHz
	input rst,	    // The reset signal, 0 --> enable reset
   
	//在该模块直接使用DataRX1-5，是因为在rx_bridge中已经确定了接收过8'hAA之后的为命令，且8'haa为命令开始的标志符号
	input [7:0] DataRX_1,	// The received data: Data1   //Data1和Data2是用于接收命令组合
	input [7:0] DataRX_2,	// The received data: Data2   
	input [7:0] DataRX_3,	// The received data: Data3   //Data3和Data4是用于接收电脑发送过来的数据
	input [7:0] DataRX_4,	// The received data: Data4
	input [7:0] DataRX_5, 	// The received data: Data5
	input RX_ready,
  
  //以下包括AD9244的采样输出结果，FFT结果，平均值和溢出结果
	input [7:0] Addr_R, Addr_R_1,                          //采样值存储器地址,Addr_R来自AD9244,通过ADC_RAM产生DATAA_O_AD9244      
	input [7:0] Addr_W,Addr_W_1,
	input [`ND_ADC-1:0] Data_O_AD9244, Data_O_AD9244_1,     //ND_ADC=14,adc采样输出为14位，分为高6位和低8位两次发送给电脑
	input [27:0] Data_send_FFT, Data_send_FFT_1,            //来自my_FFT模块
	
	//关于AD9244的ROM的控制信号,rdy_W和rdy_R来自AD9244
	input rdy_R_AD9244, rdy_R_AD9244_1,   //  读准备好信号     rdy_R和rdy_W信号含义
	input rdy_W_AD9244,  
   input rdy_rfft1,rdy_rfft2,
   output reg [7:0] FFT_Rlength=8'd0,
   output reg [7:0] FFT_Rlength_1=8'd0,

	//output reg  [7:0] DIO_OUT1, DIO_OUT2, DIO_OUT3,  //原语句，Configure the DIO output 
	output reg  [7:0] DIO_OUT1=8'hff,  
	output reg  [7:0] DIO_OUT2=8'h00, 
	output reg  [7:0] DIO_OUT3=8'h00,  

	
	//关于DDS部分的交流幅值和直流幅值的选择、波形的选择
	output reg [2:0] Sel_WaveFunc=3'b001,   //选择输出波形 
	                                 // Sel_WaveFunc == 3'b000 --> DC;       Sel_WaveFunc == 3'b001 --> sin wave ; 
	                                 // Sel_WaveFunc == 3'b010 --> sawtooth; Sel_WaveFunc == 3'b011 --> triangular wave ; 
	                                 // Sel_WaveFunc == 3'b100 --> square;
	output reg [`ND_DAC1-1:0] DutyCyc= 14'b10_0000_0000_0000, // 输出方波占空比
	output reg [11:0] freq_incr=12'h001,        //频率控制字
	output reg [15:0] Amp_DAC904=16'hffff,        //DataRX_1 == 8'h03,DataRX_2 == 8'h03,配置交流幅度
	output reg [15:0] Bias_DAC904=16'h8000,       //DataRX_1 == 8'h03,DataRX_2 == 8'h04,配置直流幅度
	output reg [`N_div_clk_DAC-1:0] cnt_DAC904=40'd0,       //输出到Gen_clk
	
	output     Sample_256,
	output reg WriteEn_ADC=1'b0,                           // start store the value of ADC                                        
	output reg Flag_ReadADC_Samp = 1'b0, Flag_ReadADC_Samp_1 = 1'b0,  //使ADC开始采样
	output reg R_Restart_ADC = 1'b1, R_Restart_ADC_1 = 1'b1,         // Read form the pre addr or 00 
	output reg [15:0] ADCR_Length= 16'h00, ADCR_Length_1= 16'h00,      // the depth of read ADC
	output reg ReadFFTEn_ADC= 1'b0, ReadFFTEn_ADC_1= 1'b0,         //读取FFT结果   
	output reg [`N_div_clk_ADC_W-1:0] cnt_AD9244_W= 20'd0,     //40位，分高20位和低20位两次读写
	output reg rst_sys=1'b1,                                 //系统重启
   
	output reg [3:0] count_coe=4'd0,count_coe_1=4'd0, //滤波器系数赋值
	output reg [3:0] coe=4'd0,coe_1=4'd0,

   output reg [7:0] DataTX_1= 8'h00,	// 实际发送6字节内容，4+8'haa+DATATX_5,后两部分在tx_bridge中加入
   output reg [7:0] DataTX_2= 8'h00,	    
	output reg [7:0] DataTX_3= 8'h00,	 
	output reg [7:0] DataTX_4= 8'h00,	
	output reg EnTxData= 1'b0     		//通过uart_top控制tx_bridge
  );

reg Err_Check= 1'b0;
reg Flag_DisFPGA2PC= 1'b0, Flag_ADCmean_Samp= 1'b0, R_OverFlow= 1'b0;

//*****************************************************************************************************************************
//--------命令格式校验--------
always @ (posedge clk_50m)  //核对接收到的6字节内容是否是命令格式
begin
if (!rst)
begin
	Err_Check <= 1'b0;
end
else if(RX_ready==1)                                                               
begin                                                                
	if (DataRX_5 == (DataRX_1 ^ DataRX_2 ^ DataRX_3 ^ DataRX_4))       
	begin
		Err_Check <= 1'b1;
	end
	else 
	begin
		Err_Check <= 1'b0;
	end
end
else
  begin
    Err_Check <= 1'b0;
  end
end
//*********************************************************************************************************************************
//---------根据不同命令判断发送信号端口状态--------
always @ (posedge clk_50m)   
begin 
if (!rst)
begin
	DataTX_1 <= 8'h00;
	DataTX_2 <= 8'h00;
	DataTX_3 <= 8'h00;
	DataTX_4 <= 8'h00;
	EnTxData <= 1'b0;                   
end
else if (!Err_Check)  //如果没有接收到命令，则uart_tx不停地发送8'haa 8'h55 8'h55 8'h55 8'h55 8'h00共6字节数据  
begin                        
	DataTX_1 <= 8'h55;
	DataTX_2 <= 8'h55;
	DataTX_3 <= 8'h55;
	DataTX_4 <= 8'h55;
	EnTxData <= 1'b1;
end
else if (Flag_DisFPGA2PC)  //关闭FPGA和打开FPGA发送数据
begin                          
	DataTX_1 <= DataTX_1;       
	DataTX_2 <= DataTX_2;
	DataTX_3 <= DataTX_3;
	DataTX_4 <= DataTX_4;
	EnTxData <= 1'b0;
end
else if (rdy_W_AD9244)  //当出现写满ADC_RAM后，发送以下数据                          
begin                                             
	DataTX_1 <= 8'h10;                             
	DataTX_2 <= 8'h11;
	DataTX_3 <= 8'h11;
	DataTX_4 <= 8'h11;
	EnTxData <= 1'b1;
end   
else if (Flag_ReadADC_Samp)  //读取ADC1的采样数据 
begin 
	if (rdy_R_AD9244)         
	begin                     
		DataTX_1 <= DataTX_1; 
		DataTX_2 <= DataTX_2;
		DataTX_3 <= DataTX_3;
		DataTX_4 <= DataTX_4;
		EnTxData <= 1'b0;
	end
	else
	begin                                           
		DataTX_1 <= 8'h20;                           
		DataTX_2 <= Addr_R[7:0];                         
		DataTX_3 <= {2'b00, Data_O_AD9244[13:8]};    
		DataTX_4 <= Data_O_AD9244[7:0];
		EnTxData <= 1'b1;
	end
end
else if (Flag_ReadADC_Samp_1)  //读取ADC2的采样数据
begin                          
	if (rdy_R_AD9244_1)         
	begin
		DataTX_1 <= DataTX_1;
		DataTX_2 <= DataTX_2;
		DataTX_3 <= DataTX_3;
		DataTX_4 <= DataTX_4;
		EnTxData <= 1'b0;
	end
	else
	begin
		DataTX_1 <= 8'h30;
		DataTX_2 <= Addr_R_1[7:0];
		DataTX_3 <= {2'b00, Data_O_AD9244_1[13:8]};     
		DataTX_4 <= Data_O_AD9244_1[7:0];
		EnTxData <= 1'b1;
	end
end
else if (ReadFFTEn_ADC) //读取ADC1_FFT数据                                   
begin
  if(rdy_rfft1)
    begin
	   DataTX_1 <= DataTX_1;
		DataTX_2 <= DataTX_2;
		DataTX_3 <= DataTX_3;
		DataTX_4 <= DataTX_4;
		EnTxData <= 1'b0;
	 end
  else 
    begin                                            
	   DataTX_1 <= {4'h4, Data_send_FFT[27:24]};     
	   DataTX_2 <= Data_send_FFT[23:16];             
	   DataTX_3 <= Data_send_FFT[15:8];             
	   DataTX_4 <= Data_send_FFT[7:0];
	   EnTxData <= 1'b1;
    end
end
else if (ReadFFTEn_ADC_1)  //读取ADC2_FFT数据
begin
  if(rdy_rfft2)
    begin
	   DataTX_1 <= DataTX_1;
		DataTX_2 <= DataTX_2;
		DataTX_3 <= DataTX_3;
		DataTX_4 <= DataTX_4;
		EnTxData <= 1'b0;
	 end
   else 
	  begin                                               
	    DataTX_1 <= {4'h5, Data_send_FFT_1[27:24]};
	    DataTX_2 <= Data_send_FFT_1[23:16];
	    DataTX_3 <= Data_send_FFT_1[15:8];                
	    DataTX_4 <= Data_send_FFT_1[7:0];
	    EnTxData <= 1'b1;
     end
end                                                                
else  //没有符合情况则保持原状态不变
begin                        
	 //原程序
	DataTX_1 <= DataTX_1;     
	DataTX_2 <= DataTX_2;     
	DataTX_3 <= DataTX_3;
	DataTX_4 <= DataTX_4;
	EnTxData <= EnTxData;
	
	/*
	//修改程序
	DataTX_1 <= 8'h05;     
	DataTX_2 <= 8'h05;     
	DataTX_3 <= 8'h05;
	DataTX_4 <= 8'h05;
	EnTxData <= 1'b1;
	*/
end 
end 


//------------输出DIO数据	------------
always @ (posedge clk_50m)
begin
if (!rst)
begin
	DIO_OUT1 <= 8'hFF;
	DIO_OUT2 <= 8'h00;
	DIO_OUT3 <= 8'h00;
end
else 
begin
	if (DataRX_1[7:4] == 4'h1)   
		if (Err_Check)
		begin
			DIO_OUT1 <= DataRX_2;
			DIO_OUT2 <= DataRX_3;
			DIO_OUT3 <= DataRX_4;
		end
		else
		begin
			DIO_OUT1 <= DIO_OUT1;
			DIO_OUT2 <= DIO_OUT2;
			DIO_OUT3 <= DIO_OUT3;
		end
	else
	begin
		DIO_OUT1 <= DIO_OUT1;
		DIO_OUT2 <= DIO_OUT2;
		DIO_OUT3 <= DIO_OUT3;
	end		
end
end	 


//***************************************************************************************************************************
//----------关闭和开启FPGA与上位机的通信--------------
always @ (posedge clk_50m)
begin
if (!rst)
	Flag_DisFPGA2PC <= 1'b0;
else 
	if ((DataRX_1 == 8'h02) && (DataRX_2 == 8'h01) && (DataRX_3 == 8'h00))  
		if (Err_Check)
			Flag_DisFPGA2PC <= 1'b1;
		else
			Flag_DisFPGA2PC <= 1'b0;
	else if ((DataRX_1 == 8'h02) && (DataRX_2 == 8'h02) && (DataRX_3 == 8'h00)) 
		Flag_DisFPGA2PC <= 1'b0;
	else
		Flag_DisFPGA2PC <= Flag_DisFPGA2PC;	
end

//****************************************************************************************************************************
//---------输出波形选择-----------------
always @ (posedge clk_50m)
begin
if (!rst)
	Sel_WaveFunc <= 3'b001;
else 
	if ((DataRX_1 == 8'h03) && (DataRX_2 == 8'h01))  //正弦波：AA 03 01 01 00 03
		if (Err_Check)                                //锯齿波：AA 03 01 02 00 00
			Sel_WaveFunc <= DataRX_3[2:0];             //三角波：AA 03 01 03 00 01
		else                                          //方形波：AA 03 01 04 00 06
			Sel_WaveFunc <= Sel_WaveFunc;
	else
		Sel_WaveFunc <= Sel_WaveFunc;
end


//----------方波占空比-----------
always @ (posedge clk_50m)       
begin
if (!rst)
	DutyCyc <= 14'b10_0000_0000_0000;
else 
	if ((DataRX_1 == 8'h03) && (DataRX_2 == 8'h08))   
		if (Err_Check)
			DutyCyc <= {DataRX_3[5:0], DataRX_4};
		else
			DutyCyc <= DutyCyc;
	else
		DutyCyc <= DutyCyc;	
end


//----------频率控制字选择----------------	
always @ (posedge clk_50m)
begin
if (!rst)                         
	freq_incr <= 12'h001;
else 
	if ((DataRX_1 == 8'h03) && (DataRX_2 == 8'h02))  
		if (Err_Check)
			freq_incr <= {DataRX_3[3:0], DataRX_4};
		else
			freq_incr <= freq_incr;
	else
		freq_incr <= freq_incr;	
end


//---------交流偏压选择----------	
always @ (posedge clk_50m)
begin
if (!rst)
	Amp_DAC904 <= 16'hffff;   
else 
	if ((DataRX_1 == 8'h03) && (DataRX_2 == 8'h03))   
		if (Err_Check)
			Amp_DAC904 <= {DataRX_3, DataRX_4};
		else
			Amp_DAC904 <= Amp_DAC904;
	else
		Amp_DAC904 <= Amp_DAC904;	
end


//------------直流偏压选择------------	
always @ (posedge clk_50m)
begin
if (!rst)
	Bias_DAC904 <= 16'h8000;
else 
	if ((DataRX_1 == 8'h03) && (DataRX_2 == 8'h04))   
		if (Err_Check)
			Bias_DAC904 <= {DataRX_3, DataRX_4};
		else
			Bias_DAC904 <= Bias_DAC904;
	else
		Bias_DAC904 <= Bias_DAC904;	
end
		
		

//----------cnt_DAC904[39:0]大小配置，用于决定分频计数，决定DAC904输入时钟频率------------  
always @ (posedge clk_50m)
begin
if (!rst)
	cnt_DAC904[39:20] <= 20'h0_0000;
else 
	if ((DataRX_1 == 8'h03) && (DataRX_2[7:4] == 4'h1))   //配置高20位
		if (Err_Check)
			cnt_DAC904[39:20] <= {DataRX_2[3:0], DataRX_3, DataRX_4};
		else
			cnt_DAC904[39:20] <= cnt_DAC904[39:20];
	else
		cnt_DAC904[39:20] <= cnt_DAC904[39:20];		
end

always @ (posedge clk_50m)
begin
if (!rst)
	 cnt_DAC904[19:0] <= 20'h0000;          
else 
	if ((DataRX_1 == 8'h03) && (DataRX_2[7:4] == 4'h2)) //配置低20位                    
		if (Err_Check)
			cnt_DAC904[19:0] <= {DataRX_2[3:0], DataRX_3, DataRX_4};
		else
			cnt_DAC904[19:0] <= cnt_DAC904[19:0];
	else
		cnt_DAC904[19:0] <= cnt_DAC904[19:0];
end



//*****************************************************************************************************************************
//------------通过配置cnt_AD9244_W的数值决定ADC采样频率，并且控制ADC9244的运行频率----	-------
always @ (posedge clk_50m)  //高20位
begin
if (!rst)
	cnt_AD9244_W[39:20] <= 20'h0_0000;
else 
	if ((DataRX_1 == 8'h04) && (DataRX_2[7:4] == 4'h1))  
		if (Err_Check)
			cnt_AD9244_W[39:20] <= {DataRX_2[3:0], DataRX_3, DataRX_4};
		else
			cnt_AD9244_W[39:20] <= cnt_AD9244_W[39:20];
	else
		cnt_AD9244_W[39:20] <= cnt_AD9244_W[39:20];	
end
always @ (posedge clk_50m)  //低20位
begin
if (!rst)
	cnt_AD9244_W[19:0] <= 20'h0_0000;
else 
	if ((DataRX_1 == 8'h04) && (DataRX_2[7:4] == 4'h2))   
		if (Err_Check)
			cnt_AD9244_W[19:0] <= {DataRX_2[3:0], DataRX_3, DataRX_4};
		else
			cnt_AD9244_W[19:0] <= cnt_AD9244_W[19:0];
	else
		cnt_AD9244_W[19:0] <= cnt_AD9244_W[19:0];
end

//***************************************************************************************************************************
//设通道1计滤波器系数
always @ (posedge clk_50m)  
begin
if (!rst)
	begin
	  count_coe<=count_coe;
	  coe<=coe;
	end	
else 
	if ((DataRX_1 == 8'h07) && (DataRX_2[7:4] == 4'hF))   
	  begin
   	if (Err_Check)
			begin
			  count_coe<=DataRX_2[3:0];
			  coe<=DataRX_4[3:0];
			end
		else
			begin
			  count_coe<=count_coe;
			  coe<=coe;
			end
	 end
	else
	  begin
		 count_coe<=count_coe;
		 coe<=coe;
	  end	
end


//设计通道2滤波器系数
always @ (posedge clk_50m)  
begin
if (!rst)
	begin
	  count_coe_1<=count_coe_1;
	  coe_1<=coe_1;
	end	
else 
	if ((DataRX_1 == 8'h08) && (DataRX_2[7:4] == 4'hF))   
	  begin
   	if (Err_Check)
			begin
			  count_coe_1<=DataRX_2[3:0];
			  coe_1<=DataRX_4[3:0];
			end
		else
			begin
			  count_coe_1<=count_coe_1;
			  coe_1<=coe_1;
			end
	 end
	else
	  begin
		 count_coe_1<=count_coe_1;
		 coe_1<=coe_1;
	  end	
end




//************************************************************************************************************************
//-----------开始记录数据，并定义计算采样平均值的长度ADCM_Length-----------
always @ (posedge clk_50m)
begin
if (!rst)
begin
	WriteEn_ADC <= 1'b0;	
end	
else 
	if ((DataRX_1 == 8'h04) && (DataRX_2 == 8'h01))   
		if (Err_Check)
			if (rdy_W_AD9244)                
			begin
				WriteEn_ADC <= 1'b0;              
			end
			else
			begin
				WriteEn_ADC <= 1'b1;              
			end	
		else
		begin
			WriteEn_ADC <= WriteEn_ADC;
		end                                                 
	else if ((DataRX_1 == 8'h04) && (DataRX_2 == 8'h02))  
		if (Err_Check)
		begin
			WriteEn_ADC <= 1'b0;
		end
		else
		begin
			WriteEn_ADC <= WriteEn_ADC;
		end
	else
	begin
		WriteEn_ADC <= WriteEn_ADC;
	end
end


//-----------获取Sample_256上升沿，使FFT变换在关闭存储数据的同时开始转换------------
reg [3:0] delay=3'd0;
reg detect=3'd0;

always @ (posedge clk_50m)       
begin
  if(!rst) detect <= 1'b0;
  else if ((DataRX_1 == 8'h04) && (DataRX_2 == 8'h02)) 
     begin
         if (Err_Check) detect <= DataRX_3[0]; 
     end	  
  else detect<=1'b0;
end

always @(posedge clk_50m)
  begin
    if(!rst)
	   begin
		  delay<=3'd0;
		end
	 else
	   begin
		  delay<={delay[1:0],detect};
		end
  end

assign Sample_256=delay[1]&~delay[2];//捕捉高电平


//********************************************************************************************************************
//----------读取ADC1_RAM原始数据-----------
always @ (posedge clk_50m)               
begin
if (!rst)
begin
	Flag_ReadADC_Samp <= 1'b0;                 
	R_Restart_ADC <= 1'b1;   //是否要从新读取           
	ADCR_Length <= 16'h00;   //读取数据长度
end
else if ((DataRX_1 == 8'h04) && (DataRX_2 == 8'h03))  
	if (Err_Check)
		if (rdy_R_AD9244)                    
		begin
			Flag_ReadADC_Samp <= 1'b0;    
			R_Restart_ADC <= 1'b0;
			ADCR_Length <= 16'h00;
		end
		else
		begin
			Flag_ReadADC_Samp <= 1'b1;      
			R_Restart_ADC <= 1'b0;
			ADCR_Length <= {DataRX_3, DataRX_4};
		end
	else
	begin
		Flag_ReadADC_Samp <= Flag_ReadADC_Samp;
		R_Restart_ADC <= R_Restart_ADC;
		ADCR_Length <= ADCR_Length;
	end
else if ((DataRX_1 == 8'h04) && (DataRX_2 == 8'h04))  
	if (Err_Check)
	begin
		Flag_ReadADC_Samp <= 1'b0;
		R_Restart_ADC <= 1'b1;                    
		ADCR_Length <= 16'h00;
	end
	else
	begin
		Flag_ReadADC_Samp <= Flag_ReadADC_Samp;
		R_Restart_ADC <= R_Restart_ADC;
		ADCR_Length <= ADCR_Length;
	end
else
begin
	Flag_ReadADC_Samp <= Flag_ReadADC_Samp;	
	R_Restart_ADC <= R_Restart_ADC;
	ADCR_Length <= ADCR_Length;
end
end

//---------读取ADC1_FFT结果	
always @ (posedge clk_50m)
begin
if (!rst)
	ReadFFTEn_ADC <= 1'b0;
else 
	if ((DataRX_1 == 8'h04) && (DataRX_2 == 8'h05))   
		if (Err_Check)
		   begin
				ReadFFTEn_ADC <= 1'b1;
			end 	
		else
			ReadFFTEn_ADC <= ReadFFTEn_ADC;
	else if ((DataRX_1 == 8'h04) && (DataRX_2 == 8'h06))   
		if (Err_Check)
			ReadFFTEn_ADC <= 1'b0;
		else
			ReadFFTEn_ADC <= ReadFFTEn_ADC;
	else
		ReadFFTEn_ADC <= ReadFFTEn_ADC;
end

//--------读取FFT数据长度----------- 
always @(posedge clk_50m)   
  begin
  if(!rst) FFT_Rlength<=0;
  else
    begin
	   if ((DataRX_1 == 8'h04) && (DataRX_2 == 8'h05))  
      begin		
		if (Err_Check)
			FFT_Rlength <= DataRX_3;	
		else
			FFT_Rlength <= FFT_Rlength;
		end
		else
		  FFT_Rlength <= FFT_Rlength;
	 end
  end
  
  

//**************************************************************************************************************************
//---------读取ADC2_RAM结果--------------
always @ (posedge clk_50m)
begin
if (!rst)
begin
	Flag_ReadADC_Samp_1 <= 1'b0;
	R_Restart_ADC_1 <= 1'b1;
	ADCR_Length_1 <= 16'h00;
end
else if ((DataRX_1 == 8'h06) && (DataRX_2 == 8'h03))  
	if (Err_Check)
		if (rdy_R_AD9244)
		begin
			Flag_ReadADC_Samp_1 <= 1'b0;
			R_Restart_ADC_1 <= 1'b0;
			ADCR_Length_1 <= 16'h00;
		end
		else
		begin
			Flag_ReadADC_Samp_1 <= 1'b1;
			R_Restart_ADC_1 <= 1'b0;
			ADCR_Length_1 <= {DataRX_3, DataRX_4};
		end
	else
	begin
		Flag_ReadADC_Samp_1 <= Flag_ReadADC_Samp;
		R_Restart_ADC_1 <= R_Restart_ADC;
		ADCR_Length_1 <= ADCR_Length;
	end
else if ((DataRX_1 == 8'h06) && (DataRX_2 == 8'h04))  
	if (Err_Check)
	begin
		Flag_ReadADC_Samp_1 <= 1'b0;
		R_Restart_ADC_1 <= 1'b1;
		ADCR_Length_1 <= 16'h00;
	end
	else
	begin
		Flag_ReadADC_Samp_1 <= Flag_ReadADC_Samp_1;
		R_Restart_ADC_1 <= R_Restart_ADC_1;
		ADCR_Length_1 <= ADCR_Length_1;
	end
else
begin
	Flag_ReadADC_Samp_1 <= Flag_ReadADC_Samp_1;	
	R_Restart_ADC_1 <= R_Restart_ADC_1;
	ADCR_Length_1 <= ADCR_Length_1;
end
end


//-------------读取ADC2_FFT结果------------	
always @ (posedge clk_50m)
begin
if (!rst)
	ReadFFTEn_ADC_1 <= 1'b0;
else 
	if ((DataRX_1 == 8'h06) && (DataRX_2 == 8'h05))   
		if (Err_Check)
		  begin
			 ReadFFTEn_ADC_1 <= 1'b1;
		  end	
		else
			ReadFFTEn_ADC_1 <= ReadFFTEn_ADC_1;
	else if ((DataRX_1 == 8'h06) && (DataRX_2 == 8'h06))   
		if (Err_Check)
			ReadFFTEn_ADC_1 <= 1'b0;
		else
			ReadFFTEn_ADC_1 <= ReadFFTEn_ADC_1;
	else
		ReadFFTEn_ADC_1 <= ReadFFTEn_ADC_1;

end

//----------设置读取ADC2_FFT数据长度------------
always @(posedge clk_50m)   
  begin
  if(!rst) FFT_Rlength_1<=0;
  else
    begin
	   if ((DataRX_1 == 8'h06) && (DataRX_2 == 8'h05))  
      begin		
		if (Err_Check)
			FFT_Rlength_1 <= DataRX_3;	
		else
			FFT_Rlength_1 <= FFT_Rlength_1;
		end
		else
		  FFT_Rlength_1 <= FFT_Rlength_1;
	 end
  end


//------------------- reset the system  -------------------------//	
always @ (posedge clk_50m)
begin
if (!rst)
	rst_sys <= 1'b1;
else 
	if ((DataRX_1 == 8'hAA) && (DataRX_2 == 8'hAA))  // 
		if (Err_Check)
			if ((DataRX_3 == 8'h00) && (DataRX_4 == 8'h00))
				rst_sys <= 1'b1;	
			else if ((DataRX_3 == 8'hFF) && (DataRX_4 == 8'hFF))
				rst_sys <= 1'b0;
			else
				rst_sys <= rst_sys;	
		else
			rst_sys <= rst_sys;
	else
		rst_sys <= rst_sys;

end
endmodule
