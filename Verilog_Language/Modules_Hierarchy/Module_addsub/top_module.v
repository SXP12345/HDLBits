module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [15:0] a_lower;
    wire [31:16] a_higher;
    assign a_lower = a[15:0];
    assign a_higher = a[31:16];
    
    wire [15:0] b_lower;
    wire [31:16] b_higher;
    wire [31:0] b_xor;
    assign b_xor = b^{32{sub}};
    assign b_lower = b_xor[15:0];
    assign b_higher = b_xor[31:16];
    
    wire link;
    
    wire [15:0] sum_lower;
    wire [31:16] sum_higher;
    assign sum = {sum_higher, sum_lower};
    
    add16 add16_lower(
        .a(a_lower),
        .b(b_lower),
        .cin(sub),
        .cout(link),
        .sum(sum_lower)
    );
    
    add16 add16_higher(
        .a(a_higher),
        .b(b_higher),
        .cin(link),
        .sum(sum_higher)
    );

endmodule
