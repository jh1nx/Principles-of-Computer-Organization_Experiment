`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 11:05:03
// Design Name: 
// Module Name: Basys3
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


module Basys3(
    input CLK,
    input [1:0]SW,  //开关信号，用于选择显示不同的内容
    input Reset,
    input button,
    output [3:0]AN,
    output [7:0]display
    );
    wire [31:0]PC;
    wire [31:0]newaddress;
    wire [31:0]Instruction;
    wire [31:0]Reg_S;
    wire [31:0]Reg_T;
    wire [31:0]ALUOUT;
    wire [31:0]W_data;
    wire myCLK;
    reg [3:0]data;
    Debounce debounce(CLK,button,myCLK);
    SingleCycleCPU SingleCycleCPU(myCLK,Reset,PC,newaddress,Instruction,Reg_S,Reg_T,ALUOUT,W_data);
    Display_7seg Display_7seg(data,display);
    clk_div clk_div(CLK,AN);
    always@(myCLK)begin
           case(AN)
                4'b1110:    begin
                    case(SW)
                        2'b00:data<=newaddress[3:0];
                        2'b01:data<=Reg_S[3:0];
                        2'b10:data<=Reg_T[3:0];
                        2'b11:data<=W_data[3:0];
                    endcase
                end
                4'b1101:    begin
                    case(SW)
                        2'b00:data<=newaddress[7:4];
                        2'b01:data<=Reg_S[7:4];
                        2'b10:data<=Reg_T[7:4];
                        2'b11:data<=W_data[7:4];
                    endcase
                end
                4'b1011:    begin
                    case(SW)
                        2'b00:data<=PC[3:0];
                        2'b01:data<=Instruction[24:21];
                        2'b10:data<=Instruction[19:16];
                        2'b11:data<=ALUOUT[3:0];
                    endcase
                end
                4'b0111 : begin
                    case(SW)
                        2'b00:data<=PC[7:4];
                        2'b01:data<={3'b000,Instruction[25]};
                        2'b10:data<={3'b000,Instruction[20]};
                        2'b11:data<=ALUOUT[7:4];
                    endcase
                end
            endcase
    end
endmodule
