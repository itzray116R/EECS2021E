// LabL1.v

module LabL1;

  reg a, b, c;
  wire z;

  yMux1 uut (.z(z),.a(a),.b(b),.c(c));
  initial begin
    a = 1;
    b = 0;
    c = 0;
    #10; 
    $display("Test 1: a=%b, b=%b, c=%b, z=%b", a, b, c, z);

    a = 0;
    b = 1;
    c = 1;
    #10;
    $display("Test 2: a=%b, b=%b, c=%b, z=%b", a, b, c, z);
    #1
    $finish;
  end

endmodule
