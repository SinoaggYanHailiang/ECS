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

reg start_FFT=1'b0, start_FFT_1=1'b0;     //������ʼֵ��û�н��   

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
wire [15:0] Amp_DAC904, Bias_DAC904;    //ģ��֮���������Ҫ��wire����
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
		.clk_DAC8551(clk_DAC8551),                //����DAC8551��Ƶ�ʶ�Ϊ2.5Mhz
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
			  .Data_1(Amp_DAC904),                       //Amp_DAC904��ģ��Ctr_UART������ź�
			  .SYNC(SYNC_DAC8551),         
			  .DIN(D_DAC8551));	

//-------------------------------------
// configure the Amp of output signal
DAC8551 DAC8551_Bias(.clk(clk_DAC8551_Bias), 
			  .rst(!rst), 
			  .Data_1(Bias_DAC904),                       //Bias_DAC904��ģ��Ctr_UART������ź�
			  .SYNC(SYNC_DAC8551_Bias), 
			  .DIN(D_DAC8551_Bias));


//ԭ����
// configure the shape of the output signal	  
DDS_Core DDS_Core_1(.clk(clk_DAC904), 
					.rst(!rst),     //,��ģ���rstΪ���߼�
					.Sel_WaveFunc(Sel_WaveFunc),  //ԭ����
					//.Sel_WaveFunc(3'b010),
					.DutyCyc(DutyCyc),
					.Out_Mode(1'b0),  // 1'b1 --> single ; 1'b0 --> continuous
					.freq(freq_incr), // 1.5KHz  ԭ������
					.Data_Out(Data_Out_DAC904));
					
/*
��AD9244ģ�����fir�˲���֮�󣬱���ͳ������������ʱ���źŽ��������û��ʱ���ź���������ȷ����ͨ��MAP����
��ˣ��������������ԭ���������������AD9244ģ���У�Ȼ��ȷ��������AD9244.CLK����������ģ���У���ȷ������֮����
ȥ����ģ�顣
*/

//clk_W_AD9244_fir ���������ڲ�����ADC�߼���·
//clk_W_AD9244������ڿ����ⲿADC

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
				.ADCR_Length(ADCR_Length),     //ADCR_Length������ֵ��ȡADCԭʼ���ݳ�����
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

//һ��ģ���������ã�һ�����ÿ���AD9244��FFT���ݷ��ͳ�ȥ����һ�������ǽ������ݿ���DDS���ֲ��ε�����
Ctr_UART Ctr_UART_1(
  .clk_50m(clk_50m),	// The clock signal of 50MHz
	.rst(rst),	    // The reset signal, 0 --> enable reset

    
  //ԭ�ź�
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
				.start_FFT(start_FFT || start_FFT_1),     //ԭ����
				//.start_FFT(1'b1),                     //����1
				.En_FFT1(En_FFT1), 
			 	.FFT_xn_re(FFT_xn_re),   //ԭ����        
				.FFT_Rlength(FFT_Rlength), 
				.FFT_Rlength_1(FFT_Rlength_1),
				.dv_FFT(dv_FFT),                        //����FFT�˵�����ˣ����������Чָʾ���ߵ�ƽ��ʾ��Ч�źų����������
            .ReadFFTEn_ADC1(ReadFFTEn_ADC), 
				.Data_send_FFT1(Data_send_FFT), 
				.ReadFFTEn_ADC2(ReadFFTEn_ADC_1), 
				.Data_send_FFT2(Data_send_FFT_1),
				.rdy_rfft1(rdy_rfft1),
				.rdy_rfft2(rdy_rfft2)
    );
	 
	 
	 
//����״̬���ǿ���FFTת��ģ��ģ����ڿ���AD9244_ram��FFT_ram��ʱ��	 
//��Ҫ����start_FFT��En_FFT1����ʱ���ν�	 

//---------------------------------------------------------------
// state machine: use one FFT module to complete two ADC channels
//����S2����ADC9244_1��fft�任��S3,S4����ADC9244_2��FFT�任���������õĿ����źŲ�ͬ

//---------------------- change the state -----------------------//	
//SampleADC1_256����ģ��AD9244
//start_FFT����AD9244
//����һ��״̬������ʱ��Ӧ����clk_FFT����Ϊ����Ҫ��¼����FFT�����ݣ����Ҫ��FFTģ��һ��
//��������������dv_fft��Ϊ�����źţ�����¼����ADC2��������clk_50MhzҲ��
always @ (posedge clk_50m)
begin
	if(!rst)
	current_S <= S0;
	else
	current_S <= next_S;
end
//---------------------- compute the next state -----------------------//	
/*
�����ź�˵����
start_FFT=1��FFT��ADC1����ת��
start_FFT_1��FFT��ADC2����ת��
En_FFT1=1��FFT_ADCд��FFT_RAM1
En_FFT1=0��FFT_ADCд��FFT_RAM2
״̬��״̬˵��:
S0:�ȴ�Sample_256���źŵ�����Ϊװ��ADC1_RAM������׼��
S1:װ��ADC1_RAM���ݣ�start_FFT=1�����ȴ�dv_FFT_ADC1���źŵ���,ΪFFT_ADC1д��FFT_RAM1��׼��
S2��dv_FFT=1,��FFT_ADC1������д��FFT_RAM1��En_FFT1=1����Ϊװ��ADC2_RAM��������׼��
S3:װ��װ��ADC2_RAM�����ݣ�start_FFT_1=1�����ҵȴ�dv_FFT_ADC2�źŵĵ���
S4:��dv_FFT_ADC2=1�ڼ䣬װ��FFT_ADC2�����ݣ��ұ�֤En_FFT1=0
*/
always @ (*)
begin
if (!rst)
	next_S  = S0;
else  
    case (current_S)                  //SampleADC1_256ֻ����ADC1�ģ�ADC2��û��
    S0 :                              //��ADC_RAM��ADDR_W=8'hff֮��SampleADC1_256=1������д��ʱ����0��
		if (SampleADC1_256)            //SampleADC1_256����AD9244_1��Sample_256    
			next_S      = S1;
		else
			next_S      = S0;
	 S1 :
		if (dv_FFT)
			next_S      = S2;
		else
			next_S      = S1;
	 S2 :if(dv_FFT)       //��ADC1������ת�����ʱ��dv_fft=1,ά��256��clk_FFT������
	      next_S      = S2;
		  else
			next_S      = S3;
	 S3 :
		if (dv_FFT)                    //����һ��ADC_RAM����װ����ɺ��ٴγ���ת�����ݱض���ADC_RAM_2��
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
			next_S      = S0; //ֹͣѭ���Ĺؼ��ط�			
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
      	start_FFT   <= 1'b1;             //Ϊ��FFTװ��ADC1������׼�� 
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
    if (dv_FFT)                             //Ϊ��¼ADC1_FFT������׼��
	   begin
		  	start_FFT   <= 1'b0;
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b1;
		end
		else
		begin                              
      	start_FFT   <= 1'b1;              //��FFTװ��ADC1����
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= FFT_xn_re_ADC1;  
			En_FFT1     <= 1'b1;
   	end
	S2 :if(dv_FFT)                          //��¼ADC1_FFT����
	    begin
		  	start_FFT   <= 1'b0;
      	start_FFT_1 <= 1'b0;     
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b1;        
		end	
	   else
		begin
		  	start_FFT   <= 1'b0;             //Ϊװ��ADC2������׼��
      	start_FFT_1 <= 1'b1;  
			FFT_xn_re   <= FFT_xn_re_ADC2;   
			En_FFT1     <= 1'b0;
		end
	S3 :
		if (dv_FFT)                        //�ȴ�dv_FFT_ADC2��Ч
		begin                   
			start_FFT   <= 1'b0; 
      	start_FFT_1 <= 1'b0;
			FFT_xn_re   <= {`ND_ADC{1'b0}};
			En_FFT1     <= 1'b0;   
		end
		else
		begin
			start_FFT   <= 1'b0;
      	start_FFT_1 <= 1'b1;           //��FFTװ��ADC2����
			FFT_xn_re   <= FFT_xn_re_ADC2;
			En_FFT1     <= 1'b0;
		end
	S4 :
		if (dv_FFT)                      //װ��FFT_ADC2����
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

