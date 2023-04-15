`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu
module Main_Decoder(
		    input wire [6:0]  op,
		    output wire [1:0] ResultSrc,
		    output wire       MemWrite, Branch,ALUSrc, RegWrite,Jump,
		    output wire [1:0] ImmSrc, ALUop
		    );

   reg [10:0] 			      controls;
   
   always@(*)
     case(op)
       //RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUop_Jump
       7'b0000011: controls = 11'b1_00_1_0_01_0_00_0;//lw
       7'b0100011: controls = 11'b0_01_1_1_00_0_00_0;//sw
       7'b0110011: controls = 11'b1_xx_0_0_00_0_10_0;//R-type
       7'b1100011: controls = 11'b0_10_0_0_00_1_01_0;//beq
       7'b0010011: controls = 11'b1_00_1_0_00_0_10_0;//I-typr ALU
       7'b1101111: controls = 11'b1_11_0_0_10_0_00_1;//jal
       default:    controls = 11'bx_xx_x_x_xx_x_xx_x;//???
     endcase

   assign {RegWrite,ImmSrc,ALUSrc,MemWrite,
	   ResultSrc,Branch,ALUop,Jump} = controls;	
   
endmodule
