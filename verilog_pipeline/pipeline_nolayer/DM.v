`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:04 11/17/2018 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input [31:0] AD,
    input [31:0] Din,
    input clk,
	 input reset,
    input MemWrite,
	 input [31:0] PC,
    output [31:0] DM_OUT
    );
	reg [31:0] dm[1023:0];
	wire [9:0]ad;
	assign ad = AD[11:2];
	integer i;
	
	initial 
		for (i = 0; i < 1024; i = i + 1) 
			dm[i] = 0;
			
	always @(posedge clk) begin
		if (reset)
			for (i = 0; i < 1024; i = i + 1) 
				dm[i] = 0;
		else if (MemWrite) begin
			dm[ad] = Din;
			$display("%d@%h: *%h <= %h", $time, PC, AD, Din);
		end
	end
	
	assign DM_OUT = dm[ad];

endmodule
