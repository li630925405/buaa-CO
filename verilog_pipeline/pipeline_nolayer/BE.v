`timescale 1ns / 1ps
`define sw 6'b101011
`define sh 6'b101001
`define sb 6'b101000

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:12:37 12/12/2018 
// Design Name: 
// Module Name:    BE 
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
module BE(
    input [1:0] AD,
	 input [5:0] op,
    output reg[3:0] BE
    );
	 
	 always @(*) 
		case(op)
			`sw: BE = 4'b1111;
			`sh: case(AD[1])
						0: BE = 4'b0011;
						1: BE = 4'b1100;
						default: BE = 0;
					endcase
			`sb: case(AD)
						0: BE = 4'b0001;
						1: BE = 4'b0010;
						2: BE = 4'b0100;
						3: BE = 4'b1000;
						default: BE = 0;
					endcase
			default: BE = 0;
		endcase

endmodule
