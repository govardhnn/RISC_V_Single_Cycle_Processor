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
module Control_Unit_tb;

   // Input wires
   reg [6:0]  op;
   reg [2:0]  funct3;
   reg	      funct7b5;
   reg	      Zero;

   // Output wires
   wire [1:0] ResultSrc;
   wire	      MemWrite;
   wire	      PCSrc;
   wire	      ALUSrc;
   wire	      RegWrite;
   wire	      Jump;
   wire [1:0] ImmSrc;
   wire [3:0] ALUControl;

   Control_Unit control_unit(
			     .op(op),
			     .funct3(funct3),
			     .funct7b5(funct7b5),
			     .Zero(Zero),
			     .ResultSrc(ResultSrc),
			     .MemWrite(MemWrite),
			     .PCSrc(PCSrc),
			     .ALUSrc(ALUSrc),
			     .RegWrite(RegWrite),
			     .Jump(Jump),
			     .ImmSrc(ImmSrc),
			     .ALUControl(ALUControl)
			     );

   initial begin
      op = 7'b0000011; // load
      funct3 = 3'b010;
      funct7b5 = 1'b0;
      Zero = 1'b0;
      #10;

      op = 7'b0110011; // add
      funct3 = 3'b000;
      funct7b5 = 1'b0;
      Zero = 1'b0;
      #10;
      
      // to add more

      $finish;
   end 

   initial begin
      $monitor("At time %d, ResultSrc = %b, MemWrite = %b, PCSrc = %b, ALUSrc = %b, RegWrite = %b, Jump = %b, ImmSrc = %b, ALUControl = %b", 
               $time, ResultSrc, MemWrite, PCSrc, ALUSrc, RegWrite, Jump, ImmSrc, ALUControl);
   end

endmodule
