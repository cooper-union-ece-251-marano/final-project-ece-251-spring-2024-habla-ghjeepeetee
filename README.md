[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/pelSJLGu)

# Catalog of Verilog Components to Build and Simulate a MIPS-based RISC.

Anthony Noseryev, Nolan Griffith

This work is based off the MIPS Verilog code by [Harris and Harris](https://pages.hmc.edu/harris/ddca/ddca2e.html). We give credit to Professor Rob Marano <rob@cooper.edu> for guidance with this implementation. We give credit to Azra Rangwala and Alex Faust for guidance in creating ISAArchitectureGreenSheet and how to successfully demo. 

Attached is the ISAArchitectureGreenSheet (https://docs.google.com/document/d/1fsQWL_-b2_XJn1Krdy7ns-I0NWAwYwXx5b1HyykORf4/edit).


We used recursion (a Fibonacci Sequence in order to test our components). 
Attached is just a small demo and proof that it works. (https://youtu.be/s_iX4-y__zM?feature=shared)

Instructions to Successfully Demo

To compile and simulate, use the following commands:

```bash
make clean compile simulate
```

For displaying the simulation with GTKWAVE, run:

```bash
make display
```

In GTKWAVE, select "example_tb" as your SST. Highlight "uut" and select all signals, then drag them to the Signal area on the right. Once completed, navigate to Time -> Zoom -> Zoom Best Fit.

For cleanup:
```bash
make clean
```

Overall Design Explanation


Overall Design Diagrams





























