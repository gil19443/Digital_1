module gates();
wire w1,w2,w3,w4,w5,w6,OUT; // 3 salidas para los Not, 3 salidas para los or y una para el and final
//orden de entradas y salidas de cada compuerta
reg A, B, C; //declarar las 3 entradas
not U1(w1,A);
not U2(w2,B);
not U3(w3,C);
or  U4(w4,A,B,w3);
or  U5(w5,A,w2,w3);
or  U6(w6,w1,w2,C);
and U7(OUT,w4,w5,w6);
initial begin
  $display("A B C | Y");
  $display("--------");
  $monitor("%b %b %b| %b", A, B, C, OUT);
  A = 0; B = 0; C = 0;
  #1  C = 1;
  #1  B = 1; C = 0;
  #1  C = 1;
  #1  A = 1; B = 0; C = 0;
  #1  C = 1;
  #1  B = 1; C = 0;
  #1  C = 1;
  #1 $finish;
end

initial
  begin
    $dumpfile("TABLA1POS_tb.vcd");
    $dumpvars(0, gates);
  end

endmodule
