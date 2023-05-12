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
module Register_File_tb;

   reg clk = 0;
   reg WE3;
   reg [4:0] RA1;
   reg [4:0] RA2;
   reg [4:0] WA3;
   reg [31:0] WD3;
   wire [31:0] RD1;
   wire [31:0] RD2;

   always #5 clk = ~clk;

   Register_File Register_File_tb_inst (.clk(clk), 
					.WE3(WE3), 
					.RA1(RA1), 
					.RA2(RA2), 
					.WA3(WA3), 
					.WD3(WD3), 
					.RD1(RD1), 
					.RD2(RD2));

   initial begin
      WE3 = 1;
      WA3 = 5'b00001;
      WD3 = 32'd12345678;
      #10;
      RA1 = 5'b00001;
      RA2 = 5'b00001;
      #10;
      WE3 = 1;
      WA3 = 5'b00010;
      WD3 = 32'd87654321;
      #10;
      RA1 = 5'b00010;
      RA2 = 5'b00010;
      #10;
      $finish;
   end 

   initial begin
      $monitor("At time %d, RD1 = %d, RD2 = %d", $time, RD1, RD2);
   end

endmodule

