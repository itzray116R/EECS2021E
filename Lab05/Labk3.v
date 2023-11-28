module labK;
reg a, b; // reg without size means 1-bit
wire notOutput, lowerInput, tmp, z;

not my_not(notOutput, b);
and my_and(z, a, lowerInput);
assign lowerInput = notOutput;

initial
begin
    #15 // wait for 15 time units
    a = 1; b = 1;
    #5 // wait for addititonal 5 units fro the values to propogate
    $display("a=%b b=%b z=%b", a, b, z);
    $finish;
end

endmodule