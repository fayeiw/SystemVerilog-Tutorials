module tb;
  int arr1[20];
  int arr2[$];
  int i;
  
  initial begin
    
    for (i = 0; i < 20; i++)
      begin
        arr1[i] =$urandom();
      end
    
    for (i = 0; i < 20; i++)
      begin
        arr2.push_front(arr1[i]);
      end
   
  end
  
  initial begin
    
    #20;
    
    for (i = 0; i < 20; i++)
      begin
        $write("%d", arr1[i]);
      end
    
    $display(" ");
    
    for (i = 0; i < 20; i++)
      begin
        $write("%d", arr2[i]);
      end
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  endmodule
