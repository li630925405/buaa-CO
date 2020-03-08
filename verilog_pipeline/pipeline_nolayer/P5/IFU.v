`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:47 11/17/2018 
// Design Name: 
// Module Name:    IFU 
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
module IFU(
	 input [31:0]PC,
    input clk,
    input reset,
	 output [31:0] Instr,
	 output [31:0] PC4
    );
	 wire [31:0] NPC;
	 reg [31:0] IM[1023:0];
	 initial 
		$readmemh("code.txt", IM);	
	 assign Instr = IM[PC[11:2]];
	 assign PC4 = PC + 4;

endmodule
