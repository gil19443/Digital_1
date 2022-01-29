//memoria RAM de 4K*4 que se pueda leer y escribir
module RAM (input wire cs, wen, input wire [11:0]address, inout [3:0]data);
  reg [3:0]ram[0:4095];
  reg [3:0]data_out;
  //para sacar el output es necesario que el enable de escritura este en 0, el chipselect en 1 y el output en 1
  assign data = (cs &! wen)? data_out:4'bz;
  //ciclo always para escribir
  always @(address or data or cs or wen)begin;
    if (cs & wen) begin
        ram[address] = data;
        end
      end
  //ciclo para leer
  always @(address or cs)begin;
    if (cs &! wen) begin
      data_out = ram[address];
      end
      end
      endmodule
//toggle flip flop, que funciona como phase
module PHASE (input wire clock, reset, output reg Q);
  always @ (posedge clock or posedge reset) begin
    if (reset)begin
    Q <= 1'b0;
    end
    else begin
    Q <= ~Q;
    end
    end
  endmodule
//bufer tri estado de 4 bits
module BUS_DRIVER1 (input wire [3:0]in, input wire enable, output wire [3:0]out);
  assign out = enable? in: 4'bz;
  endmodule
//buffer tri estado para los inputs
module INPUTS  (input wire [3:0]in, input wire enable, output wire [3:0]out);
  assign out = enable? in: 4'bz;
  endmodule
//bufer tri estado de 4 bits
module BUS_DRIVER2 (input wire [3:0]in, input wire enable, output wire [3:0]out);
  assign out = enable? in: 4'bz;
  endmodule
//modulo del microcode implementado con cases
module DECODE (input wire [6:0]INPUT, output reg [12:0]OUTPUT);
    always @ (INPUT)begin
    casex(INPUT)
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
//modulo de contador con enable reset y clock, tiene la opcion de cargar el valor del load_1 al count al momento de activar el bit load o que load_1 tenga un cambio
module PC (input wire clock, reset, load, en, input wire [11:0]load_1, output reg [11:0]count);
  always @ (posedge clock or posedge reset) begin
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
    $readmemh("ROM_proyecto.list", array);
    end
    assign palabra = array[address];
    endmodule
//flip flop de 8 bits
module FETCH (input wire clock, reset, en, input wire [7:0]D, output reg [3:0]instr, operand);
  always @ (posedge clock or posedge reset) begin
    if (reset)begin
    {instr, operand} <= 8'b0;
    end
    else if (en) begin
    {instr, operand} <= D;
    end
    end
  endmodule
//flAGS
module FLAGS (input wire clock, reset, en, input wire [1:0]D, output reg [1:0]Q);
  always @ (posedge clock or posedge reset) begin
    if (reset)begin
    Q <= 2'b0;
    end
    else if (en) begin
    Q <= D;
    end
    end
  endmodule
//buffer triestado de 4 bits
module buffer (input wire [3:0]in, input wire enable, output wire [3:0]out);
  assign out = enable? in: 4'bz;
  endmodule
//acumulador, flip flop D de 4 bits
module ACCU (input wire clock, reset, en, input wire [3:0]D, output reg [3:0]Q);
  always @ (posedge clock or posedge reset or en) begin
    if (reset)begin
    Q <= 4'b0;
    end
    else if (en) begin
    Q <= D;
    end
    end
  endmodule
//outputs, flip flop D de 4 bits
module OUTPUTS (input wire clock, reset, en, input wire [3:0]D, output reg [3:0]Q);
  always @ (posedge clock or posedge reset) begin
    if (reset)begin
    Q <= 4'b0;
    end
    else if (en) begin
    Q <= D;
    end
    end
  endmodule
//alu implementada con cases
module ALU (input wire [3:0]A, B,input wire [2:0]s, output reg [3:0]OUT, output reg C,output wire Zero);
  assign Zero = (OUT == 4'b0)? 1'b1: 1'b0;
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
//MODULO FINAL
module uP (input wire clock, reset, input wire [3:0]pushbuttons, output wire phase, c_flag, z_flag, output wire [3:0]instr, oprnd, data_bus, FF_out, accu, output wire [7:0]program_byte, output wire [11:0]PC, address_RAM);
  wire incPC, loadPC, loadA, loadFlags, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut,c_bandera, z_bandera;
  wire [2:0]S;
  wire [3:0]out_ALU;
  assign address_RAM = {oprnd,program_byte};
  FETCH fetch(clock, reset, ~phase, program_byte, instr, oprnd);
  PC ProgramC(clock, reset, loadPC, incPC, address_RAM, PC);
  ROM rom(PC, program_byte);
  BUS_DRIVER1 B1(oprnd, oeOprnd,data_bus);
  FLAGS flags(clock, reset, loadFlags,{c_bandera, z_bandera},{c_flag, z_flag});
  PHASE phse(clock, reset, phase);
  DECODE decode({instr,c_flag, z_flag,phase}, {incPC, loadPC, loadA, loadFlags,S, csRAM, weRAM,oeALU,oeIN, oeOprnd, loadOut});
  RAM ram(csRAM, weRAM,address_RAM, data_bus);
  ACCU accumulador (clock, reset,loadA,out_ALU, accu);
  ALU alu(accu, data_bus, S, out_ALU, c_bandera, z_bandera);
  BUS_DRIVER2 B2(out_ALU,oeALU, data_bus);
  INPUTS IN(pushbuttons, oeIN, data_bus);
  OUTPUTS OUT(clock, reset, loadOut, data_bus, FF_out);
  endmodule
