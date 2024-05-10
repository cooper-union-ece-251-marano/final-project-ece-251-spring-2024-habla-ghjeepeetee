///////////////////////////////////////////////////////////////////////////////
//
// Full Adder TESTBENCH module
//
// An adder testbench module for your Computer Architecture Elements Catalog
//
// module: tb_adder
// hdl: Verilog
//
// author: Nolan Griffith, Anthony Nosaryev 
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./adder.sv"

module tb_adder;

   parameter N = 4;

   reg [N-1:0] A, B;   //inputs are reg for test bench
   wire [N-1:0] C;     //outputs are wire for test bench
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("tb_example_module.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
   initial
   begin: apply_stimulus
      reg[N-1:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 2**N - 1; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abcin = %b, cout = -%b, sum = %b", {a, b, cin}, cout, sum);
         {A} = invect [N-1:0];
         {B} = ~invect [N-1:0];
         #10 $display("a=%b, b=%b, c=%b", A, B, C);
      end
      $finish;
   end

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   adder uut(.a(A), .b(B), .c(C));

endmodule
