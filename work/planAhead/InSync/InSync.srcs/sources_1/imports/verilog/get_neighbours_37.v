/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module get_neighbours_37 (
    input clk,
    input rst,
    input [24:0] cursor,
    output reg [24:0] up,
    output reg [24:0] down,
    output reg [24:0] left,
    output reg [24:0] right
  );
  
  
  
  reg [1:0] M_ctr_d, M_ctr_q = 1'h0;
  reg [24:0] M_up_temp_d, M_up_temp_q = 1'h0;
  reg [24:0] M_down_temp_d, M_down_temp_q = 1'h0;
  reg [24:0] M_left_temp_d, M_left_temp_q = 1'h0;
  reg [24:0] M_right_temp_d, M_right_temp_q = 1'h0;
  reg [4:0] M_cursor_position_d, M_cursor_position_q = 1'h0;
  
  wire [25-1:0] M_alu_out;
  reg [25-1:0] M_alu_a;
  reg [25-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_36 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  wire [5-1:0] M_get_position_pos;
  reg [25-1:0] M_get_position_cursor;
  get_position_22 get_position (
    .cursor(M_get_position_cursor),
    .pos(M_get_position_pos)
  );
  
  localparam HORI = 3'h4;
  
  localparam VERT = 2'h3;
  
  always @* begin
    M_left_temp_d = M_left_temp_q;
    M_right_temp_d = M_right_temp_q;
    M_up_temp_d = M_up_temp_q;
    M_down_temp_d = M_down_temp_q;
    M_ctr_d = M_ctr_q;
    M_cursor_position_d = M_cursor_position_q;
    
    M_alu_a = 25'h0000000;
    M_alu_b = 25'h0000000;
    M_alu_alufn = 25'h0000000;
    M_up_temp_d = M_up_temp_q;
    M_down_temp_d = M_down_temp_q;
    M_left_temp_d = M_left_temp_q;
    M_right_temp_d = M_right_temp_q;
    M_cursor_position_d = M_cursor_position_q;
    M_get_position_cursor = cursor;
    M_cursor_position_d = M_get_position_pos;
    M_ctr_d = M_ctr_q + 1'h1;
    
    case (M_ctr_q)
      1'h0: begin
        M_alu_a = cursor;
        M_alu_b = 2'h3;
        M_alu_alufn = 6'h20;
        M_up_temp_d = M_alu_out;
      end
      1'h1: begin
        M_alu_a = cursor;
        M_alu_b = 2'h3;
        M_alu_alufn = 6'h21;
        M_down_temp_d = M_alu_out;
      end
      2'h2: begin
        M_alu_a = cursor;
        M_alu_b = 3'h4;
        M_alu_alufn = 6'h20;
        M_left_temp_d = M_alu_out;
      end
      2'h3: begin
        M_alu_a = cursor;
        M_alu_b = 3'h4;
        M_alu_alufn = 6'h21;
        M_right_temp_d = M_alu_out;
      end
      default: begin
        M_alu_a = 25'h0000000;
        M_alu_b = 25'h0000000;
        M_alu_alufn = 6'h00;
      end
    endcase
    
    case (M_cursor_position_q)
      1'h0: begin
        up = 25'h0000000;
        down = 25'h0000000;
        left = M_left_temp_q;
        right = 25'h0000000;
      end
      1'h1: begin
        up = M_up_temp_q;
        down = 25'h0000000;
        left = M_left_temp_q;
        right = 25'h0000000;
      end
      2'h2: begin
        up = M_up_temp_q;
        down = 25'h0000000;
        left = M_left_temp_q;
        right = 25'h0000000;
      end
      2'h3: begin
        up = M_up_temp_q;
        down = 25'h0000000;
        left = 25'h0000000;
        right = 25'h0000000;
      end
      3'h7: begin
        up = 25'h0000000;
        down = M_down_temp_q;
        left = M_left_temp_q;
        right = 25'h0000000;
      end
      4'ha: begin
        up = M_up_temp_q;
        down = 25'h0000000;
        left = 25'h0000000;
        right = M_right_temp_q;
      end
      4'he: begin
        up = 25'h0000000;
        down = M_down_temp_q;
        left = M_left_temp_q;
        right = 25'h0000000;
      end
      5'h11: begin
        up = M_up_temp_q;
        down = 25'h0000000;
        left = 25'h0000000;
        right = M_right_temp_q;
      end
      5'h15: begin
        up = 25'h0000000;
        down = M_down_temp_q;
        left = 25'h0000000;
        right = 25'h0000000;
      end
      5'h16: begin
        up = 25'h0000000;
        down = M_down_temp_q;
        left = 25'h0000000;
        right = M_right_temp_q;
      end
      5'h17: begin
        up = 25'h0000000;
        down = M_down_temp_q;
        left = 25'h0000000;
        right = M_right_temp_q;
      end
      5'h18: begin
        up = 25'h0000000;
        down = M_down_temp_q;
        left = 25'h0000000;
        right = M_right_temp_q;
      end
      default: begin
        up = M_up_temp_q;
        down = M_down_temp_q;
        left = M_left_temp_q;
        right = M_right_temp_q;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
      M_up_temp_q <= 1'h0;
      M_down_temp_q <= 1'h0;
      M_left_temp_q <= 1'h0;
      M_right_temp_q <= 1'h0;
      M_cursor_position_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
      M_up_temp_q <= M_up_temp_d;
      M_down_temp_q <= M_down_temp_d;
      M_left_temp_q <= M_left_temp_d;
      M_right_temp_q <= M_right_temp_d;
      M_cursor_position_q <= M_cursor_position_d;
    end
  end
  
endmodule
