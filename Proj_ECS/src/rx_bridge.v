/////////////////////////////////////////////////////////////////////////////
// Company: NUDT
// Engineer: Cang Liu & Yujin Huang
// E-mail : liucang@nudt.edu.cn
// Create Date:    15:51:31 07/25/2016 
// Design Name: 
// Module Name:    rx_brige
// Project Name:   Electrochemical Workstation
// Target Devices:  Spartan6
/////////////////////////////////////////////////////////////////////////////

//接收过程通过三段状态机表示

module rx_bridge(clk,rst,rxen,rxdb,RX_rdy,
				Data1,Data2,Data3,Data4,Data5			
				);		

input clk;
input rst;	
input rxen;		   //关键控制信号1，接收有效信号,即不断有接收完成的信号输送过来
input[7:0] rxdb;	//关键控制信号2，输入串口接收的8位数据,当接收到的数据为8'haa=8'b1010_1010时，收到命令标志符号时，进入状态机运行状态

output  RX_rdy;		//
output [7:0] Data1; // Data1
output [7:0] Data2; // Data2
output [7:0] Data3; // Data3
output [7:0] Data4; // Data4
output [7:0] Data5; // Data5		
//-------------------------------------
//
parameter 	WIDLE = 4'd0;	//
parameter	WRXAA = 4'd1;	//
parameter	WRXD1 = 4'd2;	//-Data1
parameter	WRXD2 = 4'd3;	//-Data2
parameter	WRXD3 = 4'd4;	//-Data3
parameter	WRXD4 = 4'd5;	//-Data4
parameter	WRXD5 = 4'd6;	//-Data5
//
reg RX_rdy=1'b0;		
reg[7:0] Data1= 8'h00;	
reg[7:0] Data2= 8'h00;	
reg[7:0] Data3= 8'h00;	
reg[7:0] Data4= 8'h00;	
reg[7:0] Data5= 8'h00;

reg[3:0] cstate=4'd0,nstate=4'd0;   //reg类型必须赋给初始值	
		
always @(posedge clk)              //状态机指针运行
	if(!rst) cstate <= WIDLE;
	else cstate <= nstate;

	
