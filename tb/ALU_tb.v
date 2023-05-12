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
module ALU_tb;

   reg [31:0] A;
   reg [31:0] B;
   reg [3:0]  ALUControl;
   wire	      Zero;
   wire [31:0] Result;

   ALU ALU_tb_inst (.A(A), .B(B), .ALUControl(ALUControl), .Zero(Zero), .Result(Result));

   initial begin
      A = 32'd12345678;
      B = 32'd87654321;
      ALUControl = 4'b0000; // test add operation
      #10;
      ALUControl = 4'b0001; // test sub operation
      #10;
      ALUControl = 4'b0010; // test and operation
      #10;
      ALUControl = 4'b0011; // test or operation
      #10;
      ALUControl = 4'b0100; // test xor operation
      #10;
      ALUControl = 4'b0101; // test slt operation
      #10;
      ALUControl = 4'b0110; // test sltu operation
      #10;
      ALUControl = 4'b0111; // test lui operation
      #10;
      ALUControl = 4'b1000; // test AUIPC operation
      #10;
      ALUControl = 4'b1001; // test LUI operation
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, Result = %d, Zero = %b", $time, Result, Zero);
   end

endmodule
