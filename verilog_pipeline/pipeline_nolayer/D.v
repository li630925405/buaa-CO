`timescale 1ns / 1ps
`define op 31:26
`define func 5:0
`define rs 25:21
`define rt 20:16
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:10 11/24/2018 
// Design Name: 
// Module Name:    D 
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
module D(
	 input en,
	 input clk,
	 input reset,
	 input PC_en,
	 input [31:0] RD1,
	 input [31:0] RD2,
    input [31:0] PC4,
    input [31:0] Instr,
	 input [31:0] C_M,
	 input [31:0] WD,
	 input [1:0]FPCD,
	 input [1:0] FCMP1D,
	 input [1:0] FCMP2D,
	 output [31:0] EXT,
    output [31:0] IR_D,
	 output [31:0] PC8_D,
	 output [31:0]PC
    );
	 wire ALUSrc, RegWrite, MemWrite, zero;
	 wire [1:0] MemtoReg, ExtOp, nPC_sel;
	 wire [2:0] ALUctr;
	 wire [31:0] MFCMP1D, MFCMP2D, NPC;
	 wire [4:0] A3_D;
	 
	 //D级流水寄存器
	 R_pipe PIPE_IR_D(clk, Instr, en, 1'b0, reset, IR_D);
	 R_pipe PIPE_PC8_D(clk, PC4 + 4, en,  1'b0, reset, PC8_D);
	
	 main_ctrl D_ctrl(IR_D, A3_D, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, ExtOp, ALUctr);
	 
	 //D级功能部件
	 PC	pc(NPC, clk, reset, PC_en, PC);
	 NPC	npc(PC, IR_D[25:0], nPC_sel, zero, NPC, RD1, WD, C_M, FPCD);	
	 
	 ext U_ext(IR_D[15:0], ExtOp, EXT);
	 
	 MUX3to1 mux_D1(RD1, WD, C_M, FCMP1D, MFCMP1D);
	 MUX3to1 mux_D2(RD2, WD, C_M, FCMP2D, MFCMP2D);
	 CMP U_CMP(MFCMP1D, MFCMP2D, zero);
endmodule
