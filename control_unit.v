`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 20:57:14
// Design Name: 
// Module Name: control_unit
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


module control_unit(clk,op,clkA,clkB,clkC,clkD,clkE);
input clk;
input [2:0]op;
output clkA,clkB,clkC,clkD,clkE;

assign clkA = (op==3'b000)?clk:0;
assign clkB = (op==3'b001)?clk:0;
assign clkC = (op==3'b010)?clk:0;
assign clkD = (op==3'b011)?clk:0;
assign clkE = (op==3'b100)?clk:0;

endmodule



//always@(posedge clk)
//begin
//clkA=0;
//clkB=0;
//clkC=0;
//clkD=0;
//case(op)
//    0: clkA = clk;
//    1: clkB = clk;
//    2: clkC = clk;
//    3: clkD = clk;
//    default: clkA = clk;
//endcase
//end