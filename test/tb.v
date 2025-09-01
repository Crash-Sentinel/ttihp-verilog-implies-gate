`default_nettype none
`timescale 1ns / 1ps

module tb ();

  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;  // not used
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Instantiate DUT
  tt_um_big_ben_fr_implies_gate dut (
      .ui_in(ui_in),
      .uo_out(uo_out),
      .uio_in(uio_in),
      .uio_out(uio_out),
      .uio_oe(uio_oe),
      .ena(ena),
      .clk(clk),
      .rst_n(rst_n)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);

    // Initial conditions
    clk = 0;
    ena = 1;
    rst_n = 0;
    ui_in = 0;
    uio_in = 0;

    // Release reset
    #20 rst_n = 1;

    // Test #1: A=1100, B=1010
    ui_in = 8'b1010_1100;
    #10;
    $display("Test 1: uo_out=%b (expected = %b)", uo_out, (~ui_in[3:0] | ui_in[7:4]));

    #20 $finish;
  end

endmodule