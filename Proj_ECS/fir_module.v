`timescale 1ns / 1ps


module fir_module(
input rst,
input clk,         //用的时钟和ADC时钟一样子
input [13:0] din,
input [3:0] count_coe,     
input [3:0] coe,
output reg [22:0] dout=23'd0
);

reg [3:0] h0=4'd0;  //真正的系数
reg [3:0] h1=4'd0;
reg [3:0] h2=4'd0;
reg [3:0] h3=4'd0;
reg [3:0] h4=4'd7;
reg [3:0] h5=4'd7;
reg [3:0] h6=4'd7;
reg [3:0] h7=4'd0;
reg [3:0] h8=4'd0;
reg [3:0] h9=4'd0;
reg [3:0] h10=4'd0;

reg [3:0] mem_h0=4'd0;  //系数中间值
reg [3:0] mem_h1=4'd0;
reg [3:0] mem_h2=4'd0;
reg [3:0] mem_h3=4'd0;
reg [3:0] mem_h4=4'd0;
reg [3:0] mem_h5=4'd0;
reg [3:0] mem_h6=4'd0;
reg [3:0] mem_h7=4'd0;
reg [3:0] mem_h8=4'd0;
reg [3:0] mem_h9=4'd0;
reg [3:0] mem_h10=4'd0;



reg [13:0] mem [10:0];    //延迟数据

//**************************************************
//记录coe系数的更新的中间状态
always @(posedge clk)
  begin
    if(!rst)
      begin
        mem_h0=4'd0;
		  mem_h1=4'd0;
		  mem_h2=4'd0;
		  mem_h3=4'd0;
		  mem_h4=4'd0;
		  mem_h5=4'd0;
		  mem_h6=4'd0;
		  mem_h7=4'd0;
		  mem_h8=4'd0;
		  mem_h9=4'd0;
		  mem_h10=4'd0;
		end
	 else
	   begin
		  case(count_coe)
		  4'd0:begin
		         mem_h0=coe;
			    end
		  4'd1:begin
		         mem_h1=coe;
			    end
		  4'd2:begin
		         mem_h2=coe;
			    end
		  4'd3:begin
		         mem_h3=coe;
			    end
		  4'd4:begin
		         mem_h4=coe;
			    end
		  4'd5:begin
		         mem_h5=coe;
			    end
		  4'd6:begin
		         mem_h6=coe;
			    end
		  4'd7:begin
		         mem_h7=coe;
			    end
		  4'd8:begin
		         mem_h8=coe;
			    end
		  4'd9:begin
		         mem_h9=coe;
			    end
		  4'd10:begin
		         mem_h10=coe;
			     end
		  
		  default:begin
		            mem_h0=mem_h0;
		            mem_h1=mem_h1;
		            mem_h2=mem_h2;
		            mem_h3=mem_h3;
		            mem_h4=mem_h4;
		            mem_h5=mem_h5;
		            mem_h6=mem_h6;
						mem_h7=mem_h7;
		            mem_h8=mem_h8;
		            mem_h9=mem_h9;
		            mem_h10=mem_h10;
					 end
		  endcase
		end
  end
  
//****************************************************************
//当coe更新完毕后，可以更新全部数据，一次性
always @(posedge clk)
  begin
    if(!rst)
	   begin
		  h0=4'd0;
		  h1=4'd0;
		  h2=4'd0;
		  h3=4'd0;
		  h4=4'd7;
		  h5=4'd7;
		  h6=4'd7;
		  h7=4'd0;
		  h8=4'd0;
		  h9=4'd0;
		  h10=4'd0;
		end
	 else if(count_coe==4'd11) //当计数到11时，说明coe已经更新完毕，所以全部更新
	   begin
		  h0=mem_h0;
		  h1=mem_h1;
		  h2=mem_h2;
		  h3=mem_h3;
		  h4=mem_h4;
		  h5=mem_h5;
		  h6=mem_h6;
		  h7=mem_h7;
		  h8=mem_h8;
		  h9=mem_h9;
		  h10=mem_h10;
		end
	 else 
	   begin
		  h0=h0;
		  h1=h1;
		  h2=h2;
		  h3=h3;
		  h4=h4;
		  h5=h5;
		  h6=h6;
		  h7=h7;
		  h8=h8;
		  h9=h9;
		  h10=h10;
		end
  end

//******************************************************************
//输入数据延迟
always @(posedge clk )
  begin
    if(!rst)
	   begin
		  mem[0]<=14'd0;
		  mem[1]<=14'd0;
		  mem[2]<=14'd0;
		  mem[3]<=14'd0;
		  mem[4]<=14'd0;
		  mem[5]<=14'd0;
		  mem[6]<=14'd0;
		  mem[7]<=14'd0;
		  mem[8]<=14'd0;
		  mem[9]<=14'd0;
		  mem[10]<=14'd0;
		end
	 else
	   begin
		  mem[0]<=din;
		  mem[1]<=mem[0];
		  mem[2]<=mem[1];
		  mem[3]<=mem[2];
		  mem[4]<=mem[3];
		  mem[5]<=mem[4];
		  mem[6]<=mem[5];
		  mem[7]<=mem[6];
		  mem[8]<=mem[7];
		  mem[9]<=mem[8];
		  mem[10]<=mem[9];
		end
  end 

//***********************************************************************************888  
//利用移位相加实现的乘法器实现乘法

wire [17:0] fltd0,fltd1,fltd2,fltd3,fltd4,fltd5,fltd6,fltd7,fltd8,fltd9,fltd10;  //改为reg类型

/*
assign fltd0=mem[0]*h0;
assign fltd1=mem[1]*h1;
assign fltd2=mem[2]*h2;
assign fltd3=mem[3]*h3;
assign fltd4=mem[4]*h4;
assign fltd5=mem[5]*h5;
assign fltd6=mem[6]*h6;
assign fltd7=mem[7]*h7;
assign fltd8=mem[8]*h8;
assign fltd9=mem[9]*h9;
assign fltd10=mem[10]*h10;

*/


fir_mult m0(
    .rst(rst), 
    .clk(clk), 
    .data(mem[0]), 
    .coe(h0), 
    .fltd(fltd0)
    ); 

fir_mult m1 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[1]), 
    .coe(h1), 
    .fltd(fltd1)
    );
	 
fir_mult m2 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[2]), 
    .coe(h2), 
    .fltd(fltd2)
    ); 

fir_mult m3 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[3]), 
    .coe(h3), 
    .fltd(fltd3)
    );
	 
fir_mult m4 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[4]), 
    .coe(h4), 
    .fltd(fltd4)
    ); 
  
fir_mult m5 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[5]), 
    .coe(h5), 
    .fltd(fltd5)
    );
	 
fir_mult m6 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[6]), 
    .coe(h6), 
    .fltd(fltd6)
    );   

fir_mult m7 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[7]), 
    .coe(h7), 
    .fltd(fltd7)
    ); 
	 
fir_mult m8 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[8]), 
    .coe(h8), 
    .fltd(fltd8)
    );  
	 
fir_mult m9 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[9]), 
    .coe(h9), 
    .fltd(fltd9)
    );  
	 
fir_mult m10 (
    .rst(rst), 
    .clk(clk), 
    .data(mem[10]), 
    .coe(h10), 
    .fltd(fltd10)
    );      

//********************************************************************
//滤波系数和延迟相乘
always @(posedge clk)
  begin
    if(!rst) 
	   begin
		  dout<=23'd0;
		end
    else
	   begin
		  dout<=fltd0+fltd1+fltd2+fltd3+fltd4+fltd5+fltd6+fltd7+fltd8+fltd9+fltd10;
		end
  end

endmodule 