`timescale 1ns/1ps

module testbench;
    reg [3:0] a;
    reg [3:0] b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;

    // 实例化被测试的模块
    Adder_4bit uut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );

    initial begin
        // 初始化输入
        a = 4'b0000;
        b = 4'b0000;
        c_in = 1'b0;

        // 监视信号变化
        $monitor("a = %b, b = %b, c_in = %b, sum = %b, c_out = %b", a, b, c_in, sum, c_out);

        // 应用测试向量
        #10 a = 4'b0101; b = 4'b0011; c_in = 1'b0;
        #10 a = 4'b1100; b = 4'b1010; c_in = 1'b1;
        #10 a = 4'b1111; b = 4'b1111; c_in = 1'b1;
        #10 $finish;
    end
endmodule