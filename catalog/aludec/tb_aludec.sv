//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_aludec
//     Description: Test bench for simple behavorial ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALUDEC
`define TB_ALUDEC

`timescale 1ns/100ps
`include "aludec.sv"

module tb_aludec;
    parameter N = 32;

    reg [5:0] FUNCT;
    reg [1:0] ALUOP;
    wire [2:0] ALUCONTROL;

    initial begin: apply_stimulus

        // add (for lw/sw/addi)
        FUNCT = 6'b001101;
        ALUOP = 2'b00;
        #10 $display("funct=%b\taluop=%b\talucontrol=%b\n", FUNCT, ALUOP, ALUCONTROL);
      
        // sub (for beq)
        FUNCT = 6'b110101;
        ALUOP = 2'b01;
        #10 $display("funct=%b\taluop=%b\talucontrol=%b\n", FUNCT, ALUOP, ALUCONTROL);

        // add (R-type)
        FUNCT = 6'b100000;
        ALUOP = 2'b10;
        #10 $display("funct=%b\taluop=%b\talucontrol=%b\n", FUNCT, ALUOP, ALUCONTROL);

        // sub (R-type)
        FUNCT = 6'b100010;
        ALUOP = 2'b10;
        #10 $display("funct=%b\taluop=%b\talucontrol=%b\n", FUNCT, ALUOP, ALUCONTROL);
        
        // sub (R-type)
        FUNCT = 6'b100100;
        ALUOP = 2'b10;
        #10 $display("funct=%b\taluop=%b\talucontrol=%b\n", FUNCT, ALUOP, ALUCONTROL);

        // clearly the switch statement works wahoo
        // lets test default
        
        // ???
        FUNCT = 6'b000000;
        ALUOP = 2'b10;
        #10 $display("funct=%b\taluop=%b\talucontrol=%b\n", FUNCT, ALUOP, ALUCONTROL);

        $finish;
    end

    initial begin
        $dumpfile("tb_example_module.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
    end

    
    aludec #(.n(N)) uut(.funct(FUNCT), .aluop(ALUOP), .alucontrol(ALUCONTROL));

endmodule
`endif // TB_ALUDEC