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
module Single_Cycle_Core_tb;

   reg clk = 0;
   reg reset = 0;
   reg [31:0] Instr;
   reg [31:0] ReadData;
   wire [31:0] PC;
   wire	       MemWrite;
   wire [31:0] ALUResult;
   wire [31:0] WriteData;

   always #5 clk = ~clk;

   Single_Cycle_Core Single_Cycle_Core_tb_inst(.clk(clk),
					       .reset(reset), 
					       .Instr(Instr), 
					       .ReadData(ReadData), 
					       .PC(PC), 
					       .MemWrite(MemWrite), 
					       .ALUResult(ALUResult), 
					       .WriteData(WriteData));

   initial begin
      Instr = 32'h00000000;
      ReadData = 32'h00000000;
      #10;
      Instr = 32'h00400093; // addi x1, x0, 4
      ReadData = 32'h00000004;
      #10;
      Instr = 32'h008080b3; //add x1, x1, x1
      ReadData = 32'h00000008;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, PC = %h, MemWrite = %b, ALUResult = %h, WriteData = %h", $time, PC, MemWrite, ALUResult, WriteData);
   end

endmodule
