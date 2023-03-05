`timescale 1ns / 1ps
module Instruction_Memory(
			  input wire [31:0]  PC_addr,
			  output wire [31:0] Instruction
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

   reg [31:0] 				     I_MEM_BLOCK [0:1023]; // 1 KiB of Instruction memory, should be 4KiB to be RV32I compliant
   
   initial begin
      I_MEM_BLOCK[1000] = 32'hFFC4A303;
      I_MEM_BLOCK[1004] = 32'h0064A423;
      I_MEM_BLOCK[1008] = 32'h0062E233;
      I_MEM_BLOCK[1012] = 32'hFE420AE3;
   end
   
   assign Instruction = I_MEM_BLOCK[PC_addr];
   
endmodule
