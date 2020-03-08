`timescale 1ns / 1ps
`define addu (func == 6'b100001 && op == 0)
`define subu (func == 6'b100011 && op == 0)
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
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:39 11/26/2018 
// Design Name: 
// Module Name:    main_ctrl 
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
module main_ctrl(
	 input [31:0] Instr,
    output [4:0] A3,
    output ALUSrc,
    output [1:0] MemtoReg,
    output RegWrite,
    output MemWrite,
    output [1:0] nPC_sel,
    output [1:0] ExtOp,
    output [2:0] ALUctr
    );
	 wire [5:0] op, func;
	 assign op = Instr[31:26];
	 assign func = Instr[5:0];
	 assign A3 = (`addu || `subu) ? Instr[`rd] :
					 (`ori || `lw || `lui) ? Instr[`rt] : 
					 (`jal) ? 5'h1f :
					 0;
						  
	 assign ALUSrc = (`ori || `lui || `lw || `sw);
	 assign MemtoReg = `lw ? 1 :
							 `jal ? 2 :
							 0;
	 assign RegWrite = (`addu || `subu || `jal || `ori || `lw || `lui);
	 assign MemWrite = `sw;
	 assign nPC_sel = (`jal || `j) ? 2 : 
							`jr ? 3 : 
							`beq ? 1 :
							0;
	 assign ExtOp = (`lw || `sw) ? 1 :
						 (`lui) ? 2 :
						 0;
	 assign ALUctr = `subu ? 1:
						  `ori ? 2:
						  `beq ? 3:
						  0;

endmodule
