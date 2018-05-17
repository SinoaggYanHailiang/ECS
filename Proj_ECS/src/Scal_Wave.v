`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: CangLiu
// 
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    Scal_Wave 
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

module Scal_Wave(clk, rst, Scal_DC, Sin_out, Stw_out, Tri_out, Squ_out, 
		Sin_Scal_out, Stw_Scal_out, Tri_Scal_out, Squ_Scal_out);

input  clk, rst; 
input  Scal_DC; 
input  [`ND_DAC1-1:0] Sin_out, Stw_out, Tri_out, Squ_out;

output [`ND_DAC1-1:0] Sin_Scal_out, Stw_Scal_out, Tri_Scal_out, Squ_Scal_out;

reg [`ND_DAC1-1:0] Sin_Scal_out, Stw_Scal_out, Tri_Scal_out, Squ_Scal_out;

reg  [`ND_DAC1-1:0] Sin_out_temp;
reg  [`ND_DAC1-1:0] Stw_out_temp;
reg  [`ND_DAC1-1:0] Tri_out_temp;
reg  [`ND_DAC1-1:0] Squ_out_temp;

/*************  scal sin wave ************/		
always @ (posedge clk)
	if (rst)
		Sin_out_temp <= 0;
	else if (Scal_DC)
		if (Sin_out >= `Half_MAXD_DAC1)
			Sin_out_temp <= (Sin_out - `Half_MAXD_DAC1) >> 1;
		else 
			Sin_out_temp <= (`Half_MAXD_DAC1 - Sin_out) >> 1;
	else 
		Sin_out_temp <= Sin_out;
		
always @ (posedge clk)
	if (Scal_DC)
		if (Sin_out >= `Half_MAXD_DAC1)
			Sin_Scal_out <= Sin_out_temp + `Half_MAXD_DAC1;
		else	
			Sin_Scal_out <= `Half_MAXD_DAC1 - Sin_out_temp;
	else
		Sin_Scal_out <= Sin_out_temp;	
		
/*************  scal sawtooth wave ************/		
always @ (posedge clk)
	if (rst)
		Stw_out_temp <= 0;
	else if (Scal_DC)
		if (Stw_out >= `Half_MAXD_DAC1)
			Stw_out_temp <= (Stw_out - `Half_MAXD_DAC1) >> 1;
		else 
			Stw_out_temp <= (`Half_MAXD_DAC1 - Stw_out) >> 1;
	else 
		Stw_out_temp <= Stw_out;
		
always @ (posedge clk)
	if (Scal_DC)
		if (Stw_out >= `Half_MAXD_DAC1)
			Stw_Scal_out <= Stw_out_temp + `Half_MAXD_DAC1;
		else	
			Stw_Scal_out <= `Half_MAXD_DAC1 - Stw_out_temp;
	else
		Stw_Scal_out <= Stw_out_temp;
		
/*************  scal triangular wave ************/		
always @ (posedge clk)
	if (rst)
		Tri_out_temp <= 0;
	else if (Scal_DC)
		if (Tri_out >= `Half_MAXD_DAC1)
			Tri_out_temp <= (Tri_out - `Half_MAXD_DAC1) >> 1;
		else 
			Tri_out_temp <= (`Half_MAXD_DAC1 - Tri_out) >> 1;
	else 
		Tri_out_temp <= Tri_out;
		
always @ (posedge clk)
	if (Scal_DC)
		if (Tri_out >= `Half_MAXD_DAC1)
			Tri_Scal_out <= Tri_out_temp + `Half_MAXD_DAC1;
		else	
			Tri_Scal_out <= `Half_MAXD_DAC1 - Tri_out_temp;
	else
		Tri_Scal_out <= Tri_out_temp;
		
/*************  scal square wave ************/		
always @ (posedge clk)
	if (rst)
		Squ_out_temp <= 0;
	else if (Scal_DC)
		if (Squ_out >= `Half_MAXD_DAC1)
			Squ_out_temp <= (Squ_out - `Half_MAXD_DAC1) >> 1;
		else 
			Squ_out_temp <= (`Half_MAXD_DAC1 - Squ_out) >> 1;
	else 
		Squ_out_temp <= Squ_out;
		
always @ (posedge clk)
	if (Scal_DC)
		if (Squ_out >= `Half_MAXD_DAC1)
			Squ_Scal_out <= Squ_out_temp + `Half_MAXD_DAC1;
		else	
			Squ_Scal_out <= `Half_MAXD_DAC1 - Squ_out_temp;
	else
		Squ_Scal_out <= Squ_out_temp;		
		
		
endmodule
