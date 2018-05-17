`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    AD9244
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////////////////////////////
`include "ECS_Define.v"
//调试注意给出ReadEn读取ram原始数据使能信号的同时，还需要确定读取原始数据的长度ADCR_Length，即在命令AA 04 03 RX3 RX4 RX5中，RX3 RX4决定读取数据的长度
//Cr_UART控制AD9244,AD9244控制FFT模块
//AD9244一方面控制RAM_ADC的写和读，另一方面给出控制FFT模块的控制信号
//clk_W=40MZH,(80MHZ/2)默认情况下
//clk_R=50mhz/
//clk_FFT=20mhz

module AD9244(clk_W, clk_R, clk_FFT, rst, ReadEn, WriteEn, start_FFT,      
			  Data_I, OTR,                    //Ctr_UART为Flag_ReadADC_Samp，AD9244为ReadEn，RAM-ADC为ReadEn_Serial           
			  
			  count_coe,
			  coe,
			 
			  Addr_W,
			  Data_O_Serial,            
			  Addr_R, 
			  ADCR_Length, 
			  R_Restart_ADC, 
			  rdy_W, 
			  rdy_R, 
			  FFT_xn_re        //Data_O_FFT,输出到FFT模块
		              );
		  
input clk_W, clk_R, clk_FFT;  // clk_FFT --> 50MHz
input rst; 

input [3:0] count_coe;
input [4:0] coe;

input ReadEn, WriteEn, start_FFT;  //ReadEn连接到Ctr_UART模块的Flag_ReadADC_Samp端，Flag_ReadADC_Samp信号根据电脑发送过来的RX1和RX2确定其状态
                                   //WeadEn连接到Ctr_UART模块的WriteEn_ADC端
											  // start_FFT在顶层模块中产生,start_FFT连接到FFT模块的start_FFT_D端

//---------------ADC采集的数据，外部输入--------------------
input [`ND_ADC-1:0] Data_I;         //ND_ADC=14,NA_ADC=8，分配到管脚，直接外部输入
input [15:0] ADCR_Length;           // the depth of read ADC ，根据Ctr_UART模块接收的指令来确定该值，ADCR_Length <= {DataRX_3, DataRX_4};
                                    // input [15:0] AddrFFT_ADC;
input R_Restart_ADC;                // Read form the pre addr or 00 ，和ReadEn（Flag_ReadADC_Samp）联合使用读取ADC数据
input OTR;

//--------控制串口发送---------
output [`ND_ADC-1:0] Data_O_Serial;  //连接到Ctr_UART的Data_O_AD9244输入端，本模块输出作为Ctr_UART，经过Ctr_UART发送到电脑，即为ADC采集的数据 

output [7:0] Addr_W;
output [7:0] Addr_R;
output rdy_W, rdy_R;   //rdy_R=1表示准备好读取了，数据写入ADC_ROM完毕，是Ctr_UART的输入信号，控制UART发送ADC采集的数据以及数据的地址

output [`ND_ADC-1:0] FFT_xn_re;   //输出到FFT模块


localparam S0 = 2'b00;
localparam S1 = 2'b01;
localparam S2 = 2'b10;

reg [1:0] current_S=2'd0, next_S=2'd0;

reg [`NA_ADC-1:0] Addr_W=8'd0, Addr_R=8'd0;          //为读写地址，宽度是8位，为AD9244发出控制ADC_ROM的读写地址，此处定义这两个信号的作用,Ctr_UART中包括rdy_W_AD9244信号，需要理解其含义？
reg rdy_W=1'b0, rdy_R=1'b0;


reg ReadEn_FFT=1'b0;
reg  [`NA_ADC-1:0] Addr_D_FFT=8'd0;

reg [`ND_ADC-1:0] Mean_ADC=14'd0;                //平均值
reg [7:0] cnt_CompM=8'd0;                       //计数值，计算累加了几个值
reg signed [`ND_ADC+7:0] Sum_CompM=22'd0;        //存储累加和
reg signed [`ND_ADC-1:0] MaxSamp=14'd0;          //寻找采样最大值，用以计算有无超出采样范围

//*********************************************************************************************************************
// 将补码转换为无符号数
wire [14:0] Data_C;
assign Data_C=Data_I+13'd8191;  //舍弃最高位后，即可以将补码转换为无符号整型数据，只用Data_C[13:0]

//**********************************************************************************************************************
//加入滤波器,这里如果不声明为存储器类型，则编译不通过
wire [22:0] filter_data [0:0]; // 38位，14+16+（9-1）=38, 注意1，声明为memory类型的变量
reg [22:0] data_store=23'd0;                          // 注意2，将memory类型变量转换为reg型变量，才可以对变量进行为操作

fir_module low_pass_filter (
    .rst(!rst), 
    .clk(clk_W), 
    .din(Data_C[13:0]), 
    .count_coe(count_coe), 
    .coe(coe), 
    .dout(filter_data[0])
    );

