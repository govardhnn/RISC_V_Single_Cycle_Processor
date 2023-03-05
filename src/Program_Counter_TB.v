`timescale 1ns / 1ps
module Program_Counter_tb;
   reg clk;
   reg rst;
   reg [31:0] PC_next;
   wire [31:0] PC;

   Program_Counter PC_dut (
			   .clk(clk),
			   .rst(rst),
			   .PC_next(PC_next),
			   .PC(PC)
			   );

   always #5 clk = ~clk;

   initial begin
      rst = 0; clk = 0;
      #10;
      rst = 1;
      #10;
      rst = 0;
      
      PC_next = 32'h0001;
      #20;
      PC_next = 32'h0010;
      #20;
      PC_next = 32'h0100;
      #20;
      $finish;
   end

endmodule
