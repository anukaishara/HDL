
module mux_2to1(
    input wire a,
    input wire b,
    input wire se,
    input wire en, // enable signal
    output wire y
);
    assign y = en ? (se ? a : b) : 1'bz;


endmodule
