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
	   input wire [4:0]   ALUControl,
	   output wire	      Zero,
	   output wire [31:0] Result );

   reg [31:0]		      ResultReg;
   wire [31:0]		      temp,Sum;
   wire			      V,slt, sltu; //overflow

   //~B if ALUControl[0] is set 1 for subtraction (R Type]
   assign temp = ALUControl[0] ? ~B:B;
   //Sum is addition of A + B + 0 or
   //Sum is subtraction of A + ~B + 1 <2's complement>
   assign Sum = A + temp + ALUControl[0]; 
   //checks for overflow if result has different sign than operands
   assign V = (ALUControl[0]) ? 
              (~(A[31] ^ B[31]) & (A[31] ^ Sum[31])) : // to check for addition - (operands same sign)&(result has diff sign than A)
              ((A[31] ^ B[31]) & (~(A[31] ^ Sum[31]))); // to check for subtraction - (operands have diff sign)&(result has same sign as A)  
   assign slt = (A[31] == B[31]) ? (A < B) : A[31]; // because for signed numbers, of both are of same sign, we can compare A and B, but if they are of different sign we can take the MSB of A
   //if A is positive and B is negative => A is not less than B, slt = 0 ie. A[31]
   //if A is negative and B is positive -> A is definitely lass than B, so slt = 1 ie. A[31]
   
   assign sltu = A < B; //for unsigned number comparison, this will give a boolean output (true - 1, false - 0)
   

   always@(*)
     case(ALUControl)
       5'b00000: ResultReg <= Sum; //add
       5'b00001: ResultReg <= Sum; //sub
       5'b00010: ResultReg <= A&B; //and
       5'b00011: ResultReg <= A|B; //or
       5'b00100: ResultReg <= A^B; //xor
       5'b00101: ResultReg <= {31'b0,slt}; //slt
       5'b00110: ResultReg <= {31'b0,sltu}; // sltu
       5'b00111: ResultReg <= {A[31:12],12'b0}; //lui
       5'b01000: ResultReg <= A + {B[31:12],12'b0}; // AUIPC
       5'b01001: ResultReg <= {B[31:12],12'b0}; // LUI
       default:  ResultReg <= 'bx;

     endcase

   assign Zero = (ResultReg == 32'b0);
   assign Result = ResultReg;

endmodule
