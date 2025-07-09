`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:33:23
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input CLK,reset,
    input [5:0] op,
    input zero,sign,
    input [5:0] func,
    output wire PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output wire InsMemRW,
    output reg WrRegDSrc,
    output reg mRD,
    output reg mWR,
    output reg IRWre,
    output reg [1:0] RegDst,
    output reg ExtSel,
    output reg [1:0]PCSrc,
    output reg [2:0] ALUop,
    output reg [2:0] state
);
    //根据实验原理的状态转移图，写出状态转移的过程
    always @(posedge CLK) begin
        if(reset==0) begin
            state<= 3'b000;
        end
        else case(state)
                3'b000: if(op!=6'b111111) state<= 3'b001;
                        else state<=state;
                3'b001: begin
                    if(op==6'b000100||op==6'b000101||op==6'b000001) state<= 3'b101;
                    else if(op==6'b100011||op==6'b101011) state<= 3'b010;
                    else if(op==6'b000010||op==6'b000011||op==6'b111111||(op==6'b000000&&func==6'b001000)) state<= 3'b000;
                    else state<=3'b110;
                end
                3'b110: state<= 3'b111;
                3'b010: state<= 3'b011;
                3'b011: begin
                    if(op==6'b100011) state<= 3'b100;
                    else state<= 3'b000;
                end
                3'b111: state<= 3'b000;
                3'b101: state<= 3'b000;
                3'b100: state<= 3'b000;
            endcase
        end
    
    //对不同指令、不同状态时的各个控制信号进行赋值
    assign InsMemRW=1;
    always@(*) begin
        case(op)
            6'b000000: begin    
                case(func)
                    6'b100000:begin     //add
                        ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b000;
                        case(state)
                            3'b000: begin
                                IRWre=1;mWR=0;RegWre=0;
                            end
                            3'b001: begin
                                IRWre=0;mWR=0;RegWre=0;
                            end
                            3'b110: begin
                                IRWre=0;mWR=0;RegWre=0;
                            end
                            3'b111: begin
                                IRWre=0;mWR=0;RegWre=1;
                            end                    
                        endcase
                    end
                        6'b100001:begin     //addu
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b000;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end
                        6'b100010:begin     //sub
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b001;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end
                        6'b100011:begin     //subu
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b001;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end 
                        6'b100100:begin     //and
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b100;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end
                        6'b100101:begin     //or
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b011;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end
                        6'b100110:begin     //xor
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b111;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end
                        6'b101010:begin     //slt
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b110;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end
                        6'b101011:begin     //sltu
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b101;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end
                        6'b000000:begin     //sll
                            ALUSrcA=1;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b00;ALUop=3'b010;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b110: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end
                                3'b111: begin
                                    IRWre=0;mWR=0;RegWre=1;
                                end                    
                            endcase
                        end 
                        6'b001000:begin     //jr
                            ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b10;ExtSel=0;PCSrc=2'b10;ALUop=3'b000;
                            case(state)
                                3'b000: begin
                                    IRWre=1;mWR=0;RegWre=0;
                                end
                                3'b001: begin
                                    IRWre=0;mWR=0;RegWre=0;
                                end                 
                            endcase
                        end                                                                                                                                                                                                                                                                   
                endcase
            end
            6'b001000:begin     //addi
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b110: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b111: begin
                        IRWre=0;mWR=0;RegWre=1;
                    end                    
                endcase
            end
            6'b001001:begin     //addiu
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b110: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b111: begin
                        IRWre=0;mWR=0;RegWre=1;
                    end                    
                endcase
            end
            6'b001100:begin     //andi
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=0;PCSrc=2'b00;ALUop=3'b100;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b110: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b111: begin
                        IRWre=0;mWR=0;RegWre=1;
                    end                    
                endcase
            end
            6'b001101:begin     //ori
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=0;PCSrc=2'b00;ALUop=3'b011;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b110: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b111: begin
                        IRWre=0;mWR=0;RegWre=1;
                    end                    
                endcase
            end
            6'b001110:begin     //xori
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=0;PCSrc=2'b00;ALUop=3'b111;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b110: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b111: begin
                        IRWre=0;mWR=0;RegWre=1;
                    end                    
                endcase
            end
            6'b100011:begin     //lw
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=1;WrRegDSrc=1;RegDst=2'b01;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;mRD=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;mRD=0;
                    end
                    3'b010: begin
                        IRWre=0;mWR=0;RegWre=0;mRD=0;
                    end
                    3'b011: begin
                        IRWre=0;mWR=0;RegWre=0;mRD=1;
                    end
                    3'b100: begin
                        IRWre=0;mWR=0;RegWre=1;mRD=0;
                    end                    
                endcase
            end
            6'b101011:begin     //sw
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=1;PCSrc=2'b00;ALUop=3'b000;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b010: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b011: begin
                        IRWre=0;mWR=1;RegWre=0;
                    end                    
                endcase
            end
            6'b000100:begin     //beq
                ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=1;PCSrc=(zero==1)?2'b01:2'b00;ALUop=3'b001;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b101: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end                 
                endcase
            end 
            6'b000101:begin     //bne
                ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=1;PCSrc=(zero==0)?2'b01:2'b00;ALUop=3'b001;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b101: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end                
                endcase
            end
            6'b001010:begin     //slti
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=1;PCSrc=2'b00;ALUop=3'b110;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b110: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b111: begin
                        IRWre=0;mWR=0;RegWre=1;
                    end                    
                endcase
            end
            6'b000001:begin     //bltz
                ALUSrcA=0;ALUSrcB=0;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b01;ExtSel=1;PCSrc=(sign==1)?2'b01:2'b00;ALUop=3'b001;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end
                    3'b101: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end                 
                endcase
            end
            6'b000010:begin     //j
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=1;mRD=0;RegDst=2'b00;ExtSel=0;PCSrc=2'b11;ALUop=3'b000;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=0;
                    end                 
                endcase
            end 
            6'b000011:begin     //jal
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=0;mRD=0;RegDst=2'b00;ExtSel=0;PCSrc=2'b11;ALUop=3'b000;
                case(state)
                    3'b000: begin
                        IRWre=1;mWR=0;RegWre=0;
                    end
                    3'b001: begin
                        IRWre=0;mWR=0;RegWre=1;
                    end                 
                endcase
            end
            6'b111111:begin     //halt
                ALUSrcA=0;ALUSrcB=1;DBDataSrc=0;WrRegDSrc=0;mRD=0;RegDst=2'b00;ExtSel=0;PCSrc=2'b00;ALUop=3'b000;
                IRWre=1;mWR=0;RegWre=0;          
            end                                                                                                                                                   
        endcase
    end
    
    assign PCWre=(state==3'b001&&(op==6'b000010||op==6'b000011||(op==6'b000000&func==6'b001000)))||(state==3'b111)||(state==3'b101)||(state==3'b100)||(state==3'b011&&op==6'b101011); 
endmodule
