module top_module ( input clk, input d, output q );
    wire vector[3:0];
    assign vector[0] = d;
    assign q = vector[3];
    genvar i;
    generate
        for(i=0; i<3; i=i+1) begin: my_dff
            my_dff my_dff_u ( .clk(clk), .d(vector[i]), .q(vector[i+1]) );
        end
    endgenerate
    
endmodule
