module piporeg #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire reset,
    input wire load,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Clear register on reset
            data_out <= {WIDTH{1'b0}};
        end
        else if (load) begin
            // Load data_in into output register
            data_out <= data_in;
        end
    end

endmodule