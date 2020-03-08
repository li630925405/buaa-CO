`timescale 1ns / 1ps
`define op 31:26
`define func 5:0
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:10 11/24/2018 
// Design Name: 
// Module Name:    M 
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
module M(
	 input clk,
	 input reset,
	 input [31:0] RT_E,
    input [31:0] IR_E,
    input [31:0] PC8_E,
	 input [31:0] C,
	 input FWDM,
	 input [1:0] FRTE,
	 input [31:0] WD,
	 output [4:0]A3_M,
    output [31:0] IR_M,
    output [31:0] PC8_M,
	 output [31:0] DM_OUT,
	 output [31:0] C_M
    );
	 
	 wire [31:0] MFRTE, MFWDM, RT_M;
	 wire ALUSrc, RegWrite, MemWrite;
	 wire [1:0] MemtoReg, nPC_sel, ExtOp;
	 wire [2:0] ALUctr;
	 //M级流水寄存器
			
	 R_pipe PIPE_IR_M(clk, IR_E, 1'b1, 1'b0, reset, IR_M);
	 R_pipe PIPE_PC8_M(clk, PC8_E, 1'b1, 1'b0, reset, PC8_M);
	 
	 MUX3to1 U_MFRTE(RT_E, WD, C_M, FRTE, MFRTE);
	 R_pipe PIPE_RT_M(clk, MFRTE, 1'b1, 1'b0, reset, RT_M);
	 R_pipe PIPE_C_M(clk, C, 1'b1, 1'b0, reset, C_M);
	 
	 main_ctrl M_ctrl(IR_M, A3_M, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, ExtOp, ALUctr);
	 
	 //M级功能部件
	 MUX2to1 U_MFWDM(RT_M, WD, FWDM, MFWDM);
	 DM U_DM(C_M, MFWDM, clk, reset, MemWrite, PC8_M - 8, DM_OUT);
	 
endmodule
