`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 20:04:11
// Design Name: 
// Module Name: ieee754_alu_tb
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


module ieee754_alu_tb();
reg clk;
reg [2:0]op;
reg [31:0]A,B;
wire [31:0]out;
wire great_out,less_out,equal_out;

ieee754_alu fpu1(clk,op,A,B,out,great_out,less_out,equal_out);
//float_point_div d1(clk,A,B,out);
initial clk=0;
always #20 clk=~clk;

initial
begin
op=5; A=32'b0_00000000_00000000000000000000000; B=32'b0_00000000_00000000000000000000000;
#200
op=0; A=32'b0_10000001_00000000000000000000000; B=32'b0_01111111_00000000000000000000000;
#40 op=1; A=32'b0_10000101_11101000000000000000000; B=32'b0_10000000_00000000000000000000000;
#40 op=2; A=32'b0_10000011_00000000000000000000000; B=32'b0_10000010_00000000000000000000000;
#40 op=3; A=32'b0_10000000_00000000000000000000000; B=32'b0_10000001_00000000000000000000000;
#40 op=4; A=32'b0_01111111_10000000000000000000000; B=32'b1_01111111_10000000000000000000000;
#40 op=0; A=32'b1_10000001_01100000000000000000000; B=32'b1_10000001_00100000000000000000000;
#40 op=0; A=32'b0_10000000_01000000000000000000000; B=32'b0_10000010_00001001100110011001100;
//#20 A=32'b0_01111111_10000000000000000000000; B=32'b0_10000000_01000000000000000000000;
//#20 A=32'b0_10000110_00110100011100110011001; B=32'b1_10000110_00110100100001111010111;
//#20  A=32'b0_10000110_00110100011100110011001; B=32'b0_10000000_01000000000000000000000;
//#20  A=32'b0_10001000_00110100011100110011001; B=32'b1_10000110_00110100100001111010111;
//#20  A=32'b0_00000000_00000000000000000000000; B=32'b0_00000000_00000000000000000000000;

#80 $finish;
end
endmodule
