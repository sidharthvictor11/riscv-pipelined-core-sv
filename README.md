#**RV32I Pipelined Risc-V Core (SystemVerilog) **
Status: Under active development

##**Design Intent**

This repository documents a clean implementation of 32-bit RV32I RISC-V processor core in SystemVerilog.

The primary goals are 
- Built strong intuition around pipeline design and timing
- Explore control and data hazard handling incrementally
- Integrate realistic data and instruction memory behaviour
- maintain clear and review quality RTL with verification

##**Scope**

Initial focus:
- RV32I base ISI
- 5 stage pipeline(IF, ID, EX, MEM, WB)
- FPGA-friendly synchronous design

## Development Roadmap

- [ ] Instruction Fetch stage
- [ ] Register File
- [ ] Decode & control logic
- [ ] Execute stage (ALU)
- [ ] Memory access stage
- [ ] Writeback stage
- [ ] Hazard handling
- [ ] Branch handling / prediction

## Toolchain

- Language: SystemVerilog
- Simulator: Vivado
