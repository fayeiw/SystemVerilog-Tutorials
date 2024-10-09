function int multiplier_func (input int a, input int b);
  int c;
  c = a * b;
  return c;
endfunction

module tb;
  int n1;
  int n2;
  
  initial begin
    
    n1 = multiplier_func(50, 60);
  	n2 = 50 * 60;
  
    if (n1 == n2)
      begin
        $display("Test passed!");
      end
   else
     begin
        $display("Test failed!");
     end
     
  end
     
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
    
  
  
endmodule
