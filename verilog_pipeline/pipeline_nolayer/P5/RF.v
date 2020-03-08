`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:07 11/17/2018 
// Design Name: 
// Module Name:    RF 
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
module RF(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    input RegWrite,
    input clk,
    input reset,
	 input [31:0] PC,
    output reg[31:0] RD1,
    output reg[31:0] RD2
    );
	 wire [31:0]tmp_RD1, tmp_RD2;
	 wire sel_RD1, sel_RD2;
	 assign sel_RD1 = (A1 == A3 & RegWrite);
	 assign sel_RD2 = (A2 == A3 & RegWrite);
	 reg [31:0] rf[31:0];
	 integer i;
	 
	 initial 
		for (i = 0; i < 32; i = i + 1)
			rf[i] = 0;
	
	 always @(posedge clk) begin
		if (reset)
			for (i = 0; i < 32; i = i + 1)
				rf[i] = 0;
		else if (RegWrite && (A3 != 0)) begin
			$display ("%d@%h: $%d <= %h", $time, PC, A3, WD);
			rf[A3] = WD;
		end
	end
	
	assign tmp_RD1 = (A1 != 0) ? rf[A1] : 0;
	assign tmp_RD2 = (A2 != 0) ? rf[A2] : 0;
	always @(*)begin
		case(sel_RD1)
			1: RD1 = (A3 != 0) ? WD : 0;
			default: RD1 = tmp_RD1;
		endcase
		case(sel_RD2)
			1: RD2 = (A3 != 0 ) ? WD : 0;
			default: RD2 = tmp_RD2;
		endcase
	end

endmodule
