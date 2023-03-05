`timescale 1ns / 1ps
module Register_File(
		     input wire 	clk, rst,
		     input wire [4:0] 	rs1_addr, rs2_addr, rd_addr,
		     input wire [31:0] 	write_data,
		     input wire 	write_enable,
		     output wire [31:0] rs1_data,
		     output wire [31:0] rs2_data
		     );

   reg [31:0] 				REG_MEM_BLOCK [31:0];
   reg [31:0] 				rs1_reg, rs2_reg;

   // x5 = 6
   // x9 = 0x2004
   // 0x2000 contains 10 -> Data Memory

   initial begin
      REG_MEM_BLOCK [0] = 0;
      REG_MEM_BLOCK [1] = 0;
      REG_MEM_BLOCK [2] = 0;
      REG_MEM_BLOCK [3] = 0;
      REG_MEM_BLOCK [4] = 0;
      REG_MEM_BLOCK [5] = 6;
      REG_MEM_BLOCK [6] = 0;
      REG_MEM_BLOCK [7] = 0;
      REG_MEM_BLOCK [8] = 0;
      REG_MEM_BLOCK [9] = 32'h2004;
      // to fill upto 32
   end

   always@(posedge clk, rst) begin
      if(rst) begin
	 rs1_reg <= 0;
	 rs2_reg <= 0;
      end
      if(write_enable) begin
	 REG_MEM_BLOCK[rd_addr] <= write_data;
      end
      else begin
	 rs1_reg <= REG_MEM_BLOCK[rs1_addr];
	 rs2_reg <= REG_MEM_BLOCK[rs2_addr];
      end
   end

   assign rs1_data = rs1_reg;
   assign rs2_data = rs2_reg;

endmodule
