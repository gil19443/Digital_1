//flip flop de 3 bits con reset asincrono
module FFD3 (input wire clock, reset, input wire [2:0]D, output reg [2:0]Q);
always @ (posedge clock, posedge reset) begin
  if (reset) begin
    Q <= 3'b0;
    end
  else begin
    Q <= D;
    end
    end
endmodule
//flip flop de 4 bits con reset asincrono
module FFD4 (input wire clock, reset, input wire [3:0]D, output reg [3:0]Q);
always @ (posedge clock, posedge reset) begin
  if (reset) begin
    Q <= 4'b0;
    end
  else begin
    Q <= D;
    end
    end
endmodule
//flip flio de 2 bits con reset asincrono
module FFD2 (input wire clock, reset, input wire [1:0]D, output reg [1:0]Q);
always @ (posedge clock or posedge reset) begin
  if (reset)begin
  Q <= 2'b0;
    end
  else begin
  Q <= D;
    end
    end
  endmodule
//fsm 4 para que la salida del vuelto tenga duracion
module FSM4 (input wire z2,clock, reset,input wire [2:0]V, output wire [2:0]VF);
wire S1_4, S0_4, S1F_4, S0F_4;
assign S1F_4 = (S1_4 & ~S0_4 & ~z2) | (~S1_4 & ~ S0_4 & ~V[2] & V[1] & ~V[0]);
assign S0F_4 = (~S1_4 & S0_4 & ~z2) | (~S1_4 & ~ S0_4 & ~V[2] & ~V[1] & V[0]);
FFD2  M1 (clock, reset, S1F_4, S0F_4,S1_4, S0_4);
assign VF[2] = 0;
assign VF[1] = S1_4 & ~S0_4;
assign VF[0] = ~S1_4 & S0_4;
endmodule
//fsm 3 para que al ingresar el producto, este espere a que enable sea 1 para borrarse e ingresar otro producto
module FSM3 (input wire EN, clock, reset, input wire [3:0]P, output wire [3:0]PF);
wire S2_3, S1_3, S0_3, S2F_3, S1F_3, S0F_3;
assign  S2F_3 = (S2_3 & ~EN) | (~S2_3 & ~S1_3 & ~S0_3 & P[3] & ~P[2] & ~P[1] & ~P[0]);
assign  S1F_3 = (S1_3 & ~EN) | (~S2_3 & ~S1_3 & ~S0_3 & ~P[3] & P[2] & ~P[1] & ~P[0]) | (~S2_3 & ~S1_3 & ~S0_3 & ~P[3] & ~P[2] & P[1] & ~P[0]);
assign  S0F_3 = (S0_3 & ~EN) | (~S2_3 & ~S1_3 & ~S0_3 & ~P[3] & P[2] & ~P[1] & ~P[0]) | (~S2_3 & ~S1_3 & ~S0_3 & ~P[3] & P[2] & ~P[1] & P[0]);
FFD3  M2  (clock, reset, S2F_3, S1F_3, S0F_3,S2_3, S1_3, S0_3);
assign  PF[3] = (S2_3 & ~S1_3 & ~S0_3);
assign  PF[2] = (~S2_3 & S1_3 & S0_3);
assign  PF[1] = (~S2_3 & S1_3 & ~S0_3);
assign  PF[0] = (~S2_3 & ~S1_3 & S0_3);
endmodule
//fsm 2 maquina encargada de distribuir el producto que se selecciono luego de que se haya terminado de pagar y de hacer que dure activo cierto tiempo
module FSM2 (input wire EN, z_1, clock, reset, input wire [3:0]P, output wire [3:0]OUT);
wire S2_2, S1_2, S0_2, S2F_2, S1F_2, S0F_2;
assign S2_2 = (S2_2 & ~S1_2 & ~S0_2 & ~z_1) | (~S2_2 & ~S1_2 & ~S0_2 & P[3] & ~P[2] & ~P[1] & ~P[0] & EN);
assign S1_2 = (~S2_2 & S1_2 & ~z_1) | (~S2_2 & ~S1_2 & ~S0_2 & ~P[3] & ~P[2] & P[1] & ~P[0] & EN) | (~S2_2 & ~S1_2 & ~S0_2 & ~P[3] & P[2] & ~P[1] & ~P[0] & EN);
assign S0_2 = (~S2_2 & S0_2 & ~z_1) | (~S2_2 & ~S1_2 & ~S0_2 & ~P[3] & ~P[2] & ~P[1] & P[0] & EN) | (~S2_2 & ~S1_2 & ~S0_2 & ~P[3] & P[2] & ~P[1] & ~P[0] & EN);
FFD3  M3 (clock, reset, S2F_2, S1F_2, S0F_2, S2_2, S1_2, S0_2);
assign  OUT[3] = (S2_2 & ~S1_2 & ~S0_2);
assign  OUT[2] = (~S2_2 & S1_2 & S0_2);
assign  OUT[1] = (~S2_2 & S1_2 & ~S0_2);
assign  OUT[0] = (~S2_2 & ~S1_2 & S0_2);
endmodule
//fsm debounce encargada de hacer que al ingresar el billete este solo genere el  pago 1 vez y luego se regrese a 0
