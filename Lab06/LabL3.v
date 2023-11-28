module LabL3;

reg [31:0] a, b,expect;  // Change size to 32
reg c;
wire [31:0] z;    // Change size to 32
integer i, j, k;

yMux #(32) M(.z(z), .a(a), .b(b), .c(c));  // Change instantiation to yMux

// initial begin
//     for (i = 0; i < 4; i = i + 1) begin
//         for (j = 0; j < 4; j = j + 1) begin
//             for (k = 0; k < 2; k = k + 1) begin
//                 a = i;
//                 b = j;
//                 c = k;

//                 #10;
//                 $display("Test Case: a=%d, b=%d, c=%d, z=>d", a, b, c, z);
//             end
//         end
//     end

//     $finish; // Finish simulation
// end
 // exhaustive testing
    initial begin
        repeat (100)
        begin
            a = $random;
            b = $random;
            c = $random % 2;
            for (i = 0; i < 32; i = i + 1) // need a for loop to calculate each bit of expect properly. credit to RayM
            begin
                expect[i] = ((a[i] & ~c) + (b[i] & c)); // boolean logic representation of the circuit
            end
            #1; // wait for z - propagation delay

            // oracle
            // $display("EXPECT: expect=%b", expect);
            if (expect === z)
                $display("PASS: a=%d b=%d c=%d z=%d", a, b, c, z);
            else
                $display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
        end
    $finish;
    end

endmodule
