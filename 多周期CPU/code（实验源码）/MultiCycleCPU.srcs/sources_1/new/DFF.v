`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 17:07:43
// Design Name: 
// Module Name: DFF
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


module DFF(
    input CLK,
    input reset,
    input [31:0] DFF_in,
    output reg [31:0] DFF_out
);
    initial begin
        DFF_out=0;
    end
    always @(posedge CLK) begin
        if(reset==1)    DFF_out<=DFF_in;
    end
endmodule
