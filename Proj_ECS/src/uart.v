//////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    uart
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////

module uart(
			input clk_25m,	//25MHz
			input rst,	
			input uart_rx,		
			output uart_tx,		
         //发送的数据
			input [7:0] DataTX_1,	 
			input [7:0] DataTX_2,	 
			input [7:0] DataTX_3,	 
			input [7:0] DataTX_4,	 
			input  EnTxData,		
			//接收的数据
			output  RX_rdy,		
			output [7:0] DataRX_1,	
			output [7:0] DataRX_2,	
			output [7:0] DataRX_3,	
			output [7:0] DataRX_4,	
			output [7:0] DataRX_5 	
		);															

wire bps_start1;	
wire clk_bps1;		
wire[7:0] rxdb;	
wire rxen;		
	

speed_setting		speed_rx(	
							.clk(clk_25m),	
							.rst(rst),
							.bps_start(bps_start1),
							.clk_bps(clk_bps1)
						);


my_uart_rx			my_uart_rx(		
							.clk(clk_25m),	
							.rst(rst),
							.uart_rx(uart_rx),
							.rx_data(rxdb),
							.rx_rdy(rxen),            //rx_rdy表示单字节接收完成信号
							.clk_bps(clk_bps1),
							.bps_start(bps_start1)
						);	

//-------------------------------------		
rx_bridge		uut_rx_bridge(
					.clk(clk_25m), 
					.rst(rst), 
					.rxen(rxen),	                //rxen接	my_uart_rx中的单字节接收完成信号
					.rxdb(rxdb),				
					.RX_rdy(RX_rdy),               //RX_rdy表示5个字节接收完成信号
					.Data1(DataRX_1),	 
					.Data2(DataRX_2),	 
					.Data3(DataRX_3),	 
					.Data4(DataRX_4),	 
					.Data5(DataRX_5)	 			
				    );
						
	
//-------------------------------------
wire[7:0] txdb;	
wire txen;  

tx_bridge	uut_tx_bridge(
				.clk(clk_25m), 
				.rst(rst), 
				.EnTxData(EnTxData),   
				.Data1(DataTX_1),      
				.Data2(DataTX_2),      
				.Data3(DataTX_3),      
				.Data4(DataTX_4),		  
				.txen(txen),	
				.txdb(txdb)
			);	
			
//-------------------------------------

wire bps_start2;	
wire clk_bps2;							
										
speed_setting		speed_tx(	
							.clk(clk_25m),	
							.rst(rst),
							.bps_start(bps_start2),
							.clk_bps(clk_bps2)
						);
						
my_uart_tx			my_uart_tx(		
							.clk(clk_25m),	
							.rst(rst),
							.rx_data(txdb),
							.rx_int(txen),       //txen来自tx_bridge ,发送一个字节命令          
							.uart_tx(uart_tx),
							.clk_bps(clk_bps2),
							.bps_start(bps_start2)
						);

endmodule

