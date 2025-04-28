module IC74LS85(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire in_agb,
    input wire in_alb,
    input wire in_aeb,
    output reg out_agb,
    output reg out_alb,
    output reg out_aeb
);

always @(*) begin
    if (A > B) begin
        out_agb = 1'b1;
        out_alb = 1'b0;
        out_aeb = 1'b0;
    end
    
    else if (A < B) begin
        out_agb = 1'b0;
        out_alb = 1'b1;
        out_aeb = 1'b0;
    end

    else begin // A == B
        out_agb = in_agb;
        out_alb = in_alb;
        out_aeb = in_aeb;
    end
end

endmodule
