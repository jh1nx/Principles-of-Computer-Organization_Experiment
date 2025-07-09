`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/26 10:58:24
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
    input CLK,RegDst,RegWre,DBDataSrc,
    input [4:0] rs,rt,rd,
    input [31:0] datafromALU,datafromRW,    //����ALU��������ֵ�������ڴ��ȡ��ֵ
    output [31:0] Data1,Data2,  //�ӼĴ����ж�ȡ��ֵ
    output [31:0] writeData     //д�ؼĴ�����ֵ
    );
    wire [4:0] writeReg;    //Ҫд��ļĴ����Ķ˿�
    assign writeReg=RegDst?rd:rt;      //����Ŀ���ַ��Դ��0Ϊrt(I��ָ��)��1Ϊrd(R��ָ��)
    assign writeData=DBDataSrc?datafromRW:datafromALU;     //����д�ؼĴ�����������Դ
    
    reg [31:0] register[0:31];      //����32��32λ�Ĵ���
    integer i;
    initial begin
        for(i=0;i<32;i=i+1)
            register[i]<=0;
    end    //��ÿ���Ĵ�������ֵ0
    assign Data1=register[rs];
    assign Data2=register[rt];
    always @ (negedge CLK) begin
        if(RegWre)    //RegWreΪ1ʱ������д��Ĵ��������ҷ�ֹ�Ĵ���0���޸�(��0���Ĵ�����Ϊ0)
            register[writeReg] <= writeData;    
    end
endmodule
