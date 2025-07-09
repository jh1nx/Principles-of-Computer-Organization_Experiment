`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 10:59:54
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [5:0] op,
    input zero,sign,
    input [5:0] func,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output reg InsMemRW,
    output reg mRD,
    output reg mWR,
    output reg RegDst,
    output reg ExtSel,
    output reg [1:0]PCSrc,
    output reg [2:0] ALUop
);
       always@(*) begin
               case(op)
                   6'b000000: begin
                       case(func)
                           6'b100000: begin    //add
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                           end
                           6'b100001: begin    //addu
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                           end
                           6'b100010: begin    //sub
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=3'b001;
                           end
                           6'b100011: begin    //subu
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=3'b001;
                           end
                           6'b100100: begin    //and
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=3'b100;
                           end
                           6'b100101: begin    //or
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=3'b011;
                           end
                           6'b100110: begin    //xor
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=3'b111;
                           end
                           6'b101010: begin    //slt
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=4'b110;
                           end
                           6'b101011: begin    //sltu
                               PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=4'b101;
                           end
                           6'b000000: begin    //sll
                               PCWre=1;ALUSrcA=1;ALUSrcB=0;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=1;ExtSel=1;PCSrc=2'b00;ALUop=3'b010;
                           end
                          
                       endcase
                   end
                   6'b001000: begin    //addi
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                   end
                   6'b001001: begin    //addiu
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                   end
                   6'b001100: begin    //andi
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=0;PCSrc=2'b00;ALUop=3'b100;
                   end
                   6'b001101: begin    //ori
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=0;PCSrc=2'b00;ALUop=3'b011;
                   end
                   6'b001110: begin    //xori
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=0;PCSrc=2'b00;ALUop=3'b111;
                   end
                   6'b100011: begin    //lw
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=1;RegWre=1;InsMemRW=1;mRD=1;mWR=0;RegDst=0;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                   end
                   6'b101011: begin    //sw
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=0;InsMemRW=1;mRD=0;mWR=1;RegDst=0;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                   end
                   6'b000100: begin    //beq
                       PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=0;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=1;ALUop=3'b001;
                       PCSrc=(zero==1)?(2'b01):(2'b00);
                   end
                   6'b000101: begin    //bne
                       PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=0;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=1;ALUop=3'b001;
                       PCSrc=(zero==0)?(2'b01):(2'b00);
                   end
                   6'b001010: begin    //slti
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=1;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=1;PCSrc=2'b00;ALUop=3'b110;
                   end
                   6'b000110: begin    //blez
                       PCWre=1;ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;RegWre=0;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=1;ALUop=3'b001;
                       PCSrc=(zero==1||sign==1)?2'b01:2'b00;
                   end
                   6'b000010: begin    //j
                       PCWre=1;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=0;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=1;PCSrc=2'b10;ALUop=3'b000;
                   end
                   6'b111111: begin    //halt
                       PCWre=0;ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;RegWre=0;InsMemRW=1;mRD=0;mWR=0;RegDst=0;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                   end
               endcase
           end
endmodule
/*   另一种实现方式
    input [5:0] op,
    input zero,sign,
    input [5:0] func,
    output PCWre,
    output ALUSrcA,
    output ALUSrcB,
    output DBDataSrc,
    output RegWre,
    output InsMemRW,
    output mRD,
    output mWR,
    output RegDst,
    output ExtSel,
    output [1:0]PCSrc,
    output [2:0] ALUop

        parameter R=6'b000000;
        assign PCWre=(op==6'b111111)?0:1;
        assign ALUSrcA=(op==R&&func==6'b000000)?1:0;
        assign ALUSrcB=(op==R||op==6'b000100||op==6'b000101||op==6'b000110)?0:1;
        assign DBDataSrc=(op==6'b100011)?1:0;
        assign RegWre=(op==6'b101011||op==6'b000100||op==6'b000101||op==6'b000110||op==6'b000010)?0:1;
        assign InsMemRW=1;
        assign mRD=(op==6'b100011)?1:0;
        assign mWR=(op==6'b101011)?1:0;
        assign RegDst=(op==R)?1:0;
        assign ExtSel=(op==R||op==6'b001100||op==6'b001101||op==6'b001110)?0:1;
        assign PCSrc=(op==6'b000010)?2'b10
                     :(op==6'b000100)?(zero==1)?2'b01:2'b00
                     :(op==6'b000101)?(zero==1)?2'b00:2'b01
                     :(op==6'b000110)?(sign==1)?2'b01:2'b00
                     :2'b00;
         assign ALUop=((op==R&&func==6'b100010)||(op==R&&func==6'b100011)||op==6'b000100||op==6'b000101||op==6'b000110)?3'b001
                     :(op==R&&func==6'b000000)?3'b010
                     :((op==R&&func==6'b100101)||op==6'b001101)?3'b011
                     :((op==R&&func==6'b100100)||op==6'b001100)?3'b100
                     :(op==R&&func==6'b101011)?3'b101
                     :((op==R&&func==6'b101010)||op==6'b001010)?3'b110
                     :((op==R&&func==6'b100110)||op==6'b001110)?3'b111
                     :3'b000;
           */
