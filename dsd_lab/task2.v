module Dec_4x16 (A, B, C, D, En, O);

   	input A, B, C, D, En; //Assume A is MSB and D is LSB
   	output [15:0] O;
   	//Place your code here
   	
   	reg [15:0] O;
   	always @ (A or B or C or D or En)
   		if (~En)
   			O = 16'b0;
   		else
   			case ({A, B, C, D})
   				0: O = 16'h0001;
   				1: O = 16'h0002;
   				2: O = 16'h0004;
   				3: O = 16'h0008;
   				4: O = 16'h0010;
   				5: O = 16'h0020;
   				6: O = 16'h0040;
   				7: O = 16'h0080;
   				8: O = 16'h0100;
   				9: O = 16'h0200;
   				10: O = 16'h0400;
   				11: O = 16'h0800;
   				12: O = 16'h1000;
   				13: O = 16'h2000;
   				14: O = 16'h4000;
   				15: O = 16'h8000;
   			endcase
   			
endmodule
