module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    
    wire [15:0] a_lower;
    wire [31:15] a_upper;
    assign a_lower = a[15:0];
    assign a_upper = a[31:16];
    
    wire [15:0] b_lower;
    wire [31:16] b_upper;
    assign b_lower = b[15:0];
    assign b_upper = b[31:16];
    
    wire [15:0] sum_lower;
    wire [31:16] sum_upper;
    assign sum = {sum_upper, sum_lower};
    
    wire cin;
    
    add16 add16_lower(
        .a(a_lower),
        .b(b_lower),
        .cin(1'b0),
        .cout(cin),
        .sum(sum_lower)
    );
    
    add16 add16_upper(
        .a(a_upper),
        .b(b_upper),
        .cin(cin),
        .sum(sum_upper)
    );

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign {cout, sum} = a + b + cin;

endmodule
