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
//����ע�����ReadEn��ȡramԭʼ����ʹ���źŵ�ͬʱ������Ҫȷ����ȡԭʼ���ݵĳ���ADCR_Length����������AA 04 03 RX3 RX4 RX5�У�RX3 RX4������ȡ���ݵĳ���
//Cr_UART����AD9244,AD9244����FFTģ��
//AD9244һ�������RAM_ADC��д�Ͷ�����һ�����������FFTģ��Ŀ����ź�
//clk_W=40MZH,(80MHZ/2)Ĭ�������
//clk_R=50mhz/
//clk_FFT=20mhz

module AD9244(clk_W, clk_R, clk_FFT, rst, ReadEn, WriteEn, start_FFT,      
			  Data_I, OTR,                    //Ctr_UARTΪFlag_ReadADC_Samp��AD9244ΪReadEn��RAM-ADCΪReadEn_Serial           
			  
			  count_coe,
			  coe,
			 
			  Addr_W,
			  Data_O_Serial,            
			  Addr_R, 
			  ADCR_Length, 
			  R_Restart_ADC, 
			  rdy_W, 
			  rdy_R, 
			  FFT_xn_re        //Data_O_FFT,�����FFTģ��
		              );
		  
input clk_W, clk_R, clk_FFT;  // clk_FFT --> 50MHz
input rst; 

input [3:0] count_coe;
input [4:0] coe;

input ReadEn, WriteEn, start_FFT;  //ReadEn���ӵ�Ctr_UARTģ���Flag_ReadADC_Samp�ˣ�Flag_ReadADC_Samp�źŸ��ݵ��Է��͹�����RX1��RX2ȷ����״̬
                                   //WeadEn���ӵ�Ctr_UARTģ���WriteEn_ADC��
											  // start_FFT�ڶ���ģ���в���,start_FFT���ӵ�FFTģ���start_FFT_D��

//---------------ADC�ɼ������ݣ��ⲿ����--------------------
input [`ND_ADC-1:0] Data_I;         //ND_ADC=14,NA_ADC=8�����䵽�ܽţ�ֱ���ⲿ����
input [15:0] ADCR_Length;           // the depth of read ADC ������Ctr_UARTģ����յ�ָ����ȷ����ֵ��ADCR_Length <= {DataRX_3, DataRX_4};
                                    // input [15:0] AddrFFT_ADC;
input R_Restart_ADC;                // Read form the pre addr or 00 ����ReadEn��Flag_ReadADC_Samp������ʹ�ö�ȡADC����
input OTR;

//--------���ƴ��ڷ���---------
output [`ND_ADC-1:0] Data_O_Serial;  //���ӵ�Ctr_UART��Data_O_AD9244����ˣ���ģ�������ΪCtr_UART������Ctr_UART���͵����ԣ���ΪADC�ɼ������� 

output [7:0] Addr_W;
output [7:0] Addr_R;
output rdy_W, rdy_R;   //rdy_R=1��ʾ׼���ö�ȡ�ˣ�����д��ADC_ROM��ϣ���Ctr_UART�������źţ�����UART����ADC�ɼ��������Լ����ݵĵ�ַ

output [`ND_ADC-1:0] FFT_xn_re;   //�����FFTģ��


localparam S0 = 2'b00;
localparam S1 = 2'b01;
localparam S2 = 2'b10;

reg [1:0] current_S=2'd0, next_S=2'd0;

reg [`NA_ADC-1:0] Addr_W=8'd0, Addr_R=8'd0;          //Ϊ��д��ַ�������8λ��ΪAD9244��������ADC_ROM�Ķ�д��ַ���˴������������źŵ�����,Ctr_UART�а���rdy_W_AD9244�źţ���Ҫ����京�壿
reg rdy_W=1'b0, rdy_R=1'b0;


reg ReadEn_FFT=1'b0;
reg  [`NA_ADC-1:0] Addr_D_FFT=8'd0;

reg [`ND_ADC-1:0] Mean_ADC=14'd0;                //ƽ��ֵ
reg [7:0] cnt_CompM=8'd0;                       //����ֵ�������ۼ��˼���ֵ
reg signed [`ND_ADC+7:0] Sum_CompM=22'd0;        //�洢�ۼӺ�
reg signed [`ND_ADC-1:0] MaxSamp=14'd0;          //Ѱ�Ҳ������ֵ�����Լ������޳���������Χ

//*********************************************************************************************************************
// ������ת��Ϊ�޷�����
wire [14:0] Data_C;
assign Data_C=Data_I+13'd8191;  //�������λ�󣬼����Խ�����ת��Ϊ�޷����������ݣ�ֻ��Data_C[13:0]

