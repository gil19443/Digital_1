//flip flop D con reset asincrono y set sincrono
module FFD5 (input wire clock, reset, set, input wire [3:0]D, output reg [3:0]Q);
always @ (posedge clock, posedge reset, posedge set) begin
  if (reset) begin
    Q <= 4'b0;
    end
  else if (set) begin
    Q <= 4'b1111;
    end
  else
    Q <= D;
    end
endmodule

//flip flop D de 2 entradas, para ejercicio 1
module FD1 (input wire clock, reset, input wire D, output reg Q);
always @ (posedge clock or posedge reset) begin
  if (reset)begin
  Q <= 1'b0;
  end
  else begin
  Q <= D;
  end
  end
  endmodule

// modulo EJERCICIO 1
module FINALEJ1 (input wire A, B, clock, reset, output wire Y);
wire  S1F, S0F, S1, S0;
assign S1F = (S0 & B) | (S1 & A & B);
assign S0F = ~S1 & ~S0 & A;
assign Y = S1 & A & B;
FD1 E2(clock, reset, S1F, S1);
FD1 E3(clock, reset, S0F, S0);
endmodule

//modulo EJERCICIO 3
module FINALEJ3 (input wire P, clock, reset, output wire Y2,Y1,Y0);
wire  S2, S1, S0, S2F, S1F, S0F;
assign S2F = (~S2 & S1 & S0 & P) | (~S2 & ~S1 & ~S0 & ~P) | (S2 & ~S1 & S0) | (S2 & ~S0 & P) | (S2 & S1 & ~P);
assign S1F = (~S1 & S0 & P) |  (S1 & ~S0 & P) | (S1 & S0 & ~P) |  (~S1 & ~S0 & ~P);
assign S0F = ~S0;

FD1 E5(clock, reset, S2F, S2);
FD1 E6(clock, reset, S1F, S1);
FD1 E7(clock, reset, S0F, S0);

assign Y2 = S2;
assign Y1 = ~S2 & S1 | S2 & ~S1;
assign Y0 = ~S1 & S0 | ~S0 & S1;

endmodule
