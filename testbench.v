`timescale 1ns/1ps

module testbench;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] sum;
    wire carry;

    // 实例化被测试的模块
    Add uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // 初始化输入
        a = 32'd0;
        b = 32'd0;

        // 监视信号变化
        $monitor("a = %d, b = %d, sum = %d, carry = %b", a, b, sum, carry);

        // 应用测试向量
        #10 a = 32'd15; b = 32'd10;
        #10 a = 32'd123456789; b = 32'd987654321;
        #10 a = 32'd4294967295; b = 32'd1; // 最大32位无符号整数加1
        #10 $finish;
    end
endmodule