
module fpgaio (
    input wire clk,
    input wire reset,
    output reg redled1
);

reg [31:0] clockbitz = 32'd0;

always @(posedge clk) begin
    if (reset) begin
        redled1 <= 1'b0;
        clockbitz <= 32'd0;
    end

    else begin
        clockbitz <= clockbitz + 32'd1;

        if (clockbitz == 32'd50000000) begin
            redled1 <= ~redled1;
            clockbitz <= 32'd0;
        end
        
    end

end

endmodule