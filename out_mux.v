`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2024 23:39:46
// Design Name: 
// Module Name: out_mux
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


module out_mux(clk,op,out_add,out_sub,out_mul,out_div,out_comp,great_in,less_in,equal_in,out,great_out,less_out,equal_out);
input clk;
input [2:0]op;
input [31:0]out_add,out_sub,out_mul,out_div,out_comp;
input great_in,less_in,equal_in;
output reg [31:0]out=0;
output reg great_out=0,less_out=0,equal_out=0;

always@(out_add,out_sub,out_mul,out_div,out_comp)
begin
great_out=0;less_out=0;equal_out=0;
if(op==0)
        begin
        out=out_add;
        end
else if(op==1)
        begin
        out=out_sub;
        end
else if(op==2)
        begin
        out=out_mul;
        end
else if(op==3)
        begin
        out=out_div;
        end
else if(op==4)
        begin
        out=out_comp;
        great_out=great_in;less_out=less_in;equal_out=equal_in;
        end
else
        begin
        out=0;
        end

end
endmodule
