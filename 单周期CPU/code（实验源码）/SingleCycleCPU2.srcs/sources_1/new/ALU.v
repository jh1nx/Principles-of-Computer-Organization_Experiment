`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 10:57:34
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] ReadData1,
    input [31:0] ReadData2,
    input [31:0] immExt,
    input [4:0] shamt,
    input [2:0] ALUop,
    input ALUSrcA,ALUSrcB,
    output zero,sign,
    output reg [31:0] result
    );
    wire [31:0] InA;
    wire [31:0] InB;
    assign InA=ALUSrcA?{{27{1'b0}},shamt}:ReadData1;    //控制第一个操作数来源，0：rs寄存器；1：立即数
    assign InB=ALUSrcB?immExt:ReadData2;    //控制第二个操作数来源，0：rt寄存器；1：立即数
    assign zero=(result==0)?1:0;
    assign sign=result[31];    
    always@(*) begin
        case(ALUop)
            3'b000:
                result=InA+InB;
            3'b001:
                result=InA-InB;
            3'b010:
                result=InB<<InA;
            3'b011:
                result=InA|InB;     //或运算
            3'b100:
                result=InA&InB;
            3'b101:
                result=(InA<InB)?1:0;   //无符号数比较
            3'b110:
                result=(((InA<InB)&&(InA[31]==InB[31]))||((InA[31]==1)&&(InB[31]==0)))?1:0;     //符号数比较
            3'b111:
                result=InA^InB;     //异或运算
            default:
                result = 32'h0000;
        endcase
    end
endmodule
