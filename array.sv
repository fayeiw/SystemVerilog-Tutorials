module tb;
  
  bit[2:0] arr[5];
  int i;
  
  initial begin
    for (i = 0; i<5; i++)
      begin
        arr[i] = i;
      end
    
    for (i = 0; i < 5; i++)
      begin
        $display("A value in the array 'arr' is %d", arr[i]);
      end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  
endmodule
