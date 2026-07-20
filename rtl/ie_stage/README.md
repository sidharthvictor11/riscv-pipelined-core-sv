# Instruction Execute (EX) Stage

## Status

🚧 In Progress

## Overview

The Execute (EX) stage performs arithmetic and logical operations on operands received from the Instruction Decode (ID) stage. It executes ALU operations and prepares results for the Memory (MEM) stage.

---

## Implemented Features

- 32-bit Arithmetic Logic Unit (ALU)
- Signed and unsigned comparisons
- Shift operations
- Bitwise logical operations
- ALU operation selection using enumerated types (`alu_op_t`)

---

## Supported ALU Operations

| Operation | Description |
|-----------|-------------|
| ADD | Addition |
| SUB | Subtraction |
| AND | Bitwise AND |
| OR | Bitwise OR |
| XOR | Bitwise XOR |
| SLL | Shift Left Logical |
| SRL | Shift Right Logical |
| SRA | Shift Right Arithmetic |
| SLT | Signed Less Than |
| SLTU | Unsigned Less Than |

---

## Inputs

- Operand A (`alu_a`)
- Operand B (`alu_b`)
- ALU Operation (`alu_op`)

---

## Output

- ALU Result (`alu_result`)

---

## Modules

| Module | Description |
|---------|-------------|
| `alu.sv` | 32-bit RV32I Arithmetic Logic Unit |

---

## Next Steps

The following modules will be added to complete the Execute stage:

- ALU Control Unit
- Branch Comparator
- Branch Target Address Calculation
- PC Selection Logic
- EX/MEM Pipeline Register

---

## Next Stage

The ALU result and control signals are forwarded to the Memory Access (MEM) stage.