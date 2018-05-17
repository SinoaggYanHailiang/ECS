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
��ģ������4�в��Σ����Ǿ��������һ�����λ�����ģ��DDS_Core�о�������DDS_Coreģ���е���������Sel_WaveFunc����
*/


`include "ECS_Define.v"

module GenWave(clk, rst, AC_Wave, Out_Mode, freq, DutyCyc, Sin_out, Stw_out, Tri_out, Squ_out);

input  clk, rst;
input AC_Wave;    // 1ѡ��ı䣬0ѡ�񲻱仹������ԭ���Ĳ���;������ѡ���ǰ��һ���ˣ����øı䣬��һ�����øı䡣   //�����ⲿ���룬��DDS_CORE �в����ñ���ȷ��ֵ
input Out_Mode;   // 1'b1 --> single ; 1'b0 --> continuous                                        //�ⲿ�������  
input  [`N_Freq-1:0]  freq;       //N_Freq=12                                                      //�ⲿ�������
input [`ND_DAC1-1:0] DutyCyc;    //ND_DAC1=14 
output [`ND_DAC1-1:0] Sin_out;  // sin wave
output [`ND_DAC1-1:0] Stw_out;  // sawtooth wave
output [`ND_DAC1-1:0] Tri_out;  // triangular wave
output [`ND_DAC1-1:0] Squ_out;  // square wave

reg [`ND_DAC1-1:0] Stw_out=14'd0;  // sawtooth wave
reg [`ND_DAC1-1:0] Tri_out=14'd0;  // triangular wave
reg [`ND_DAC1-1:0] Squ_out=14'd0;  // square wave
reg [`NA_DAC1-1:0] addra=15'd0;    //���������Ҳ����ݸ���Ϊ2^15
// reg [`ND_DAC1-1:0] Sin_out;  // sin wave

wire [`ND_DAC1-1:0] Sin_DDS;  // sin wave

rom_sin rom_sin_1 (  
		.clka(clk), 
		.rsta(rst),
		.addra(addra), 
		.douta(Sin_out)
	);


//addra����ram�Ķ������ݣ�addra�ı仯ֱ�ӿ���Stw_out��Stw_outͨ���任ת����Tri_out��Squ_out���
//��˸ı�Ƶ����freqʱ�����ֲ��ε����Ƶ�ʶ����Ըı䣬��ʵStw_out��Tri_out��Squ_out����Ƶ��һ������Ϊ��ݲ�����һ�����ڣ����ǲ��ͷ���Ҳ����һ������
//����addr����һ������sinҲ����һ�����ڣ�Stw_outҲ����һ�����ڣ����Stw_out��sin��������һ����

/************ calculate the value of addra ***********/	
always @ (posedge clk)	                                  // ����DDSģ���ַ
begin
	if (rst)  
		addra <= 0;
	else if (AC_Wave)
		addra   <= 0;
	else if (Out_Mode)                                     //out_mode=0,�����������
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
		Stw_out <= {`ND_DAC1{1'b0}};          //ND_DAC1=14,DAC���ݿ��
	else if (Out_Mode)                       //NA_DAC1=15,DAC��ַ���
		if (addra == {`NA_DAC1{1'b1}})                           //��ַΪ���ֵʱ����ַ����
			Stw_out <= {`ND_DAC1{1'b0}};
		else
			Stw_out <= addra[`NA_DAC1-1:(`NA_DAC1-`ND_DAC1)];     //��ַΪ15λ�����Ϊ14λ�����ֻҪ��ַ��14λ 
	else 
		Stw_out <= addra[`NA_DAC1-1:(`NA_DAC1-`ND_DAC1)];
end
/********************* generate the triangular wave *********************/	   
always @ (posedge clk)                //˼·��Stw_out ��Χ��0->2^14,��0->16383 ,��Stw_out ���е�����1/2�ķ���ʱ����Ҫ��ת��ͨ��MAXD_DAC=16383        
begin
	if (rst)                           //��ȥStw_out ���ɣ�Ȼ��õ�����ֵ�����ƣ��Ŵ�����
	begin
		Tri_out <= {`ND_DAC1{1'b0}};
	end
	else if (Stw_out <= (`MAXD_DAC1>>1))  //the value of sawtooth wave is smaller than 0.5*max_value 
	begin                                 //MAXD_DAC1=16383=2^14����ADC�����������Χ14'b11_1111_1111_1111
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
	if (rst)                          //Stw_out�����ֵΪMAXD_DAC1>>1����16383������0->16383֮��ȡֵ����DutyCyc����ڵ���Stw_outʱ������Ϊ1��С��ʱ������Ϊ0
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
