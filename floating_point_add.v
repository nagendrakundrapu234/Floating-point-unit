`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 17:51:22
// Design Name: 
// Module Name: float_point_add
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


module float_point_add(clk,op,A,B,out);
input clk,op;
input [31:0]A,B;
output reg [31:0]out=0;

reg [31:0]res;
reg [31:0]temp1,temp2,tempA,tempB;
reg [7:0]e_final;
reg [23:0]m_shift;
reg [7:0]exp_diff=0;
reg [24:0]m_final=0;

reg count=0;
reg [4:0]index=23;
reg [4:0]i=23;

always@(posedge clk)
begin
if(op==0)
    begin
    tempA=A;
    tempB=B;
    end
else
    begin
    tempA=A;
    tempB={~B[31],B[30:0]};
    end
temp1 = (A[30:0]>B[30:0])?tempA:tempB;
temp2 = (A[30:0]<B[30:0])?tempA:tempB;
exp_diff = temp1[30:23] - temp2[30:23];
e_final = temp1[30:23];
res[31] = temp1[31];
m_shift = {1'b1,temp2[22:0]}>>exp_diff;

if(temp1[31]==temp2[31])
    begin
    m_final = {1'b1,temp1[22:0]}+m_shift;
    res[22:0] = (m_final[24]==1)?m_final[23:1]:m_final[22:0];
    res[30:23] = (m_final[24]==1)?e_final+1:e_final;
    end
else
    begin
    m_final = {1'b1,temp1[22:0]}-m_shift;
    count=0;
    index=23;
    for(i=23;i>0;i=i-1)
        begin
        if(m_final[i]==1 && count==0)
            begin
            index=i;
            count=count+1;
            end
        end
    m_final[23:0]=m_final[23:0]<<(23-index);
    res[22:0]=m_final[22:0];
    res[30:23]=e_final-(23-index);
    end
out = ((A[31]!=B[31])&&(A[30:0]==B[30:0]))? 32'b0:res;
end
endmodule
