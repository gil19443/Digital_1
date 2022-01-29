//Ejercicio 1, ecuación 1
module ejercicio1_1(input wire A, B, C, output wire OUT);
  wire w1, w2, w3, w4, w5, w6;
  not (w1, A);
  not (w2, B);
  not (w3, C);
  and (w4, w1, w3);
  and (w5, A, C);
  and (w6, A, w2);
  or (OUT, w4, w5, w6);
endmodule

//Ejercicio 1, ecuación 2
module ejercicio1_2(input wire B, output wire OUT);
  not (OUT, B);
endmodule

//Ejercicio 1, ecuación 3
module ejercicio1_3(input wire A, B, C, D, output wire OUT);
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
  not (w1,A);
  not (w2,B);
  not (w3,C);
  not (w4,D);
  and (w5,w1,w2,w3,w4);
  and (w6,w1,w2,C,D);
  and (w7,w1,B,C,w4);
  and (w8,A,B,w3,w4);
  and (w9,A,B,C,D);
  and (w10,A,w2,w3,D);
  and (w11,A,w2,C,w4);
  and (w12,w1,B,w3,D);
  or  (OUT,w5,w6,w7,w8,w9,w10,w11,w12);
endmodule

// Ejercicio 5 ecuacion minimizada
module ejercicio5_kmap(input wire A, B, C, output wire OUT);
  wire w1,w2;
  not (w1,B);
  or  (w2,w1,C);
  and (OUT,A,w2);
endmodule


//Ejercicio 1, ecuación 4
module ejercicio1_4(input wire A, B, C, D, output wire OUT);
  wire w1,w2,w3;
  not (w1,A);
  not (w2,D);
  or  (w3,w1,B,C,w2);
  and (OUT,A,w3);
endmodule

//Ejercicio 2, ecuación 1
module ejercicio2_1(input wire A, B, C, D, output wire OUT);
  assign  OUT = (A & ~B) | (A & C & ~D) | (A & ~C) | (~B & ~C & ~D);
endmodule

//Ejercicio 2, ecuación 2
module ejercicio2_2(input wire B, C, output wire OUT);
  assign  OUT = C | ~B;
endmodule

//Ejercicio 2, ecuación 3
module ejercicio2_3(input wire A, B, C, D, output wire OUT);
  assign  OUT = (B | D) & (A | B | ~C);
endmodule

//Ejercicio 2, ecuación 4
module ejercicio2_4(input wire A, B, C, output wire OUT);
  assign  OUT = (~A | B) & (~C | B);
endmodule
// Ejercicio 5 ecuacion POS
module ejercicio5_POS(input wire A, B, C, output wire OUT);
  assign  OUT = (A | B | C ) & (A | B |~C) & (A | ~B |C) & (A | ~B |~C) & (~A | ~B | C);
endmodule

//Ejercicio 5 ecuacion SOP
module ejercicio5_SOP(input wire A, B, C, output wire OUT);
  assign OUT = (A & ~B & ~C) | (A & ~B & C) | (A & B & C);
endmodule
