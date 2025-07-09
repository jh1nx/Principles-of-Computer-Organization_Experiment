`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 12:28:33
// Design Name: 
// Module Name: DM_sim
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


module DM_sim;
    //输入
    reg CLK;
    reg [31:0] DAddr;
    reg [31:0] DataIn;
    reg mRD;
    reg mWR;
    //输出
    wire [31:0] DMOut;
    DataMemory uut(
        .CLK(CLK),
        .DAddr(DAddr),
        .DataIn(DataIn),
        .mRD(mRD),
        .mWR(mWR),
        .DMOut(DMOut)
    );
    always #15 CLK = !CLK;
    initial begin
        //
        $dumpfile("DM.vcd");
        $dumpvars(0, DM_sim);
        //初始化
        CLK = 0;
        DAddr = 0;
        DataIn = 0;
        mRD = 0;    //为1，正常读；为0，输出高阻态（相当于开路）
        mWR = 0;   //为1，写；为0，无操作
        #30;//30ns后，CLK下降沿写
            DAddr = 8;
            DataIn = 25;
            mRD = 0;
            mWR = 1;
        #30;//60ns后，CLK下降沿写
            DAddr = 12;
            DataIn = 73;
            mRD = 0;
            mWR = 1;
        #30;//90ns后开始读
            DAddr = 12;
            mRD = 1;
            mWR = 0;
        #30;//120ns后开始读
            DAddr = 8;
            mRD = 1;
            mWR = 0;
        #30;
            $stop;//150ns后停
    end

endmodule
