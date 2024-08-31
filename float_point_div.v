`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 09:14:41
// Design Name: 
// Module Name: float_point_div
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


module float_point_div(clk,A,B,out);
input clk;
input [31:0]A,B;
output reg [31:0]out;
reg [7:0]e_out;
reg [2:0]q;
reg [24:0]rem;
reg [27:0]diff1,diff2,diff3,diff4,diff5,diff6,diff7,diff8;
reg [26:0]one_N=27'd67108864;
reg [26:0]m_out;
reg [1:0]exp_diff;

always@(posedge clk)
begin
out[31] = A[31] ^ B[31];
e_out = A[30:23]-B[30:23]+127;

diff1 = one_N-{1'b1,B[22:0]}*1;
diff2 = one_N-{1'b1,B[22:0]}*2;
diff3 = one_N-{1'b1,B[22:0]}*3;
diff4 = one_N-{1'b1,B[22:0]}*4;
diff5 = one_N-{1'b1,B[22:0]}*5;
diff6 = one_N-{1'b1,B[22:0]}*6;
diff7 = one_N-{1'b1,B[22:0]}*7;
diff8 = one_N-{1'b1,B[22:0]}*8;


if(diff1[27]==1)
    begin
    q=0;
    rem = diff1;
    end
else if(diff2[27]==1)
    begin
    q=1;
    rem = diff2;
    end
else if(diff3[27]==1)
    begin
    q=2;
    rem = diff3;
    end
else if(diff4[27]==1)
    begin
    q=3;
    rem = diff4;
    end
else if(diff5[27]==1)
    begin
    q=4;
    rem = diff5;
    end
else if(diff6[27]==1)
    begin
    q=5;
    rem = diff6;
    end
else if(diff7[27]==1)
    begin
    q=6;
    rem = diff7;
    end

else
    begin
    q=7;
    rem = diff8;
    end

m_out = q*{1'b1,A[22:0]};

if(m_out[26])
    begin
    out[22:0]=m_out[25:3];
    exp_diff=0;
    end
else if(m_out[25])
    begin
    out[22:0]=m_out[24:2];
    exp_diff=1;
    end
else if(m_out[24])
    begin
    out[22:0]=m_out[23:1];
    exp_diff=2;
    end
else
    begin
    out[22:0]=m_out[22:0];
    exp_diff=3;
    end

out[22:0] = m_out;
out[30:23] = e_out;
out = ((A[30:0]==0)|(B[30:0]==0))?0:out;
end

endmodule
