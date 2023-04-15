`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu

module ALU(
	   input wire [31:0]  A,B,
	   input wire [2:0]   ALUControl,
	   output wire 	      Zero,
	   output wire [31:0] Result );

   reg [31:0] 		      ResultReg;
   wire [31:0] 		      temp1,Sum;
   wire 		      V,slt; //overflow

   assign temp1 = ALUControl[0] ? ~B:B;
   assign Sum = A + temp1 + ALUControl[0];
   assign V = ((~ALUControl[1]) & (A[31]^Sum[31]) & (~ALUControl[0]^A[31]^B[31]));
   assign slt = V^Sum[31];

   always@(*)
     case(ALUControl)
       3'b000: ResultReg <= Sum; //add
       3'b001: ResultReg <= Sum; //sub
       3'b010: ResultReg <= A&B; //and
       3'b011: ResultReg <= A|B; //or
       3'b101: ResultReg <= {31'b0,slt}; //slt
     endcase

   assign Zero = (ResultReg == 32'b0);
   assign Result = ResultReg;

endmodule
