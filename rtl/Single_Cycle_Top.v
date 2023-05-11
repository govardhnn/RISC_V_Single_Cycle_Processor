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
module Single_Cycle_Top(
			input 	      clk,reset,
			output [31:0] WriteData,DataAddr,
			output 	      MemWrite );

   wire [31:0] 			      PC, Instr, ReadData;

   Single_Cycle_Core core_top (
			       .clk(clk),
			       .reset(reset),
			       .Instr(Instr),
			       .ReadData(ReadData),
			       .PC(PC),
			       .MemWrite(MemWrite),
			       .ALUResult(DataAddr),
			       .WriteData(WriteData) );

   Instruction_Memory Instr_Memory ( 
				     .A(PC),
				     .RD(Instr) );

   Data_Memory Data_Memory (
			    .clk(clk), 
			    .WE(MemWrite),
			    .A(DataAddr), 
			    .WD(WriteData),
			    .RD(ReadData) );

endmodule