always @(posedge clk_W)
  begin
    if(rst) data_store<=25'd0;
	 else data_store<=filter_data[0];
  end
 

RAM_ADC RAM_ADC_1(
              //时钟信号
				  .clk_W(clk_W), 
				  .clk_R_Serial(clk_R), 
				  .clk_R_FFT(clk_FFT), 
				  //数据输入
				  //.Data_I(Data_C[13:0]),   //不经过滤波的数据  
				  .Data_I(data_store[22:9]),  //存储滤波数据
				  //地址
				  .Addr_W(Addr_W),                    //ADC9244采集的数据写入ADC_RAM的地址
				  .Addr_R_Serial(Addr_R),             //UART从ADC_RAM读取数据的地址：Addr_R_Serial->Addr_R->AddrR_O
				  .Addr_R_FFT(Addr_D_FFT),            //FFT模块从ADC_RAM读取数据的地址
				  //使能
				  .ReadEn_Serial(ReadEn),             //允许UART发送模块读取ADC_RAM内存数据
				  .ReadEn_FFT(ReadEn_FFT),            //允许FFT变换模块读取ADC_RAM内存数据   
				  .WriteEn(WriteEn),                  //允许采集的数据写入ADC_RAM
				  //数据输出
				  .Data_O_Serial(Data_O_Serial),      //数据输出到UART
				  .Data_O_FFT(FFT_xn_re));            //原程序，数据输出到FFT模块
              

//读取ADC_RAM**************************************************************************************************************
always @ (posedge clk_R)
begin
if (rst)
begin
	Addr_R <= {`NA_ADC{1'b0}}; //输出到ADC_RAM           //Addr_R作为ADC_ram的输入控制端       
	rdy_R <= 1'b0;             //输出到Ctr_UART           //AddrR_O和rdy_R一起输送到Ctr_UART
end
else if (ReadEn)                         //电脑经过UART发送过来读取ADC9244使能命令，由RX1和RX2确定
	if (Addr_R >= ADCR_Length)            //ReadEn连接到RAM_ADC的ReadEn_Serial，使能串口读取数据
	begin
		Addr_R <= Addr_R;
		rdy_R <= 1'b1;                     //当读取数据个数大于需要读取的数据时，发出读取准备好信号
	end
	else
	begin
		Addr_R <= Addr_R + 1'b1;
		rdy_R <= 1'b0;
	end
else if (R_Restart_ADC)            //来自Ctr_UART,Ctr_UART依据电脑发过来的RX1和RX2来确定该值状态，R_Restart_ADC表示重新读取数据
	begin                          
		Addr_R <= {`NA_ADC{1'b0}};
		rdy_R   <= 1'b0;
	end
else
	begin
		Addr_R <= Addr_R;
		rdy_R   <= rdy_R;
	end
end

//向ADC_RAM写数据*************************************************************************************************************
always @ (posedge clk_W)
if (rst)
begin
	Addr_W <= {`NA_ADC{1'b0}};        //输出到ADC_RAM
	rdy_W <= 1'b0;                    //输出到Ctr_UART,为存储器写满信号
end 
else if (WriteEn)  //电脑发送过来命令后，不发送其他命令，则命令不变，因此WriteEn不变
	if (Addr_W >= {`NA_ADC{1'b1}})      //NA_ADC=8,写满指示信号，写满之后给出一个准备好写信号   
	begin
		Addr_W <= {`NA_ADC{1'b1}};    
		rdy_W <= 1'b1;                  //输出到Ctr_UART，控制UART的读数据
	end
	else
	begin
		Addr_W <= Addr_W + 1'b1;          //rdy_W=0时，才控制写入数据
		rdy_W <= 1'b0;
	end
else 
begin
	Addr_W <= {`NA_ADC{1'b0}};	
	rdy_W <= 1'b0;                        
end

//*****************************************************************************************************
//程序优化，当读取数据大于255后，停止读取数据
always @ (posedge clk_FFT)
begin 
  if (rst)
    begin
	   ReadEn_FFT <= 1'b0;   
	   Addr_D_FFT <= {`NA_ADC{1'b0}};                   
    end
  else if (start_FFT)     //在start_FFT=1期间，判断信号走势的技巧，对比将Addr_D_FFT >= 8'b1111_1111写在外面的情况
    begin
	   if(Addr_D_FFT >= 8'b1111_1111) 
		    begin 
			     ReadEn_FFT <= 1'b0;   
	           Addr_D_FFT <= 8'b1111_1111;
			 end
	    else 
		   begin
			  ReadEn_FFT <= 1'b1;
		     Addr_D_FFT <= Addr_D_FFT + 1'b1;
			end
	 end
  else
	begin
		ReadEn_FFT <= 1'b0;
		Addr_D_FFT <= {`NA_ADC{1'b0}};
	end
end


endmodule
