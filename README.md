#RV32I Pipelined Risc-V Core (SystemVerilog) 
Status: Under active development

##Design Intent

This repository documents a clean implementation of 32-bit RV32I RISC-V processor core in SystemVerilog.

The primary goals are 
- Built strong intuition around pipeline design and timing
- Explore control and data hazard handling incrementally
- Integrate realistic data and instruction memory behaviour
- maintain clear and review quality RTL with verification

##Scope

Initial focus:
- RV32I base ISI
- 5 stage pipeline(IF, ID, EX, MEM, WB)
- FPGA-friendly synchronous design

##Development Roadmap

- [x] Program Counter
- [x] Instruction Memory
- [x] Fetch Stage
- [x] Decode Stage
- [ ] Register File
- [ ] Control Unit
- [ ] Execute Stage
- [ ] ALU
- [ ] Memory Stage
- [ ] Write Back Stage
- [ ] Hazard Detection
- [ ] Forwarding Unit
- [ ] RV32I Compliance Testing


## Tools

- SystemVerilog
- Xilinx Vivado
- Git
- GitHub

## Future Work

- Complete the 5-stage RV32I pipeline
- Add UART peripheral
- Implement CSR instructions
- Integrate with FPGA
- Improve verification using SystemVerilog testbenches
