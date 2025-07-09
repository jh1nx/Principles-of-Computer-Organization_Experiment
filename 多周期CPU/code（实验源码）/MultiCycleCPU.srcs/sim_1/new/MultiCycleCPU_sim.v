`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/19 19:23:13
// Design Name: 
// Module Name: MultiCycleCPU_sim
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


module MultiCycleCPU_sim();
    reg CLK,reset;
    wire [31:0] curPC,nextPC;
    wire [31:0] IDataOut;
    wire [31:0] ADR_out, BDR_out;
    wire [31:0] result, writeData;
    wire [31:0] writeReg;
    wire [31:0] DMOut;
    wire [31:0] ALUInA,ALUInB;
    wire [31:0] DataOut1;
    wire [31:0] DataOut2;
    wire [31:0] ALUoutDR_out;
    wire [31:0] DBDR_out;
    wire [31:0] IR_out;
    wire [31:0] immExt;
    wire [2:0] state;
  
    MultiCycleCPU uut(
        .CLK(CLK),
        .reset(reset),
        .curPC(curPC), 
        .nextPC(nextPC),
        .IDataOut(IDataOut),
        .ADR_out(ADR_out), .BDR_out(BDR_out),
        .result(result), 
        .writeData(writeData),
        
        .writeReg(writeReg),
        .DMOut(DMOut),
        .ALUInA(ALUInA),
        .ALUInB(ALUInB),
        .DataOut1(DataOut1),
        .DataOut2(DataOut2),
        .ALUoutDR_out(ALUoutDR_out),
        .DBDR_out(DBDR_out),
        .IR_out(IR_out),
        .immExt(immExt),
        .state(state)
    );
    
    initial begin
        $dumpfile("MCCPU.vcd"); 
        $dumpvars(0, MultiCycleCPU_sim);
        CLK=0;
        reset=0;
        #20;
        CLK=1;
        #20;
        reset=1;    // ¿ªÊ¼·ÂÕæ
        forever #20 begin 
            CLK =!CLK; 
        end 
    end
endmodule
