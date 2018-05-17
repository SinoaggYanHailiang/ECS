`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    my_FFT
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////////////////////////////
`include "ECS_Define.v"

module my_FFT(clk_R, clk_FFT, rst, start_FFT, En_FFT1,                         //控制信号
			     FFT_xn_re,dv_FFT,                                  //FFT转换的输入和输出信号
              ReadFFTEn_ADC1, Data_send_FFT1, ReadFFTEn_ADC2, Data_send_FFT2,   //FFT转换完成写入FFT_RAM的信号
              FFT_Rlength,FFT_Rlength_1,rdy_rfft1,rdy_rfft2
             	);

input clk_FFT, clk_R;
input rst, start_FFT;
input En_FFT1;   //控制用一个FFT模块计算两个ADC9244采集的数据  
input [`ND_ADC-1:0] FFT_xn_re; 
input [7:0] FFT_Rlength; //读取FFT数据的长度    
input [7:0] FFT_Rlength_1;

output dv_FFT;
input ReadFFTEn_ADC1, ReadFFTEn_ADC2;
output [27:0] Data_send_FFT1, Data_send_FFT2;
output  rdy_rfft1,rdy_rfft2;   

reg rdy_rfft1=1'd0,rdy_rfft2=1'd0;
reg writeEn_FFT1=1'd0, writeEn_FFT2=1'd0; //                
reg [`NA_FFT-1:0] Addr_W_FFT1=8'd0, Addr_W_FFT2=8'd0;     //NA_FFT=8
wire [7:0] xk_index;
wire [`ND_FFT-1:0] xk_re, xk_im;      //经过转换之后数据变为23位
reg ReadEn_Re_FFT1=1'd0, ReadEn_Im_FFT1=1'd1, ReadEn_Re_FFT2=1'd0, ReadEn_Im_FFT2=1'd1;

reg [`ND_FFT-1:0] Data_O_FFT1=23'd0, Data_O_FFT2=23'd0;    //ND_FFT=23

