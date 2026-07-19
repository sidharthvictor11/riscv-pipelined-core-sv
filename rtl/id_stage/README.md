# Instruction Decode (ID) Stage

## Status

✅ Completed

## Overview

The Instruction Decode (ID) stage decodes the fetched RV32I instruction and extracts all fields required by the later pipeline stages. It also generates the immediate value based on the instruction format.

---

## Implemented Features

- Opcode extraction
- Source register extraction (rs1)
- Source register extraction (rs2)
- Destination register extraction (rd)
- funct3 extraction
- funct7 extraction
- Immediate generation for:
  - I-Type
  - S-Type
  - B-Type
  - U-Type
  - J-Type

---

## Supported RV32I Instruction Formats

![Instruction Formats](../../docs/images/ISA.png)

| Format | Purpose |
|---------|---------|
| R-Type | Register-register ALU operations |
| I-Type | Immediate ALU operations, Loads, JALR |
| S-Type | Store instructions |
| B-Type | Conditional Branches |
| U-Type | LUI / AUIPC |
| J-Type | JAL |

---

## Immediate Generation

The immediate generator reconstructs immediate values according to the RV32I specification.

Supported immediate types:

- I Immediate
- S Immediate
- B Immediate
- U Immediate
- J Immediate

Sign extension is applied where required.

---

## Opcode Package

The decode stage uses a dedicated package (`risc_pkg.sv`) containing enumerated opcode definitions.

Example:

```systemverilog
typedef enum logic [6:0] {
    OPCODE_R_TYPE  = 7'h33,
    OPCODE_I_LOAD  = 7'h03,
    OPCODE_I_ALU   = 7'h13,
    OPCODE_I_JALR  = 7'h67,
    OPCODE_S_TYPE  = 7'h23,
    OPCODE_B_TYPE  = 7'h63,
    OPCODE_LUI     = 7'h37,
    OPCODE_AUIPC   = 7'h17,
    OPCODE_JAL     = 7'h6F
} opcode_t;
```

---

## Outputs

The decode stage generates:

- opcode
- funct3
- funct7
- rs1
- rs2
- rd
- Immediate
- Instruction type

---

## Next Stage

The decoded instruction is forwarded to the Execute (EX) stage.