//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: YOUR NAMES
// 
//     Create Date: 2023-02-07
//     Module Name: tb_alu
//     Description: Test bench for simple behavorial ALU
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALU
`define TB_ALU

`timescale 1ns/100ps
`include "alu.sv"

module tb_alu;
    parameter N = 4;
    localparam p = 10;
    localparam p_high = p;

    reg CLK;
    reg [N-1:0] A, B;
    reg [2:0] ALUCONTROL;

    reg [N-1:0] RESULT;
    reg [N-1:0] TEMP;
    reg ZERO;


    initial begin
        $dumpfile("tb_example_module.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
    end

    initial begin: clock
        CLK = 1'b0;
        forever begin
            #(p-p_high) CLK = 1'b1;
            #(p_high) CLK = 1'b0;
        end
    end

    //apply input vectors
    initial begin: apply_stimulus

        // AND
        A = 4'b0101;
        B = 4'b1100;
        ALUCONTROL = 3'b000;
        #10 $display("AND\ta=%b\tb=%b\tresult=%b\tzero=%b\n", A, B, RESULT, ZERO);
      
        // OR
        A = 4'b0101;
        B = 4'b1100;
        ALUCONTROL = 3'b001;
        #10 $display("OR\ta=%b\tb=%b\tresult=%b\tzero=%b\n", A, B, RESULT, ZERO);

        // ADD
        A = 4'b0001;
        B = 4'b1111;
        ALUCONTROL = 3'b010;
        #10 $display("ADD\ta=%b\tb=%b\tresult=%b\tzero=%b\n", A, B, RESULT, ZERO);

        // MULT, MFHI, MFLO
        A = 4'b1100;
        B = 4'b1011;
        ALUCONTROL = 3'b011; // multiplies
        #5
        ALUCONTROL = 3'b101; // gets high
        #5
        TEMP = RESULT;
        ALUCONTROL = 3'b100; // gets low
        #10 $display("MULT\ta=%b\tb=%b\tresult=%b%b\tzero=%b\n", A, B, TEMP, RESULT, ZERO);

        TEMP = 4'b0000;
        // DIV, MFHI, MFLO
        A = 4'b1100;
        B = 4'b0101;
        ALUCONTROL = 3'b101; // divides
        #10
        ALUCONTROL = 3'b100; // gets low (quotient)
        #10 $display("DIV\ta=%b\tb=%b\tresult=%b\tzero=%b\n", A, B, RESULT, ZERO);

        // SUB
        A = 4'b0110;
        B = 4'b0011;
        ALUCONTROL = 3'b110;
        #10 $display("SUB\ta=%b\tb=%b\tresult=%b\tzero=%b\n", A, B, RESULT, ZERO);
        
        // SLT
        A = 4'b0101;
        B = 4'b1100;
        ALUCONTROL = 3'b111;
        #10 $display("SLT\ta=%b\tb=%b\tresult=%b\tzero=%b\n", A, B, RESULT, ZERO);

        // SLT 2
        A = 4'b0000;
        B = 4'b0000;
        ALUCONTROL = 3'b111;
        #10 $display("SLT\ta=%b\tb=%b\tresult=%b\tzero=%b\n", A, B, RESULT, ZERO);

        $finish;
    end

    //
    // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
    //
    alu #(.n(N)) uut(.clk(CLK), .a(A), .b(B), .alucontrol(ALUCONTROL), .result(RESULT), .zero(ZERO));

endmodule
`endif // TB_ALU