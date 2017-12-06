/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_35 (
    input [24:0] a,
    input [24:0] b,
    input [5:0] alufn,
    output reg [24:0] out
  );
  
  
  
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  wire [1-1:0] M_adder_overflow;
  wire [25-1:0] M_adder_out;
  adder_38 adder (
    .a(a),
    .b(b),
    .alufn(alufn),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n),
    .overflow(M_adder_overflow),
    .out(M_adder_out)
  );
  wire [25-1:0] M_shift_out;
  shift_39 shift (
    .a(a),
    .b(b),
    .alufn(alufn),
    .out(M_shift_out)
  );
  wire [25-1:0] M_boole_out;
  boole_40 boole (
    .a(a),
    .b(b),
    .alufn(alufn),
    .out(M_boole_out)
  );
  
  wire [25-1:0] M_compare_out;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  reg [6-1:0] M_compare_alufn;
  compare_41 compare (
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .alufn(M_compare_alufn),
    .out(M_compare_out)
  );
  
  always @* begin
    M_compare_z = M_adder_z;
    M_compare_v = M_adder_v;
    M_compare_n = M_adder_n;
    M_compare_alufn = alufn;
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = M_adder_out;
      end
      2'h1: begin
        out = M_boole_out;
      end
      2'h2: begin
        out = M_shift_out;
      end
      2'h3: begin
        out = M_compare_out;
      end
      default: begin
        out = 25'h0000000;
      end
    endcase
  end
endmodule
