# 4-Bit Ring Counter in Verilog

## Description

This project implements a 4-bit Ring Counter using Verilog HDL.

A Ring Counter is a shift register in which the output of the last flip-flop is connected back to the input of the first flip-flop. Only one bit is HIGH at a time.

## Output Sequence

```text
0001 → 0010 → 0100 → 1000 → 0001 → ...
```

## Files

* `ring_counter.v` — Ring Counter design
* `ring_counter_tb.v` — Testbench
* `ring_counter.vcd` — Simulation waveform

## Simulation

Compile using Icarus Verilog:

```bash
iverilog -o ring_counter_sim ring_counter.v ring_counter_tb.v
```

Run the simulation:

```bash
vvp ring_counter_sim
```

## Tools

* Verilog HDL
* VS Code
* Icarus Verilog
* GTKWave

## Author

Add your name here.

