/////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    tx_brige
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
//////////////////////////////////////////////////////////
//来自Ctr_uart的EnTxData，控制tx_bridge,tx_bridge的txen信号与uart_tx的rx_int连接，控制发送模块的发送单字节数据
//EnTxData控制发送6字节数据，EnTxData经过tx_brige变成txen，连接到rx_int控制uart_tx，rx_int(txen)控制单字节数据发送
//总之，一个EnTxData控制6字节的数据传输
module tx_bridge(
			input clk,		
			input rst,	
			input EnTxData,          //该信号为控制本模块的关键信号，来自Ctr_uart模块  
			input[7:0] Data1,	        
			input[7:0] Data2,	    
			input[7:0] Data3,	   
			input[7:0] Data4,		
			output reg txen,		    //该信号为控制my_uart_tx的关键信号
			output reg[7:0] txdb	
		);		
		
//-------------------------------------
reg [27:0] Data_r=28'd0;	//合并Data1, Data2, Data3, Data4
reg [7:0]  Data5_r=8'd0;  // Data1, Data2, Data3, Data4进行异或操作，用于校验

always @ (posedge clk) 
begin
	Data_r <= {Data1, Data2, Data3, Data4};
	Data5_r <= Data1 ^ Data2 ^ Data3 ^ Data4;
end	

//-------------------------------------
//count_clk_ADC_R 21位对50mhz分频
//fcnt 20位对25mhz分频，
//即控制一个周期，fcnt运行一周
reg[19:0] fcnt=20'd0;  //reg寄存器必须赋给初始值	
always @ (posedge clk)	
	if(~rst) fcnt <= {20{1'b0}};
	else if (fcnt == {20{1'b0}})
		if(EnTxData) fcnt <= fcnt+1'b1;        //只有EnTxdata来一个有效输入信号之后才能进入计数循环
		else fcnt <= {20{1'b0}};
	else  fcnt <= fcnt+1'b1;

	//每隔2ms产生一个数据发送字节                 //1/115200=8.68us,发送10位需要10*8.68us=86.8us
always @ (posedge clk)	                    //信号传输能力为115200hz
	if(~rst) begin
		txen <= 1'b0;
		txdb <= 8'd0;
	end
	else begin	//产生发送的数据
		case(fcnt)
			20'd50_000: begin	// 发送报头: 0xaa     FPGA告诉电脑开始发送采集的数据了  
				txen <= 1'b1;	//0xaa=2'b1010_1010  发送10字节数据需要10*217=2170个时钟信号，所以计数50000足够  
				txdb <= 8'haa;
			end
			20'd100_000: begin	// 发送Data1
				txen <= 1'b1;	
				txdb <= Data1;
			end
			20'd150_000: begin	// 发送Data2
				txen <= 1'b1;
				txdb <= Data2;				
			end
			20'd200_000: begin	// 发送Data3
				txen <= 1'b1;	
				txdb <= Data3;
			end
			20'd250_000: begin	// 发送Data4
				txen <= 1'b1;	
				txdb <= Data4;
			end
			20'd300_000: begin	// 发送Data5     实际是发送了5字节内容
				txen <= 1'b1;
				txdb <= Data5_r;				
			end 	
			default: begin	
				txen <= 1'b0;
				txdb <= 8'd0;			
			end	
		endcase
	end

	
endmodule

