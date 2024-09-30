module Adder_4bit(
    input[3:0] a,
    input[3:0] b,
    input c_in,
    output[3:0] sum,
    output c_out
);

wire [3:0] g;
wire [3:0] p;
wire [3:0] c;

assign g = a & b;
assign p = a ^ b;
assign c[0] = c_in;
assign c[1] = g[0] | (p[0] & c[0]);
assign c[2] = g[1] | (p[1] & (g[0] | (p[0] & c[0])));
assign c[3] = g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & c[0])))));


assign sum = p ^ c;
assign c_out = g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & c[0])))))));

endmodule