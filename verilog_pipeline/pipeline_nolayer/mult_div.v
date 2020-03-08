`timescale 1ns / 1ps
`define mthi 6'b010001
`define mtlo 6'b010011
`define mfhi 6'b010000
`define mflo 6'b010010
`define mult 6'b011000
`define div 6'b011010
`define multu 6'b011001
`define divu 6'b011011
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:19 12/12/2018 
// Design Name: 
// Module Name:    mult_div 
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
module mult_div(
    input reset,
    input clk,
	 input start,
    input [31:0] A,
    input [31:0] B,
	 input [31:0]IR_E,
    output reg[31:0] RD = 0,
	 output reg busy = 0
    );
	 //内部转发？
	 reg [31:0] HI = 0;
	 reg [31:0] LO = 0;
	 reg [3:0] cnt = 0;
	 wire [5:0] func;
	 assign func = IR_E[5:0];
	 reg [63:0]C = 0;
	 reg [31:0]remainder = 0;
	 reg mult = 0;
	 
	 always @(*)
		case(func)
			`mtlo: LO = A;
			`mthi: HI = A;
			`mfhi: RD = HI;
			`mflo: RD = LO;
		endcase
			
	 always @(posedge clk) begin
		if (reset) begin
			HI = 0;
			LO = 0;
			busy = 0;
		end
		else begin
			case(func)
				`mult: begin 
							C = $signed(A) * $signed(B);
							mult = 1;
						 end
				`multu: begin 
							C = A * B;
							mult = 1;
						 end
				`div: begin
							C = $signed(A) / $signed(B);
							remainder = $signed(A) % $signed(B);
						end
				`divu: begin
							C = A / B;
							remainder = A % B;
						end
				default: C = C;
			endcase
			case(cnt)
				0: if (start && !busy) begin
						cnt = 1;
						busy = 1;
					end
				1: cnt = 2;
				2: cnt = 3;
				3: cnt = 4;
				4: cnt = 5;
				5: if (mult) begin
						cnt = 0;
						busy = 0;
						mult = 0;
						HI = C[63:32];
						LO = C[31:0];
					end
					else 
						cnt = 6;
				6: cnt = 7;
				7: cnt = 8;
				8: cnt = 9;
				9: cnt = 10;
				10: begin
						cnt = 0;	
						busy = 0;
						HI = remainder;
						LO = C[31:0];
					end
			endcase
		end
	end
	
endmodule
