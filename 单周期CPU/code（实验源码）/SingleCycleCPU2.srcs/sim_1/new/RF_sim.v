`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 12:37:01
// Design Name: 
// Module Name: RF_sim
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


module RF_sim();
    //����
    reg CLK, RegDst, RegWre, DBDataSrc;
    reg [4:0] rs, rt, rd;
    reg [31:0] datafromALU, datafromRW;
    //���
    wire [31:0] Data1;
    wire [31:0] Data2;
    RegisterFile uut(
        .CLK(CLK),
        .RegDst(RegDst),
        .RegWre(RegWre),
        .DBDataSrc(DBDataSrc),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .datafromALU(datafromALU),
        .datafromRW(datafromRW),

        .Data1(Data1),
        .Data2(Data2)
    );
    always #3 CLK = !CLK;

    initial begin
        //record
        $dumpfile("RF.vcd");
        $dumpvars(0, RF_sim);
        //��ʼ��
        CLK = 0;
        //��������1
        #10;
        CLK = 0;
        RegDst = 1;//����R��ָ��
        RegWre = 1;//����д�Ĵ���
        DBDataSrc = 0;//ʹ�����Դ洢�������
        rs = 5'b00000;
        rt = 5'b00001;
        rd = 5'b00010;
        datafromALU = 32'd1;//����ALU�����
        datafromRW = 32'd2;//����RW�����
        //��������2
        #10;
        RegDst = 0;//����I��ָ��
        RegWre = 0;//������д�Ĵ���
        DBDataSrc = 1;//ʹ������ALU�����
        rs = 5'b00011;
        rt = 5'b00100;
        rd = 5'b00101;
        datafromALU = 32'd3;//����ALU�����
        datafromRW = 32'd4;//����RW�����
        //��������3
        #10;
        RegDst = 0;//����I��ָ��
        RegWre = 1;//����д�Ĵ���
        DBDataSrc = 1;//ʹ������ALU�����
        rs = 5'b00011;
        rt = 5'b00100;
        rd = 5'b00101;
        datafromALU = 32'd3;//����ALU�����
        datafromRW = 32'd4;//����RW�����
        #10;
        RegDst = 0;//����I��ָ��
        RegWre = 1;//����д�Ĵ���
        DBDataSrc = 1;//ʹ������ALU�����
        rs = 5'b00011;
        rt = 5'b00100;
        rd = 5'b00101;
        datafromALU = 32'd3;//����ALU�����
        datafromRW = 32'd4;//����RW�����
        $stop;
    end
endmodule
