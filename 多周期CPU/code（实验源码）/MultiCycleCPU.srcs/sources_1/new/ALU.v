`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:20:03
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
    input wire [31:0] InA,
    input wire [31:0] InB,
    input [2:0] ALUop,
    output zero,sign,
    output reg [31:0] result
    );
    assign zero=(result==0)?1:0;
    assign sign=result[31];    
    always@(ALUop or InA or InB) begin
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
