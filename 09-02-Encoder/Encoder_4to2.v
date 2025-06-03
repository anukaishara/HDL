module encoder4to2 (
    input wire [3:0] din,  // 4 input lines
    output reg [1:0] y,    // 2-bit output
    output reg valid       // High if any input is 1
);

always @(*) begin
    valid = 1'b1;
    case (din)  // use casez to allow for don't-cares
        4'b1???: y = 2'b11;  // input 3
        4'b01??: y = 2'b10;  // input 2
        4'b001?: y = 2'b01;  // input 1
        4'b0001: y = 2'b00;  // input 0
        default: begin
            y = 2'b00;
            valid = 1'b0;    // No input is high
        end
    endcase
end

endmodule

