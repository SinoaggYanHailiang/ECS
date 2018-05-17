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
1.����DAC8551�ڲ�Ϊ24λ��λ�Ĵ�������Data_1��16λ����˸�λ��Data_0 = 8'b0000_0000����ÿ��24��ʱ������װ��һ�����ݣ�
  ���½���װ�ز���ѭ�����ƣ���λѭ������λ��
2.��������Data_1[15:0]���� 
3.SYNC�͵�ƽ��Ч��SYNC=0,24λ��λ�Ĵ�����ʱ���ź��½��ؼ�¼DIN�����������ݣ�SYNC=1����ʱ���ź��Ӻ��������DIN�źš�
*/
module DAC8551(clk, rst, Data_1, SYNC, DIN); //�������������ģ����

input clk, rst;
input [15:0] Data_1;

output SYNC, DIN;

parameter Data_0 = 8'b0000_0000;  // the last two bits must be 00

reg SYNC=1'b1, DIN=1'b0;
reg [23:0] Data=24'd0;
reg [4:0] Count=5'd0;


// �ж��������޸���
reg [15:0] Data_store=16'd0;
reg q=1'b0;

always @(posedge clk)   //�����ӳ�
  begin
     Data_store<=Data_1;
  end
always @(posedge clk)   //�ж��������ޱ仯
  begin
    if(rst) q<=1'b0;
	 else if(Data_store != Data_1) q<=1;
	 else q<=0;	   
  end


//����״̬��
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
		      Data <= {Data_0, Data_1};  //װ������
			 end
		  updatedata:
		    begin
			   DIN <= Data[23];
		      Count <= Count + 1'b1;
		      SYNC <= 1'b0;                               
		      Data <= {Data[22:0], Data[23]};   //��λ����
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
		SYNC <= 1'b1;                             //װ���������֮�󣬹ر���λ�Ĵ������롣
		Data <= {Data_0, Data_1};
	end
	else if (Count <= 5'b1_1000)
	begin
		DIN <= Data[23];
		Count <= Count + 1'b1;
		SYNC <= 1'b0;                             //24��ʱ������֮�󣬴���λ�Ĵ�������  
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
