//modulo de contador con enable reset y clock, tiene la opcion de cargar el valor del load_1 al count al momento de activar el bit load o que load_1 tenga un cambio
module contador (input wire clock, reset, load, en, input wire [11:0]load_1, output reg [11:0]count);
  always @ (posedge clock or posedge reset or load or load_1) begin
      if (reset) begin
      count <= 12'b000000000000;
      end
      else if (load) begin
      count <= load_1;
      end
      else if (en) begin
      count <= count + 12'b000000000001;
      end
      end
      endmodule
//arreglo de memoria de 4kx8bits a la cual cargue los valores ingresados en ROM.list
module ROM (input wire[11:0]address, output wire [7:0]palabra);
  reg [7:0] array [0:4095];
    initial begin
    $readmemh("ROM.list", array);
    end
    assign palabra = array[address];
    endmodule
//ALU de 4 bits implementada con cases
module ALU (input wire [3:0]A, B, input wire [2:0]S, output reg [3:0]resultado);
  always @ (*) begin
    case(S)
    0:
    resultado <= A & B;
    1:
    resultado <= A | B;
    2:
    resultado <= A + B;
    3:
    resultado <= 4'b0;
    4:
    resultado <= A & ~B;
    5:
    resultado <= A | ~B;
    6:
    resultado <= A - B;
    7:
    resultado <= (A < B) ? 4'b1111: 4'b0;
    default:
    resultado <= 4'b0;
    endcase
    end
    endmodule
