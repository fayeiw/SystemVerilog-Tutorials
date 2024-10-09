class first;
  int data1 = 45;
  int data2 = 78;
  int data3 = 90;
endclass

module tbl;
  first f1;
  
  initial begin
    f1 = new();
    $display("The value of data1 is %d", f1.data1);
    $display("The value of data2 is %d", f1.data2);
    $display("The value of data3 is %d", f1.data3);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
