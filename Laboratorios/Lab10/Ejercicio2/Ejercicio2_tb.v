`include "Ejercicio2.v"
module testbench();
reg clock, reset, enF, enb1, enb2;
reg [3:0]buffer1;
reg [2:0]s;
wire [3:0]buffer2;
wire carry, zero;
ejercicio2 MF(clock, reset, enF, enb1, enb2, buffer1,s,buffer2, carry, zero);
always
  #5 clock <=~clock;

  initial begin
  #1
  $display(" Ejercicio 2  ");
  $display("clk enF enb1 enb2 buffer1 s | buffer2 carry zero ");
  $display("----------------------------|---------------------");
  $monitor(" %b   %b   %b   %b   %b  %b  |  %b    %b    %b " ,clock, enF, enb1, enb2, buffer1, s, buffer2, carry, zero);
    reset = 0;  enF = 0; enb1 = 0; clock = 0; enb2 = 0; buffer1 = 4'b0; s = 3'b0;
  #1 reset = 1;
  #1 reset = 0;
  #9 enF = 1; enb1 = 1; enb2 = 0; buffer1 = 4'b1111; s = 3'b0;
  #9 enF = 1; enb1 = 1; enb2 = 1; buffer1 = 4'b1111; s = 3'b010;
  #9 enF = 1; enb1 = 1; enb2 = 1; buffer1 = 4'b1111; s = 3'b001;
  #9 enF = 1; enb1 = 1; enb2 = 1; buffer1 = 4'b1111; s = 3'b011;
  #9 enF = 1; enb1 = 1; enb2 = 1; buffer1 = 4'b1111; s = 3'b100;
  end
  initial
    #54 $finish;
  initial begin
      $dumpfile("Ejercicio2_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
