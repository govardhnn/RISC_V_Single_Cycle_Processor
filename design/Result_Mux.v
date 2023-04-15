`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu
module Result_Mux (
	input wire [31:0] ALUResult,ReadData,PC_Plus_4,
	input wire [31:0] ResultSrc,
	output wire [31:0] Result
);

assign Result = ResultSrc[1] ? PC_Plus_4 :(ResultSrc[0] ? ReadData : ALUResult);

endmodule