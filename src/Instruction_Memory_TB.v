`timescale 1ns / 1ps

module Instruction_Memory_TB;
   reg [31:0] PC_addr;
   wire [31:0] Instruction;
   
   Instruction_Memory IM_dut(
			     .PC_addr(PC_addr),
			     .Instruction(Instruction)
			     );
   
   initial begin //this wont synthesize, should use a .hex file
      PC_addr = 1000;
      #10;
      
      PC_addr = 1004;
      #10;
      
      PC_addr = 1008;
      #10;
      
      PC_addr = 1012;
      #10; 
      $finish;
   end
endmodule
