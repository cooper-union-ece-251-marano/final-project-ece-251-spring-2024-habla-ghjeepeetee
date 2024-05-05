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
// author: Nolan Griffith <nolan.griffith@cooper.edu>
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
  (input [bitSize-1:0] p,
   input [bitSize-1:0] q,
  output reg [bitSize-1:0] summation,
   input carry_in,
   input enabled,
   output reg carry_out);
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   always @ (carry_in or b or a) begin
   if(enabled) begin
      {carry_out, summation} = a + b + carry_in;
      end
   else begin
         summation = 'bz;
         carry_out = 'bz;
         end
   end
endmodule

`endif // ADDER
