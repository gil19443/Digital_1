`include "contador.v"
module testbench();
reg clock, reset,EN,load;
reg [11:0]load_1;
wire [11:0]count;
contador E1 (clock, reset, load, EN, load_1, count);
always
  #1 clock <=~clock;

  initial begin
  #1
  $display("            contador         ");
  $display("clk en load   load_1 | count ");
  $display("-------------------|-------------");
  $monitor("%b %b %b %b | %b " ,clock,EN,load,load_1,count);
  end
  initial begin
    reset = 0; clock = 0;
  #1 reset = 1;
  #1 reset = 0;
  #3 EN = 0; load = 0; load_1[12] = 0; load_1[11] = 0; load_1[10] = 0; load_1[9] = 0; load_1[8] = 0; load_1[7] = 0; load_1[6] = 0; load_1[5] = 0; load_1[4] = 0; load_1[3] = 0; load_1[2] = 0;load_1[1] = 0;load_1[0] = 0;
  #3 EN = 0; load = 0;
  #3 EN = 0; load = 0;
  #1 EN = 1; load = 1; load_1[12] = 1; load_1[5]  = 1;
  #1 EN = 1; load = 1; load_1[12] = 0; load_1[5]  = 0;
  #1 EN = 1; load = 1; load_1[10] = 1; load_1[7]  = 1;
  #3 EN = 1; load = 0;
  #3 EN = 1; load = 0;
  #3 EN = 1; load = 0;
  #3 EN = 1; load = 0;
  #3 EN = 1; load = 0;
  #3 EN = 0; load = 0;
  #3 EN = 0; load = 0;
  #3 EN = 0; load = 0;
  #3 EN = 0; load = 0;
  end

  initial
    #50 $finish;
  initial begin
      $dumpfile("contador.vcd");
      $dumpvars(0, testbench);
    end
  endmodule
