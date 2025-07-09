`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:06:36
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
    input [31:0] nextaddress,  
    output reg [31:0] address,
    output [31:0] PC4    //���ڴ��浱ǰ��ַ+4��ĵ�ַ
    );
    assign PC4 = address+4;
    always @(posedge CLK or negedge reset) begin//��clock�½��ص�����Reset�½��ص���ʱ���Ե�ַ���и��»�������
        if(reset==0) begin  //reset=0ʱ����ʼ��PCΪ0 
            address=0;
        end
        else if(PCWre) begin
            address=nextaddress;    //PCWreΪ1ʱ�����Ե�ַ���и���
        end
    end
endmodule
