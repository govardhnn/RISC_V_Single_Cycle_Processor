`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu

module Data_Memory(
		   input wire 	      clk, WE,
		   input wire [31:0]  A, WD,
		   output wire [31:0] RD
		   );

   reg [31:0] 			      RAM[63:0];

   assign RD = RAM[A[31:2]]; // word aligned

   always @(posedge clk)
     if (WE)
       RAM[A[31:2]] <= WD;

endmodule
