`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 16:56:06
// Design Name: 
// Module Name: InstructionRegister
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


module InstructionRegister(
    input CLK,
    input IRWre,
    input [31:0] insIn,
    output reg [31:0] insOut
    );
    initial begin
        insOut=0;
    end
    always@(posedge CLK) begin
        if(IRWre==1) insOut<=insIn;
    end
endmodule

