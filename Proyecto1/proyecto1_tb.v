`include "proyecto1.v"
module testbench();
reg clock, reset;
reg [3:0]P;
reg [2:0]D;
wire [3:0]OUT;
wire [2:0]VF;
superfsm E1 (clock, reset, P, D, OUT, VF);

always
  #1 clock <=~clock;

  initial begin
  #1
  $display(" MAQUINA EXPENDEDORA");
  $display("clk  P   D | OUT  VF ");
  $display("-----------|---------");
  $monitor("%b %b %b | %b %b " ,clock,P, D,OUT,VF);
  end
  initial begin
    reset = 1; clock = 0;
  #1 P[0] = 1;P[1] = 0;P[2] = 0;P[3] = 0; D[0] = 0;D[1] = 0;D[2] = 0; reset = 0;
  #5 P[0] = 0;P[1] = 0;P[2] = 0;P[3] = 0; D[0] = 1;D[1] = 0;D[2] = 0;
  end

  initial
    #18 $finish;
  initial begin
      $dumpfile("proyecto1_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
