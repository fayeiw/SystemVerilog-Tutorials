module tb;
  
  reg clk;
 
   
  task clkgen(input real period, input real duty_cycle);
    begin
      // Generate the clock signal
      forever begin
        clk = 0;
        #(period * (1-duty_cycle));
        clk = 1;
        #(period * duty_cycle);
      end
    end
  endtask
    
    
  initial begin
    clk = 0;
  end
    
  initial begin
    clkgen(100, 0.8);
  end
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
    
  initial begin
    #500;
    $finish;
  end
    
  
endmodule
