module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] a_lower;
    wire [31:16] a_higher;
    assign a_lower = a[15:0];
    assign a_higher = a[31:16];
    
    wire [15:0] b_lower;
    wire [31:16] b_higher;
    assign b_lower = b[15:0];
    assign b_higher = b[31:16];
    
    wire [15:0] sum_lower;
    wire [31:16] sum_higher;
    assign sum = {sum_higher, sum_lower};
    
    wire sel;
    
    add16 add16_lower(
        .a(a_lower),
        .b(b_lower),
        .cin(1'b0),
        .cout(sel),
        .sum(sum_lower)
    );
    
    wire [15:0] sum_higher_0;
    wire [15:0] sum_higher_1;
    add16 add16_higher_0(
        .a(a_higher),
        .b(b_higher),
        .cin(1'b0),
        .sum(sum_higher_0)
    );
    add16 add16_higher_1(
        .a(a_higher),
        .b(b_higher),
        .cin(1'b1),
        .sum(sum_higher_1)
    );
    
    always@(*) begin
        case(sel)
            1'b0: sum_higher = sum_higher_0;
            1'b1: sum_higher = sum_higher_1;
            default: sum_higher = sum_higher_0;
        endcase
    end

endmodule
