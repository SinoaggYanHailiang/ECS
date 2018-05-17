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
//����Ctr_uart��EnTxData������tx_bridge,tx_bridge��txen�ź���uart_tx��rx_int���ӣ����Ʒ���ģ��ķ��͵��ֽ�����
//EnTxData���Ʒ���6�ֽ����ݣ�EnTxData����tx_brige���txen�����ӵ�rx_int����uart_tx��rx_int(txen)���Ƶ��ֽ����ݷ���
//��֮��һ��EnTxData����6�ֽڵ����ݴ���
module tx_bridge(
			input clk,		
			input rst,	
			input EnTxData,          //���ź�Ϊ���Ʊ�ģ��Ĺؼ��źţ�����Ctr_uartģ��  
			input[7:0] Data1,	        
			input[7:0] Data2,	    
			input[7:0] Data3,	   
			input[7:0] Data4,		
			output reg txen,		    //���ź�Ϊ����my_uart_tx�Ĺؼ��ź�
			output reg[7:0] txdb	
		);		
		
//-------------------------------------
reg [27:0] Data_r=28'd0;	//�ϲ�Data1, Data2, Data3, Data4
reg [7:0]  Data5_r=8'd0;  // Data1, Data2, Data3, Data4����������������У��

always @ (posedge clk) 
begin
	Data_r <= {Data1, Data2, Data3, Data4};
	Data5_r <= Data1 ^ Data2 ^ Data3 ^ Data4;
end	

//-------------------------------------
//count_clk_ADC_R 21λ��50mhz��Ƶ
//fcnt 20λ��25mhz��Ƶ��
//������һ�����ڣ�fcnt����һ��
reg[19:0] fcnt=20'd0;  //reg�Ĵ������븳����ʼֵ	
always @ (posedge clk)	
	if(~rst) fcnt <= {20{1'b0}};
	else if (fcnt == {20{1'b0}})
		if(EnTxData) fcnt <= fcnt+1'b1;        //ֻ��EnTxdata��һ����Ч�����ź�֮����ܽ������ѭ��
		else fcnt <= {20{1'b0}};
	else  fcnt <= fcnt+1'b1;

	//ÿ��2ms����һ�����ݷ����ֽ�                 //1/115200=8.68us,����10λ��Ҫ10*8.68us=86.8us
always @ (posedge clk)	                    //�źŴ�������Ϊ115200hz
	if(~rst) begin
		txen <= 1'b0;
		txdb <= 8'd0;
	end
	else begin	//�������͵�����
		case(fcnt)
			20'd50_000: begin	// ���ͱ�ͷ: 0xaa     FPGA���ߵ��Կ�ʼ���Ͳɼ���������  
				txen <= 1'b1;	//0xaa=2'b1010_1010  ����10�ֽ�������Ҫ10*217=2170��ʱ���źţ����Լ���50000�㹻  
				txdb <= 8'haa;
			end
			20'd100_000: begin	// ����Data1
				txen <= 1'b1;	
				txdb <= Data1;
			end
			20'd150_000: begin	// ����Data2
				txen <= 1'b1;
				txdb <= Data2;				
			end
			20'd200_000: begin	// ����Data3
				txen <= 1'b1;	
				txdb <= Data3;
			end
			20'd250_000: begin	// ����Data4
				txen <= 1'b1;	
				txdb <= Data4;
			end
			20'd300_000: begin	// ����Data5     ʵ���Ƿ�����5�ֽ�����
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

