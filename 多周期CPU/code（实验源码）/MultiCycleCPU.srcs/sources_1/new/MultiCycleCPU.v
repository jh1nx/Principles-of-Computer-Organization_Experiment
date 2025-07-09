`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/16 17:44:40
// Design Name: 
// Module Name: MultiCycleCPU
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


module MultiCycleCPU(
    input CLK,reset,
    output wire [31:0] curPC,nextPC,IDataOut,ADR_out,BDR_out,result,writeData,
    output wire [4:0] writeReg,
    output wire [31:0] DMOut,
    output wire [31:0] ALUInA,ALUInB,
    output wire [31:0] DataOut1,
    output wire [31:0] DataOut2,
    output wire [31:0] ALUoutDR_out,
    output wire [31:0] DBDR_out,
    output wire [31:0] IR_out,
    output wire [31:0] immExt,
    output wire [2:0] state,  
    output wire [31:0] JumpPC,
    output wire [31:0] DBDR_in,
    output wire [31:0] PC4
); 
    /*wire [4:0] writeReg;
    wire [31:0] DMOut;
    wire [31:0] ALUInA,ALUInB;
    wire [31:0] DataOut1;
    wire [31:0] DataOut2;
    wire [31:0] ALUoutDR_out;
    wire [31:0] DBDR_out;
    wire [31:0] IR_out;
    wire [31:0] immExt;
    wire [2:0] state;
    wire [31:0] JumpPC;
    wire [31:0] DBDR_in;
    wire [31:0] PC4;*/
    
    wire [1:0] PCSrc;
    wire [1:0] RegDst;
    wire [2:0] ALUop;
    wire zero,sign,PCWre,ALUSrcA,ALUSrcB,RegWre,InsMemRW,WrRegDSrc,mRD,mWR,IRWre,DBDataSrc,ExtSel;
    
    ALU alu(
        .InA(ALUInA), .InB(ALUInB), .ALUop(ALUop), .zero(zero), .sign(sign), .result(result)
    );
    PC pc( 
        .CLK(CLK), .reset(reset), .PCWre(PCWre), .nextaddress(nextPC), .address(curPC), .PC4(PC4)
    );
    ControlUnit CU(CLK,reset,IR_out[31:26],zero,sign,IR_out[5:0],PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,InsMemRW,WrRegDSrc,mRD,mWR,IRWre,RegDst,ExtSel,PCSrc,ALUop,state);
    DataMemory DM(
         .CLK(CLK), .DAddr(ALUoutDR_out), .DataIn(BDR_out), .mRD(mRD), .mWR(mWR), .DataOut(DMOut)
    );
    InstructionMemory IM(
        .PC4(PC4), .IAddr(curPC), .InsMemRW(InsMemRW), .JumpPC(JumpPC), .IDataOut(IDataOut)
    );
    RegisterFile RF( 
        .CLK(CLK), .RegWre(RegWre), .ReadReg1(IR_out[25:21]), .ReadReg2(IR_out[20:16]), .writeReg(writeReg), .writeData(writeData), .ReadData1(DataOut1), .ReadData2(DataOut2)
    );
    SignZeroExtend SZE(
        .immediate(IR_out[15:0]), .ExtSel(ExtSel), .immExt(immExt)
    );
    InstructionRegister IR(
        .CLK(CLK), .IRWre(IRWre), .insIn(IDataOut), .insOut(IR_out) 
    );
    DFF ADR(
        .CLK(CLK), .reset(reset), .DFF_in(DataOut1), .DFF_out(ADR_out)
    );
    DFF BDR(
        .CLK(CLK), .reset(reset), .DFF_in(DataOut2), .DFF_out(BDR_out)
    );
    DFF ALUoutDR(
        .CLK(CLK), .reset(reset), .DFF_in(result), .DFF_out(ALUoutDR_out)
    );
    DFF DBDR(
        .CLK(CLK), .reset(reset), .DFF_in(DBDR_in), .DFF_out(DBDR_out)
    );
    Mux4_32bits NextAddress(
        .choice(PCSrc), .inA(PC4), .inB(curPC+4+(immExt<<2)), .inC(DataOut1), .inD(JumpPC), .out(nextPC)
    );
    Mux3_5bits Write_Reg(
        .choice(RegDst), .inA(5'b11111), .inB(IR_out[20:16]), .inC(IR_out[15:11]), .out(writeReg)
    );
    Mux2_32bits Write_Data(
        .choice(WrRegDSrc), .inA(PC4), .inB(DBDR_out), .out(writeData)
    );
    Mux2_32bits ALU_inA(
        .choice(ALUSrcA), .inA(ADR_out), .inB({{27{1'b0}},IR_out[10:6]}), .out(ALUInA)
    );
    Mux2_32bits ALU_inB(
        .choice(ALUSrcB), .inA(BDR_out), .inB(immExt), .out(ALUInB)        
    );
    Mux2_32bits DBDR_In(
        .choice(DBDataSrc), .inA(result), .inB(DMOut), .out(DBDR_in)    
    );
endmodule
