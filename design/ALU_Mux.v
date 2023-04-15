`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu

module ALU_Mux (
	input wire [31:0] WD, ImmExt,
	input wire ALUSrc,
	output wire [31:0] B
);

assign B = ALUSrc ? ImmExt : WD;

endmodule