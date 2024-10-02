module Adder_4bit(
    input[3:0] a,
    input[3:0] b,
    input c_in,
    output[3:0] sum,
    output c_out
);

wire[3:0] g;
wire[3:0] p;
wire[3:0] c;

assign g = a & b;
assign p = a ^ b;
assign c[0] = c_in;
assign c[1] = g[0] | (p[0] & c[0]);
assign c[2] = g[1] | (p[1] & (g[0] | (p[0] & c[0])));
assign c[3] = g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & c[0])))));


assign sum = p ^ c;
assign c_out = g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & c[0])))))));

endmodule


module Adder_16bit(
    input[15:0] a,
    input[15:0] b,
    input c_in,
    output[15:0] sum,
    output c_out
);

wire[3:0] carry;
assign carry[0] = c_in;

Adder_4bit adder0(
    .a(a[3:0]),
    .b(b[3:0]),
    .c_in(carry[0]),
    .sum(sum[3:0]),
    .c_out(carry[1])
);

Adder_4bit adder1(
    .a(a[7:4]),
    .b(b[7:4]),
    .c_in(carry[1]),
    .sum(sum[7:4]),
    .c_out(carry[2])
);

Adder_4bit adder2(
    .a(a[11:8]),
    .b(b[11:8]),
    .c_in(carry[2]),
    .sum(sum[11:8]),
    .c_out(carry[3])
);

Adder_4bit adder3(
    .a(a[15:12]),
    .b(b[15:12]),
    .c_in(carry[3]),
    .sum(sum[15:12]),
    .c_out(c_out)
);


endmodule

module Adder_32bit(
    input[31:0] a,
    input[31:0] b,
    input c_in,
    output[31:0] sum,
    output c_out
);

wire carry;

Adder_16bit adder0(
    .a(a[15:0]),
    .b(b[15:0]),
    .c_in(c_in),
    .sum(sum[15:0]),
    .c_out(carry)
);

Adder_16bit adder1(
    .a(a[31:16]),
    .b(b[31:16]),
    .c_in(carry),
    .sum(sum[31:16]),
    .c_out(c_out)
);

endmodule

module Add(
    input[31:0] a,
    input[31:0] b,
    output[31:0] sum,
    output carry
);

Adder_32bit adder(
    .a(a),
    .b(b),
    .c_in(1'b0),
    .sum(sum),
    .c_out(carry)
);


endmodule