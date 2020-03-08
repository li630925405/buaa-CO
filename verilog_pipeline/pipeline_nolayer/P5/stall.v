`timescale 1ns / 1ps
`define rs 25:21
`define rt 20:16
`define op 31:26
`define func 5:0
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:51 11/26/2018 
// Design Name: 
// Module Name:    stall 
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
module stall(
	input [31:0] Instr,
	input [31:0]IR_E,
	input [31:0]IR_M,
	input Tuse_RS0,
	input Tuse_RS1,
	input Tuse_RT0,
	input Tuse_RT1,
	input Tuse_RT2,
	input [1:0] Tnew_E,
	input [1:0] Tnew_M,
	input [1:0] Tnew_W,
	output reg PC_en = 1,
	output reg D_en = 1,
	output reg E_clr = 0
    );
	 
	 wire Stall_RS0_E1, Stall_RS0_E2, Stall_RS1_E2, Stall_RS, Stall_RT0_E1, Stall_RT0_E2, Stall_RT0_M1, Stall_RT1_E2, Stall, Stall_RT;
	 wire ALUSrc_M, RegWrite_M, MemWrite_M, ALUSrc_E, RegWrite_E, MemWrite_E;
	 wire [1:0] MemtoReg_M, nPC_sel_M, ExtOp_M, MemtoReg_E, nPC_sel_E, ExtOp_E;
	 wire [2:0] ALUctr_M, ALUctr_E;
	 wire [4:0] A3_M, A3_E;
    main_ctrl U_stall_ctrl_M(IR_M, A3_M, ALUSrc_M, MemtoReg_M, RegWrite_M, MemWrite_M, nPC_sel_M, ExtOp_M, ALUctr_M);
	 main_ctrl U_stall_ctrl_E(IR_E, A3_E, ALUSrc_E, MemtoReg_E, RegWrite_E, MemWrite_E, nPC_sel_E, ExtOp_E, ALUctr_E);
	
	assign Stall_RS0_E1 = Tuse_RS0 & (Tnew_E == 1) & (Instr[`rs] == A3_E) & RegWrite_E;
	assign Stall_RS0_E2 = Tuse_RS0 & (Tnew_E == 2) & (Instr[`rs] == A3_E) & RegWrite_E;
	assign Stall_RS0_M1 = Tuse_RS0 & (Tnew_M == 1) & (Instr[`rs] == A3_M) & RegWrite_M;
	assign Stall_RS1_E2 = Tuse_RS1 & (Tnew_E == 2) & (Instr[`rs] == A3_E) & RegWrite_E;
	assign Stall_RS = Stall_RS0_E1 | Stall_RS0_E2 | Stall_RS0_M1 | Stall_RS1_E2;
	
	assign Stall_RT0_E1 = Tuse_RT0 & (Tnew_E == 1) & (Instr[`rt] == A3_E) & RegWrite_E;
	assign Stall_RT0_E2 = Tuse_RT0 & (Tnew_E == 2) & (Instr[`rt] == A3_E) & RegWrite_E;
	assign Stall_RT0_M1 = Tuse_RT0 & (Tnew_M == 1) & (Instr[`rt] == A3_M) & RegWrite_M;
	assign Stall_RT1_E2 = Tuse_RT1 & (Tnew_E == 2) & (Instr[`rt] == A3_E) & RegWrite_E;
	assign Stall_RT = Stall_RT0_E1 | Stall_RT0_E2 | Stall_RT0_M1 | Stall_RT1_E2;
	
	assign Stall = Stall_RS | Stall_RT;
	
	always @(*) begin
		PC_en = ~Stall;
		D_en = ~Stall;
		E_clr = Stall;
	end

endmodule
