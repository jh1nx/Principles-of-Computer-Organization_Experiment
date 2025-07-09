`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:22:46
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input CLK,
    input [31:0] DAddr,
    input [31:0] DataIn,
    input mRD,
    input mWR,
    output wire [31:0] DataOut
    );
    reg [7:0] Memory [255:0];   //´æ´¢Æ÷
    //wire [31:0] address;
    //assign address=(DAddr<<2);
    assign DataOut[7:0]=(mRD==1)?Memory[DAddr+3]:8'bz;//zÎª¸ß×èÌ¬
    assign DataOut[15:8]=(mRD==1)?Memory[DAddr+2]:8'bz;
    assign DataOut[23:16]=(mRD==1)?Memory[DAddr+1]:8'bz;
    assign DataOut[31:24]=(mRD==1)?Memory[DAddr]:8'bz;
    
    always@(negedge CLK) begin      //Ð´²Ù×÷
        if(mWR==1) begin
            Memory[DAddr]<=DataIn[31:24];
            Memory[DAddr+1]<=DataIn[23:16];
            Memory[DAddr+2]<=DataIn[15:8];
            Memory[DAddr+3]<=DataIn[7:0];
        end
    end
endmodule
