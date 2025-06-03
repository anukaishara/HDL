module piso_reg #(
    parameter WIDTH = 8
)(
    input wire clk,
    input wire reset,
    input wire load,               // When high, load parallel data
    input wire [WIDTH-1:0] data_in, // Parallel input
    output reg data_out            // Serial output (MSB-first)
);

    reg [WIDTH-1:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= {WIDTH{1'b0}};
            data_out <= 1'b0;
        end
        else if (load) begin
            // Load parallel data into shift register
            shift_reg <= data_in;
            data_out <= data_in[WIDTH-1]; // Output MSB immediately
        end
        else begin
            // Shift left and output MSB
            shift_reg <= {shift_reg[WIDTH-2:0], 1'b0};
            data_out <= shift_reg[WIDTH-1];
        end
    end

endmodule
