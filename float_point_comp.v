`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2024 23:18:34
// Design Name: 
// Module Name: float_point_comp
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


module float_point_comp(clk,A,B,out,great,less,equal);
input clk;
input [31:0]A,B;
output reg [31:0]out=0;
output reg great=0,less=0,equal=0;
reg [31:0]diff;

always@(posedge clk)
begin
great=0;
less=0;
equal=0;
out = A;
if(A[31]==B[31])
    begin
    diff = A[30:0] - B[30:0];
    if((|diff)==0)
        begin
        equal = 1;
        end
    else if(A[31]==0)
        begin
        great = (diff[31]==0)?1:0;
        less = (diff[31]==1)?1:0;
        end
    else 
        begin
        great = (diff[31]==0)?0:1;
        less = (diff[31]==1)?0:1;
        end
    end
else
    begin
    great = (A[31]==0)?1:0;
    less = (A[31]==1)?1:0;   
    end

out = (great==1)?A:B;
end

endmodule
