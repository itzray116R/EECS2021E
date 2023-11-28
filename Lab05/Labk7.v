module labK;
  reg a, b, c,flag;
  wire notOutput, lowerInput, orInput1, orInput2, r, s, z;

  not my_not (notOutput, c);
  assign lowerInput = notOutput;

  and my_and1 (r, a, lowerInput);
  assign orInput1 = r;

  and my_and2 (s, c, b);
  assign orInput2 = s;

  or my_or (z, orInput1, orInput2);

  initial
    begin
      #15
        flag = $value$plusargs("a=%b", a);
        if(flag == 0) $display("Error +a not specified");
        flag = $value$plusargs("b=%b", b);
        if(flag == 0) $display("Error +b not specified");
        flag = $value$plusargs("c=%b", c);
        if(flag == 0) $display("Error +c not specified");
      #25 // to produce results
      #1 $display("a=%b b=%b c=%b z=%b ", a, b, c, z);
      $finish;
    end
endmodule

//if +a=1 is not specified the output is
// ===>> a=x b=0 c=0 z=x
