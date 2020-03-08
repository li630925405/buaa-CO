`timescale 1ns / 1ps
`define rt 20:16
`define rd 15:11
`define op 31:26
`define func 5:0
`define rs 25:21
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:19 11/18/2018 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
	 input PC_en,
	 input D_en,
	 input E_clr,
    input clk,
    input reset,
	 input [1:0] FALUAE,
	 input [1:0] FALUBE,
	 input [1:0] FCMP1D,
	 input [1:0] FCMP2D,
	 input [1:0] FRTE,
	 input FWDM,
	 input [1:0] FPCD,
	 output [4:0] A3_E,
	 output [4:0] A3_M,
	 output [4:0] A3_W,
	 output [31:0] IR_D,
	 output [31:0] IR_E,
	 output [31:0] IR_M,
	 output [31:0] IR_W
    );
	 wire ALUSrc_D, RegWrite_D, MemWrite_D, zero_D, ALUSrc_M, RegWrite_M, MemWrite_M, zero_M, ALUSrc_E, RegWrite_E, MemWrite_E, zero_E, ALUSrc_W, RegWrite_W, MemWrite_W, zero_W;
	 wire [1:0] MemtoReg_D, ExtOp_D, nPC_sel_D, MemtoReg_M, ExtOp_M, nPC_sel_M, MemtoReg_E, ExtOp_E, nPC_sel_E, MemtoReg_W, ExtOp_W, nPC_sel_W;
	 wire [2:0] ALUctr_D, ALUctr_E, ALUctr_M, ALUctr_W;
	 wire [31:0] MFCMP1D, MFCMP2D, NPC, MFALUBE, MFALUAE, B, MFRTE, RT_M, MFWDM, C_W, DM_W;
	 wire [4:0] A3_D;
	 
	 
	 wire [31:0] Instr, C, RD1, RD2, DM_OUT, PC, PC4, C_M, WD, EXT, PC8_D, PC8_E, PC8_M, PC8_W, RT_E, RS_E, EXT_E, WD_M;
	 wire Tuse_RS0, Tuse_RS1, Tuse_RT0, Tuse_RT1, Tuse_RT2;
	 
	 //F级功能部件
	 IFU	U_ifu(PC, clk, reset, Instr, PC4);
	 
	 //D级流水寄存器
	 R_pipe PIPE_IR_D(clk, Instr, D_en, 1'b0, reset, IR_D);
	 R_pipe PIPE_PC8_D(clk, PC4 + 4, D_en,  1'b0, reset, PC8_D);
	
	 main_ctrl D_ctrl(IR_D, A3_D, ALUSrc_D, MemtoReg_D, RegWrite_D, MemWrite_D, nPC_sel_D, ExtOp_D, ALUctr_D);
	 
	 //D级功能部件
	 PC	pc(NPC, clk, reset, PC_en, PC);
	 NPC	npc(PC, IR_D[25:0], nPC_sel_D, zero, NPC, RD1, WD, WD_M, FPCD);	
	 
	 ext U_ext(IR_D[15:0], ExtOp_D, EXT);
	 
	 MUX3to1 mux_D1(RD1, WD, WD_M, FCMP1D, MFCMP1D);
	 MUX3to1 mux_D2(RD2, WD, WD_M, FCMP2D, MFCMP2D);
	 CMP U_CMP(MFCMP1D, MFCMP2D, zero);
	 
	 MUX3to1 U_mux_WD(C_W, DM_W, PC8_W, MemtoReg_W, WD);
	 RF U_RF(IR_D[`rs], IR_D[`rt], A3_W, WD, RegWrite_W, clk, reset, PC8_W - 8, RD1, RD2);
	 
	 //E级流水寄存器
	 R_pipe PIPE_IR_E(clk, IR_D, 1'b1, E_clr, reset, IR_E);
	 R_pipe PIPE_PC8_E(clk, PC8_D, 1'b1, E_clr, reset, PC8_E);
	 R_pipe PIPE_RS_E(clk, RD1, 1'b1, E_clr, reset, RS_E);
	 R_pipe PIPE_RT_E(clk, RD2, 1'b1, E_clr, reset, RT_E);
	 R_pipe PIPE_EXT_E(clk, EXT, 1'b1, E_clr, reset, EXT_E);
	 
	 main_ctrl E_decode(IR_E, A3_E, ALUSrc_E, MemtoReg_E, RegWrite_E, MemWrite_E, nPC_sel_E, ExtOp_E, ALUctr_E);
	 
	 //E级功能部件
	 MUX3to1 U_MFALUBE(RT_E, WD, WD_M, FALUBE, MFALUBE);
	 MUX3to1 U_MFALUAE(RS_E, WD, WD_M, FALUAE, MFALUAE);
	 MUX2to1 U_mux_ALUB(MFALUBE, EXT_E, ALUSrc_E, B);
	 alu U_alu(MFALUAE, B, ALUctr_E, C);
	 
	 //M级流水寄存器
			
	 R_pipe PIPE_IR_M(clk, IR_E, 1'b1, 1'b0, reset, IR_M);
	 R_pipe PIPE_PC8_M(clk, PC8_E, 1'b1, 1'b0, reset, PC8_M);
	 
	 MUX3to1 U_MFRTE(RT_E, WD, WD_M, FRTE, MFRTE);
	 R_pipe PIPE_RT_M(clk, MFRTE, 1'b1, 1'b0, reset, RT_M);
	 R_pipe PIPE_C_M(clk, C, 1'b1, 1'b0, reset, C_M);
	 
	 main_ctrl M_ctrl(IR_M, A3_M, ALUSrc_M, MemtoReg_M, RegWrite_M, MemWrite_M, nPC_sel_M, ExtOp_M, ALUctr_M);
	 
	 //M级功能部件
	 MUX2to1 U_MFWDM(RT_M, WD, FWDM, MFWDM);
	 DM U_DM(C_M, MFWDM, clk, reset, MemWrite_M, PC8_M - 8, DM_OUT);
	 
	 MUX3to1 U_WD_M(C_M, DM_OUT, PC8_M, MemtoReg_M, WD_M);
	 
	 //W级流水寄存器
	 R_pipe PIPE_IR_W(clk, IR_M, 1'b1, 1'b0, reset, IR_W);
	 R_pipe PIPE_C_W(clk, C_M, 1'b1, 1'b0, reset, C_W);
	 R_pipe PIPE_PC8_W(clk, PC8_M, 1'b1, 1'b0, reset, PC8_W);
	 R_pipe PIPE_DM_W(clk, DM_OUT, 1'b1, 1'b0, reset, DM_W);
		
	 main_ctrl W_ctrl(IR_W, A3_W, ALUSrc_W, MemtoReg_W, RegWrite_W, MemWrite_W, nPC_sel_W, ExtOp_W, ALUctr_W);
	 
endmodule
