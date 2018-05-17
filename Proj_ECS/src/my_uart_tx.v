/////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    my_uart_tx
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
/////////////////////////////////////////////////////////////////////////////

module my_uart_tx(
				input clk,			// 25MHz
				input rst,		//
				input clk_bps,		// 
				input[7:0] rx_data,	//��Ҫ���͵�8λ����
				input rx_int,		//
				output uart_tx,	// 
				output reg bps_start=1'b0	//
			);

//---------------------------------------------------------
reg[7:0] tx_data=8'd0;	//
reg tx_en=1'b0;	//
reg[3:0] num=4'b0;

always @ (posedge clk or negedge rst)      //
	if(!rst) begin
		bps_start <= 1'b0;
		tx_en <= 1'b0;
		tx_data <= 8'd0;
	end
	else if(rx_int) begin	  //����tx_bridge��txen,����һ��Ҫ���͵����ݣ�Ȼ����Ҫ�����湤������һ�����������ʷ��������ڶ���װ��Ҫ���͵����ݣ�����������uart_tx��������
		bps_start <= 1'b1;     //���Ͳ����ʷ�����ʹ���ź�
		tx_data <= rx_data;	 
		tx_en <= 1'b1;		    //���ս�Ҫ���͵��ź� 
	end
	else if(num == 4'd10) begin	 
		bps_start <= 1'b0;
		tx_en <= 1'b0;
	end

//---------------------------------------------------------
reg uart_tx_r=1'b1;

always @ (posedge clk or negedge rst)          
	if(!rst) begin
		num <= 4'd0;
		uart_tx_r <= 1'b1;
	end
	else if(tx_en) begin
		if(clk_bps)	begin                      //115200�����ʷ��͵�Ƶ��                                         
			num <= num+1'b1;
			case (num)
				4'd0: uart_tx_r <= 1'b0; 	      //uart_tx_rĬ��Ϊ�ߵ�ƽ����ʼ�źŽ�������
				4'd1: uart_tx_r <= tx_data[0];	
				4'd2: uart_tx_r <= tx_data[1];	
				4'd3: uart_tx_r <= tx_data[2];	
				4'd4: uart_tx_r <= tx_data[3];	
				4'd5: uart_tx_r <= tx_data[4];	
				4'd6: uart_tx_r <= tx_data[5];	
				4'd7: uart_tx_r <= tx_data[6];	
				4'd8: uart_tx_r <= tx_data[7];	
				4'd9: uart_tx_r <= 1'b1;	      //������־λ
			 	default: uart_tx_r <= 1'b1;
			endcase
		end
		else if(num == 4'd10) num <= 4'd0;	    
	end

assign uart_tx = uart_tx_r;

endmodule


