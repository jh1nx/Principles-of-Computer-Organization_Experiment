`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:06:36
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
    input [31:0] nextaddress,  
    output reg [31:0] address,
    output [31:0] PC4    //用于储存当前地址+4后的地址
    );
    assign PC4 = address+4;
    always @(posedge CLK or negedge reset) begin//当clock下降沿到来或Reset下降沿到来时，对地址进行更新或者置零
        if(reset==0) begin  //reset=0时，初始化PC为0 
            address=0;
        end
        else if(PCWre) begin
            address=nextaddress;    //PCWre为1时，将对地址进行更新
        end
    end
endmodule
