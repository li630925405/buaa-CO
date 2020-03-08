`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:45 11/17/2018 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUctr,
    output reg [31:0] C = 0
    );
	 always @(*) begin
		case(ALUctr)
			0: C = A + B;
			1: C = A - B;
			2: C = A | B;
			3: C = A == B;
			default: C = 0;
		endcase
	end


endmodule
