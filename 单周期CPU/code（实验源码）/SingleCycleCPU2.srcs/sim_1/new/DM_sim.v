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
    //����
    reg CLK;
    reg [31:0] DAddr;
    reg [31:0] DataIn;
    reg mRD;
    reg mWR;
    //���
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
        //��ʼ��
        CLK = 0;
        DAddr = 0;
        DataIn = 0;
        mRD = 0;    //Ϊ1����������Ϊ0���������̬���൱�ڿ�·��
        mWR = 0;   //Ϊ1��д��Ϊ0���޲���
        #30;//30ns��CLK�½���д
            DAddr = 8;
            DataIn = 25;
            mRD = 0;
            mWR = 1;
        #30;//60ns��CLK�½���д
            DAddr = 12;
            DataIn = 73;
            mRD = 0;
            mWR = 1;
        #30;//90ns��ʼ��
            DAddr = 12;
            mRD = 1;
            mWR = 0;
        #30;//120ns��ʼ��
            DAddr = 8;
            mRD = 1;
            mWR = 0;
        #30;
            $stop;//150ns��ͣ
    end

endmodule