reg [`NA_FFT-1:0] Addr_R_FFT1=8'd0, Addr_R_FFT2=8'd0; //一定得赋给初始值，该出不赋值，则没有结果
reg [27:0] Data_send_FFT1=28'd0, Data_send_FFT2=28'd0;  // 27==0 --> Im; 27==1 --> Re 


FFT FFT_1(
	.clk(clk_FFT), 
	.start(start_FFT),	
	.unload(1'b1), 
	.fwd_inv(1'b1), 
	.fwd_inv_we(1'b1), 
	.rfd(), 
	.busy(),       
	.edone(), 
	.done(), 
	.dv(dv_FFT),              //FFT输出数据有效期间dv=1，其余dv=0
	.xn_re(FFT_xn_re),	
	.xn_im(14'b00_0000_0000_0000), 
	.xn_index(), 
	.xk_index(xk_index),     //表示输出第几个数据，和输出数据个数一一对应，
	.xk_re(xk_re), 
	.xk_im(xk_im)
	);
	

wire [22:0]  ADC1_RE,ADC1_IM,ADC2_RE,ADC2_IM;


//-----------------ADC1_fft数据---------------------

Dram_fft_re ADC1_FFT_RE (
  .clka(clk_FFT), // input clka
  .wea(writeEn_FFT1), // input [0 : 0] wea
  .addra(Addr_W_FFT1), // input [7 : 0] addra
  .dina(xk_re), // input [22 : 0] dina
  .clkb(clk_R), // input clkb
  .addrb(Addr_R_FFT1), // input [7 : 0] addrb
  .doutb(ADC1_RE) // output [22 : 0] doutb
);

Dram_fft_im ADC1_FFT_IM (
  .clka(clk_FFT), // input clka
  .wea(writeEn_FFT1), // input [0 : 0] wea
  .addra(Addr_W_FFT1), // input [7 : 0] addra
  .dina(xk_im), // input [22 : 0] dina
  .clkb(clk_R), // input clkb
  .addrb(Addr_R_FFT1), // input [7 : 0] addrb
  .doutb(ADC1_IM) // output [22 : 0] doutb
);

always @(posedge clk_R)
if (ReadEn_Re_FFT1)
	Data_O_FFT1 <= ADC1_RE;
else if (ReadEn_Im_FFT1)
	Data_O_FFT1 <= ADC1_IM;
else
	Data_O_FFT1 <= Data_O_FFT1;



//---------------ADC2_FFT数据-----------------
Dram_fft_re ADC2_FFT_RE (
  .clka(clk_FFT), // input clka
  .wea(writeEn_FFT2), // input [0 : 0] wea
  .addra(Addr_W_FFT2), // input [7 : 0] addra
  .dina(xk_re), // input [22 : 0] dina
  .clkb(clk_R), // input clkb
  .addrb(Addr_R_FFT2), // input [7 : 0] addrb
  .doutb(ADC2_RE) // output [22 : 0] doutb
);

Dram_fft_im ADC2_FFT_IM (
  .clka(clk_FFT), // input clka
  .wea(writeEn_FFT2), // input [0 : 0] wea
  .addra(Addr_W_FFT2), // input [7 : 0] addra
  .dina(xk_im), // input [22 : 0] dina
  .clkb(clk_R), // input clkb
  .addrb(Addr_R_FFT2), // input [7 : 0] addrb
  .doutb(ADC2_IM) // output [22 : 0] doutb
);

always @(posedge clk_R)
if (ReadEn_Re_FFT2)
	Data_O_FFT2 <= ADC2_RE;
else if (ReadEn_Im_FFT2)
	Data_O_FFT2 <= ADC2_IM;
else
	Data_O_FFT2 <= Data_O_FFT2;




//写入FFT的数据是自动写入，关键是研究写入数据的顺序
//clk_FFT控制fft转换过后的数据写入FFT_RAM,主要由En_FFT1控制                                                                                                                                  
// configure the write signal of FFT result memory
//写FFT1和FFT2的RAM,En_FFT1=1向FFT_RAM1中写入数据，En_FFT1=0向FFT_RAM2中写入数据
always @ (posedge clk_FFT)
begin
if (rst)
begin
	writeEn_FFT1 <= 1'b0;
	Addr_W_FFT1 <= 8'd0;
	writeEn_FFT2 <= 1'b0;                                              
	Addr_W_FFT2 <= 8'd0;                                              
end                   
else if ((dv_FFT) && (En_FFT1))  
	begin                                                              
		writeEn_FFT1 <= 1'b1;  //写入FFT_RAM使能    
		Addr_W_FFT1 <= Addr_W_FFT1 + 1'b1; //产生写入FFT_RAM的地址                             
		writeEn_FFT2 <= 1'b0;
		Addr_W_FFT2 <= 8'd0;                                          
	end
else if ((dv_FFT) && (En_FFT1==1'b0))  //这次dv=1表示ADC2的fft变换，上一次dv=1表示ADC1的fft变换                 
	begin
		writeEn_FFT1 <= 1'b0;
		Addr_W_FFT1 <= 8'd0;
		writeEn_FFT2 <= 1'b1;
		Addr_W_FFT2 <= Addr_W_FFT2 + 1'b1;     //实部和虚部一块儿写入
	end
else
	begin
		writeEn_FFT1 <= 1'b0;
		Addr_W_FFT1 <= 8'd0;
		writeEn_FFT2 <= 1'b0;
		Addr_W_FFT2 <= 8'd0;
	end
end

//修改程序

//读出ADC1_FFT数据   
always @ (posedge clk_R)
begin
if (rst)
begin
   rdy_rfft1<=1'b0;
	Addr_R_FFT1 <= {`NA_FFT{1'b0}};             
	ReadEn_Re_FFT1 <= 1'b0;
	ReadEn_Im_FFT1 <= 1'b1;
	Data_send_FFT1 <= {2'b01,Addr_R_FFT1,Data_O_FFT1};
end
else if (ReadFFTEn_ADC1)
begin                  
   case ({ReadEn_Re_FFT1, ReadEn_Im_FFT1})
	2'b00 : 
	begin
	   rdy_rfft1<=1'b0;
		Addr_R_FFT1 <= {`NA_FFT{1'b0}};
		ReadEn_Re_FFT1 <= 1'b0;
		ReadEn_Im_FFT1 <= 1'b1;
		Data_send_FFT1 <= {2'b01,Addr_R_FFT1,Data_O_FFT1};
	end
	2'b01 :                                                    
	begin
		if (Addr_R_FFT1 >= FFT_Rlength)               
		begin
		   rdy_rfft1<=1'b0;
			Addr_R_FFT1 <= {`NA_FFT{1'b0}};
			ReadEn_Re_FFT1 <= 1'b1;
			ReadEn_Im_FFT1 <= 1'b0;
			Data_send_FFT1 <= {2'b10,Addr_R_FFT1,Data_O_FFT1};     
		end
		else
		begin
		   rdy_rfft1<=1'b0;
			Addr_R_FFT1 <= Addr_R_FFT1 + 1'b1;
			ReadEn_Re_FFT1 <= 1'b0;
			ReadEn_Im_FFT1 <= 1'b1;
			Data_send_FFT1 <= {2'b01,Addr_R_FFT1,Data_O_FFT1};
		end
	end
	2'b10 :   //到该处使其状态不变，停止循环                                                         
	begin
		if (Addr_R_FFT1 >= FFT_Rlength)   
		begin
		   rdy_rfft1<=1'b1;    
			Addr_R_FFT1 <= Addr_R_FFT1;
			ReadEn_Re_FFT1 <= ReadEn_Re_FFT1;
			ReadEn_Im_FFT1 <= ReadEn_Im_FFT1;
			Data_send_FFT1 <= Data_send_FFT1;
		end
		else
		begin
		   rdy_rfft1<=1'b0;
			Addr_R_FFT1 <= Addr_R_FFT1 + 1'b1;
			ReadEn_Re_FFT1 <= 1'b1;
			ReadEn_Im_FFT1 <= 1'b0;
			Data_send_FFT1 <= {2'b10,Addr_R_FFT1,Data_O_FFT1};
		end
	end
	default :
	begin
	   rdy_rfft1<=1'b0;
		Addr_R_FFT1 <= {`NA_FFT{1'b0}};
		ReadEn_Re_FFT1 <= 1'b0;
		ReadEn_Im_FFT1 <= 1'b1;
		Data_send_FFT1 <= {2'b01,Addr_R_FFT1,Data_O_FFT1};
	end
   endcase	  
end   
else
begin
   rdy_rfft1<=1'b0;
	Addr_R_FFT1 <= {`NA_FFT{1'b0}};    
	ReadEn_Re_FFT1 <= 1'b0;
	ReadEn_Im_FFT1 <= 1'b1;
	Data_send_FFT1 <= {2'b01,Addr_R_FFT1,Data_O_FFT1};
end
end

// 读取ADC2_FFT数据
always @ (posedge clk_R)
if (rst)
begin
   rdy_rfft2<=1'b0;
	Addr_R_FFT2 <= {`NA_FFT{1'b0}};
	ReadEn_Re_FFT2 <= 1'b0;
	ReadEn_Im_FFT2 <= 1'b1;
	Data_send_FFT2 <= {2'b01,Addr_R_FFT2,Data_O_FFT2};
end
else if (ReadFFTEn_ADC2)                   
case ({ReadEn_Re_FFT2, ReadEn_Im_FFT2})
	2'b00 : 
	begin
	   rdy_rfft2<=1'b0;
		Addr_R_FFT2 <= {`NA_FFT{1'b0}};
		ReadEn_Re_FFT2 <= 1'b0;
		ReadEn_Im_FFT2 <= 1'b1;
		Data_send_FFT2 <= {2'b01,Addr_R_FFT2,Data_O_FFT2};
	end
	2'b01 :
	begin
		if (Addr_R_FFT2 >= FFT_Rlength_1)         
		begin                               
			rdy_rfft2<=1'b0;
			Addr_R_FFT2 <= {`NA_FFT{1'b0}};
			ReadEn_Re_FFT2 <= 1'b1;
			ReadEn_Im_FFT2 <= 1'b0;
			Data_send_FFT2 <= {2'b10,Addr_R_FFT2,Data_O_FFT2};
		end
		else
		begin
			rdy_rfft2<=1'b0;
			Addr_R_FFT2 <= Addr_R_FFT2 + 1'b1;
			ReadEn_Re_FFT2 <= 1'b0;
			ReadEn_Im_FFT2 <= 1'b1;
			Data_send_FFT2 <= {2'b01,Addr_R_FFT2,Data_O_FFT2};
		end
	end
	2'b10 :
	begin
		if (Addr_R_FFT2 >= FFT_Rlength_1)
		begin
			rdy_rfft2<=1'b1;
			Addr_R_FFT2 <= Addr_R_FFT2;
			ReadEn_Re_FFT2 <= ReadEn_Re_FFT2;
			ReadEn_Im_FFT2 <= ReadEn_Im_FFT2;
			Data_send_FFT2 <= Data_send_FFT2;
		end
		else
		begin
			rdy_rfft2<=1'b0;
			Addr_R_FFT2 <= Addr_R_FFT2 + 1'b1;
			ReadEn_Re_FFT2 <= 1'b1;
			ReadEn_Im_FFT2 <= 1'b0;
			Data_send_FFT2 <= {2'b10,Addr_R_FFT2,Data_O_FFT2};
		end
	end
	default:
	begin
		rdy_rfft2<=1'b0;
		Addr_R_FFT2 <= {`NA_FFT{1'b0}};
		ReadEn_Re_FFT2 <= 1'b0;
		ReadEn_Im_FFT2 <= 1'b1;
		Data_send_FFT2 <= {2'b01,Addr_R_FFT2,Data_O_FFT2};
	end
endcase	
else
begin
	rdy_rfft2<=1'b0;
	Addr_R_FFT2 <= {`NA_FFT{1'b0}};
	ReadEn_Re_FFT2 <= 1'b0;
	ReadEn_Im_FFT2 <= 1'b1;
	Data_send_FFT2 <= {2'b01,Addr_R_FFT2,Data_O_FFT2};
end


/* 
//原程序
//读出ADC1_FFT数据
always @ (posedge clk_R) Addr_R_FFT1_D <= Addr_R_FFT1;      

always @ (posedge clk_R)
begin
if (rst)
begin
   rdy_rfft1<=1'b0;
	Addr_R_FFT1 <= {`NA_FFT{1'b0}};             
	ReadEn_Re_FFT1 <= 1'b0;
	ReadEn_Im_FFT1 <= 1'b1;
	Data_send_FFT1 <= 28'h0000000;
end
else if (ReadFFTEn_ADC1)                      
case ({ReadEn_Re_FFT1, ReadEn_Im_FFT1})
	2'b00 : 
	begin
	   rdy_rfft1<=1'b0;
		Addr_R_FFT1 <= {`NA_FFT{1'b0}};
		ReadEn_Re_FFT1 <= 1'b0;
		ReadEn_Im_FFT1 <= 1'b1;
		Data_send_FFT1 <= 28'h0000000;
	end
	2'b01 :                                                    
	begin
		if (Addr_R_FFT1 >= FFT_Rlength)               
		begin
		   rdy_rfft1<=1'b0;
			Addr_R_FFT1 <= {`NA_FFT{1'b0}};
			ReadEn_Re_FFT1 <= 1'b1;
			ReadEn_Im_FFT1 <= 1'b0;
			Data_send_FFT1 <= {2'b00,Addr_R_FFT1_D,Data_O_FFT1};     
		end
		else if (Addr_R_FFT1 == 8'd0)
		begin
		   rdy_rfft1<=1'b0;
			Addr_R_FFT1 <= Addr_R_FFT1 + 1'b1;
			ReadEn_Re_FFT1 <= 1'b0;
			ReadEn_Im_FFT1 <= 1'b1;
			Data_send_FFT1 <= {2'b10,Addr_R_FFT1_D,Data_O_FFT1};           
		end
		else
		begin
		   rdy_rfft1<=1'b0;
			Addr_R_FFT1 <= Addr_R_FFT1 + 1'b1;
			ReadEn_Re_FFT1 <= 1'b0;
			ReadEn_Im_FFT1 <= 1'b1;
			Data_send_FFT1 <= {2'b00,Addr_R_FFT1_D,Data_O_FFT1};
		end
	end
	2'b10 :                                                            
	begin
		if (Addr_R_FFT1 >= FFT_Rlength)   
		begin
		   rdy_rfft1<=1'b1;
			Addr_R_FFT1 <= {`NA_FFT{1'b0}};
			ReadEn_Re_FFT1 <= 1'b0;
			ReadEn_Im_FFT1 <= 1'b1;
			Data_send_FFT1 <= {2'b10,Addr_R_FFT1_D,Data_O_FFT1};
		end
		else if (Addr_R_FFT1 ==8'd0)
		begin
		   rdy_rfft1<=1'b0;
			Addr_R_FFT1 <= Addr_R_FFT1 + 1'b1;
			ReadEn_Re_FFT1 <= 1'b1;
			ReadEn_Im_FFT1 <= 1'b0;
			Data_send_FFT1 <= {2'b00,Addr_R_FFT1_D,Data_O_FFT1};
		end
		else
		begin
		   rdy_rfft1<=1'b0;
			Addr_R_FFT1 <= Addr_R_FFT1 + 1'b1;
			ReadEn_Re_FFT1 <= 1'b1;
			ReadEn_Im_FFT1 <= 1'b0;
			Data_send_FFT1 <= {2'b10,Addr_R_FFT1_D,Data_O_FFT1};
		end
	end
	default :
	begin
	   rdy_rfft1<=1'b0;
		Addr_R_FFT1 <= {`NA_FFT{1'b0}};
		ReadEn_Re_FFT1 <= 1'b0;
		ReadEn_Im_FFT1 <= 1'b1;
		Data_send_FFT1 <= 28'h0000000;
	end
endcase	
else
begin
   rdy_rfft1<=1'b0;
	Addr_R_FFT1 <= {`NA_FFT{1'b0}};    
	ReadEn_Re_FFT1 <= 1'b0;
	ReadEn_Im_FFT1 <= 1'b1;
	Data_send_FFT1 <= 28'h0000000;
end
end

// 读取ADC2_FFT数据
always @ (posedge clk_R) Addr_R_FFT2_D <= Addr_R_FFT2;
always @ (posedge clk_R)
if (rst)
begin
   rdy_rfft2<=1'b0;
	Addr_R_FFT2 <= {`NA_FFT{1'b0}};
	ReadEn_Re_FFT2 <= 1'b0;
	ReadEn_Im_FFT2 <= 1'b1;
	Data_send_FFT2 <= 28'h0000000;
end
else if (ReadFFTEn_ADC2)                   
case ({ReadEn_Re_FFT2, ReadEn_Im_FFT2})
	2'b00 : 
	begin
	   rdy_rfft2<=1'b0;
		Addr_R_FFT2 <= {`NA_FFT{1'b0}};
		ReadEn_Re_FFT2 <= 1'b0;
		ReadEn_Im_FFT2 <= 1'b1;
		Data_send_FFT2 <= 28'h0000000;
	end
	2'b01 :
	begin
		if (Addr_R_FFT2 >= FFT_Rlength_1)         
		begin                               
			rdy_rfft2<=1'b0;
			Addr_R_FFT2 <= {`NA_FFT{1'b0}};
			ReadEn_Re_FFT2 <= 1'b1;
			ReadEn_Im_FFT2 <= 1'b0;
			Data_send_FFT2 <= {2'b00,Addr_R_FFT2_D,Data_O_FFT2};
		end
		else if (Addr_R_FFT2 == 8'd0)
		begin
			rdy_rfft2<=1'b0;
			Addr_R_FFT2 <= Addr_R_FFT2 + 1'b1;
			ReadEn_Re_FFT2 <= 1'b0;
			ReadEn_Im_FFT2 <= 1'b1;
			Data_send_FFT2 <= {2'b10,Addr_R_FFT2_D,Data_O_FFT2};
		end
		else
		begin
			rdy_rfft2<=1'b0;
			Addr_R_FFT2 <= Addr_R_FFT2 + 1'b1;
			ReadEn_Re_FFT2 <= 1'b0;
			ReadEn_Im_FFT2 <= 1'b1;
			Data_send_FFT2 <= {2'b00,Addr_R_FFT2_D,Data_O_FFT2};
		end
	end
	2'b10 :
	begin
		if (Addr_R_FFT2 >= FFT_Rlength_1)
		begin
			rdy_rfft2<=1'b1;
			Addr_R_FFT2 <= {`NA_FFT{1'b0}};
			ReadEn_Re_FFT2 <= 1'b0;
			ReadEn_Im_FFT2 <= 1'b1;
			Data_send_FFT2 <= {2'b10,Addr_R_FFT2_D,Data_O_FFT2};
		end
		else if (Addr_R_FFT2 == 3'b000)
		begin
			rdy_rfft2<=1'b0;
			Addr_R_FFT2 <= Addr_R_FFT2 + 1'b1;
			ReadEn_Re_FFT2 <= 1'b1;
			ReadEn_Im_FFT2 <= 1'b0;
			Data_send_FFT2 <= {2'b00,Addr_R_FFT2_D,Data_O_FFT2};
		end
		else
		begin
			rdy_rfft2<=1'b0;
			Addr_R_FFT2 <= Addr_R_FFT2 + 1'b1;
			ReadEn_Re_FFT2 <= 1'b1;
			ReadEn_Im_FFT2 <= 1'b0;
			Data_send_FFT2 <= {2'b10,Addr_R_FFT2_D,Data_O_FFT2};
		end
	end
	default:
	begin
		rdy_rfft2<=1'b0;
		Addr_R_FFT2 <= {`NA_FFT{1'b0}};
		ReadEn_Re_FFT2 <= 1'b0;
		ReadEn_Im_FFT2 <= 1'b1;
		Data_send_FFT2 <= 28'h0000000;
	end
endcase	
else
begin
	rdy_rfft2<=1'b0;
	Addr_R_FFT2 <= {`NA_FFT{1'b0}};
	ReadEn_Re_FFT2 <= 1'b0;
	ReadEn_Im_FFT2 <= 1'b1;
	Data_send_FFT2 <= 28'h0000000;
end
*/

endmodule
