module labK;
reg [31:0] x; // a 32-bit register
initial
begin
$display($time, " %d", x);
x = 0;
$display($time, " %d", x);
x = x + 2;
$display($time, " %d", x);
$finish;
end
endmodule
