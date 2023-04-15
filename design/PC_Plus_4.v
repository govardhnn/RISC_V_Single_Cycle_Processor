`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu

module PC_Plus_4(
	input wire [31:0] PC,
	output wire [31:0] PCPlus4 );

assign PCPlus4 = PC + 32'd4;

endmodule