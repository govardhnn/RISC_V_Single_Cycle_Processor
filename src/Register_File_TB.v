`timescale 1ns / 1ps

module Register_File_tb;

   reg clk, rst;
   reg [4:0] rs1_addr, rs2_addr, rd_addr;
   reg [31:0] write_data;
   reg 	      write_enable;

   wire [31:0] rs1_data, rs2_data;

   Register_File RF_dut (
			 .clk(clk),
			 .rst(rst),
			 .rs1_addr(rs1_addr),
			 .rs2_addr(rs2_addr),
			 .rd_addr(rd_addr),
			 .write_data(write_data),
			 .write_enable(write_enable),
			 .rs1_data(rs1_data),
			 .rs2_data(rs2_data)
			 );

   always #5 clk = ~clk;

   initial begin
      rst = 0; clk = 0;
      #10;
      rst = 1;
      #10;
      rst = 0;
      #10;
      rs1_addr = 5;
      rs2_addr = 9;
      rd_addr = 0;
      write_data = 32'h1234;
      write_enable = 0;
      #10;
      
      rs1_addr = 0;
      rs2_addr = 0;
      rd_addr = 4;
      write_data = 32'h1234;
      write_enable = 1;
      #10;
      rs1_addr = 1;
      rs2_addr = 0;
      rd_addr = 0;
      write_data = 0;
      write_enable = 0;
      #10;
      
   end
endmodule
