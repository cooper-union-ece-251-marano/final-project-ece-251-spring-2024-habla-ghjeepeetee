// Code your testbench here
// or browse Examples
///////////////////////////////////////////////////////////////////////////////
//
// Full Adder module
//
// Full adder module for your Computer Architecture Elements Catalog
//
// module: adder
// hdl: Verilog
//
// author: Nolan Griffith, Anthony Nosaryev
//
///////////////////////////////////////////////////////////////////////////////

`ifndef ADDER
`define ADDER

module adder
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   # (parameter n = 32)

   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   (input [n-1:0] a,
    input [n-1:0] b,
    output reg [n-1:0] c
   );
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   always @(a, b) begin
      c = a + b;
   end
    
endmodule

`endif // ADDER
