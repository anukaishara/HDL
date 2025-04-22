
module mux_2to1(
    input wire a,
    input wire b,
    input wire se,
    output wire y
);
    assign y = (se) ? a : b;

endmodule