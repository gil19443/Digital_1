//buffer triestado de 4 bits
module buffer (input wire [3:0]in, input wire enable, output wire [3:0]out);
  assign out = enable? in: 4'bz;
  endmodule
//acumulador, flip flop D de 4 bits
module FFD4 (input wire clock, reset, en, input wire [3:0]D, output reg [3:0]Q);
  always @ (posedge clock or posedge reset or en) begin
    if (reset)begin
    Q <= 8'b0;
    end
    else if (en) begin
    Q <= D;
    end
    end
  endmodule
//alu implementada con cases
module ALU (input wire [3:0]A, B,input wire [2:0]s, output reg [3:0]OUT, output reg C,output wire Zero);
  assign Zero = ({C,OUT} == 5'b0)? 1'b1: 1'b0;
  always @ (*)begin
  case(s)
  3'b000:
  {C,OUT} <= A;
  3'b001:
  {C,OUT} <= A-B;
  3'b010:
  {C,OUT} <= B;
  3'b011:
  {C,OUT} <= A + B;
  3'b100:
  {C,OUT} <= ~({1'b1,A} & {1'b1,B});
  default:
  {C,OUT} <= 5'b0;
  endcase
  end
  endmodule
//modulo concatenando todos los modulos anteriores
module ejercicio2 (input wire clock, reset, enF, enb1, enb2, input wire [3:0]buffer1,input wire [2:0]s, output wire [3:0]buffer2, output wire carry, zero);
  wire [3:0]B, A, OUT;
  buffer b1(buffer1, enb1,B);
  FFD4  accu(clock, reset, enF, OUT, A);
  ALU ALU(A, B,s, OUT, carry, zero);
  buffer b2(OUT, enb2, buffer2);
  endmodule
