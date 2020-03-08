`timescale 1ns / 1ps
`include "macro.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:15:05 12/12/2018 
// Design Name: 
// Module Name:    start 
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
module start(
    input clk,
	 input [31:0]Instr,
	 input busy,
    output reg start = 0
    );
	 wire [5:0] op, func;
	 assign op = Instr[31:26];
	 assign func = Instr[5:0];
	 
	 always @(*)
		start = (`mult || `div || `multu || `divu) && ~busy;

endmodule
