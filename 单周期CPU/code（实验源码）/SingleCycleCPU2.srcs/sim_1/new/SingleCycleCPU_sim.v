`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 11:01:46
// Design Name: 
// Module Name: SingleCycleCPU_sim
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


module SingleCycleCPU_sim();
    reg CLK;
    reg reset;
    //输出
    wire [31:0] curPC;
    wire [31:0] nextPC;
    wire [31:0] Instruction;
    wire [31:0] DataOut1;
    wire [31:0] DataOut2;
    wire [31:0] result;
    wire [31:0] writeData;
    wire [4:0] rs,rt,rd;
    //
    SingleCycleCPU uut(
        .CLK(CLK),
        .reset(reset),
        .curPC(curPC),
        .nextPC(nextPC),
        .IDataOut(Instruction),
        .DataOut1(DataOut1),
        .DataOut2(DataOut2),
        .result(result),
        .writeData(writeData),
        .rs(rs),
        .rt(rt),
        .rd(rd)
    );
    initial begin 
        //记录数据
        $dumpfile("SCCPU.vcd");
        $dumpvars(0, SingleCycleCPU_sim);
        //初始化输入
        CLK = 0;
        reset = 0;//刚开始设置PC为0
        #10;
        CLK = 1;
        #10;
        reset = 1;
        //产生时钟信号
        forever #20 begin
            CLK = !CLK;
        end
    end 
endmodule
