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
    reg [15:0] count_low;   //计数器，记录处于低电平的时间
    reg [15:0] count_high;
    reg key_out_reg;    //存储消抖后的按键状态
    
    always@(posedge clk) begin
        count_low<= key_in?0:count_low+1;
        count_high<= key_in?count_high+1:0;
        if(count_low==SAMPLE_TIME)
            key_out_reg<=0;     //按键稳定于低电平已经一段时间了
        else if(count_high==SAMPLE_TIME)
            key_out_reg<=1;
    end
    assign key_out=!key_out_reg;    //通过反转来输出稳定的按键信号
endmodule
