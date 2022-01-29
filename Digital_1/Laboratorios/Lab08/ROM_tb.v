`include "contador.v"
module testbench();
reg [11:0]address;
wire [7:0]palabra;
ROM E1 (address, palabra);

  initial begin
  #1
  $display(" MEMORIA ROM");
  $display("    ADRESS   |   PALABRA  ");
  $display("-------------|------------");
  $monitor("%b | %b " ,address, palabra);
  end
  initial begin
  address = 12'b000000000000;
#3 address = 12'b000000000001;
#3 address = 12'b000001010101;
#3 address = 12'b000001010110;
#3 address = 12'b000001010111;
#3 address = 12'b000001011000;
#3 address = 12'b000010001000;
#3 address = 12'b000010001001;
#3 address = 12'b000010001010;
#3 address = 12'b000010001011;
  end

  initial
    #50 $finish;
  initial begin
      $dumpfile("ROM_tb.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
