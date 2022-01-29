module gates();
reg A, B, C,D; //declarar las 4 entradas
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,OUT; // 4 salidas para los Not, 7 salidas para los and y una para el or final
//orden de entradas y salidas de cada compuerta
not U1(w1,A);
not U2(w2,B);
not U3(w3,C);
not U4(w4,D);
and U5(w5,w1,w2,w3,w4);
and U6(w6,w1,w2,C,w4);
and U7(w7,w1,w2,C,D);
and U8(w8,w1,B,C,w4);
and U9(w9,w1,B,C,D);
and U10(w10,A,w2,w3,w4);
and U11(w11,A,w2,C,w4);
or  U12(OUT,w5,w6,w7,w8,w9,w10,w11);

initial begin
  $display("A B C D | Y");
  $display("--------");
  $monitor("%b %b %b %b| %b", A, B, C, D, OUT);
  A = 0; B = 0; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 B = 1; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 A = 1; B = 0; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 B = 1; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 $finish;
end

initial
  begin
    $dumpfile("TABLA4SOP_tb.vcd");
    $dumpvars(0, gates);
  end

endmodule
