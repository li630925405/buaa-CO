`timescale 1ns / 1ps
`define rt 20:16
`define rd 15:11
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:39 11/17/2018 
// Design Name: 
// Module Name:    mux2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX3to1(in0, in1, in2, sel, out);
	parameter WIDTH_DATA = 32;
	input [WIDTH_DATA:1] in0;
	input [WIDTH_DATA:1] in1;
	input [WIDTH_DATA:1] in2;
	input [1:0] sel;
	output reg [WIDTH_DATA:1] out;
	always @(*) begin
		case(sel)
			2: out = in2;
			1: out = in1;
			default: out = in0;
		endcase
	end
endmodule 

module MUX2to1(in0, in1, sel, out);
		parameter WIDTH_DATA = 32;
		input [WIDTH_DATA:1] in0;
		input [WIDTH_DATA:1] in1;
		input sel;
		output reg [WIDTH_DATA:1] out;
		always @(*)begin
			case(sel)
				1: out = in1;
				default: out = in0;
			endcase
		end
endmodule
