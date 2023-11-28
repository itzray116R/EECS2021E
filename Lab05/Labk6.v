module labK;
  reg a, b, c;
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
      a = 1;
      b = 0;
      c = 0;
      #25 // to produce results
      #1 
      $display("a=%b b=%b c=%b z=%b ", a, b, c, z);
      $finish;
    end
endmodule
