`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 11:00:29
// Design Name: 
// Module Name: SingleCycleCPU
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


module SingleCycleCPU(
    input CLK,reset,
    output wire [31:0] curPC,nextPC,IDataOut,DataOut1,DataOut2,result,writeData,
    output wire [4:0] rs,rt,rd
    );
    wire [2:0] ALUop;
    wire [31:0] immExt;
    wire [5:0] op,func;
    wire [15:0] immediate;
    wire [4:0] shamt;
    wire [31:0] JumpPC;
    wire [31:0] DMOut;
    wire [31:0] PC4;
    wire [1:0] PCSrc;
    wire zero,sign,PCWre,ALUSrcA,ALUSrcB,RegWre,InsMemRW,mRD,mWR,RegDst,DBDataSrc,ExtSel;
    
    ALU alu(DataOut1,DataOut2,immExt,shamt,ALUop,ALUSrcA,ALUSrcB,zero,sign,result);
    PC pc(CLK,reset,PCWre,PCSrc,immExt,JumpPC,curPC,nextPC,PC4);
    ControlUnit CU(op,zero,sign,func,PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,InsMemRW,mRD,mWR,RegDst,ExtSel,PCSrc,ALUop);
    DataMemory DM(CLK,result,DataOut2,mRD,mWR,DMOut);
    InstructionMemory IM(PC4,curPC,InsMemRW,op,rs,rt,rd,immediate,func,shamt,JumpPC,IDataOut);
    RegisterFile RF(CLK,RegDst,RegWre,DBDataSrc,rs,rt,rd,result,DMOut,DataOut1,DataOut2,writeData);
    SignZeroExtend SZE(immediate,ExtSel,immExt);
endmodule