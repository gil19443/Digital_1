`include "ejercicio5y6.v"

module testbench();
wire [3:0]Q1;
reg [3:0]D1;
reg clock, RST, ST;

FFD5  U1(clock, RST,ST, D1, Q1);

always
  #1 clock <=~clock;

//testbench flip flop d con reset asincrono
  initial begin
  $display(" Prueba ffrst");
  $display("S C R  D    |  Q ");
  $display("------------|-----");
  $monitor("%b %b %b %b  | %b  ", ST,clock, RST, D1, Q1);
     RST = 1; ST = 1; D1[3] = 1; D1[2] = 1; D1[1] = 0; D1[0] = 0; clock = 0;
  #5 RST = 0; ST = 0; D1[3] = 0; D1[2] = 1; D1[1] = 1; D1[0] = 0;
  #5 RST = 0; ST = 1; D1[3] = 1; D1[2] = 1; D1[1] = 1; D1[0] = 1;
  #5 RST = 0; ST = 0; D1[3] = 0; D1[2] = 0; D1[1] = 1; D1[0] = 1;
  #5 RST = 0; ST = 0; D1[3] = 1; D1[2] = 1; D1[1] = 0; D1[0] = 1;
  end
  initial
    #21 $finish;
  initial begin
      $dumpfile("ejercicio5y6p2_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
