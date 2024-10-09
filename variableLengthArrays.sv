module tb;
  
  int arr[];
  int i;
  int j;
  int k;
  
  initial begin
    arr = new[7];
    for (i = 0; i < 7; i++)
      begin
        arr[i] = 7 * (i + 1);
      end
    
    #20;
    
    arr = new[20](arr);
    
    for (j = 0; j < 13; j++)
      begin
        arr[j + 7] = 5 * (j + 1);
      end
    
    for (k = 0; k < 20; k++)
      begin
        $write("%d", arr[k]);
      end
  end
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
