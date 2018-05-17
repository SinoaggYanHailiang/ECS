/////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    my_uart_rx
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
/////////////////////////////////////////////////////////////////////////////

module my_uart_rx(
				input clk,		// 25MHz
				input rst,	//
				input uart_rx,	// 
				input clk_bps,	// ��ͬ��25MHzʱ�Ӿ�����Ƶ����clk_bps=115200
				output reg bps_start,		// �����������͸�λ���ߵ�ƽ��Ч
				output reg[7:0] rx_data,	//
				output reg rx_rdy	//���ڽ���8λ������ɱ�־λ��1����������ɣ�0��������ڽ�������
			);

//----------------------------------------------------------------
//�����ֽ����������źŽ����˲�

reg uart_rx0=0,uart_rx1=0,uart_rx2=0,uart_rx3=0;	//�����˲�
wire neg_uart_rx;	//

always @ (posedge clk or negedge rst) 
	if(!rst) begin
		uart_rx0 <= 1'b0;
		uart_rx1 <= 1'b0;
		uart_rx2 <= 1'b0;
		uart_rx3 <= 1'b0;
	end
	else begin
		uart_rx0 <= uart_rx;
		uart_rx1 <= uart_rx0;
		uart_rx2 <= uart_rx1;
		uart_rx3 <= uart_rx2;
	end

	
assign neg_uart_rx = uart_rx3 & uart_rx2 & ~uart_rx1 & ~uart_rx0;	//�͵�ƽΪUARTЭ�鿪ʼ�źţ����յ���ʼλ����һ��ʱ�ӿ�ʼ�ͽ�����Ч�����ź�
                                                                  //�൱�ڵ͵�ƽѡȡ�ź�
//----------------------------------------------------------------
reg[3:0] num=4'd0;	//��¼���մ��ڵĴ������ݵ�λ��
reg rx_int=1'b0;		//���� rx_int=1��ʾ��⵽����������ʼ�źţ���Ҫ��ʼ����������

always @ (posedge clk or negedge rst)
begin
	if(!rst) begin
		bps_start <= 1'b0;
		rx_int <= 1'b0;
		rx_rdy <= 1'b0;
	end
	else if(neg_uart_rx) begin		// ��⵽�½��أ������ʷ��������������տ�ʼ�ź���1
		bps_start <= 1'b1;	          
		rx_int <= 1'b1;			     
	end
	else if(num == 4'd9) begin		//�������һ�ֽ����ݺ󣬲����ʷ������رգ����տ�ʼ�ź���0����������ź���1
		bps_start <= 1'b0;	      
		rx_int <= 1'b0;			   
		rx_rdy <= 1'b1;            
	end
	else rx_rdy <= 1'b0;          //rx_int��ʾ��⵽�½���֮��������ڿ�ʼ�������ݣ�rx_rdy��ʾ����һ���ֽڵ�����֮�������ɽ����źţ��ȴ���һ����ʼ�źŵĵ���
end
//----------------------------------------------------------------
reg[7:0] rx_temp_data;	

always @ (posedge clk or negedge rst)  
begin      
	if(!rst) begin
		rx_temp_data <= 8'd0;
		num <= 4'd0;
		rx_data <= 8'd0;
	end
	else if(rx_int) begin	                 //��⵽��ʼ�źţ���ʼ�������ݣ������ڽ����ڼ�һֱά�ָߵ�ƽ
	if(clk_bps) begin	                       //ÿ��217��clk_25Mhz����һ��clk_bps,��ֻ��ά��һ��clk_25Mhz����clk_bps���ָߵ�ƽһ�����ڵ�Ƶ��Ϊ115200
			num <= num+1'b1;  //��һ��clk_bpsʱ��num=0���ڶ���clk_bpsʱ��num=1��                 
			case (num)
				4'd1: rx_temp_data[0] <= uart_rx;	//��⵽�͵�ƽ����֮��bsp_start��ʼ�������������� ��һ�� 108,num=0,��������Ϊ���������ʼ�ź�
				4'd2: rx_temp_data[1] <= uart_rx;	//                                           �ڶ��� 108+217��num=1�ſ�ʼ�����ļ�¼�ź�
				4'd3: rx_temp_data[2] <= uart_rx;	//                                           ������ 108+217
				4'd4: rx_temp_data[3] <= uart_rx;	//                                           ������֤��ÿ�����źŵ��м���в���       
				4'd5: rx_temp_data[4] <= uart_rx;	
				4'd6: rx_temp_data[5] <= uart_rx;	
				4'd7: rx_temp_data[6] <= uart_rx;	
				4'd8: rx_temp_data[7] <= uart_rx;	
				default:rx_temp_data<=rx_temp_data;                          
			endcase
		end
		else if(num == 4'd9) begin		
			num <= 4'd0;			      
			rx_data <= rx_temp_data;	
	    end
	end
end

endmodule
