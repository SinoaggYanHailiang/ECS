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
				input clk,	// 25MHz����Ƶ��
				input rst,	
				input bps_start,	//�����ʷ�����ʹ�ܶ˿ڣ�1ʹ�ܲ����ʼ�������ʼ����
				output reg clk_bps	// ��Ƶʱ�����Ϊ115200hz   
			);

`define CLK_PERIORD	40	//ʱ������Ϊ40ns(25MHz)
`define BPS_SET		1152	//                           //1000_000_000/'CLK_PREIORD/115200=217��Verilog �С�/��Ϊ��������������ȡ��
`define BPS_PARA	(10_000_000/`CLK_PERIORD/`BPS_SET)    // ������ΪBPS_SETʱ�ķ�Ƶ����ֵ��1000_000_000/'CLK_PREIORD/115200
`define BPS_PARA_2	(`BPS_PARA/2)                      //BPS��Ƶ������һ��
                                                        //2^8=256
reg[12:0] cnt=13'd0;			


always @ (posedge clk or negedge rst)                           //��������always��������γ�ż����Ƶ�����൱��һ��ģ�������һ��ģ��������
begin                                                           //ʱ�ӵķ�ת��ż����Ƶ��N/2-1,������ֵ��N/2ʱ����һ������ʱ��clk_25mhz��Χ�ڣ�
	if(!rst) cnt <= 13'd0;                                       //��40ns�ڣ�����һ�θߵ�ƽ��
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

