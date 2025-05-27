
module mux_2to1(
    input wire a,
    input wire b,
    input wire se,
    input wire en, // enable signal
    output wire y
);
    assign y = en ? (se ? a : b) : 1'bz;
    // Here ? means "if", so:
    // if en is high this part will run: (se ? a : b)
    // if en is low, the output will be high impedance (1'bz)

    // In the (se ? a : b) part:
    // if se is high, output a
    // if se is low, output b


endmodule
