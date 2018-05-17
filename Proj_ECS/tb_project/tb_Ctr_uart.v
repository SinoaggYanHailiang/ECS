`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:06:41 04/14/2018
// Design Name:   Ctr_UART
// Module Name:   D:/2_FPGA_program/Proj_ECS_sinoagg/Proj_ECS/tb_project/tb_Ctr_uart.v
// Project Name:  Proj_ECS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ctr_UART
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Ctr_uart;

	// Inputs
	reg clk_50m;
	reg rst;
	reg [7:0] DataRX_1;
	reg [7:0] DataRX_2;
	reg [7:0] DataRX_3;
	reg [7:0] DataRX_4;
	reg [7:0] DataRX_5;
	reg [7:0] AddrR_O;
	reg [7:0] AddrR_O_1;
	reg [13:0] Data_O_AD9244;
	reg [13:0] Data_O_AD9244_1;
	reg [27:0] Data_send_FFT;
	reg [27:0] Data_send_FFT_1;
	reg [13:0] mean_ADC1;
	reg [13:0] mean_ADC2;
	reg flag_OverFlow_1;
	reg flag_OverFlow;
	reg rdy_R_AD9244;
	reg rdy_R_AD9244_1;
	reg rdy_W_AD9244;

	// Outputs
	wire [7:0] DIO_OUT1;
	wire [7:0] DIO_OUT2;
	wire [7:0] DIO_OUT3;
	wire [2:0] Sel_WaveFunc;
	wire [13:0] DutyCyc;
	wire [11:0] freq_incr;
	wire [15:0] Amp_DAC904;
	wire [15:0] Bias_DAC904;
	wire [39:0] cnt_DAC904;
	wire WriteEn_ADC;
	wire [7:0] ADCM_Length;
	wire [7:0] AddrFFT_ADC;
	wire Flag_ReadADC_Samp;
	wire Flag_ReadADC_Samp_1;
	wire R_Restart_ADC;
	wire R_Restart_ADC_1;
	wire [15:0] ADCR_Length;
	wire [15:0] ADCR_Length_1;
	wire ReadFFTEn_ADC;
	wire ReadFFTEn_ADC_1;
	wire [39:0] cnt_AD9244_W;
	wire rst_sys;
	wire [7:0] DataTX_1;
	wire [7:0] DataTX_2;
	wire [7:0] DataTX_3;
	wire [7:0] DataTX_4;
	wire EnTxData;

	// Instantiate the Unit Under Test (UUT)
	Ctr_UART uut (
		.clk_50m(clk_50m), 
		.rst(rst), 
		.DataRX_1(DataRX_1), 
		.DataRX_2(DataRX_2), 
		.DataRX_3(DataRX_3), 
		.DataRX_4(DataRX_4), 
		.DataRX_5(DataRX_5), 
		.AddrR_O(AddrR_O), 
		.AddrR_O_1(AddrR_O_1), 
		.Data_O_AD9244(Data_O_AD9244), 
		.Data_O_AD9244_1(Data_O_AD9244_1), 
		.Data_send_FFT(Data_send_FFT), 
		.Data_send_FFT_1(Data_send_FFT_1), 
		.mean_ADC1(mean_ADC1), 
		.mean_ADC2(mean_ADC2), 
		.flag_OverFlow_1(flag_OverFlow_1), 
		.flag_OverFlow(flag_OverFlow), 
		.rdy_R_AD9244(rdy_R_AD9244), 
		.rdy_R_AD9244_1(rdy_R_AD9244_1), 
		.rdy_W_AD9244(rdy_W_AD9244), 
		.DIO_OUT1(DIO_OUT1), 
		.DIO_OUT2(DIO_OUT2), 
		.DIO_OUT3(DIO_OUT3), 
		.Sel_WaveFunc(Sel_WaveFunc), 
		.DutyCyc(DutyCyc), 
		.freq_incr(freq_incr), 
		.Amp_DAC904(Amp_DAC904), 
		.Bias_DAC904(Bias_DAC904), 
		.cnt_DAC904(cnt_DAC904), 
		.WriteEn_ADC(WriteEn_ADC), 
		.ADCM_Length(ADCM_Length), 
		.AddrFFT_ADC(AddrFFT_ADC), 
		.Flag_ReadADC_Samp(Flag_ReadADC_Samp), 
		.Flag_ReadADC_Samp_1(Flag_ReadADC_Samp_1), 
		.R_Restart_ADC(R_Restart_ADC), 
		.R_Restart_ADC_1(R_Restart_ADC_1), 
		.ADCR_Length(ADCR_Length), 
		.ADCR_Length_1(ADCR_Length_1), 
		.ReadFFTEn_ADC(ReadFFTEn_ADC), 
		.ReadFFTEn_ADC_1(ReadFFTEn_ADC_1), 
		.cnt_AD9244_W(cnt_AD9244_W), 
		.rst_sys(rst_sys), 
		.DataTX_1(DataTX_1), 
		.DataTX_2(DataTX_2), 
		.DataTX_3(DataTX_3), 
		.DataTX_4(DataTX_4), 
		.EnTxData(EnTxData)
	);

	initial begin
		// Initialize Inputs
		clk_50m = 0;
		rst = 0;
		DataRX_1 = 0;
		DataRX_2 = 0;
		DataRX_3 = 0;
		DataRX_4 = 0;
		DataRX_5 = 0;
		AddrR_O = 0;
		AddrR_O_1 = 0;
		Data_O_AD9244 = 0;
		Data_O_AD9244_1 = 0;
		Data_send_FFT = 0;
		Data_send_FFT_1 = 0;
		mean_ADC1 = 0;
		mean_ADC2 = 0;
		flag_OverFlow_1 = 0;
		flag_OverFlow = 0;
		rdy_R_AD9244 = 0;
		rdy_R_AD9244_1 = 0;
		rdy_W_AD9244 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

