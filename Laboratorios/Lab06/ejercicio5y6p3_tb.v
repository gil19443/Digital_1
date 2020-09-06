`include "ejercicio5y6.v"

module testbench();
wire O3,O2,O1;
reg p3;
reg clock, RST;

FINALEJ3  U4(p3, clock, RST, O3, O2, O1);

always
  #1 clock <=~clock;

  initial begin
  $display(" EJERCICIO 3 ");
  $display("clk p |  Y ");
  $display("------|----");
  $monitor("%b  %b  | %b %b %b " ,clock,p3, O3,O2,O1);
  end
  initial begin
     p3 = 1; RST = 1; clock = 0;
  #1 p3 = 1; RST = 0;
  #1 p3 = 1;
  #1 p3 = 1;
  #1 p3 = 1;
  #1 p3 = 1;
  #1 p3 = 1;
  #1 p3 = 1;
  #1 p3 = 1;
  #1 p3 = 1;
  #1 p3 = 0;
  #1 p3 = 0;
  #1 p3 = 0;
  #1 p3 = 0;
  #1 p3 = 0;
  #1 p3 = 0;
  #1 p3 = 0;
  #1 p3 = 0;
  end

  initial
    #18 $finish;
  initial begin
      $dumpfile("ejercicio5y6p3_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
