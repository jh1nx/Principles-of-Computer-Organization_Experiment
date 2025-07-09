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
    //输入
    reg CLK, RegDst, RegWre, DBDataSrc;
    reg [4:0] rs, rt, rd;
    reg [31:0] datafromALU, datafromRW;
    //输出
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
        //初始化
        CLK = 0;
        //测试样例1
        #10;
        CLK = 0;
        RegDst = 1;//处理R型指令
        RegWre = 1;//允许写寄存器
        DBDataSrc = 0;//使用来自存储器的输出
        rs = 5'b00000;
        rt = 5'b00001;
        rd = 5'b00010;
        datafromALU = 32'd1;//来自ALU的输出
        datafromRW = 32'd2;//来自RW的输出
        //测试样例2
        #10;
        RegDst = 0;//处理I型指令
        RegWre = 0;//不允许写寄存器
        DBDataSrc = 1;//使用来自ALU的输出
        rs = 5'b00011;
        rt = 5'b00100;
        rd = 5'b00101;
        datafromALU = 32'd3;//来自ALU的输出
        datafromRW = 32'd4;//来自RW的输出
        //测试样例3
        #10;
        RegDst = 0;//处理I型指令
        RegWre = 1;//允许写寄存器
        DBDataSrc = 1;//使用来自ALU的输出
        rs = 5'b00011;
        rt = 5'b00100;
        rd = 5'b00101;
        datafromALU = 32'd3;//来自ALU的输出
        datafromRW = 32'd4;//来自RW的输出
        #10;
        RegDst = 0;//处理I型指令
        RegWre = 1;//允许写寄存器
        DBDataSrc = 1;//使用来自ALU的输出
        rs = 5'b00011;
        rt = 5'b00100;
        rd = 5'b00101;
        datafromALU = 32'd3;//来自ALU的输出
        datafromRW = 32'd4;//来自RW的输出
        $stop;
    end
endmodule
