`timescale 1ns / 1ps
module Program_Counter(
		       input wire 	  clk, rst, 
		       input wire [31:0]  PC_next,
		       output wire [31:0] PC
		       );
   reg [31:0] 				  PC_reg; 
   // 2 segment coding
   always @(posedge clk, rst) begin
      if(rst) PC_reg <=0;
      else PC_reg <= PC_next;
   end
   
   assign PC = PC_reg;
endmodule