//**********************************************************************************************************************
//�����˲���,�������������Ϊ�洢�����ͣ�����벻ͨ��
wire [22:0] filter_data [0:0]; // 38λ��14+16+��9-1��=38, ע��1������Ϊmemory���͵ı���
reg [22:0] data_store=23'd0;                          // ע��2����memory���ͱ���ת��Ϊreg�ͱ������ſ��ԶԱ�������Ϊ����

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
              //ʱ���ź�
				  .clk_W(clk_W), 
				  .clk_R_Serial(clk_R), 
				  .clk_R_FFT(clk_FFT), 
				  //��������
				  //.Data_I(Data_C[13:0]),   //�������˲�������  
				  .Data_I(data_store[22:9]),  //�洢�˲�����
				  //��ַ
				  .Addr_W(Addr_W),                    //ADC9244�ɼ�������д��ADC_RAM�ĵ�ַ
				  .Addr_R_Serial(Addr_R),             //UART��ADC_RAM��ȡ���ݵĵ�ַ��Addr_R_Serial->Addr_R->AddrR_O
				  .Addr_R_FFT(Addr_D_FFT),            //FFTģ���ADC_RAM��ȡ���ݵĵ�ַ
				  //ʹ��
				  .ReadEn_Serial(ReadEn),             //����UART����ģ���ȡADC_RAM�ڴ�����
				  .ReadEn_FFT(ReadEn_FFT),            //����FFT�任ģ���ȡADC_RAM�ڴ�����   
				  .WriteEn(WriteEn),                  //����ɼ�������д��ADC_RAM
				  //�������
				  .Data_O_Serial(Data_O_Serial),      //���������UART
				  .Data_O_FFT(FFT_xn_re));            //ԭ�������������FFTģ��
              

//��ȡADC_RAM**************************************************************************************************************
always @ (posedge clk_R)
begin
if (rst)
begin
	Addr_R <= {`NA_ADC{1'b0}}; //�����ADC_RAM           //Addr_R��ΪADC_ram��������ƶ�       
	rdy_R <= 1'b0;             //�����Ctr_UART           //AddrR_O��rdy_Rһ�����͵�Ctr_UART
end
else if (ReadEn)                         //���Ծ���UART���͹�����ȡADC9244ʹ�������RX1��RX2ȷ��
	if (Addr_R >= ADCR_Length)            //ReadEn���ӵ�RAM_ADC��ReadEn_Serial��ʹ�ܴ��ڶ�ȡ����
	begin
		Addr_R <= Addr_R;
		rdy_R <= 1'b1;                     //����ȡ���ݸ���������Ҫ��ȡ������ʱ��������ȡ׼�����ź�
	end
	else
	begin
		Addr_R <= Addr_R + 1'b1;
		rdy_R <= 1'b0;
	end
else if (R_Restart_ADC)            //����Ctr_UART,Ctr_UART���ݵ��Է�������RX1��RX2��ȷ����ֵ״̬��R_Restart_ADC��ʾ���¶�ȡ����
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

//��ADC_RAMд����*************************************************************************************************************
always @ (posedge clk_W)
if (rst)
begin
	Addr_W <= {`NA_ADC{1'b0}};        //�����ADC_RAM
	rdy_W <= 1'b0;                    //�����Ctr_UART,Ϊ�洢��д���ź�
end 
else if (WriteEn)  //���Է��͹�������󣬲������������������䣬���WriteEn����
	if (Addr_W >= {`NA_ADC{1'b1}})      //NA_ADC=8,д��ָʾ�źţ�д��֮�����һ��׼����д�ź�   
	begin
		Addr_W <= {`NA_ADC{1'b1}};    
		rdy_W <= 1'b1;                  //�����Ctr_UART������UART�Ķ�����
	end
	else
	begin
		Addr_W <= Addr_W + 1'b1;          //rdy_W=0ʱ���ſ���д������
		rdy_W <= 1'b0;
	end
else 
begin
	Addr_W <= {`NA_ADC{1'b0}};	
	rdy_W <= 1'b0;                        
end

//*****************************************************************************************************
//�����Ż�������ȡ���ݴ���255��ֹͣ��ȡ����
always @ (posedge clk_FFT)
begin 
  if (rst)
    begin
	   ReadEn_FFT <= 1'b0;   
	   Addr_D_FFT <= {`NA_ADC{1'b0}};                   
    end
  else if (start_FFT)     //��start_FFT=1�ڼ䣬�ж��ź����Ƶļ��ɣ��ԱȽ�Addr_D_FFT >= 8'b1111_1111д����������
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
