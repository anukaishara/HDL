    // RTL modelling

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




// RTL modelling another way

module comp1b (
    input wire x,
    input wire y,
    output wire z 
);

assign z = (~x & ~y) | (x & y);

endmodule





// Gate level modelling


module comp1b (
    input wire x,
    input wire y,
    output wire z 
);

// Gate-level implementation of (~x & ~y) | (x & y)
wire nx, ny;
wire nxandny, xandy;

// NOT gates
not NG1(nx, x); // Gate_category Gate_name(output, input)
not NG2(ny, y);

// AND gates
and AND1(nxandny, nx, ny);
and AND2(xandy, x, y);

// OR gate
or OR1(z, nxandny, xandy);

endmodule



// Behavioural modelling

module comp1b (
    input wire x,
    input wire y,
    output reg z 
);


always @(*) 

    begin
        if (x == y) begin 
            z = 1;
        end
        else begin
            z = 0;
        end
    end

endmodule