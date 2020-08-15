//mux 2:1
module MUX2_1(input wire s1, A1, B1, output wire y1);
assign  y1 = s1?  B1: A1;
endmodule
// mux 4:1
module MUX4_1(input wire[1:0]s1, input wire A2, B2, C2, D2, output wire y2);
  wire y1, y1_2;
  MUX2_1  E1(s1[0],A2,B2,y1);
  MUX2_1  E2(s1[0],C2,D2,y1_2);
  MUX2_1  E3(s1[1],y1,y1_2,y2);
endmodule
// mux 8:1
module MUX8_1(input wire[2:0]s3, input wire A3, B3, C3, D3, E3, F3, G3, H3, output wire y3);
  wire y2, y2_2;
  MUX4_1  E1(s3[1:0],A3, B3, C3, D3,y2);
  MUX4_1  E2(s3[1:0],E3, F3, G3, H3,y2_2);
  MUX2_1  E4(s3[2],y2,y2_2,y3);
endmodule
//tabla 1 mux 8:1
module Tabla1MUX8_1 (input wire A, B, C, GND, VCC, output wire OUT);
  wire [2:0]S1;
  assign S1[0] = C;
  assign S1[1] = B;
  assign S1[2] = A;
  MUX8_1  E1(S1[2:0],GND, VCC, VCC, GND, VCC, GND, GND, VCC, OUT);
endmodule
//tabla 1 mux4:1
module Tabla1MUX4_1 (input wire A, B, C, output wire OUT);
  wire [1:0]S1;
  assign S1[0] = B;
  assign S1[1] = A;
  MUX4_1 E1(S1[1:0],C,~C, ~C, C, OUT);
endmodule
//Tabla 1 mux2:1
module Tabla1MUX2_1 (input wire A, B, C, output wire OUT);
  wire S1, W1, W2;
  assign S1 = A;
  assign W1 = B^C;
  assign W2 = ~(B^C);
  MUX2_1 E1(S1, W1, W2, OUT);
endmodule
//Tabla 2 mux 8:1
module Tabla2MUX8_1 (input wire A, B, C,GND, VCC, output wire OUT);
  wire [2:0]S1;
  assign S1[0] = C;
  assign S1[1] = B;
  assign S1[2] = A;
  MUX8_1  E1(S1[2:0],VCC,VCC,GND,GND,GND,VCC,VCC,GND,OUT);
endmodule
//Tabla 2 mux 4:1
module Tabla2MUX4_1 (input wire A, B, C,GND, output wire OUT);
  wire [1:0]S1;
  assign S1[0] = B;
  assign S1[1] = A;
  MUX4_1 E1(S1[1:0],~C,GND, C, ~C, OUT);
endmodule
//Tabla 2 mux 2:1
module Tabla2MUX2_1 (input wire A, B, C, output wire OUT);
  wire S1, W1, W2;
  assign S1 = A;
  assign W1 = ~(B | C);
  assign W2 = ~(B & C);
  MUX2_1 E1(S1, W1, W2, OUT);
endmodule
