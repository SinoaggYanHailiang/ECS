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
				input clk_bps,	// 等同于25MHz时钟经过分频，即clk_bps=115200
				output reg bps_start,		// 波特率启动和复位，高电平有效
				output reg[7:0] rx_data,	//
				output reg rx_rdy	//串口接收8位数据完成标志位，1接收数据完成，0代表接正在接收数据
			);

//----------------------------------------------------------------
//本部分将接收来的信号进行滤波

reg uart_rx0=0,uart_rx1=0,uart_rx2=0,uart_rx3=0;	//用来滤波
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

	
assign neg_uart_rx = uart_rx3 & uart_rx2 & ~uart_rx1 & ~uart_rx0;	//低电平为UART协议开始信号，接收到起始位后，下一个时钟开始就接收有效数据信号
                                                                  //相当于低电平选取信号
//----------------------------------------------------------------
reg[3:0] num=4'd0;	//记录接收串口的串行数据的位数
reg rx_int=1'b0;		//等于 rx_int=1表示检测到串口数据起始信号，需要开始接收数据了

always @ (posedge clk or negedge rst)
begin
	if(!rst) begin
		bps_start <= 1'b0;
		rx_int <= 1'b0;
		rx_rdy <= 1'b0;
	end
	else if(neg_uart_rx) begin		// 检测到下降沿，波特率发生器启动，接收开始信号置1
		bps_start <= 1'b1;	          
		rx_int <= 1'b1;			     
	end
	else if(num == 4'd9) begin		//接收完成一字节数据后，波特率发生器关闭，接收开始信号置0，接收完成信号置1
		bps_start <= 1'b0;	      
		rx_int <= 1'b0;			   
		rx_rdy <= 1'b1;            
	end
	else rx_rdy <= 1'b0;          //rx_int表示检测到下降沿之后给出串口开始接收数据，rx_rdy表示接收一个字节的数据之后给出完成接收信号，等待下一个起始信号的到来
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
	else if(rx_int) begin	                 //检测到起始信号，开始接收数据，并且在接收期间一直维持高电平
	if(clk_bps) begin	                       //每隔217个clk_25Mhz出现一次clk_bps,且只能维持一个clk_25Mhz，即clk_bps出现高电平一个周期的频率为115200
			num <= num+1'b1;  //第一次clk_bps时，num=0；第二次clk_bps时，num=1；                 
			case (num)
				4'd1: rx_temp_data[0] <= uart_rx;	//检测到低电平到来之后，bsp_start开始计数，当计数到 第一次 108,num=0,舍弃，因为是输入端起始信号
				4'd2: rx_temp_data[1] <= uart_rx;	//                                           第二次 108+217，num=1才开始真正的记录信号
				4'd3: rx_temp_data[2] <= uart_rx;	//                                           第三次 108+217
				4'd4: rx_temp_data[3] <= uart_rx;	//                                           这样保证了每次在信号的中间进行采样       
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
