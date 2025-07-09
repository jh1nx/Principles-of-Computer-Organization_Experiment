`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/11 11:22:02
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input CLK,
    input RegWre,
    input [4:0] ReadReg1,ReadReg2,
    input [4:0] writeReg,    //Ҫд��ļĴ����Ķ˿�
    input [31:0] writeData,    //д�ؼĴ�����ֵ
    output [31:0] ReadData1,ReadData2  //�ӼĴ����ж�ȡ��ֵ
    );
    reg [31:0] register[0:31];      //����32��32λ�Ĵ���
    integer i;
    initial begin
        for(i=0;i<32;i=i+1)
            register[i]<=0;
    end    //��ÿ���Ĵ�������ֵ0
    assign ReadData1=register[ReadReg1];
    assign ReadData2=register[ReadReg2];
    always @ (negedge CLK) begin
        if(writeReg!=0 && RegWre)    //RegWreΪ1ʱ������д��Ĵ��������ҷ�ֹ�Ĵ���0���޸�(��0���Ĵ�����Ϊ0)
            register[writeReg] <= writeData;    
    end
endmodule
