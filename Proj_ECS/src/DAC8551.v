`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    DAC8551
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////////////////////////////
/*
1.由于DAC8551内部为24位移位寄存器，而Data_1是16位，因此高位补Data_0 = 8'b0000_0000，即每过24个时钟周期装载一次数据，
  在下降沿装载并且循环左移，高位循环到低位。
2.输入数据Data_1[15:0]来自 
3.SYNC低电平有效，SYNC=0,24位移位寄存器在时钟信号下降沿记录DIN输入数据数据；SYNC=1，在时钟信号延忽略输入端DIN信号。
*/
module DAC8551(clk, rst, Data_1, SYNC, DIN); //输入数字量输出模拟量

input clk, rst;
input [15:0] Data_1;

output SYNC, DIN;

parameter Data_0 = 8'b0000_0000;  // the last two bits must be 00

reg SYNC=1'b1, DIN=1'b0;
reg [23:0] Data=24'd0;
reg [4:0] Count=5'd0;


// 判断数据有无更新
reg [15:0] Data_store=16'd0;
reg q=1'b0;

always @(posedge clk)   //数据延迟
  begin
     Data_store<=Data_1;
  end
always @(posedge clk)   //判断数据有无变化
  begin
    if(rst) q<=1'b0;
	 else if(Data_store != Data_1) q<=1;
	 else q<=0;	   
  end


//三段状态机
parameter loaddata=2'b00;
parameter updatedata=2'b01;
parameter waitchange=2'b10;
reg [1:0] currentstate=2'b00,nextstate=2'b00;

always @(posedge clk)
  begin
    if(rst) currentstate<=loaddata;
	 else currentstate<=nextstate;
  end

always @(*)
  begin
    if(rst) 
	   begin
	     nextstate=loaddata;
		end
	 else
	   begin
		  case(currentstate)
		  loaddata:begin
		             nextstate=updatedata;
		           end
		  updatedata:begin
		               if(Count<=5'd24) nextstate=updatedata;
							else nextstate=waitchange;
						 end
		  waitchange:begin
		             if(q == 1) nextstate=loaddata;
						 else nextstate=waitchange;
					    end
		  default:begin
		            nextstate=loaddata;
		          end
		  endcase
		end
  end

always @(posedge clk)
  begin
    if(rst)
	   begin
		  DIN <= 1'b0;
		  Count <= 5'b0_0000;
		  SYNC <= 1'b1;
		  Data <= {24{1'b0}};
		end
	 else
	   begin
		  case(currentstate)
		  loaddata:
		    begin
			   DIN <= 1'b0;
		      Count <= Count + 1'b1;
		      SYNC <= 1'b1;                             
		      Data <= {Data_0, Data_1};  //装载数据
			 end
		  updatedata:
		    begin
			   DIN <= Data[23];
		      Count <= Count + 1'b1;
		      SYNC <= 1'b0;                               
		      Data <= {Data[22:0], Data[23]};   //移位数据
			 end
		  waitchange:
		    begin
			   DIN <= 1'b0;
		      Count <= 5'b0_0000;
		      SYNC <= 1'b1;
		      Data <= Data;
			 end
		  default:
		    begin
			   DIN <= 1'b0;
		      Count <= 5'b0_0000;
		      SYNC <= 1'b1;
		      Data <= Data;
			 end
		  endcase
		end
  
  end


/*		  
always @ (posedge clk)
	if (rst)
	begin
		DIN <= 1'b0;
		Count <= 5'b0_0000;
		SYNC <= 1'b1;
		Data <= {24{1'b0}};
	end
	else if (Count == 5'b0_0000)
	begin
		DIN <= 1'b0;
		Count <= Count + 1'b1;
		SYNC <= 1'b1;                             //装载完成数据之后，关闭移位寄存器输入。
		Data <= {Data_0, Data_1};
	end
	else if (Count <= 5'b1_1000)
	begin
		DIN <= Data[23];
		Count <= Count + 1'b1;
		SYNC <= 1'b0;                             //24个时钟周期之后，打开移位寄存器输入  
		Data <= {Data[22:0], Data[23]};          
	end
	else 
	begin
		DIN <= 1'b0;
		Count <= 5'b0_0000;
		SYNC <= 1'b1;
		Data <= Data;
	end
*/		  
		  
endmodule
