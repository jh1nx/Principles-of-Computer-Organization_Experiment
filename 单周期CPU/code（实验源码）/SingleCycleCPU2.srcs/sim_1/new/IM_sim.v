`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 12:24:06
// Design Name: 
// Module Name: IM_sim
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


module IM_sim;
//输入
reg [31:0] IAddr;
reg InsMemRW;
//输出
wire [5:0] op;
wire [5:0] rs, rt, rd;
wire [15:0] immediate;
wire [5:0] shamt;
wire [5:0] func;
wire [31:0] IDataOut;
InstructionMemory uut(
    .IAddr(IAddr),
    .InsMemRW(InsMemRW),
    .op(op),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .immediate(immediate),
    .shamt(shamt),
    .func(func),
    .IDataOut(IDataOut)
);

initial begin
    //记录数据的文件名
    $dumpfile("InstructionMemory.vcd");
    $dumpvars(0, IM_sim);
    //初始化
    #10;
    InsMemRW = 0;
    IAddr[31:0] = 32'd0;
    //第一次读指令
    #40;
    InsMemRW = 1;
    IAddr[31:0] = 32'd0;
    //第二次读指令
    #40;
    InsMemRW = 1;
    IAddr[31:0] = 32'd4;
    //第三次读指令
    #40;
    InsMemRW = 1;
    IAddr[31:0] = 32'd8;
    //结束
    #10;
    $stop;
end
endmodule
