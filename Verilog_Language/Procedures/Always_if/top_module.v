// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    
    wire sel_;
    assign sel_ = sel_b1 & sel_b2;
    assign out_assign = (sel_ == 1'b0)?a:b;
    
    wire [1:0] sel;
    assign sel = {sel_b1, sel_b2};
    always@(*) begin
        case(sel)
            2'b00: out_always = a;
            2'b01: out_always = a;
            2'b10: out_always = a;
            2'b11: out_always = b;
            default: out_always = 1'b0;
        endcase
    end

endmodule
