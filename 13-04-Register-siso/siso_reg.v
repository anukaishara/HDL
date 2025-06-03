module siso_reg #(
    parameter N = 8
)(
    input wire clk,
    input wire reset,
    input wire load,             // If high, load data_in into shift register
    input wire data_in,          // Serial input
    output reg data_out          // Serial output (MSB)
);

    reg [N-1:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 0;
            data_out <= 0;
        end else begin
            if (load) begin
                shift_reg <= {shift_reg[N-2:0], data_in}; // Shift left, insert LSB
                data_out <= shift_reg[N-1];              // Output MSB (before shift)
            end
        end
    end

endmodule