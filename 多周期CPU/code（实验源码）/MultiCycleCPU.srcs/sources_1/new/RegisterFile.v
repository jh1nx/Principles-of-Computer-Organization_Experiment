`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:22:02
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
    input CLK,
    input RegWre,
    input [4:0] ReadReg1,ReadReg2,
    input [4:0] writeReg,    //要写入的寄存器的端口
    input [31:0] writeData,    //写回寄存器的值
    output [31:0] ReadData1,ReadData2  //从寄存器中读取的值
    );
    reg [31:0] register[0:31];      //定义32个32位寄存器
    integer i;
    initial begin
        for(i=0;i<32;i=i+1)
            register[i]<=0;
    end    //给每个寄存器赋初值0
    assign ReadData1=register[ReadReg1];
    assign ReadData2=register[ReadReg2];
    always @ (negedge CLK) begin
        if(writeReg!=0 && RegWre)    //RegWre为1时，允许写入寄存器，并且防止寄存器0被修改(第0个寄存器恒为0)
            register[writeReg] <= writeData;    
    end
endmodule
