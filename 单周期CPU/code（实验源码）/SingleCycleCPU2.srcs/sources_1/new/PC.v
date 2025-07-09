`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 10:57:05
// Design Name: 
// Module Name: PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC(
    input CLK,reset,PCWre,
    input[1:0] PCSrc,
    input [31:0] immExt,
    input [31:0] JumpPC,
    output reg [31:0] address,
    output [31:0] nextaddress,  
    output [31:0] PC4    //���ڴ��浱ǰ��ַ+4��ĵ�ַ
    );
    assign PC4 = address+4;
    assign nextaddress= (PCSrc==2'b01)?address+4+(immExt<<2):((PCSrc==2'b10)?JumpPC:address + 4);//����PCSrc��ֵ��ȷ����һ��ָ��ĵ�ַ
    always @(negedge CLK) begin//��clock�½��ص�����Reset�½��ص���ʱ���Ե�ַ���иı��������
        if(reset==0) begin  //reset=0ʱ����ʼ��PCΪ0
            address=0;
        end
        else if(PCWre) begin
            address=nextaddress;
        end
    end
endmodule