`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 12:38:27
// Design Name: 
// Module Name: SZE_sim
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


module SZE_sim();
//����
reg signed [15:0] immediate;
reg ExtSel;
//���
wire [31:0] immExt;
SignZeroExtend uut(
    .immediate(immediate),
    .ExtSel(ExtSel),
    .immExt(immExt)
);
initial begin
    //��¼����
    $dumpfile("SZE.vcd");
    $dumpvars(0, SZE_sim);
    //Test1
    #50;
    ExtSel = 1;
    immediate[15:0] = 15'd10;
    //Test2
    #50;
    ExtSel = 1;
    immediate[15:0] = 15'd7;
    immediate[15]=1;
    //Test3
    #50;
    ExtSel = 0;
    immediate[15:0] = 15'd10;
    //Test4
    #50;
    ExtSel = 0;
    immediate[15:0] = 15'd7;   
    #50;
    $stop;
end

endmodule
