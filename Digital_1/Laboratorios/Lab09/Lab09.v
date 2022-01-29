//ejercicio 1
//flip flop D de 1 bit
module FD1 (input wire clock, reset, en, input wire D, output reg Q);
  always @ (posedge clock or posedge reset or en) begin
    if (reset)begin
    Q <= 1'b0;
    end
    else if (en) begin
    Q <= D;
    end
    end
  endmodule
//flip flop D de 2 bit
module FD2 (input wire clock, reset, en, input wire [1:0]D, output reg[1:0]Q);
  wire Q0, Q1;
  assign Q0 = Q[0];
  assign Q1 = Q[1];
  FD1 N1(clock, reset, en, D[0], Q0);
  FD1 N2(clock, reset, en, D[1], Q1);
  endmodule
//flip flop D de 4 bits
module FD4 (input wire clock, reset, en, input wire [3:0]D, output reg[3:0]Q);
  wire Q0, Q1, Q2, Q3;
  assign Q0 = Q[0];
  assign Q1 = Q[1];
  assign Q0 = Q[2];
  assign Q1 = Q[3];
  FD1 N1(clock, reset, en, D[0], Q0);
  FD1 N2(clock, reset, en, D[1], Q1);
  FD1 N3(clock, reset, en, D[2], Q2);
  FD1 N4(clock, reset, en, D[3], Q3);
  endmodule
//flip flip 'timescale
module FFT (input wire clock, reset, en, output reg Q);
  FD1 N5(clock, reset, enable, ~Q, Q);
  endmodule
//flip flop JK
module FFJK (input wire J, K, clock, reset, en, output wire Q);
  wire D, AND1, AND2, NOTQ, NOTK;
  not U1(NOTQ,Q);
  not U2(NOTK,K);
  and U3(AND1,NOTK, Q);
  and U4(AND2, J, NOTQ);
  or  U5(D,AND1, AND2);s
  FD1 N7(clock, reset, en, D, Q);
  endmodule
//buffer triestado de 4 bits
module buffer (input wire [3:0]in, input wire enable, output wire [3:0]out);
  assign out = enable? in: 4'bz;
  endmodule
//modulo del microcode implementado con cases
module microcode (input wire [6:0]INPUT, output reg [12:0]OUTPUT);
  always @ (*)begin
  case(INPUT)
  7'bxxxxxx0: //0
  OUTPUT <= 13'b1000000001000;
  7'b00001x1://1
  OUTPUT <= 13'b0100000001000;
  7'b00000x1://2
  OUTPUT <= 13'b1000000001000;
  7'b00011x1://3
  OUTPUT <= 13'b1000000001000;
  7'b00010x1://4
  OUTPUT <= 13'b0100000001000;
  7'b0010xx1://5
  OUTPUT <= 13'b0001001000010;
  7'b0011xx1://6
  OUTPUT <= 13'b1001001100000;
  7'b0100xx1://7
  OUTPUT <= 13'b0011010000010;
  7'b0101xx1://8
  OUTPUT <= 13'b0011010000100;
  7'b0110xx1://9
  OUTPUT <= 13'b1011010100000;
  7'b0111xx1: //10
  OUTPUT <= 13'b1000000111000;
  7'b1000x11: //11
  OUTPUT <= 13'b0100000001000;
  7'b1000x01: //12
  OUTPUT <= 13'b1000000001000;
  7'b1001x11: //13
  OUTPUT <= 13'b1000000001000;
  7'b1001x01: //14
  OUTPUT <= 13'b0100000001000;
  7'b1010xx1: //15
  OUTPUT <= 13'b0011011000010;
  7'b1011xx1: //16
  OUTPUT <= 13'b1011011100000;
  7'b1100xx1: //17
  OUTPUT <= 13'b0100000001000;
  7'b1101xx1: //18
  OUTPUT <= 13'b0000000001001;
  7'b1110xx1: //19
  OUTPUT <= 13'b0011100000010;
  7'b1111xx1: //20
  OUTPUT <= 13'b1011100100000;
  default:
    OUTPUT <= 13'b0;
  endcase
  end
  endmodule
