/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shift_cursor_21 (
    input clk,
    input rst,
    input [1:0] direction,
    input [24:0] current_cursor,
    output reg out
  );
  
  
  
  always @* begin
    out = current_cursor + 1'h1;
  end
endmodule
