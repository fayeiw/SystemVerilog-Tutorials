class generator;
  randc bit[7:0] a;
  randc bit[7:0] b;
  randc bit[7:0] c;
  
  constraint data_a {a>0; a<50;}
  constraint data_b {b>0; b<50;}
  constraint data_c {c>0; c<50;}
endclass

module tb;
  generator gen;
  int i;
  
  initial begin
    gen = new();
  end
  
  initial begin
    for (i = 0; i < 20; i++)
      begin
        gen.randomize;
        #20;
      end
  end
  
  always
    begin
      #25;
      $display("The values of gen are %0d, %0d, %0d", gen.a, gen.b, gen.c);
    end
  
  initial begin
    #500;
    $finish();
  end
  
endmodule
