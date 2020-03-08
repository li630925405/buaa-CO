`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:25 11/17/2018 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
    input [31:0] PC,
    input [25:0] Imm,
    input [1:0] nPC_sel,
    input zero,
    output reg [31:0] NPC = 32'h00003000,
    input [31:0] RD1,
	 input [31:0] WD,
	 input [31:0] WD_M,
	 input [1:0] FPCD
    );
	 wire [31:0] MFPCD;
	 MUX3to1 U_MFPCD(RD1, WD, WD_M, FPCD, MFPCD);
	 always @(*) begin
		case(nPC_sel)
			0: NPC = PC + 4;
			1: NPC = zero ? (PC + {{14{Imm[15]}}, Imm[15:0], 2'b00}) : PC + 4;//因为调的IR_D，所以不再加4.太奇怪了
			2: NPC = {PC[31:28], Imm, 2'b00}; // j, jal
			3: NPC = MFPCD; //jr
			default: NPC = PC + 4;
		endcase
	end


endmodule
