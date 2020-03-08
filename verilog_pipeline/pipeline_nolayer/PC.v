`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:57 11/17/2018 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input [31:0] NPC,
    input clk,
    input reset,
	 input en,
    output reg [31:0] PC = 32'h00003000
    );
	 always @(posedge clk) begin
		if (reset)
			PC = 32'h00003000;
		else if (en)
			PC = NPC;
		else
			PC = PC;
	 end
	 

endmodule
