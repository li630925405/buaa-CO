`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:52 11/26/2018 
// Design Name: 
// Module Name:    R_pipe 
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
module R_pipe(clk, di, en, clr, reset, dout);
	parameter WIDTH_DATA = 32;
	input clk;
	input [WIDTH_DATA:1] di;
	input en;
	input clr;
	input reset;
	output reg [WIDTH_DATA:1] dout;
	
	
	always @(posedge clk) begin
		if (reset)
			dout <= 0;
		else if (clr)
			dout <= 0;
		else if(en)
			dout <= di;
	end	
endmodule
