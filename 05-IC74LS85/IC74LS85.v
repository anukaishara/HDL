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

        // In a cascaded configuration, at the first stage, where there is no previous stage,
        // the inputs in_agb, in_alb are set to 0 and in_aeb is set to 1.
        // Since in A == B state, the outputs will be set to the previous stage's outputs.
        // But the first stage actually has no inputs, so we set aeb to 1, agb and alb to 0.
        // This is the default state for the first stage to cascade without any incorrect outputs.
    end
end

endmodule
