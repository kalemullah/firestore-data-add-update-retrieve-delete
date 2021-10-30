module tst_Dec_4x16;
	
	reg A, B, C, D, En; 
   	wire [15:0] O;
   	
   	Dec_4x16 dec1 (A, B, C, D, En, O);
   	
   	initial begin
   		#0 En = 0;
   		#5 En = 1;
   		#5 {A, B, C, D} = 4'd0;
   		#5 {A, B, C, D} = 4'd1;
   		#5 {A, B, C, D} = 4'd8;
   		#5 {A, B, C, D} = 4'd9;   		
   	end
   	
   	initial
   		$monitor ($time, "  Output = %b", O);
   	
endmodule
