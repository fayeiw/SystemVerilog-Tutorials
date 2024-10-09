module tb;
  reg[7:0] a;
  reg[7:0] b;
  reg[7:0] c;
  reg[7:0] d;
  
  function display_values();
    $display("The value of a is %d, b is %d, c is %d, while d is %d.", a, b, c, d);
  endfunction
  
  
  initial begin
    a = 12;
    b = 34;
    c = 67;
    d = 255;
  end
  
  initial begin
    #12;
    display_values();
  end
  
  initial begin
    #20;
    $finish();
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  
endmodule
