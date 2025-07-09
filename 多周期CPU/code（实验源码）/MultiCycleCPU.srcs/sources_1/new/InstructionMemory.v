`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:21:28
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input [31:0] PC4,
    input [31:0] IAddr,
    input InsMemRW,
    output wire [31:0] JumpPC,
    output reg [31:0] IDataOut  //输出：32位指令，用于计算JumpPC
    );
    reg [7:0] Mem[255:0];   //存储器
    assign JumpPC={{PC4[31:28]},{IDataOut[25:0]},{2'b00}};     //投机：提前计算好可能存在的跳转指令
    initial begin
        $readmemb("C:/Users/jhinx/Desktop/MultiCycleCPU/Instructions.txt",Mem);      //从文件中读取指令     
        IDataOut=0;
    end
    always @(IAddr or InsMemRW) begin    //InsMemRW信号为1时读取存储器
        if(InsMemRW==1) begin
            IDataOut[7:0] = Mem[IAddr + 3];
            IDataOut[15:8] = Mem[IAddr + 2];
            IDataOut[23:16] = Mem[IAddr + 1];
            IDataOut[31:24] = Mem[IAddr];
        end
    end
endmodule
