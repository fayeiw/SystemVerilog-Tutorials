class generator;
  
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction
 
  function generator copy();
    copy = new();
    copy.a = a;
    copy.b = b;
    copy.wr = wr;
    copy.en = en;
    copy.s = s;
    return copy;
  endfunction
  
endclass

module tb;
  generator g1;
  generator g2;
  
  initial begin
    g1 = new();
    g1.s = 14;
    g1.a = 8;
    g1.wr = 0;
    g2 = g1.copy();
  end
  
  initial begin
    #25;
    $display("The values of g1 are: %0d, %0d, %0d, %0d, %0d", g1.a, g1.b, g1.wr, g1.en, g1.s);
    $display("The values of g2 are: %0d, %0d, %0d, %0d, %0d", g2.a, g2.b, g2.wr, g2.en, g2.s);
  end
  
endmodule

