# RISC_V_Single_Cycle_Processor

My implementation of the RISC-V Single Cycle Processor 

Reference Textbook:\
`Digital Design and Computer Architecture: RISC-V Edition by Sarah L. Harris and David Harris` 

The Single Cycle Processor Design Specification: 

![image](https://user-images.githubusercontent.com/37037342/232227351-18115bc2-6f23-4f39-a2f4-f87c626f9750.png)

## Directory Structure 

```├── instructions.txt
├── LICENSE
├── README.md
├── rtl
│   ├── ALU_decoder.v
│   ├── ALU_Mux.v
│   ├── ALU.v
│   ├── ALU.v~
│   ├── Control_Unit.v
│   ├── Core_Datapath.v
│   ├── Data_Memory.v
│   ├── Extend.v
│   ├── Instruction_Memory.v
│   ├── Main_Decoder.v
│   ├── PC_Mux.v
│   ├── PC_Plus_4.v
│   ├── PC_Target.v
│   ├── PC.v
│   ├── Register_File.v
│   ├── Result_Mux.v
│   ├── Single_Cycle_Core.v
│   └── Single_Cycle_Top.v
└── tb
    ├── ALU_Decoder_tb.v
    ├── ALU_Mux_tb.v
    ├── ALU_tb.v
    ├── Control_Unit_tb.v
    ├── Core_Datapath_tb.v
    ├── Data_Memory_tb.v
    ├── Extend_tb.v
    ├── Instruction_Memory_tb.v
    ├── Main_Decoder_tb.v
    ├── PC_Mux_tb.v
    ├── PCPlus4_tb.v
    ├── PC_Target_tb.v
    ├── PC_tb.v
    ├── Register_File_tb.v
    ├── Register_tb.v
    ├── Result_Mux_tb.v
    ├── Single_Cycle_Core_tb.v
    └── Single_Cycle_TB.v
```
