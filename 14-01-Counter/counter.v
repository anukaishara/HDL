module counter #(
    parameter WIDTH = 8   // Number of bits in the counter
)(
    input wire clk,
    input wire reset,     // Synchronous reset
    input wire enable,    // Enable counting
    output reg [WIDTH-1:0] count
);

    always @(posedge clk) begin
        if (reset) begin
            count <= {WIDTH{1'b0}};
        end
        else if (enable) begin
            count <= count + 1;
        end
    end

endmodule