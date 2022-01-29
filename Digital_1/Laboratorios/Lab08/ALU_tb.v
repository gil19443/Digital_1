`include "contador.v"
module testbench();
reg [2:0]S;
reg [3:0]A;
reg [3:0]B;
wire [3:0]resultado;
ALU E1 (A, B, S, resultado);
  initial begin
  #1
  $display("       ALU         ");
  $display(" A    B    S  | resultado  ");
  $display("--------------|-----------");
  $monitor("%b %b %b | %b " ,A, B, S, resultado);
  end
  initial begin
      A = 4'b0101; B = 4'b0000; S = 3'b000;
  #3 A = 4'b0101; B = 4'b0000; S = 3'b001;
  #3 A = 4'b0101; B = 4'b0001; S = 3'b010;
  #3 A = 4'b0101; B = 4'b0000; S = 3'b011;
  #3 A = 4'b0101; B = 4'b0000; S = 3'b100;
  #3 A = 4'b0101; B = 4'b0000; S = 3'b101;
  #3 A = 4'b0101; B = 4'b0001; S = 3'b110;
  #3 A = 4'b0101; B = 4'b0000; S = 3'b111;
  end

  initial
    #50 $finish;
  initial begin
      $dumpfile("contador.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
