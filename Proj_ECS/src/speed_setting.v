/////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    speed_setting
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
/////////////////////////////////////////////////////////////////////////////

module speed_setting(
				input clk,	// 25MHz输入频率
				input rst,	
				input bps_start,	//波特率发生器使能端口，1使能波特率计数器开始计数
				output reg clk_bps	// 分频时钟输出为115200hz   
			);

`define CLK_PERIORD	40	//时钟周期为40ns(25MHz)
`define BPS_SET		1152	//                           //1000_000_000/'CLK_PREIORD/115200=217，Verilog 中“/”为整除运算符，结果取整
`define BPS_PARA	(10_000_000/`CLK_PERIORD/`BPS_SET)    // 波特率为BPS_SET时的分频计数值，1000_000_000/'CLK_PREIORD/115200
`define BPS_PARA_2	(`BPS_PARA/2)                      //BPS分频计数的一半
                                                        //2^8=256
reg[12:0] cnt=13'd0;			


always @ (posedge clk or negedge rst)                           //以下两个always语句用于形成偶数分频器，相当于一个模块计数，一个模块控制输出
begin                                                           //时钟的翻转，偶数分频是N/2-1,当计数值到N/2时，在一个输入时钟clk_25mhz范围内，
	if(!rst) cnt <= 13'd0;                                       //即40ns内，出现一次高电平。
	else if((cnt == `BPS_PARA) || !bps_start) cnt <= 13'd0;	
	else cnt <= cnt+1'b1;			
end

always @ (posedge clk or negedge rst) 
begin                  
	if(!rst) clk_bps <= 1'b0;
	else if(cnt == `BPS_PARA_2) clk_bps <= 1'b1;	
	else clk_bps <= 1'b0;
end
	
endmodule

