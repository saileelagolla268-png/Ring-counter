# 4-Bit Shift Register in Verilog

## Description

This project implements a 4-bit Serial-In Parallel-Out (SIPO) Shift Register
using Verilog HDL.

The shift register accepts data serially through the `serial_in` input and
provides the stored data through the 4-bit `parallel_out` output.

An active-high synchronous reset is included.

## Project Structure

```text
4-bit-shift-register/
├── src/
│   └── shift_register_4bit.v
├── tb/
│   └── shift_register_4bit_tb.v
└── README.md
