/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input start_button,
    input reset_button,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  reg [24:0] out_temp;
  
  localparam VERT = 2'h3;
  
  localparam HORI = 3'h4;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [0:0] M_ctr_d, M_ctr_q = 1'h0;
  reg [24:0] M_temp_d, M_temp_q = 1'h0;
  reg [24:0] M_temp1_d, M_temp1_q = 1'h0;
  reg [24:0] M_cursor_d, M_cursor_q = 1'h0;
  reg [1:0] M_direction_d, M_direction_q = 1'h0;
  wire [1-1:0] M_counter_value;
  counter_2 counter (
    .clk(clk),
    .rst(rst),
    .value(M_counter_value)
  );
  wire [25-1:0] M_processor_out;
  reg [5-1:0] M_processor_button;
  processor_3 processor (
    .clk(clk),
    .rst(rst),
    .button(M_processor_button),
    .out(M_processor_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_processor_button = io_button;
    out_temp = M_processor_out;
    io_led[0+7-:8] = out_temp[0+7-:8];
    io_led[8+7-:8] = out_temp[8+7-:8];
    io_led[16+7-:8] = out_temp[16+7-:8];
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
      M_temp_q <= 1'h0;
      M_temp1_q <= 1'h0;
      M_cursor_q <= 1'h0;
      M_direction_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
      M_temp_q <= M_temp_d;
      M_temp1_q <= M_temp1_d;
      M_cursor_q <= M_cursor_d;
      M_direction_q <= M_direction_d;
    end
  end
  
endmodule
