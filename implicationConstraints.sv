class first;
  rand bit[3:0] addr;
  rand bit wr;
  
  constraint data {
    (wr == 0) <-> (addr inside {[0:7]});
    (wr == 1) <-> (addr inside {[8:15]});
  }
endclass


module tb;
  first f1;
  int i;
  
  initial begin
    f1 = new();
  end
  
  initial begin
    for(i = 0; i < 20; i++)
      begin
        #10
        f1.randomize();
        #20;
      end
  end
  
  always
    begin
      #5
      $display("The values are %0d, %0d",f1.wr, f1.addr);
    end
  
  initial begin
    #500;
    $finish();
  end
  
endmodule
