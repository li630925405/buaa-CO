`timescale 1ns / 1ps
`define lb 6'b100000
`define lbu 6'b100100
`define lh 6'b100001
`define lhu 6'b100101
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:10 12/12/2018 
// Design Name: 
// Module Name:    LE 
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
module LE(
    input [1:0] A,
    input [31:0] Din,
	 input [31:0] IR_M,
    output reg [31:0] DOut
    );
	 
	 wire [5:0] op;
	 assign op = IR_M[31:26];
	 
	 always @(*)
		case (op)
			`lb: case(A)
						0: DOut = {{24{Din[7]}}, Din[7:0]};
						1: DOut = {{24{Din[15]}}, Din[15:8]};
						2: DOut = {{24{Din[23]}}, Din[23:16]};
						3: DOut = {{24{Din[31]}}, Din[31:24]};
						default: DOut = 0;
					endcase
			`lbu: case(A)
						0: DOut = {24'b0, Din[7:0]};
						1: DOut = {24'b0, Din[15:8]};
						2: DOut = {24'b0, Din[23:16]};
						3: DOut = {24'b0, Din[31:24]};
						default: DOut = 0;
					endcase
			`lh: case(A[1])
						0: DOut = {{16{Din[15]}}, Din[15:0]};
						1: DOut = {{16{Din[31]}}, Din[31:16]};
						default: DOut = 0;
					endcase
			`lhu: case(A[1])
						0: DOut = {16'b0, Din[15:0]};
						1: DOut = {16'b0, Din[31:16]};
						default : DOut = 0;
					endcase
			default: DOut = Din;
		endcase

endmodule
