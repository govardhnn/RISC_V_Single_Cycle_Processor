`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu

module Instruction_Memory(
	input  [31:0] A,
	
    output [31:0] RD
);
   //hardcoding an instruction memory for the following instructions:
   //Address Instruction Type Fields Machine Language - Sarah Harris TBK Pg.399
   //0x1000 L7: lw x6, -4(x9) I 111111111100 01001 010 00110 0000011 FFC4A303
   //imm11:0 rs1 f3 rd op
   //0x1004 sw x6, 8(x9) S 0000000 00110 01001 010 01000 0100011 0064A423
   //imm11:5 rs2 rs1 f3 imm4:0 op
   //0x1008 or x4, x5, x6 R 0000000 00110 00101 110 00100 0110011 0062E233
   //funct7 rs2 rs1 f3 rd op
   //0x100C beq x4, x4, L7 B 1111111 00100 00100 000 10101 1100011 FE420AE3
reg  [31:0] I_MEM_BLOCK[63:0];

initial
begin
	$readmemh("C:/Users/saigo/Desktop/Govardhan_RISC_V/Single_Cycle_Govardhan_Final/Single_Cycle_Govardhan_Final.srcs/sources_1/imports/src_single/instructions.txt",I_MEM_BLOCK);
end

assign RD = I_MEM_BLOCK[A[31:2]]; // word aligned

endmodule