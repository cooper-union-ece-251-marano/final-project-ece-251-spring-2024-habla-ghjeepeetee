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
  # (parameter bitSize = 4)

   // ADD YOUR MODULE INPUTS AND OUTPUTS HERE
   (input [bitSize-1:0] a,
    input [bitSize-1:0] b,
  output reg [bitSize-1:0] summation,
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   always @ (b or a) begin
      summation = a + b;
      end
    
endmodule

`endif // ADDER
