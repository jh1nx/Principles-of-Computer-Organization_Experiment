`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 11:03:36
// Design Name: 
// Module Name: Debounce
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


module Debounce(
    input clk,
    input key_in,
    output key_out
    );
    parameter SAMPLE_TIME=5000;
    reg [15:0] count_low;   //����������¼���ڵ͵�ƽ��ʱ��
    reg [15:0] count_high;
    reg key_out_reg;    //�洢������İ���״̬
    
    always@(posedge clk) begin
        count_low<= key_in?0:count_low+1;
        count_high<= key_in?count_high+1:0;
        if(count_low==SAMPLE_TIME)
            key_out_reg<=0;     //�����ȶ��ڵ͵�ƽ�Ѿ�һ��ʱ����
        else if(count_high==SAMPLE_TIME)
            key_out_reg<=1;
    end
    assign key_out=!key_out_reg;    //ͨ����ת������ȶ��İ����ź�
endmodule
