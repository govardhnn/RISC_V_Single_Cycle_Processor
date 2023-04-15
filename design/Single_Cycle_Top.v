`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu

module Single_Cycle_Top(
	input clk,reset,
	output [31:0] WriteData,DataAddr,
	output MemWrite );

wire [31:0] PC, Instr, ReadData;

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