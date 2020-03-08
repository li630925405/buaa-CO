`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:03 11/17/2018 
// Design Name: 
// Module Name:    ctrl 
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
module ctrl(
	 input clk,
	 input reset,
	 input [4:0] A3_E,
	 input [4:0] A3_M,
	 input [4:0] A3_W,
	 input [31:0] IR_D,
	 input [31:0] IR_E,
	 input [31:0] IR_M,
	 input [31:0] IR_W,
	 output [1:0] FALUBE,
	 output [1:0]FALUAE,
	 output [1:0]FCMP1D,
	 output [1:0]FCMP2D,
	 output FWDM,
	 output [1:0]FRTE,
	 output [1:0]FPCD,
	 output PC_en,
	 output D_en,
	 output E_clr
    );
	 
	 wire Tuse_RS0, Tuse_RS1, Tuse_RT0, Tuse_RT1, Tuse_RT2;
	 wire [1:0] Tnew_E, Tnew_M, Tnew_W;
	 
	 AT U_AT(clk, reset, IR_D, Tuse_RS0, Tuse_RS1, Tuse_RT0, Tuse_RT1, Tuse_RT2, Tnew_E, Tnew_M, Tnew_W);
	 stall U_stall(IR_D, IR_E, IR_M, Tuse_RS0, Tuse_RS1, Tuse_RT0, Tuse_RT1, Tuse_RT2, Tnew_E, Tnew_M, Tnew_W, PC_en, D_en, E_clr);
	 forward U_forward(Tnew_M, IR_D, IR_E, IR_M, IR_W, FALUBE, FALUAE, FCMP1D, FCMP2D, FRTE, FWDM, FPCD);
	
endmodule
