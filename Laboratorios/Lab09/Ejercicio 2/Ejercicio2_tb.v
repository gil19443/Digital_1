`include "Lab09.v"
module testbench();
reg clock, reset,EN, D, J, K, enable;
reg [1:0]D1;
reg [3:0]D2;
reg [3:0]in;
reg [6:0]INPUT;
wire [1:0]Q1;
wire [3:0]Q2;
wire [3:0]OUT;
wire [12:0]OUTPUT;
wire Q, QT, QJK;
FFT E4(clock, reset, EN, QT);
always
  #1 clock <=~clock;

  initial begin
  clock = 0;
  #1
  $display(" FLIP FLOP T  ");
  $display("clk en | Q ");
  $display("---------|----");
  $monitor("%b %b | %b " ,clock,EN,QT);
    reset = 0; clock = 0; EN =0;
  #1 reset = 1; EN =1;
  #1 reset = 0;
  #1 EN = 1;
  end

  initial
    #14 $finish;
  initial begin
      $dumpfile("Ejercicio2_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
