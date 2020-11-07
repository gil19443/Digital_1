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
FFJK E5(J, K, clock, reset, EN, QJK);
always
  #1 clock <=~clock;

  initial begin
  clock = 0;
  #1
  $display(" FLIP FLOP JK  ");
  $display("clk en J K  | Q ");
  $display("---------|----");
  $monitor("%b %b %b %b| %b " ,clock,EN,J,K,QJK);
    reset = 0;  EN = 0; J = 0; K = 0;
  #1 reset = 1;
  #1 reset = 0;
  #3 EN = 1; J = 0; K = 0;
  #3 EN = 1; J = 0; K = 1;
  #3 EN = 1; J = 1; K = 0;
  #3 EN = 1; J = 1; K = 1;
  end
  initial
    #16 $finish;
  initial begin
      $dumpfile("Ejercicio3_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
