`timescale 1ns / 1ps
/*
 * Copyright (c) 2023 Govardhan
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

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
