module tb;
  int t1_trigger;
  int t2_trigger;
  event t1;
  event t2;
  
  task one();
    forever begin
    #20;
    $display("Task 1 Trigger");
    ->t1;
    end
  endtask
  
  task two();
    forever begin
    #40;
    $display("Task 2 Trigger");
    ->t2;
    end
  endtask
  
  initial begin
    t1_trigger = 0;
    t2_trigger = 0;
  end
  
  always @(t1) begin
    t1_trigger = t1_trigger + 1;
  end
  

  always @(t2) begin
    t2_trigger = t2_trigger + 1;
  end
  
  initial begin
    fork
      one();
      two();
    join
  end
  
  initial begin
    #200;
    $display("Task 1 triggered :%0d times", t1_trigger);
    $display("Task 2 triggered :%0d times", t2_trigger);
    $finish();
  end
endmodule
