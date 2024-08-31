`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2024 09:19:32
// Design Name: 
// Module Name: ieee754_alu
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


module ieee754_alu(clk,op,A,B,out,great_out,less_out,equal_out);
input clk;
input [2:0]op;
input [31:0]A,B;
output [31:0]out;
output great_out,less_out,equal_out;

wire clkA,clkB,clkC,clkD,clkE;
wire [31:0]out_add,out_sub,out_mul,out_div,out_comp;
wire great_in,less_in,equal_in;

control_unit cu1(clk,op,clkA,clkB,clkC,clkD,clkE);
float_point_add ad1(clkA,0,A,B,out_add);
float_point_add sub1(clkB,1,A,B,out_sub);
float_point_mul mul1(clkC,A,B,out_mul);
float_point_div div1(clkD,A,B,out_div);
float_point_comp cmp1(clkE,A,B,out_comp,great_in,less_in,equal_in);
out_mux om1(clk,op,out_add,out_sub,out_mul,out_div,out_comp,great_in,less_in,equal_in,out,great_out,less_out,equal_out);

endmodule