always @(*)                        
begin
	case(cstate)                                         
		WIDLE: begin	                                  
			if(rxen && (rxdb == 8'haa)) nstate <= WRXAA; // 每次出现该信号则进入到该循环
				                                          
			else nstate <= WIDLE;                        
		end                                             
		WRXAA: begin
			if(rxen) nstate <= WRXD1;
			else nstate <= WRXAA;
		end
		WRXD1: begin
			if(rxen) nstate <= WRXD2;
			else nstate <= WRXD1;		
		end
		WRXD2: begin
			if(rxen) nstate <= WRXD3;
			else nstate <= WRXD2;		
		end
		WRXD3: begin	
			if(rxen) nstate <= WRXD4;
			else nstate <= WRXD3;			
		end
		WRXD4: begin	
			if(rxen) nstate <= WRXD5;
			else nstate <= WRXD4;			
		end
		/*
		WRXD5: begin	
		  //if(rxen) nstate <= WIDLE;   //当循环到该处时，循环停止，但是当下一个AA和rxen到来时，循环会再次启动
        //else nstate <=WRXD5; 
        nstate<=WRXD5;		            
		end*/
		WRXD5: begin	
		  if(rxen && (rxdb == 8'haa)) nstate <= WRXAA;
        else  nstate<=WRXD5;		            
		end
		default: nstate <= WIDLE;
	endcase
end

	
always @(posedge clk) 
	if(!rst) 
	begin
		RX_rdy <= 1'b0;		
		Data1 <= 8'h00;	//-Data1
		Data2 <= 8'h00;	//-Data2
		Data3 <= 8'h00;	//-Data3
		Data4 <= 8'h00;	//-Data4	
		Data5 <= 8'h00;	//-Data5			
	end
	else begin
		case(cstate)	
			WIDLE: 
			begin
				RX_rdy <= 1'b0;		//
				Data1 <= 8'h00;	//-Data1
				Data2 <= 8'h00;	//-Data2
				Data3 <= 8'h00;	//-Data3
				Data4 <= 8'h00;	//-Data4	
				Data5 <= 8'h00;	//-Data5			
			end
			WRXAA: 
				if(rxen) 
				begin
					RX_rdy <= 1'b0;		//
					Data1 <= rxdb;	   //-Data1
					Data2 <= 8'h00;	//-Data2
					Data3 <= 8'h00;	//-Data3
					Data4 <= 8'h00;	//-Data4	
					Data5 <= 8'h00;	//-Data5			
				end
				else
				begin
					RX_rdy <= 1'b0;		//
					Data1 <= Data1;	//-Data1
					Data2 <= 8'h00;	//-Data2
					Data3 <= 8'h00;   //-Data3
					Data4 <= 8'h00; 	//-Data4	
					Data5 <= 8'h00;	//-Data5			
				end
			WRXD1: 
				if(rxen) 
				begin
					RX_rdy <= 1'b0;	//
					Data1 <= Data1;	//-Data1
					Data2 <= rxdb;	   //-Data2
					Data3 <= 8'h00;	//-Data3
					Data4 <= 8'h00;	//-Data4	
					Data5 <= 8'h00;	//-Data5			
				end
				else
				begin
					RX_rdy <= 1'b0;	//
					Data1 <= Data1;	//-Data1
					Data2 <= Data2;	//-Data2
					Data3 <= 8'h00;	//-Data3
					Data4 <= 8'h00;	//-Data4	
					Data5 <= 8'h00;	//-Data5			
				end
			WRXD2: 
				if(rxen) 
				begin
					RX_rdy <= 1'b0;	//
					Data1 <= Data1;	//-Data1
					Data2 <= Data2;	//-Data2
					Data3 <= rxdb;	   //-Data3
					Data4 <= 8'h00;	//-Data4	
					Data5 <= 8'h00;	//-Data5			
				end
				else
				begin
					RX_rdy <= 1'b0;	//
					Data1 <= Data1;	//-Data1
					Data2 <= Data2;	//-Data2
					Data3 <= Data3;	//-Data3
					Data4 <= 8'h00;	//-Data4	
					Data5 <= 8'h00;	//-Data5			
				end
			WRXD3: 
				if(rxen) 
				begin
					RX_rdy <= 1'b0;	//
					Data1 <= Data1;	//-Data1
					Data2 <= Data2;	//-Data2
					Data3 <= Data3;	//-Data3
					Data4 <= rxdb;	   //-Data4	
					Data5 <= 8'h00;	//-Data5			
				end
				else
				begin
					RX_rdy <= 1'b0;	//
					Data1 <= Data1;	//-Data1
					Data2 <= Data2;	//-Data2
					Data3 <= Data3;	//-Data3
					Data4 <= Data4;	//-Data4	
					Data5 <= 8'h00;	//-Data5			
				end
			WRXD4: 
				if(rxen) 
				begin
					RX_rdy <= 1'b0;	//
					Data1 <= Data1;	//-Data1
					Data2 <= Data2;	//-Data2
					Data3 <= Data3;	//-Data3
					Data4 <= Data4;	//-Data4	
					Data5 <= rxdb;	   //-Data5			
				end
				else
				begin
					RX_rdy <= 1'b0;	//
					Data1 <= Data1;	//-Data1
					Data2 <= Data2;	//-Data2
					Data3 <= Data3;	//-Data3
					Data4 <= Data4;	//-Data4	
					Data5 <= Data5;	//-Data5			
				end
			WRXD5: 
			begin
				RX_rdy <= 1'b1;	//5个字节数据接收完成，进行一次输出判断，判断电脑发过来的数据指令含义
				Data1 <= Data1;	//-Data1
				Data2 <= Data2;	//-Data2
				Data3 <= Data3;	//-Data3
				Data4 <= Data4;	//-Data4	
				Data5 <= Data5;	//-Data5			
			end
			default: 
			begin
				RX_rdy <= 1'b0;
				Data1 <= 8'h00;
				Data2 <= 8'h00;
				Data3 <= 8'h00;
				Data4 <= 8'h00;
				Data5 <= 8'h00;
			end
		endcase
	end

	
endmodule

