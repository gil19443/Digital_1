`include "ejercicio4.v"

module testbench();
  reg p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17;
  wire led1, led2, led3, led4, led5, led6, led7, led8, led9, led10, led11;

  ejercicio1_1 E1(p1, p2, p3, led1);
  ejercicio1_2 E2(p2,led2);
  ejercicio1_3 E3(p4, p5, p6, p7, led3);
  ejercicio1_4 E4(p4, p5, p6, p7, led4);
  ejercicio2_1 E5(p8, p9, p10, p11, led5);
  ejercicio2_3 E6(p8, p9, p10, p11, led6);
  ejercicio2_2 E7(p13, p14, led7);
  ejercicio2_4 E8(p12, p13, p14, led8);
  ejercicio5_POS  E9(p15, p16, p17, led9);
  ejercicio5_SOP  E10(p15, p16, p17, led10);
  ejercicio5_kmap E11(p15, p16, p17, led11);

  initial begin
    #1
    $display("Tabla 1.1-1.2");
    $display("A B C | Y1 Y2");
    $display("------|------");
    $monitor("%b %b %b | %b  %b", p1, p2, p3, led1, led2);
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
      $display(" Tabla 1.3-1.4 ");
      $display("A B C D | Y1 Y2");
      $display("--------|------");
      $monitor("%b %b %b %b | %b  %b", p4, p5, p6, p7, led3, led4);
         p4 = 0; p5 = 0; p6 = 0; p7 = 0;
      #1 p7 = 1;
      #1 p6 = 1; p7 = 0;
      #1 p7 = 1;
      #1 p5 = 1; p6 = 0; p7 = 0;
      #1 p7 = 1;
      #1 p6 = 1; p7 = 0;
      #1 p7 = 1;
      #1 p4 = 1; p5 = 0; p6 = 0; p7 = 0;
      #1 p7 = 1;
      #1 p6 = 1; p7 = 0;
      #1 p7 = 1;
      #1 p5 = 1; p6 = 0; p7 = 0;
      #1 p7 = 1;
      #1 p6 = 1; p7 = 0;
      #1 p7 = 1;
    end


  initial begin
      #26
      $display("\n");
      $display(" Tabla 2.1-2.3");
      $display("A B C D | Y1 Y2");
      $display("--------|------");
      $monitor("%b %b %b %b | %b  %b", p8, p9, p10, p11, led5, led6);
         p8 = 0; p9 = 0; p10 = 0; p11 = 0;
      #1 p11 = 1;
      #1 p10 = 1; p11 = 0;
      #1 p11 = 1;
      #1 p9 = 1; p10 = 0; p11 = 0;
      #1 p11 = 1;
      #1 p10 = 1; p11 = 0;
      #1 p11 = 1;
      #1 p8 = 1; p9 = 0; p10 = 0; p11 = 0;
      #1 p11 = 1;
      #1 p10 = 1; p11 = 0;
      #1 p11 = 1;
      #1 p9 = 1; p10 = 0; p11 = 0;
      #1 p11 = 1;
      #1 p10 = 1; p11 = 0;
      #1 p11 = 1;
    end



  initial begin
      #42
      $display("\n");
      $display("Tabla 2.2-2.4");
      $display("A B C | Y1 Y2");
      $display("------|------");
      $monitor("%b %b %b | %b  %b", p12, p13, p14, led7, led8);
         p12 = 0; p13 = 0; p14 = 0;
      #1 p14 = 1;
      #1 p13 = 1; p14 = 0;
      #1 p14 = 1;
      #1 p12 = 1; p13 = 0; p14 = 0;
      #1 p14 = 1;
      #1 p13 = 1; p14 = 0;
      #1 p14 = 1;
    end

    initial begin
        #50
        $display("\n");
        $display("Tabla 5.P-5.S-5.K");
        $display("A B C | Y1 Y2 Y3 ");
        $display("------|----------");
        $monitor("%b %b %b | %b  %b  %b", p15, p16, p17, led9, led10, led11);
           p15 = 0; p16 = 0; p17 = 0;
        #1 p17 = 1;
        #1 p16 = 1; p17 = 0;
        #1 p17 = 1;
        #1 p15 = 1; p16 = 0; p17 = 0;
        #1 p17 = 1;
        #1 p16 = 1; p17 = 0;
        #1 p17 = 1;
      end
  initial
    #58 $finish;

  initial begin
    $dumpfile("ejercicio4_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
