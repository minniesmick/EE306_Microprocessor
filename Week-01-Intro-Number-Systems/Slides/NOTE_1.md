# Week 1 — Introduction to Microprocessors
**Date:** 3 February 2026

---

## Overview
This note introduces basic digital circuit types and the CPU fetch–decode–execute cycle using a simple example: loading two integers from RAM, adding them, and storing the result in a register.

---

## Key concepts

### Combinational circuits
- Output depends only on current inputs (no memory or state).
- Examples: ALU (Arithmetic Logic Unit), decoders, multiplexers.
- Characteristic: same inputs → same outputs (instantaneous mapping).

### Sequential circuits
- Output depends on current inputs and past history (use memory elements).
- Examples: flip-flops, registers, RAM, some parts of the Control Unit (CU).
- Characteristic: store state across clock cycles.

---

## Quick facts
- A decoder with n input lines produces 2^n outputs (e.g., n = 3 → 8 outputs).
- A 32-bit register is typically implemented with 32 flip-flops (one flip-flop per bit).
- The Instruction Register (IR) holds the instruction currently being executed.
- The Control Unit (CU) generates control signals and manages the fetch–decode–execute cycle.

---

## Buses (brief)
- Address bus: carries memory addresses from CPU to memory (which location to read/write).
- Data bus: carries data between CPU, registers, and memory.
- Control lines: signals like Read, Write, Clock, and Interrupt that orchestrate actions.

---

## The Fetch–Decode–Execute cycle (high level)
1. FETCH
   - CU places instruction address on address bus.
   - Memory places instruction on data bus; instruction goes into IR.
2. DECODE
   - CU decodes opcode and operand fields from IR.
   - CU prepares control signals for the required operation.
3. EXECUTE
   - CU and datapath perform the operation (ALU operations, memory read/write, register transfers).
   - Write results back to destination register or memory as required.

---

## Example: Add two integers from RAM and store result in r2
Assumptions:
- Registers: r0, r1, r2 (32-bit).
- RAM contains integers at addresses A and B.
- Instruction set uses `LOAD rX, [address]` and `ADD dest, src1, src2`.

Step-by-step (clear, high-level):
1. FETCH instruction: `LOAD r0, [A]` into IR.
   - CU places address-of-instruction on address bus → memory returns instruction → IR.
2. DECODE: CU interprets `LOAD r0, [A]`.
3. EXECUTE `LOAD r0, [A]`:
   - CU places address A on address bus, asserts memory read.
   - Memory returns data at A on data bus.
   - CU asserts register write for r0 → r0 := memory[A].
4. Repeat FETCH/DECODE/EXECUTE for `LOAD r1, [B]` → r1 := memory[B].
5. FETCH instruction: `ADD r2, r1, r0` into IR.
6. DECODE: CU decodes `ADD` and identifies operands r1, r0 and destination r2.
7. EXECUTE `ADD r2, r1, r0`:
   - CU enables read access to r1 and r0.
   - ALU (combinational) computes sum: result := r1 + r0.
   - CU asserts register write for r2 → r2 := result.

Notes:
- The ALU is combinational: it computes output from inputs without storing state.
- Registers and memory are sequential elements: they store values across cycles.
- CU controls the sequence and timing of operations via control signals and the clock.

---

## Teaching / Slide tips
- Use a simple datapath diagram showing Memory ↔ (Address bus, Data bus) ↔ CU / Registers ↔ ALU.
- Animate or highlight the path of data during FETCH, DECODE, and EXECUTE so students can follow addresses, data, and control signals.
- Emphasize the conceptual difference:
  - Combinational = "compute" (stateless)
  - Sequential = "store & control" (stateful)
- Optionally include a small timing diagram showing when memory read, register write, and ALU ops occur relative to clock edges.

---

## Minimal example instructions (pseudo-assembly)
```asm
LOAD r0, [A]    ; r0 := memory[A]
LOAD r1, [B]    ; r1 := memory[B]
ADD  r2, r1, r0 ; r2 := r1 + r0
```

---


``` ````
