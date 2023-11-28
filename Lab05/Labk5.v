module labK;
reg a, b, expect;
wire z;
integer i, j;
not my_not(tmp, b);
and my_and(z, a, tmp);
initial
begin

    for (i = 0; i < 2; i = i + 1)
    begin
        for (j = 0; j < 2; j = j + 1)
        begin
            a = i; b = j;
            expect = i & ~b;
            #1; // wait for z
            if (expect === z)
                $display("PASS: a=%b b=%b z=%b", a, b, z);
            else
                $display("FAIL: a=%b b=%b z=%b", a, b, z);

        end
    end
    $finish;
end
endmodule
// PASS: a=0 b=0 z=0
// PASS: a=0 b=1 z=0
// PASS: a=1 b=0 z=1
// PASS: a=1 b=1 z=0
//it passed the automated testing