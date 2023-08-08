module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] vector [3:0];
    
    genvar i;
    generate
        for(i=0; i<3; i=i+1) begin: my_dff8_u
            my_dff8 my_dff8_u ( .clk(clk), .d(vector[i]), .q(vector[i+1]) );
        end
    endgenerate
    
    assign vector[0] = d;
    
    always@(*) begin
        case(sel)
            2'b00: q = vector[0];
            2'b01: q = vector[1];
            2'b10: q = vector[2];
            2'b11: q = vector[3];
            default: q = vector[3];
        endcase
    end

endmodule
