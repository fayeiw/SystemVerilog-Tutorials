module tb;
  reg arr1[15];
  reg arr2[15];
  int i;
  
  initial begin
    for (i = 0; i < 15; i++)
      begin
        arr1[i] = $urandom();
        arr2[i] = $urandom();
      end
    
    for (i = 0; i < 15; i++)
      begin
        $write("%d ",arr1[i]);
      end
    
    $display(" ");
    
    for (i = 0; i < 15; i++)
      begin
        $write("%d ",arr2[i]);
      end
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
