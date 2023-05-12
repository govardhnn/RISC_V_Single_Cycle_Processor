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
module Core_Datapath_tb;

   reg clk=0, reset;
   reg [1:0] ResultSrc;
   reg	     PCSrc, ALUSrc, RegWrite;
   reg [1:0] ImmSrc;
   reg [3:0] ALUControl;
   reg [31:0] Instr;
   reg [31:0] ReadData;
   wire	      Zero;
   wire [31:0] PC, ALUResult, WriteData;

   Core_Datapath core_datapath(
			       .clk(clk), 
			       .reset(reset), 
			       .ResultSrc(ResultSrc), 
			       .PCSrc(PCSrc), 
			       .ALUSrc(ALUSrc), 
			       .RegWrite(RegWrite),
			       .ImmSrc(ImmSrc), 
			       .ALUControl(ALUControl), 
			       .Instr(Instr), 
			       .ReadData(ReadData), 
			       .Zero(Zero),
			       .PC(PC), 
			       .ALUResult(ALUResult), 
			       .WriteData(WriteData)
			       );

   always #10 clk = ~clk;

   initial begin
      reset = 1; 
      #20; 
      reset = 0; 

      Instr = 'b010011; // addi
      ReadData = 'b001;
      ResultSrc = 2'b00;
      PCSrc = 0;
      ALUSrc = 1;
      RegWrite = 1;
      ImmSrc = 2'b00;
      ALUControl = 4'b0010;
      #20;

      $finish;
   end
   initial begin
      $monitor("At time %t, Zero = %b, PC = %d, ALUResult = %d, WriteData = %d", 
               $time, Zero, PC, ALUResult, WriteData);
   end

endmodule

