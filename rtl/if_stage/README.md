# Instruction Fetch (IF) Stage

## Responsibility
The Instruction Fetch stage is responsible for:
- Maintaining the Program Counter (PC)
- Fetching instructions from instruction memory
- Providing PC and instruction to the Decode stage

## Design Decisions
- Simple sequential PC update (PC + 4)
- Branch redirection via EX-stage input
- No stalls or flush handling at this stage
- Single-cycle instruction memory model

## Outputs
- o_if_pc: Program Counter of fetched instruction
- o_if_instr: 32-bit RISC-V instruction
- o_if_valid: Always asserted (no stalls yet)
