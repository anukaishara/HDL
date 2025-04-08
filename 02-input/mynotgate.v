// RTL modelling

module mynotgate (
    input wire a,
    output wire nota
);

assign nota = ~a; // Inverter

endmodule