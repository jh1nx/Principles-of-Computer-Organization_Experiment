`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 12:21:50
// Design Name: 
// Module Name: PC_sim
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


module PC_sim();
    //����
    reg CLK;
    reg reset;
    reg PCWre;
    reg [1:0] PCSrc;
    reg [31:0] immExt;
    reg [31:0] JumpPC;
    //���
    wire [31:0] address;
    wire [31:0] nextaddress;
    PC uut(
        .CLK(CLK),
        .reset(reset),
        .PCWre(PCWre),
        .PCSrc(PCSrc),
        .immExt(immExt),
        .nextaddress(nextaddress),
        .address(address),
        .JumpPC(JumpPC)
    );
    always #15 CLK = !CLK;  //ʱ��ÿ15ns�仯һ��
    initial begin
        //��¼���ݱ仯
        $dumpfile("PC.vcd");
        $dumpvars(0, PC_sim);
        //��ʼ��
        CLK = 0;
        reset = 0;
        PCWre = 0;
        PCSrc = 2'b00;
        immExt = 0;
        //����ת��˳��ִ����һ����ַ
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b00;
        immExt = 4;
        //����ת��˳��ִ����һ����ַ
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b00;
        immExt = 4;
        //ƫ��ֵ��ת��ִ����ת֮���ָ��
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b01;
        immExt = 4;
        //ƫ��ֵ��ת��ִ����ת֮���ָ��
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b01;
        immExt = 4;
        //��������ת��ִ����ת֮�������
        #50;
        reset = 1;
        PCWre = 1;
        PCSrc = 2'b10;
        JumpPC=8;   
        //����
        #50;
        $stop;
    end
endmodule
