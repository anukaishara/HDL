module sipo_reg #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire reset,
    input wire load,              // Shift enable
    input wire data_in,           // Serial data input (1 bit)
    output reg [WIDTH-1:0] data_out  // Parallel data output
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= {WIDTH{1'b0}};
        end
        else if (load) begin
            // Shift left and insert new serial bit at LSB
            data_out <= {data_out[WIDTH-2:0], data_in};
        end
    end

endmodule