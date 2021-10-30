module fsm_two1s_mealy2 (x, rst, clk, z);
input x, rst, clk;
output z; reg z;
parameter zero = 0, one1 = 1, two1s = 2;
reg [1:0] PS, NS;
always @ (posedge clk, rst)
if (rst)
PS &lt;= zero;
else
PS &lt;= NS;
always @ (PS or x)
case (PS)
zero: begin
z = x? 0:0;
NS = x? one1:zero;
end
one1: begin
z = x? 1:0;
NS = x? two1s:zero;
end
two1s: begin
z = x? 0:0;
NS = x? one1:zero;
end
default: begin
z = 0;
NS = zero;
end
endcase

endmodule
