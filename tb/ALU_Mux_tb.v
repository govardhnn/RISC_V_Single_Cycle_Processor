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
module ALU_Mux_tb;

   reg [31:0] WD;
   reg [31:0] ImmExt;
   reg	      ALUSrc;
   wire [31:0] B;

   ALU_Mux ALU_Mux_tb_inst (.WD(WD), .ImmExt(ImmExt), .ALUSrc(ALUSrc), .B(B));

   initial begin
      WD = 32'd12345678;
      ImmExt = 32'd87654321;
      ALUSrc = 1'b0;
      #10;
      ALUSrc = 1'b1;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, B = %h", $time, B);
   end

endmodule
