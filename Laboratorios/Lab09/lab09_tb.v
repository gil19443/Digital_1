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
FD1 E1(clock, reset, EN, D, Q);
FD2 E2(clock, reset, EN, D1, Q1);
FD4 E3(clock, reset, EN, D2, Q2);
FFT E4(clock, reset, EN, QT);
FFJK E5(J, K, clock, reset, EN, QJK);
buffer E6(in, enable, OUT);
microcode E7(INPUT, OUTPUT);
always
  #1 clock <=~clock;

  initial begin
  #1
  $display(" FLIP FLOP D 1 BIT  ");
  $display("clk en D | Q ");
  $display("---------|----");
  $monitor("%b %b %b | %b " ,clock,EN,D, Q);
    reset = 0; clock = 0;
  #1 reset = 1;
  #1 reset = 0;
  #3 EN = 1; D = 1;
  #3 EN = 1; D = 1;
  #3 EN = 0; D = 0;
  #3 EN = 0; D = 0;
  end
  initial begin
  #16
  $display(" FLIP FLOP D 2 BIT  ");
  $display("clk en D | Q ");
  $display("---------|----");
  $monitor("%b %b %b | %b " ,clock,EN,D1, Q1);
    reset = 0; clock = 0;
  #1 reset = 1;
  #1 reset = 0;
  #3 EN = 1; D1 = 2'b01;
  #3 EN = 1; D1 = 2'b01;
  #3 EN = 0; D1 = 2'b0;
  #3 EN = 0; D1 = 2'b0;
  end
  initial begin
  #41
  $display(" FLIP FLOP D 4 BIT  ");
  $display("clk en D | Q ");
  $display("---------|----");
  $monitor("%b %b %b | %b " ,clock,EN,D2, Q2);
    reset = 0; clock = 0;
  #1 reset = 1;
  #1 reset = 0;
  #3 EN = 1; D2 = 4'b0101;
  #3 EN = 1; D2 = 4'b0101;
  #3 EN = 0; D2 = 4'b0;
  #3 EN = 0; D2 = 4'b0;
  end
  initial begin
  #56
  $display(" FLIP FLOP T  ");
  $display("clk en | Q ");
  $display("---------|----");
  $monitor("%b %b | %b " ,clock,EN,QT);
    reset = 0; clock = 0;
  #1 reset = 1;
  #1 reset = 0;
  end
  initial begin
  #64
  $display(" FLIP FLOP JK  ");
  $display("clk en | Q ");
  $display("---------|----");
  $monitor("%b %b | %b " ,clock,EN,QT);
    reset = 0; clock = 0;
  #1 reset = 1;
  #1 reset = 0;
  end
  initial begin
  #72
  $display(" BUFFER TRI ESTADO  ");
  $display("IN enable | out ");
  $display("---------|----");
  $monitor("%b %b | %b " ,in, enable, OUT);
      in = 4'b0; enable = 0;
  #3 in = 4'b0100; enable = 1;
  #3 in = 4'b0100; enable = 1;
  end
  initial begin
  #72
  $display(" MICROCODE  ");
  $display("INPUT | OUTPUT ");
  $display("---------|----");
  $monitor("%b | %b " ,INPUT, OUTPUT);
      INPUT = 7'bxxxxxx0;
  #3 INPUT = 7'b00001x1;
  #3 INPUT = 7'b00000x1;
  #3 INPUT = 7'b00011x1;
  end
  initial
    #82 $finish;
  initial begin
      $dumpfile("contador.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
