`timescale 1ns / 1ps
`define addu (func == 6'b100001 && op == 0)
`define subu (func == 6'b100011 && op == 0)
`define nop (func == 0 && op == 0)
`define ori (op == 6'b001101)
`define lui (op == 6'b001111)
`define lw (op == 6'b100011)
`define sw (op == 6'b101011)
`define j (op == 6'b000010)
`define jal (op == 6'b000011)
`define jr (op == 0 && func == 6'b001000)
`define beq (op == 6'b000100)
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define T_ALU 1
`define T_DM 2
`define T_PC 0
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:17 11/26/2018 
// Design Name: 
// Module Name:    AT 
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
module AT(
	 input clk,
	 input reset,
	 input [31:0] IR_D,
	 output Tuse_RS0,
	 output Tuse_RS1,
	 output Tuse_RT0,
	 output Tuse_RT1,
	 output Tuse_RT2,
	 output reg [1:0] Tnew_E,
	 output reg [1:0] Tnew_M,
	 output reg [1:0] Tnew_W
    );
	 
	 wire [5:0]op;
	 wire [5:0]func;
	 assign op = IR_D[31:26];
	 assign func = IR_D[5:0];
	 
	assign Tuse_RS0 = `beq + `jr;
	assign Tuse_RS1 = `addu + `subu + `ori + `lw + `sw;
	assign Tuse_RT0 = `beq;
	assign Tuse_RT1 = `addu + `subu;
	assign Tuse_RT2 = `lw;
	
	always @(posedge clk) begin
		if (reset) begin
			Tnew_E <= 0;
			Tnew_M <= 0;
			Tnew_W <= 0;
		end
		else begin
			if (`addu | `subu | `ori | `lui)
				Tnew_E <= `T_ALU;
			else if (`lw)
				Tnew_E <= `T_DM;
			else if (`jal)
				Tnew_E <= `T_PC;
			Tnew_M <= (Tnew_E > 0) ? Tnew_E - 1 : 0;
			Tnew_W <= (Tnew_M > 0) ? Tnew_M - 1 : 0;
		end
	end

endmodule
