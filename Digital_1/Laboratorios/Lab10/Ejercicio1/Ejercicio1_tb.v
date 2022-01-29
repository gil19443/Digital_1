`include "Ejercicio1.v"
module testbench();
reg clock, reset,enF, enP, load, J, K, enable;
reg [11:0]load_1;
wire [7:0]progbyte;
wire [3:0]instr, operand;
ejercicio1 MF(clock, reset, enF, enP, load, load_1, progbyte, instr, operand);
always
  #5 clock <=~clock;

  initial begin
  #1
  $display(" Ejercicio 1  ");
  $display("clk enF enP load load_1 | progbyte instruction operand ");
  $display("------------------------|-------------------------------");
  $monitor("%b  %b  %b %b  %b | %b %b %b " ,clock, enF, enP, load, load_1, progbyte, instr, operand);
    reset = 0; clock = 0; enF = 0; enP = 0; load = 0; load_1 = 12'b0;
  #1 reset = 1;
  #1 reset = 0;
  #6 enF = 0; enP = 0; load = 0; load_1 = 12'b0;
  #6 enF = 0; enP = 0; load = 0; load_1 = 12'b0;
  #6 enF = 1; enP = 1; load = 1; load_1 = 12'b000001010101;
  #6 enF = 1; enP = 1; load = 0; load_1 = 12'b0;
  #6 enF = 1; enP = 1; load = 0; load_1 = 12'b0;
  #6 enF = 1; enP = 1; load = 0; load_1 = 12'b0;
  #6 enF = 1; enP = 1; load = 0; load_1 = 12'b0;
  end
  initial
    #46 $finish;
  initial begin
      $dumpfile("Ejercicio1_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
