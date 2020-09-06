`include "ejercicio5y6.v"

module testbench();
wire O0;
reg A, B;
reg clock, RST;

FINALEJ1  U1(A, B, clock, RST, O0);

always
  #1 clock <=~clock;

  initial begin
  $display(" EJERCICIO 1 ");
  $display("clk A B | Y ");
  $display("--------|---");
  $monitor("%b  %b %b | %b  " ,clock, A, B, O0);
  end
  initial begin
    A = 0; B = 0; RST = 0; clock = 0;
    #1	RST = 1;
    #1	RST = 0;
    #5
    A = 1; B = 0;
    #5
    A = 0; B = 0;
    #5
    A = 1; B = 1;
  end

  initial
    #20 $finish;
  initial begin
      $dumpfile("ejercicio5y6_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
