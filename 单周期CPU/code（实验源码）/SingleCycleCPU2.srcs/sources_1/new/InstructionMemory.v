`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 10:57:58
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
    output [5:0] op,
    output [4:0] rs,rt,rd,
    output signed [15:0] immediate,
    output [5:0] func,
    output[4:0] shamt,
    output [31:0] JumpPC,
    output reg [31:0] IDataOut  //�����32λָ����ڼ���JumpPC
    );
    reg [7:0] Mem[0:127];   //�洢��
    assign op=IDataOut[31:26];
    assign rs=IDataOut[25:21];
    assign rt=IDataOut[20:16];
    assign rd=IDataOut[15:11];
    assign immediate=IDataOut[15:0];    
    assign func=IDataOut[5:0];
    assign shamt=IDataOut[10:6];
    assign JumpPC={{PC4[31:28]},{IDataOut[25:0]},{2'b00}};     //Ͷ������ǰ����ÿ��ܴ��ڵ���תָ��
    initial begin
        $readmemb("C:/Users/jhinx/Desktop/SingleCycleCPU2/Instructions.txt",Mem);      //���ļ��ж�ȡָ��     
        IDataOut=0;
    end
    always @(IAddr or InsMemRW) begin    //InsMemRW�ź�Ϊ1ʱ��ȡ�洢��
        if(InsMemRW==1) begin
            IDataOut[7:0] = Mem[IAddr + 3];
            IDataOut[15:8] = Mem[IAddr + 2];
            IDataOut[23:16] = Mem[IAddr + 1];
            IDataOut[31:24] = Mem[IAddr];
        end
    end
endmodule
