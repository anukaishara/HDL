    // RTL modelling


/*
module comp1b (
    input wire a,
    input wire b,
    output wire c 
);



wire x, y, p, q; // Internal wires
// Internal signals for the gates

assign x = ~a;
assign y = ~b; // Inverter
assign p = x & y; // AND gate
assign q = a & b; // AND gate
assign c = p | q; // OR gate

endmodule
*/


/*
module comp1b (
    input wire x,
    input wire y,
    output wire z 
);

assign z = (~x & ~y) | (x & y); // XOR gate
// XOR gate implementation using AND, OR, and NOT gates

endmodule
*/


// Gate level modelling

/*
module comp1b (
    input wire x,
    input wire y,
    output wire z 
);

// Gate-level implementation of (~x & ~y) | (x & y)
wire not_x, not_y;
wire and1_out, and2_out;

// NOT gates
not not1(not_x, x);
not not2(not_y, y);

// AND gates
and and1(and1_out, not_x, not_y);
and and2(and2_out, x, y);

// OR gate
or or1(z, and1_out, and2_out);

endmodule

*/