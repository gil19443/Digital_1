//flip flop de 8 bits
module FFD8 (input wire clock, reset, en, input wire [7:0]D, output reg [3:0]instr, operand);
  always @ (posedge clock or posedge reset or en) begin
    if (reset)begin
    {instr, operand} <= 8'b0;
    end
    else if (en) begin
    {instr, operand} <= D;
    end
    end
  endmodule
//contador de 12 bits, con enable, enable de load y load de 12 bits
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
//memoria ROM de 4kx8bits
module ROM (input wire[11:0]address, output wire [7:0]palabra);
  reg [7:0] array [0:4095];
    initial begin
    $readmemh("ROM.list", array);
    end
    assign palabra = array[address];
    endmodule
//modulo final, concatenando todo
module ejercicio1 (input wire clock, reset, enF, enP, load, input wire [11:0]load_1, output wire [7:0]progbyte, output wire[3:0]instr, operand);
  wire [11:0]counter;
  FFD8 FTCH(clock, reset, enF, progbyte, instr, operand);
  contador COUNT(clock, reset, load, enP, load_1, counter);
  ROM ROM(counter, progbyte);
  endmodule 
