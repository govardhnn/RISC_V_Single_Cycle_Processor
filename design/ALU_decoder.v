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
module ALU_Decoder(
		   input wire	    opb5,
		   input wire [2:0] funct3,
		   input wire	    funct7b5,
		   input wire [1:0] ALUOp,
		   output reg [2:0] ALUControl
		   );

   wire				    RtypeSub;
   assign RtypeSub = funct7b5 & opb5; //TRUE for R-type substract

   always@(*)
     begin
	case(ALUOp)
          2'b00:  ALUControl = 3'b000; //addition
          2'b01:  ALUControl = 3'b001; //subtraction
          default: 
            case(funct3)//R-type or I-type ALU
              3'b000:    
		if (RtypeSub) ALUControl = 3'b001; //sub
		else ALUControl = 3'b000; //add,addi
              3'b010: ALUControl = 3'b101; //slt,slti
              3'b110: ALUControl = 3'b011; //or,ori
              3'b111: ALUControl = 3'b010; //and,andi
              default: ALUControl = 3'bxxx; //???
            endcase
	endcase
     end

endmodule
