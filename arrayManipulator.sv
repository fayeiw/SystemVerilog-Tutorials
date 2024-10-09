function int gen (input int x);
  int a;
  a = 8 * x;
  return a;
endfunction

module tb;
  int arr[32];
  int i;
  
  initial begin
    for (i = 0; i < 32; i++)
      begin
        arr[i] = gen(i);
      end
  end
  
  initial begin
    #20;
     for (i = 0; i < 32; i++)
      begin
        $write("%d", arr[i]);
      end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
