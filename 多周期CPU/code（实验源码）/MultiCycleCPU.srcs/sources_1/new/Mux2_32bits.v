`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/20 10:53:59
// Design Name: 
// Module Name: Mux2_32bits
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


module Mux2_32bits(
    input choice,
    input [31:0] inA,
    input [31:0] inB,
    output [31:0] out
    );
    assign out=(choice==0)?inA:inB;
endmodule
