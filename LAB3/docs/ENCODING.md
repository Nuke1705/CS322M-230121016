# RVX10 Instruction Encodings

This document describes the exact bitfield encodings for the 10 custom RVX10 instructions
implemented in our single-cycle RISC-V core.

All RVX10 instructions use the **CUSTOM-0 opcode space**:

opcode = 0x0B = 7'b0001011

They follow the R-type format:

31 25 24 20 19 15 14 12 11 7 6 0
+----------+-------+-------+------+-------+-------+
| funct7 | rs2 | rs1 |funct3| rd | opcode|
+----------+-------+-------+------+-------+-------+

---

## Encoding Table

| Instr | funct7   | funct3 | rs2 usage       | Semantics                        |
|-------|----------|--------|-----------------|----------------------------------|
| ANDN  | 0000000  | 000    | rs2             | rd = rs1 & ~rs2                  |
| ORN   | 0000000  | 001    | rs2             | rd = rs1 \| ~rs2                 |
| XNOR  | 0000000  | 010    | rs2             | rd = ~(rs1 ^ rs2)                |
| MIN   | 0000001  | 000    | rs2             | signed compare                   |
| MAX   | 0000001  | 001    | rs2             | signed compare                   |
| MINU  | 0000001  | 010    | rs2             | unsigned compare                 |
| MAXU  | 0000001  | 011    | rs2             | unsigned compare                 |
| ROL   | 0000010  | 000    | rs2[4:0] (shamt)| rotate left                      |
| ROR   | 0000010  | 001    | rs2[4:0] (shamt)| rotate right                     |
| ABS   | 0000011  | 000    | rs2 = x0        | rd = |rs1| (two’s complement abs)|

---
The encoding is carried by using the 4th bit of the op code (which is one only for this opcode and the one for jal) to select the custom instructions, the last three bits of the funct7 field
and the funct3 field is used. This avoids overlap with existing instructions.

