class transaction;
 
bit [7:0] addr = 7'h12;
bit [3:0] data = 4'h4;
bit we = 1'b1;
bit rst = 1'b0;
 
endclass


class generator;
  transaction trans;
  mailbox #(transaction) mbx;
  //event done;
  
  function new(input mailbox #(transaction) mbx);
    trans = new();
    this.mbx = mbx;
  endfunction
  
  task run();
    mbx.put(trans);
    $display("Data has been sent");
  endtask
endclass


class driver;
  transaction trans;
  mailbox #(transaction) mbx;
  event done;
  
  function new(input mailbox #(transaction) mbx);
    trans = new();
    this.mbx = mbx;
  endfunction
  
  task run();
    //wait(done.triggered);
    mbx.get(trans);
    $display("Data has been received");
  endtask
  
endclass

module tb;
  mailbox #(transaction) mbx;
  driver drv;
  generator gen;
  
  initial begin
    mbx = new();
    drv = new(mbx);
    gen = new(mbx);
  end
  
  initial begin
    fork
      gen.run();
      drv.run();
    join   
  end
  
  initial begin
    
    $display("The contents of the received data are: %0d, %0d", drv.trans.addr, drv.trans.data);
  end
endmodule
