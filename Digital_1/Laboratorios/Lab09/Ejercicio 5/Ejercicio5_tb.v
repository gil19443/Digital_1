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
microcode E7(INPUT, OUTPUT);
  initial begin
  #1
  $display(" MICROCODE  ");
  $display("INPUT | OUTPUT ");
  $display("---------|----");
  $monitor("%b | %b " ,INPUT, OUTPUT);
      INPUT = 7'bxxxxxx0;
  #3 INPUT = 7'b00001x1;
  #3 INPUT = 7'b00000x1;
  #3 INPUT = 7'b00011x1;
  #3 INPUT = 7'b00010x1;
  #3 INPUT = 7'b0010xx1;
  #3 INPUT = 7'b0011xx1;
  #3 INPUT = 7'b0100xx1;
  #3 INPUT = 7'b0101xx1;
  #3 INPUT = 7'b0110xx1;
  #3 INPUT = 7'b0111xx1;
  #3 INPUT = 7'b1000x11;
  #3 INPUT = 7'b1000x01;
  #3 INPUT = 7'b1001x11;
  #3 INPUT = 7'b1001x01;
  #3 INPUT = 7'b1010xx1;
  #3 INPUT = 7'b1011xx1;
  #3 INPUT = 7'b1100xx1;
  #3 INPUT = 7'b1101xx1;
  #3 INPUT = 7'b1110xx1;
  #3 INPUT = 7'b1111xx1;

  #3 INPUT = 7'b1111111;
  #3 INPUT = 7'b1111001;
  #3 INPUT = 7'b1111011;
  #3 INPUT = 7'b1111101;
  #3 INPUT = 7'b1110001;
  #3 INPUT = 7'b1101011;
  #3 INPUT = 7'b1000001;
  #3 INPUT = 7'b1101011;
  #3 INPUT = 7'b1111101;
  #3 INPUT = 7'b1000001;

  end
  initial
    #94 $finish;
  initial begin
      $dumpfile("Ejercicio5_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
