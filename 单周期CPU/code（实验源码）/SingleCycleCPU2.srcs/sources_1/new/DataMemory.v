`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 10:58:50
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input CLK,
    input wire [31:0] DAddr,
    input wire [31:0] DataIn,
    input mRD,
    input mWR,
    output wire [31:0] DMOut    //数据存储器的输出
    );
    reg [7:0] Memory [0:127];   //存储器
    wire [31:0] address;
    assign address = (DAddr<<2);      //一条指令存储在四个存储单元中
    assign DMOut[7:0]=(mRD==1)?Memory[address+3]:8'bz;//z为高阻态
    assign DMOut[15:8]=(mRD==1)?Memory[address+2]:8'bz;
    assign DMOut[23:16]=(mRD==1)?Memory[address+1]:8'bz;
    assign DMOut[31:24]=(mRD==1)?Memory[address]:8'bz;
    
    always@(negedge CLK) begin      //写操作
        if(mWR==1) begin
            Memory[address]<=DataIn[31:24];
            Memory[address+1]<=DataIn[23:16];
            Memory[address+2]<=DataIn[15:8];
            Memory[address+3]<=DataIn[7:0];
        end
    end
endmodule
