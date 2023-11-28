module labK;
 reg a, b, c,flag,oracle;
 wire notOutput, lowerInput, orInput1, orInput2, r, s, z;

 not my_not (notOutput, c);
 assign lowerInput = notOutput;

 and my_and1 (r, a, lowerInput);
 assign orInput1 = r;

 and my_and2 (s, c, b);
 assign orInput2 = s;

 or my_or (z, orInput1, orInput2);

// // Oracle logic
// reg oracle;
//  always @(a, b, c) begin
//     if (a == 1 && b == 0 && c == 0)
//       oracle = 1;
//     else
//       oracle = 0;
//  end
///////////////////
//without bit wise approach using if and ? itenary
  // Without bitwise approach using if and ternary operator
  always @(a, b, c) begin
    // If the condition is true, oracle equals 1, otherwise 0.
    oracle = (a == 1 && b == 0 && c == 0) ? 1 : 0;
  end

  initial begin
    #15
    flag = $value$plusargs("a=%b", a);
    if (flag == 0) $display("Error +a not specified");
    flag = $value$plusargs("b=%b", b);
    if (flag == 0) $display("Error +b not specified");
    flag = $value$plusargs("c=%b", c);
    if (flag == 0) $display("Error +c not specified");
    #25 // to produce results
    #1 $display("a=%b b=%b c=%b z=%b oracle=%b", a, b, c, z, oracle);
    if (z == oracle)
      $display("PASS");
    else
      $display("FAIL");
    $finish;
  end
endmodule

 