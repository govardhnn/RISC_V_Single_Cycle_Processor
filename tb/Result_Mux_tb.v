`timescale 1ns / 1ps

module Result_Mux_tb;

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
    reg [31:0] ALUResult, ReadData, PC_Plus_4;
    reg [1:0]  ResultSrc;

    wire [31:0] Result;

    Result_Mux result_mux(
        .ALUResult(ALUResult),
        .ReadData(ReadData),
        .PC_Plus_4(PC_Plus_4),
        .ResultSrc(ResultSrc),
        .Result(Result)
    );

    initial begin
        ALUResult = 32'b001;
        ReadData = 32'b010;
        PC_Plus_4 = 32'b011;
        ResultSrc = 2'b00;
        #10;

        ResultSrc = 2'b01;
        #10;

        ResultSrc = 2'b10;
        #10;

        $finish;
    end
    initial begin
        $monitor("At time %t, Result=%b", $time, Result);
    end
    
endmodule
