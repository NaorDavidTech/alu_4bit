-


# 🔢 4-bit ALU in Verilog

This repository contains a modular and testable implementation of a **1-bit Arithmetic Logic Unit (ALU)** and its extension to a **4-bit ALU**, written in Verilog HDL. 

---

## 📁 Files Included

| File                  | Description                                      |
|-----------------------|--------------------------------------------------|
| `alu_1bit.v`          | Verilog module for a single-bit ALU             |
| `bitalu_4.v`          | 4-bit ALU composed of four `alu_1bit` instances |
| `bitalu_4_tb.v`       | Testbench module for verifying all operations   |
| `RTL.pdf`             | RTL schematic diagrams for the design           |
| `appendix.pdf`        | Includes truth table and system schematics      |

---

## ⚙️ ALU Capabilities

The ALU supports a variety of operations:

### 🔸 Logical Operations
- `A AND B`
- `A OR B`
- `A'`, `B'`

### 🔸 Arithmetic Operations
- `A + B`
- `A + B + 1`
- `A + 1`, `B + 1`
- `B − A`
- `B − 1`
- `−A`

### 🔸 Constant / Direct
- `A`, `B`
- `0`, `1`, `−1`

These are selected by a combination of 6 control signals: `ENA`, `ENB`, `INVA`, `F0`, `F1`, and `CIN`.

---



