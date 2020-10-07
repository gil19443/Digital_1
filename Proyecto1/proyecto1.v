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
//flip flop de 1 bit con reset asincrono
module FFD1 (input wire clock, reset, input wire D, output reg Q);
always @ (posedge clock or posedge reset) begin
  if (reset)begin
  Q <= 1'b0;
    end
  else begin
  Q <= D;
    end
    end
  endmodule
//fsm 4 para que la salida del vuelto tenga duracion
module FSM4 (input wire z2,clock, reset,input wire [2:0]V, output wire [2:0]VF);
wire S1_4, S0_4, S1F_4, S0F_4;
wire [1:0]S_4;
wire [1:0]SF_4;
assign S_4[1] = S1_4;
assign S_4[0] = S0_4;
assign SF_4[1] = S1F_4;
assign SF_4[0] = S0F_4;
assign S1F_4 = (S1_4 & ~S0_4 & ~z2) | (~S1_4 & ~ S0_4 & ~V[2] & V[1] & ~V[0]);
assign S0F_4 = (~S1_4 & S0_4 & ~z2) | (~S1_4 & ~ S0_4 & ~V[2] & ~V[1] & V[0]);
FFD2  M1 (clock, reset, SF_4, S_4);
assign VF[2] = 0;
assign VF[1] = S1_4 & ~S0_4;
assign VF[0] = ~S1_4 & S0_4;
endmodule
//fsm 3 para que al ingresar el producto, este espere a que enable sea 1 para borrarse e ingresar otro producto
module FSM3 (input wire EN, clock, reset, input wire [3:0]P, output wire [3:0]PF);
wire S2_3, S1_3, S0_3, S2F_3, S1F_3, S0F_3;
wire [2:0]S_3;
wire [2:0]SF_3;
assign  S_3[2] = S2_3;
assign  S_3[1] = S1_3;
assign  S_3[0] = S0_3;
assign  SF_3[2] = S2F_3;
assign  SF_3[1] = S1F_3;
assign  SF_3[0] = S0F_3;
assign  S2F_3 = (S2_3 & ~EN) | (~S2_3 & ~S1_3 & ~S0_3 & P[3] & ~P[2] & ~P[1] & ~P[0]);
assign  S1F_3 = (S1_3 & ~EN) | (~S2_3 & ~S1_3 & ~S0_3 & ~P[3] & P[2] & ~P[1] & ~P[0]) | (~S2_3 & ~S1_3 & ~S0_3 & ~P[3] & ~P[2] & P[1] & ~P[0]);
assign  S0F_3 = (S0_3 & ~EN) | (~S2_3 & ~S1_3 & ~S0_3 & ~P[3] & P[2] & ~P[1] & ~P[0]) | (~S2_3 & ~S1_3 & ~S0_3 & ~P[3] & P[2] & ~P[1] & P[0]);
FFD3  M2  (clock, reset,SF_3, S_3);
assign  PF[3] = (S2_3 & ~S1_3 & ~S0_3);
assign  PF[2] = (~S2_3 & S1_3 & S0_3);
assign  PF[1] = (~S2_3 & S1_3 & ~S0_3);
assign  PF[0] = (~S2_3 & ~S1_3 & S0_3);
endmodule
//fsm 2 maquina encargada de distribuir el producto que se selecciono luego de que se haya terminado de pagar y de hacer que dure activo cierto tiempo
module FSM2 (input wire EN, z_1, clock, reset, input wire [3:0]P, output wire [3:0]OUT);
wire S2_2, S1_2, S0_2, S2F_2, S1F_2, S0F_2;
wire [2:0]S_2;
wire [2:0]SF_2;
assign  S_2[2] = S2_2;
assign  S_2[1] = S1_2;
assign  S_2[0] = S0_2;
assign  SF_2[2] = S2F_2;
assign  SF_2[1] = S1F_2;
assign  SF_2[0] = S0F_2;
assign S2_2 = (S2_2 & ~S1_2 & ~S0_2 & ~z_1) | (~S2_2 & ~S1_2 & ~S0_2 & P[3] & ~P[2] & ~P[1] & ~P[0] & EN);
assign S1_2 = (~S2_2 & S1_2 & ~z_1) | (~S2_2 & ~S1_2 & ~S0_2 & ~P[3] & ~P[2] & P[1] & ~P[0] & EN) | (~S2_2 & ~S1_2 & ~S0_2 & ~P[3] & P[2] & ~P[1] & ~P[0] & EN);
assign S0_2 = (~S2_2 & S0_2 & ~z_1) | (~S2_2 & ~S1_2 & ~S0_2 & ~P[3] & ~P[2] & ~P[1] & P[0] & EN) | (~S2_2 & ~S1_2 & ~S0_2 & ~P[3] & P[2] & ~P[1] & ~P[0] & EN);
FFD3  M3 (clock, reset,SF_2, S_2);
assign  OUT[3] = (S2_2 & ~S1_2 & ~S0_2);
assign  OUT[2] = (~S2_2 & S1_2 & S0_2);
assign  OUT[1] = (~S2_2 & S1_2 & ~S0_2);
assign  OUT[0] = (~S2_2 & ~S1_2 & S0_2);
endmodule
//fsm debounce de un bit encargada de hacer que al ingresar el billete este solo genere el  pago 1 vez y luego se regrese a 0
module fsmdebounce  (input wire clock, reset, input wire V, output wire VF);
wire S_D, SN_D;
assign SN_D = (~S_D & V) | (S_D & V);
FFD1  M4(clock, reset, SN_D, S_D);
assign  VF = ~S_D & V;
endmodule
//fsm uniendo tres fsm debounce para controlar 3 push bottons
module fsmdinero (input wire clock, reset, input wire [2:0]D, output wire [2:0]DF);
fsmdebounce M5(clock, reset,D[2],DF[2]);
fsmdebounce M6(clock, reset,D[1],DF[1]);
fsmdebounce M7(clock, reset,D[0],DF[0]);
endmodule
//maquina encargada de verificar el pago y sacar el vuelto
module FSM1 (input wire clock, reset, input wire [3:0]PF, input wire [2:0]DF, output wire enable, output wire [2:0]V);
wire S3_1, S2_1, S1_1, S0_1, S3F_1, S2F_1, S1F_1, S0F_1;
wire [3:0]S_1;
wire [3:0]SF_1;
assign S_1[3] = S3_1;
assign S_1[2] = S2_1;
assign S_1[1] = S1_1;
assign S_1[0] = S0_1;
assign SF_1[3] = S3F_1;
assign SF_1[2] = S2F_1;
assign SF_1[1] = S1F_1;
assign SF_1[0] = S0F_1;
assign S3F_1 = (~S3_1 & ~S2_1 & S1_1 & DF[2] & ~DF[1] & ~DF[0]) | (~S3_1 & ~S2_1 & S0_1 & DF[2] & ~DF[1] & ~DF[0]) | (S2_1 & ~S1_1 & ~S0_1 & DF[2] & ~DF[1] & ~DF[0])
| (~S3_1 & ~S2_1 & ~S1_1 & S0_1 & ~DF[2] & ~DF[1] & DF[0]) | (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & ~DF[2] & DF[1] & ~DF[0]) | (~S3_1 & ~S2_1 & S1_1 & ~S0_1 & ~DF[2] & DF[1] & ~DF[0]);
assign S2F_1 = (S2_1 & S1_1 & ~DF[2] & ~DF[1]) | (S2_1 & S0_1 & ~DF[2] & ~DF[1]) | (S2_1 & S1_1 & ~DF[2] & ~DF[0]) | (S2_1 & ~DF[2] & ~DF[1] & ~DF[0])
| (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & ~PF[3] & PF[2] & ~PF[1] & ~PF[0]) | (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & PF[3] & ~PF[2] & ~PF[1] & ~PF[0]);
assign S1F_1 =  (S1_1 & S0_1 & ~DF[2] & ~DF[1]) | (S2_1 & S1_1 & ~DF[0] & ~DF[1]) | (S2_1 & ~S1_1 & ~DF[2] & DF[1] & ~DF[0]) | (~S3_1 & S1_1 & ~S0_1& ~DF[1] & ~DF[0])
| (S2_1 & ~S1_1 & ~S0_1 & ~DF[2] & ~DF[1] & DF[0]) | (~S3_1 & ~S2_1 & ~S1_1 & S0_1 & DF[2] & ~DF[1] & ~DF[0]) | (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & ~PF[3] & ~PF[2] & PF[1] & ~PF[0])
| (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & PF[3] & ~PF[2] & ~PF[1] & ~PF[0]);
assign S0F_1 = (~S3_1 & S0_1 & ~DF[2] & ~DF[0]) | (S2_1 & S0_1 & ~DF[1] & ~DF[0]) | (S1_1 & S0_1 & ~DF[0] & ~DF[1]) | (S2_1 & ~S0_1 & ~DF[2] & ~DF[1] & DF[0])
| (~S3_1 & S1_1 & ~S0_1 & ~DF[2] & ~DF[1] & ~DF[0]) | (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & ~PF[3] & ~PF[2] & ~PF[1] & PF[0])
| (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & ~PF[3] & ~PF[2] & PF[1] & ~PF[0]) | (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & ~PF[3] & PF[2] & ~PF[1] & ~PF[0])
| (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1 & PF[3] & ~PF[2] & ~PF[1] & ~PF[0]);
FFD4 M8 (clock, reset, SF_1, S_1);
assign enable = (~S3_1 & ~S2_1 & ~S1_1 & ~S0_1) | (S3_1 & ~S2_1 & ~S1_1 & S0_1) | (S3_1 & ~S2_1 & S1_1 & ~S0_1);
assign V[2] = 0;
assign V[1] = (S3_1 & ~S2_1 & S1_1 & ~S0_1);
assign V[0] = (S3_1 & ~S2_1 & ~S1_1 & S0_1);
endmodule
//modulo de timer
module timer (input wire clock, reset, input wire [3:0]OUT, output wire z_1, z2);
wire y;
reg [7:0]count;
assign y = OUT[3] | OUT[2] | OUT[1] | OUT[0];
assign z_1 = count[3] & count[1];
assign z2 = count[3] & count[1];
always @ (posedge clock) begin
  if(8'b00001010<count)begin
    count <= 8'b00000000;
    end
    else if (~y) begin
    count <= 8'b00000000;
    end
    else begin
    count <= count + 8'b0000001;
    end
    end
    endmodule
//fms uninendo todas las fms anteriores
module superfsm (input wire clock, reset, input wire [3:0]P, input wire [2:0]D, output wire [3:0]OUT, output wire [2:0]VF);
wire [3:0]PF;
wire en, z_1, z2;
wire [2:0]DF;
wire [2:0]V;
FSM3 M12 (en, clock, reset, P, PF);
FSM1 M10 (clock, reset, PF, DF, en, V);
fsmdinero M9 (clock, reset, D, DF);
FSM2 M11 (en, z_1, clock, reset, PF, OUT);
FSM4 M13 (z2, clock, reset, V, VF);
timer M14(clock, reset, OUT, z_1, z2);
endmodule
