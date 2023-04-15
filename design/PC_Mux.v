`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu

module PC_Mux (
	input wire [31:0] PC_Plus_4,PC_Target,
	input wire PCSrc,
	output wire [31:0] PC_Next
);

assign PC_Next = PCSrc ? PC_Target : PC_Plus_4;

endmodule