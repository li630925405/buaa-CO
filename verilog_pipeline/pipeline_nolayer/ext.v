`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:25:33 10/26/2018 
// Design Name: 
// Module Name:    ext 
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
module ext(
    input [15:0] Imm,
    input [1:0] ExtOp,
    output reg [31:0] EXT
    );

	 always @(*)
		case (ExtOp)
			1: EXT = {{16{Imm[15]}}, Imm};
			0: EXT = {{16{0}}, Imm};
			2: EXT = {Imm, 16'b0}; //lui
			//3: EXT = {{16{Imm[15]}}, Imm} << 2; //beq
			default: EXT = 0;
		endcase


endmodule
