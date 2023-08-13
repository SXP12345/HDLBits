module top_module (input x, input y, output z);
    wire za1, zb1, za2, zb2;
    a IA1(
        .x(x),
        .y(y),
        .z(za1)
    );
    b IB1(
        .x(x),
        .y(y),
        .z(zb1)
    );
    a IA2(
        .x(x),
        .y(y),
        .z(za2)
    );
    b IB2(
        .x(x),
        .y(y),
        .z(zb2)
    );
    assign z = (za1 | zb1) ^ (za2 & zb2); 

endmodule


module a (
	input wire x,
    input wire y,
    output wire z
);
    assign z = (x^y) & x;
endmodule
 
module b (
	input wire x,
    input wire y,
    output wire z
);
    assign z = ~x^y;
endmodule
