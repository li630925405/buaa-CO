`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:07 11/15/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	 wire [4:0] A3, A3_D, A3_E, A3_M, A3_W;
	 wire [1:0] FALUBE, FALUAE, FCMP1D, FCMP2D, FPCD, FRTE;
	 wire FWDM;
	 wire PC_en, D_en, E_clr;
	 wire [31:0] IR_D, IR_E, IR_M, IR_W;
	 
	 ctrl U_ctrl(clk, reset, A3_E, A3_M, A3_W, IR_D, IR_E, IR_M, IR_W, FALUBE, FALUAE, FCMP1D, FCMP2D, FWDM, FRTE, FPCD, PC_en, D_en, E_clr);
	 datapath U_datapath(PC_en, D_en, E_clr, clk, reset, FALUAE, FALUBE, FCMP1D, FCMP2D, FRTE, FWDM, FPCD, A3_E, A3_M, A3_W, IR_D, IR_E, IR_M, IR_W);
	 	 
endmodule
