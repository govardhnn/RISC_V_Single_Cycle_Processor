`timescale 1ns / 1ps
// Single Cycle RISC-V Processor by Sai Govardhan
// mail: saigov14@gmail.com or saigovardhanmc@pesu.pes.edu
module Register_File(
	input wire clk, WE3,
	input wire [4:0]  RA1,RA2,WA3,
	input wire [31:0] WD3,
	output wire [31:0] RD1,RD2
);

reg [31:0] REG_MEM_BLOCK[31:0];

always@(posedge clk)
begin
	if(WE3)
		REG_MEM_BLOCK[WA3] <= WD3;
end

assign RD1 = (RA1 != 0) ? REG_MEM_BLOCK[RA1] : 0;
assign RD2 = (RA2 != 0) ? REG_MEM_BLOCK[RA2] : 0;

endmodule