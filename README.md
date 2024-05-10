[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/pelSJLGu)

# Catalog of Verilog Components to Build and Simulate a MIPS-based RISC.
## Anthony Noseryev, Nolan Griffith

This work is based off the MIPS Verilog code by [Harris and Harris](https://pages.hmc.edu/harris/ddca/ddca2e.html). We give credit to Professor Rob Marano <rob@cooper.edu> for guidance with this implementation.

See [ISAArchitectureGreenSheet](ISAArchitectureGreenSheet.pdf) for ISA documentation.

The provided sample program is a recursive Fibonacci Sequence implementation. 
Attached is a [small demonstration of the simulation process](https://youtu.be/s_iX4-y__zM?feature=shared).

## Instructions to Successfully Demo

To compile and simulate this CPU, use the following commands:

```bash
make clean compile simulate
```

For displaying the simulation with GTKWAVE, run:

```bash
make display
```
In GTKWAVE, select "tb_computer.vcd" as your SST. Highlight "dut or dut1" and select all signals of interest, then drag them to the Signal area on the right. 

Once completed, navigate to Time -> Zoom -> Zoom Best Fit.

For cleanup:
```bash
make clean
```

## Overall Design Explanation
Our CPU supports a modest collection of MIPS operations. Our ISA is modelled after RISC, specifically MIPS32, architecture, with 32 bits per word and 32 registers.

We implemented 8 simple ALU operations (listed in the ISAArchitectureGreenSheet), `beq`, `j`, `jr`, `jal`, `lw` and `sw`.

Our design is single-cycle as demonstrated by the timing diagrams below.

Our design features separate Data Memory and Instruction Memory, both of which have a capacity of 64 words by default. 

## Overall Design Diagrams

Our datapath emulates the following design, taken from Patterson and Hennessy, Computer Organization and Design, 6th ed.

![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-habla-ghjeepeetee/assets/34826608/5acda64b-e408-4ab3-bdaa-2e0cbdcafb9e)

Below is a diagram of our Data Memory and Instruction Memory the default capacity of 64 words.

![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-habla-ghjeepeetee/assets/34826608/19051c53-edd9-469b-86d2-cf1f5067d27d)


## Timing Diagrams

Attached below is a sample timing diagram for a program executing the following three simple instructions (R, I, and J-type respectively). Note that (ticks) is set to 10 ns and each instruction takes 10 ns to execute.
```
add $t2, $t0, $t1
addi $t2, $t0, 1
j 0
```

![image](https://github.com/cooper-union-ece-251-marano/final-project-ece-251-spring-2024-habla-ghjeepeetee/assets/34826608/e085c77e-d24f-474a-a900-cad8a42b15b5)
























