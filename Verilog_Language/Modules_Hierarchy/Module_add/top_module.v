module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire [31:16] a_upper;
    wire [15:0] a_lower;
    wire [31:16] b_upper;
    wire [15:0] b_lower;
    wire [31:16] sum_upper;
    wire [15:0] sum_lower;
    wire cin;
    
    assign a_upper = a[31:16];
    assign a_lower = a[15:0];
    assign b_upper = b[31:16];
    assign b_lower = b[15:0];
    
    add16 add16_lower(
        .a(a_lower),
        .b(b_lower),
        .cin(1'b0),
        .sum(sum_lower),
        .cout(cin)
    );
    
     add16 add16_upper(
         .a(a_upper),
         .b(b_upper),
         .cin(cin),
         .sum(sum_upper)
    ); 
    
    assign sum = {sum_upper, sum_lower};

endmodule
