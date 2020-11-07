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
buffer E6(in, enable, OUT);

  initial begin
  #1
  $display(" BUFFER TRI ESTADO  ");
  $display("IN enable | out ");
  $display("---------|----");
  $monitor("%b %b | %b " ,in, enable, OUT);
      in = 4'b0; enable = 0;
  #3 in = 4'b0100; enable = 1;
  #3 in = 4'b0100; enable = 1;
  end
  initial
    #8 $finish;
  initial begin
      $dumpfile("Ejercicio4_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
