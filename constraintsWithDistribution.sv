class first;
  rand bit wr;
  rand bit rst;
  
  constraint data {
    wr dist {0:=3, 1:=7};
    rst dist {0:=5, 1:=5};
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
        f1.randomize();
        #20;
      end
  end
  
  always
    begin
      
      $display("The values are %0d, %0d",f1.wr, f1.rst);
    end
  
  initial begin
    #500;
    $finish();
  end
  
endmodule

