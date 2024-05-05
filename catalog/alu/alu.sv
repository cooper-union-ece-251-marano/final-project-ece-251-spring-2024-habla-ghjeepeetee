//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Nolan Griffith, Ant Nosaryev
// 
//     Create Date: 2023-02-07
//     Module Name: alu
//     Description: 32-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
// see https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ALU32Bit.v
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALU
`define ALU

`timescale 1ns/100ps

module alu
    #(parameter n = 32)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic clk,
    input  logic [n-1:0] a, b,
    input  logic [2:0]  alucontrol,
    output logic [n-1:0] result,
    output logic zero
);
    
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [n-1:0] diff;
    logic [2*n - 1:0] HiLo;

    assign zero = (result == 0);

    initial begin
        HiLo = {n{1'b0}};
    end

    always @(a,b,alucontrol) begin
        case (alucontrol)
            3'b000: result = a & b; // and
            3'b001: result = a | b; // or
            3'b010: result = a + b; // add
            3'b110: result = a + ~b + 1; // sub
            3'b100: result = HiLo[n-1:0]; // MFLO
            3'b101: result = HiLo[2*n - 1:n]; // MFHI
            3'b111: diff = a + ~b + 1;
                    result = diff[n-1]; // slt
        endcase
    end
    
	//Multiply and divide results are only stored at clock falling edge.
    always @(negedge clk) begin
        case (alucontrol)
            3'b011: HiLo = a * b; // mult
            3'b101: // div
                begin
                    HiLo[n-1:0] = a / b;
                    HiLo[2*n - 1:n] = a % b;
                end
        endcase
    end
    
endmodule

`endif // ALU
