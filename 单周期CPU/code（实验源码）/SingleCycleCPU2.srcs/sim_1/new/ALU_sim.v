`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 12:27:12
// Design Name: 
// Module Name: ALU_sim
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


module ALU_sim();

    //input
    reg [31:0] ReadData1;
    reg [31:0] ReadData2;
    reg [31:0] immExt;
    reg [31:0] shamt;
    reg [2:0] ALUop;
    reg ALUSrcA, ALUSrcB;

    //output
    wire zero;
    wire [31:0] result;

    ALU uut(
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .immExt(immExt),
        .shamt(shamt),
        .ALUop(ALUop),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .zero(zero),
        .result(result)
    );

    initial begin
        //record
        $dumpfile("ALU32.vcd");
        $dumpvars(0, ALU_sim);
        //add1
        ReadData1 = 0;
        ReadData2 = 0;
        immExt = 1;
        shamt = 1;
        ALUop = 3'b000;
        ALUSrcA = 0;
        ALUSrcB = 0;
        //add2
        #50;
        ReadData1 = 0;
        ReadData2 = 0;
        immExt = 1;
        shamt = 1;
        ALUop = 3'b000;
        ALUSrcA = 1;
        ALUSrcB = 0;
        //sub1
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 3;
        shamt = 4;
        ALUop = 3'b001;
        ALUSrcA = 0;
        ALUSrcB = 0;
        //sub2
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 3;
        shamt = 4;
        ALUop = 3'b001;
        ALUSrcA = 1;
        ALUSrcB = 0;
        //左移1
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 4;
        ALUop = 3'b010;
        ALUSrcA = 0;
        ALUSrcB = 0;
        //左移2
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 4;
        ALUop = 3'b010;
        ALUSrcA = 1;
        ALUSrcB = 0;
        //or1
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 4;
        ALUop = 3'b011;
        ALUSrcA = 0;
        ALUSrcB = 0;
        //or2
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 4;
        ALUop = 3'b011;
        ALUSrcA = 1;
        ALUSrcB = 0;
        //and1
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 4;
        ALUop = 3'b100;
        ALUSrcA = 0;
        ALUSrcB = 0;
        //and2
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 4;
        ALUop = 3'b100;
        ALUSrcA = 1;
        ALUSrcB = 0;
        //不带符号比较1
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 1;
        ALUop = 3'b101;
        ALUSrcA = 0;
        ALUSrcB = 0;
        //不带符号比较2
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 1;
        ALUop = 3'b101;
        ALUSrcA = 1;
        ALUSrcB = 0;
        //带符号比较1
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 1;
        ALUop = 3'b110;
        ALUSrcA = 0;
        ALUSrcB = 0;
        //带符号比较2
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 1;
        ALUop = 3'b110;
        ALUSrcA = 1;
        ALUSrcB = 0;
        //nor1
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 1;
        ALUop = 3'b111;
        ALUSrcA = 0;
        ALUSrcB = 0;
        //nor2
        #50;
        ReadData1 = 1;
        ReadData2 = 2;
        immExt = 2;
        shamt = 1;
        ALUop = 3'b111;
        ALUSrcA = 1;
        ALUSrcB = 0;
        //stop
        #50;
        $stop;
    end

endmodule
