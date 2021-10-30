module tst_fsm_moore;
reg x, rst, clk;
wire z;
fsm_two1s_moore2 fsm (.IN(x), .R(rst), .CK(clk), .OUT(z));
initial begin
clk = 0;
x = 0;
#10 x = 1;
#20 x = 0;
#20 x = 1;
#20 x = 1;
#20 x = 1;
#20 x = 0;
end
initial begin
rst = 1;
#10 rst = 0;
end
always
#10 clk = ~clk;

endmodule