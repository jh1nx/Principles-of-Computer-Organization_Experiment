`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/20 11:23:27
// Design Name: 
// Module Name: Mux4_32bits
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


module Mux4_32bits(
    input [1:0] choice,
    input [31:0] inA,
    input [31:0] inB,
    input [31:0] inC,
    input [31:0] inD,
    output reg [31:0] out
    );
    always @(choice or inA or inB or inC or inD) begin
        case(choice)
            2'b00: out = inA;
            2'b01: out = inB;
            2'b10: out = inC;
            2'b11: out = inD;
        endcase
    end
endmodule
