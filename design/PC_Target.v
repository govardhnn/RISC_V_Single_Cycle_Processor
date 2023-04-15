`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu

module PC_Target(
	input wire [31:0] PC,ImmExt,
	output wire [31:0] PCTarget
);

assign PCTarget= PC + ImmExt;

endmodule