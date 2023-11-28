module labK;
reg [31:0] x, y, z;
//add another intial #15 x = x + 1;	
initial

begin
	//#10 is the delay for the commands
	#10 x = 5;
	//$display("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);
	#10 y = x + 1;
	//$display("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);
	#10 z = y + 1;
	//$display("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);
	#1 $finish;
end

// initial
// begin
// #7 x = x + 1;
// #7 x = x + 1;
// #7 x = x + 1;
// #7 x = x + 1;
// end
/*
initial					//intial						
begin					//begin
	repeat (4)			//for (int i = 0; i<4;i++)
		#7 x = x + 1;	//	#7 x = x + 1;
end						//end
*/
always
	#7 x = x + 1;
initial
	$monitor("%2d: x=%1d y=%1d z=%1d", $time, x, y, z);

endmodule
