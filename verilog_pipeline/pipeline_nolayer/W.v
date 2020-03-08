`timescale 1ns / 1ps
`define op 31:26
`define func 5:0
`define rs 25:21
`define rt 20:16
`define rd 15:11
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:11 11/24/2018 
// Design Name: 
// Module Name:    W 
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
module W(
    input clk,
	 input reset,
    input [31:0] PC8_M,
	 input [31:0] IR_D,
	 input [31:0] PC8_D,
    input [31:0] IR_M,
	 input [31:0] C_M,
	 input [31:0] DM_OUT,
    output [31:0] IR_W,
	 output [31:0] PC8_W,
	 output [31:0]WD,
	 output [4:0] A3_W,
	 output [31:0]RD1,
	 output [31:0]RD2
    );
	 wire ALUSrc, RegWrite, MemWrite;
	 wire [1:0] MemtoReg, nPC_sel, ExtOp;
	 wire [2:0] ALUctr;
	 wire [31:0] DM_W, C_W;
	 
	 //W级流水寄存器
	 R_pipe PIPE_IR_W(clk, IR_M, 1'b1, 1'b0, reset, IR_W);
	 R_pipe PIPE_C_W(clk, C_M, 1'b1, 1'b0, reset, C_W);
	 R_pipe PIPE_PC8_W(clk, PC8_M, 1'b1, 1'b0, reset, PC8_W);
	 R_pipe PIPE_DM_W(clk, DM_OUT, 1'b1, 1'b0, reset, DM_W);
		
	 main_ctrl W_ctrl(IR_W, A3_W, ALUSrc, MemtoReg, RegWrite, MemWrite, nPC_sel, ExtOp, ALUctr);
	 
	 //W级功能部件
	 MUX3to1 U_mux_WD(C_W, DM_W, PC8_W, MemtoReg, WD);
	 RF U_RF(IR_D[`rs], IR_D[`rt], A3_W, WD, RegWrite, clk, reset, PC8_W - 8, RD1, RD2);

endmodule
