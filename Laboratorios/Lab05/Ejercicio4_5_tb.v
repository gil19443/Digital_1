`include "ejercicio4_5.v"

module testbench();
  reg p1, p2, p3;
  wire led1, led2, led3, led4, led5, led6, GND, VCC;
  assign GND = 0;
  assign VCC = 1;

  Tabla1MUX2_1  M1(p1,p2,p3,led1);
  Tabla1MUX4_1  M2(p1,p2,p3,led2);
  Tabla1MUX8_1  M3(p1,p2,p3,GND, VCC,led3);
  Tabla2MUX2_1  M4(p1,p2,p3,led4);
  Tabla2MUX4_1  M5(p1,p2,p3,GND, led5);
  Tabla2MUX8_1  M6(p1,p2,p3,GND, VCC,led6);

initial begin
#1
$display("\n");
$display(" T1MUX2:1 ");
$display("A B C | Y ");
$display("------|---");
$monitor("%b %b %b | %b ", p1,p2,p3,led1);
   p1 = 0; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
#1 p1 = 1; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
end

initial begin
#10
$display("\n");
$display(" T1MUX4:1 ");
$display("A B C | Y ");
$display("------|---");
$monitor("%b %b %b | %b ", p1,p2,p3,led2);
   p1 = 0; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
#1 p1 = 1; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
end

initial begin
#19
$display("\n");
$display(" T1MUX8:1 ");
$display("A B C | Y ");
$display("------|---");
$monitor("%b %b %b | %b ", p1,p2,p3,led3);
   p1 = 0; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
#1 p1 = 1; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
end

initial begin
#28
$display("\n");
$display(" T2MUX2:1 ");
$display("A B C | Y ");
$display("------|---");
$monitor("%b %b %b | %b ", p1,p2,p3,led4);
   p1 = 0; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
#1 p1 = 1; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
end

initial begin
#37
$display("\n");
$display(" T2MUX4:1 ");
$display("A B C | Y ");
$display("------|---");
$monitor("%b %b %b | %b ", p1,p2,p3,led5);
   p1 = 0; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
#1 p1 = 1; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
end

initial begin
#46
$display("\n");
$display(" T2MUX8:1 ");
$display("A B C | Y ");
$display("------|---");
$monitor("%b %b %b | %b ", p1,p2,p3,led6);
   p1 = 0; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
#1 p1 = 1; p2 = 0; p3 = 0;
#1 p3 = 1;
#1 p2 = 1; p3 = 0;
#1 p3 = 1;
end
initial
  #55 $finish;

initial begin
  $dumpfile("ejercicio4_5_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
