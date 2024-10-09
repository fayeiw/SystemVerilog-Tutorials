module tb;
  reg clk;
  bit en;
  bit wr;
  bit [5:0] addr;
  
  // Initialize clock
  initial begin
    clk = 0;
  end
  
  // Clock generation
  always begin
    #25;
    clk = ~clk;
  end
  
  // Task call to generate random signals
  initial begin
    forever begin
      gen(en, wr, addr);
    end
  end
  
  
  initial begin
    #500;
    $finish();
  end
  
  // Dump waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule

// Task definition
task gen(output bit en, output bit wr, output bit [5:0] addr);
    #25;
    if (!randomize(en)) $error("Failed to randomize en");
    if (!randomize(wr)) $error("Failed to randomize wr");
    if (!randomize(addr)) $error("Failed to randomize addr");
Endtask
