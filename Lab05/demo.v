module labK;
reg a,b,Cin,flag; //1-bit inputs
wire z,r,s,t,orInput1,orInput2,xorAndIn,Cout,c; // add variable 'c'

//for first xor gate
xor my_xor1(r,b,a);

//assigning for the input from xor gate 1
//r is input for second xor and second and gate
assign xorAndIn = r;

//for second xor gate
xor my_xor2(z,xorAndIn,orInput1,orInput2); // correct the instantiation

//first AND gate input from XOR gate
and my_and1(t,xorAndIn,Cin);

//assign orInput1 = t
assign orInput1 = t;

//2nd AND gate
and my_and2(s,b,a);

//assigning the input value of the orinput2
assign orInput2 = s;

or my_or(Cout,orInput1,orInput2);

initial begin
    #15
    flag = $value$plusargs("a=%b", a);
    if (flag == 0) $display("Error +a not specified");
    flag = $value$plusargs("b=%b", b);
    if (flag == 0) $display("Error +b not specified");
    flag = $value$plusargs("Cin=%b", Cin);
    if (flag == 0) $display("Error +Cin not specified");
    #25 // to produce results
    #1 $display("a=%d b=%d Cin=%d z=%d Cout=%d ", a, b, Cin, z,Cout);
 end
endmodule

