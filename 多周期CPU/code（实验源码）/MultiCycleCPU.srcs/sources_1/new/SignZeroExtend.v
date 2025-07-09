`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:32:32
// Design Name: 
// Module Name: SignZeroExtend
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


module SignZeroExtend(
    input [15:0] immediate,
    input ExtSel,
    output [31:0] immExt
    );
    assign immExt[15:0] = immediate[15:0];
    assign immExt[31:16]=(ExtSel==1)?{16{immediate[15]}}:16'b0;
    //如果ExtSel信号为1，则进行符号扩展，否则进行零扩展
endmodule
