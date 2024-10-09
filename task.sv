class first;
  bit[4:0] a;
  bit[4:0] b;
  bit[4:0] c;
  
  function new(input bit[4:0]a, input bit[4:0]b, input bit[4:0]c);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
  task add(output bit[5:0] d);
    d = a + b + c;
    $display("The sum is %0d", d);
  endtask
  
endclass
