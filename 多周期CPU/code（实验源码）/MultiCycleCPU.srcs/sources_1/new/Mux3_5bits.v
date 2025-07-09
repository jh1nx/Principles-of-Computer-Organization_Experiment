`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/21 11:15:21
// Design Name: 
// Module Name: Mux3_5bits
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


module Mux3_5bits(
    input [1:0] choice,
    input [4:0] inA,
    input [4:0] inB,
    input [4:0] inC,
    output reg [4:0] out
    );
    always @(choice or inA or inB or inC) begin
        case(choice)
            2'b00: out = inA;
            2'b01: out = inB;
            2'b10: out = inC;
        endcase
    end
endmodule
