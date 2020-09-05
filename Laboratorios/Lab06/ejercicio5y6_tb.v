`include "ejercicio5y6.v"

module testbench();
wire [3:0]Q1;
reg [3:0]D1;
wire O0,O3,O2,O1;
reg A, B, p3;
reg clock, RST, ST;

FFD5      U1(clock, RST,ST, D1, Q1);
FINALEJ1  U3(p1, p2, clock, RST, O0);
FINALEJ3  U4(p3, clock, RST, O3, O2, O1);

always
  begin
  clock <=0;
  #1 clock <=~clock; #1 ;
  end
always
  begin
    ST <=0;
    #1 ST <=~ST; #1 ;
    end
//testbench flip flop d con reset asincrono
  initial begin
  $display(" Prueba ffrst");
  $display("S C R  D    |  Q ");
  $display("------------|-----");
  $monitor("%b %b %b %b  | %b  ", ST,clock, RST, D1[3:0], Q1[3:0]);
     RST = 1; D1[3] = 1; D1[2] = 1; D1[1] = 0; D1[0] = 0;
  #3 RST = 0; D1[3] = 0; D1[2] = 1; D1[1] = 1; D1[0] = 0;
  #3 RST = 0; D1[3] = 1; D1[2] = 1; D1[1] = 1; D1[0] = 1;
  #3 RST = 0; D1[3] = 0; D1[2] = 0; D1[1] = 1; D1[0] = 1;
  #3 RST = 0; D1[3] = 1; D1[2] = 1; D1[1] = 0; D1[0] = 1;
  end

  initial begin
  #13
  $display(" EJERCICIO 1 ");
  $display("clk A B | Y ");
  $display("--------|---");
  $monitor("%b  %b | %b " , A, B, O0);
  A = 0; B = 0;
#2	A = 0; B = 1;
#2	A = 1; B = 0;
#2	A = 1; B = 1;
#2	A = 0; B = 1;
#2	A = 0; B = 0;
#2	A = 0; B = 1;
#2	A = 1; B = 0;
#2	A = 1; B = 1;
#2	A = 0; B = 1;
  end

  initial begin
  #41
  $display(" EJERCICIO 3 ");
  $display("clk p |  Y ");
  $display("------|----");
  $monitor("%b  %b  | %b %b %b " ,clock,p3, O3,O2,O1);
     p3 = 1; RST = 1;
     p3 = 1; RST = 0;
     p3 = 1;
  #2 p3 = 1;
  #2 p3 = 1;
  #2 p3 = 1;
  #2 p3 = 1;
  #2 p3 = 1;
  #2 p3 = 1;
  #2 p3 = 1;
  #2 p3 = 0;
  #2 p3 = 0;
  #2 p3 = 0;
  #2 p3 = 0;
  #2 p3 = 0;
  #2 p3 = 0;
  #2 p3 = 0;
  #2 p3 = 0;
  end

  initial
    #73 $finish;
  initial begin
      $dumpfile("ejercicio5y6_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
