`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 12:21:50
// Design Name: 
// Module Name: PC_sim
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


module PC_sim();
    //输入
    reg CLK;
    reg reset;
    reg PCWre;
    reg [1:0] PCSrc;
    reg [31:0] immExt;
    reg [31:0] JumpPC;
    //输出
    wire [31:0] address;
    wire [31:0] nextaddress;
    PC uut(
        .CLK(CLK),
        .reset(reset),
        .PCWre(PCWre),
        .PCSrc(PCSrc),
        .immExt(immExt),
        .nextaddress(nextaddress),
        .address(address),
        .JumpPC(JumpPC)
    );
    always #15 CLK = !CLK;  //时钟每15ns变化一次
    initial begin
        //记录数据变化
        $dumpfile("PC.vcd");
        $dumpvars(0, PC_sim);
        //初始化
        CLK = 0;
        reset = 0;
        PCWre = 0;
        PCSrc = 2'b00;
        immExt = 0;
        //不跳转，顺序执行下一条地址
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b00;
        immExt = 4;
        //不跳转，顺序执行下一条地址
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b00;
        immExt = 4;
        //偏移值跳转，执行跳转之后的指令
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b01;
        immExt = 4;
        //偏移值跳转，执行跳转之后的指令
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b01;
        immExt = 4;
        //无条件跳转，执行跳转之后的命令
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b10;
        JumpPC=8;   
        //结束
        #50;
        $stop;
    end
endmodule
