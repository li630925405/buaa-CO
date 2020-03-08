`timescale 1ns / 1ps
`define M2E 2
`define W2E 1
`define W2M 1
`define M2D 2
`define W2D 1
`define rt 20:16
`define rs 25:21
`define op 31:26
`define func 5:0
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:59 11/26/2018 
// Design Name: 
// Module Name:    forward 
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
module forward(
	input [1:0] Tnew_M,
	input [31:0] IR_D,
	input [31:0] IR_E,
	input [31:0] IR_M,
	input [31:0] IR_W,
	output [1:0] FALUBE,
	output [1:0] FALUAE,
	output [1:0] FCMP1D,
	output [1:0] FCMP2D,
	output [1:0] FRTE,
	output FWDM,
	output [1:0] FPCD
    );
	 wire ALUSrc, RegWrite, MemWrite, ALUSrc_M, RegWrite_M, MemWrite_M, ALUSrc_W, RegWrite_W, MemWrite_W;
	 wire [1:0] MemtoReg, nPC_sel, ExtOp, MemtoReg_M, nPC_sel_M, ExtOp_M, MemtoReg_W, nPC_sel_W, ExtOp_W;
	 wire [2:0] ALUctr, ALUctr_M, ALUctr_W;
	 wire [4:0] A3, A3_M, A3_W;
	 
	 main_ctrl U_forward_ctrl_E(IR_E, A3, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, ExtOp, ALUctr);
    main_ctrl U_forward_ctrl_M(IR_M, A3_M, ALUSrc_M, MemtoReg_M, RegWrite_M, MemWrite_M, nPC_sel_M, ExtOp_M, ALUctr_M);
	 main_ctrl U_forward_ctrl_W(IR_W, A3_W, ALUSrc_W, MemtoReg_W, RegWrite_W, MemWrite_W, nPC_sel_W, ExtOp_W, ALUctr_W);
	
	assign FALUBE = ((IR_E[`rt] == A3_M) & (A3_M != 0) & (Tnew_M == 0) & RegWrite_M) ? `M2E:
				((IR_E[`rt] == A3_W) & (A3_W != 0) & RegWrite_W) ? `W2E:
				0;
	assign FALUAE = ((IR_E[`rs] == A3_M) & (A3_M != 0) & (Tnew_M == 0) & RegWrite_M) ? `M2E:
				((IR_E[`rs] == A3_W) & (A3_W != 0) & RegWrite_W) ? `W2E:
				0;			
	assign FCMP1D = ((IR_D[`rs] == A3_M) & (A3_M != 0) & (Tnew_M == 0) & RegWrite_M) ? `M2E:
				((IR_D[`rs] == A3_W) & (A3_W != 0 ) & RegWrite_W) ? `W2E:
				0;
	assign FCMP2D = ((IR_D[`rt] == A3_M) & (A3_M != 0) & (Tnew_M == 0) & RegWrite_M) ? `M2E:
				((IR_D[`rt] == A3_W) & (A3_W != 0) & RegWrite_W) ? `W2E:
				0;
	assign FRTE = ((IR_E[`rt] == A3_M) & (A3_M != 0) & (Tnew_M == 0) & RegWrite_M) ? `M2E :
			 ((IR_E[`rt] == A3_W) & (A3_W != 0) & RegWrite_W) ? `W2E:
			 0;
	assign FWDM = ((IR_M[`rt] == A3_W) & RegWrite_W & (A3_M != 0)) ? `W2M:
			 0;
	assign FPCD = ((IR_D[`rs] == A3_M) & (Tnew_M == 0) & RegWrite_M & (A3_M != 0)) ? `M2D:
					 ((IR_D[`rs] == A3_W) & RegWrite_W & (A3_W != 0)) ? `W2D :
					 0;
			 


endmodule
