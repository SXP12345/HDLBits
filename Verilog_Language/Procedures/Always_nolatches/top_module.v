// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output left,
    output down,
    output right,
    output up  ); 
    
    reg [3:0] sign;
    always@(*) begin
        case(scancode)
            16'he06b: sign = 4'b1000;
            16'he072: sign = 4'b0100;
            16'he074: sign = 4'b0010;
            16'he075: sign = 4'b0001;
            default: sign = 4'b0000;
        endcase
    end
    
    assign left = sign[3];
    assign down = sign[2];
    assign right = sign[1];
    assign up = sign[0];

endmodule
