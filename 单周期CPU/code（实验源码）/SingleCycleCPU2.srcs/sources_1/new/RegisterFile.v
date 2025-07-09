`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 10:58:24
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input CLK,RegDst,RegWre,DBDataSrc,
    input [4:0] rs,rt,rd,
    input [31:0] datafromALU,datafromRW,    //来自ALU计算结果的值，来自内存读取的值
    output [31:0] Data1,Data2,  //从寄存器中读取的值
    output [31:0] writeData     //写回寄存器的值
    );
    wire [4:0] writeReg;    //要写入的寄存器的端口
    assign writeReg=RegDst?rd:rt;      //控制目标地址来源，0为rt(I型指令)，1为rd(R型指令)
    assign writeData=DBDataSrc?datafromRW:datafromALU;     //控制写回寄存器的数据来源
    
    reg [31:0] register[0:31];      //定义32个32位寄存器
    integer i;
    initial begin
        for(i=0;i<32;i=i+1)
            register[i]<=0;
    end    //给每个寄存器赋初值0
    assign Data1=register[rs];
    assign Data2=register[rt];
    always @ (negedge CLK) begin
        if(RegWre)    //RegWre为1时，允许写入寄存器，并且防止寄存器0被修改(第0个寄存器恒为0)
            register[writeReg] <= writeData;    
    end
endmodule
