`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 10:57:05
// Design Name: 
// Module Name: PC
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


module PC(
    input CLK,reset,PCWre,
    input[1:0] PCSrc,
    input [31:0] immExt,
    input [31:0] JumpPC,
    output reg [31:0] address,
    output [31:0] nextaddress,  
    output [31:0] PC4    //用于储存当前地址+4后的地址
    );
    assign PC4 = address+4;
    assign nextaddress= (PCSrc==2'b01)?address+4+(immExt<<2):((PCSrc==2'b10)?JumpPC:address + 4);//根据PCSrc的值来确定下一个指令的地址
    always @(negedge CLK) begin//当clock下降沿到来或Reset下降沿到来时，对地址进行改变或者置零
        if(reset==0) begin  //reset=0时，初始化PC为0
            address=0;
        end
        else if(PCWre) begin
            address=nextaddress;
        end
    end
endmodule