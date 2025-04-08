// Gate Level Model

module bus_signals (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire c,
    output wire [3:0] p,
);

wire nc;
wire ao1, ao2, ao3, ao4, ao5, ao6, ao7, ao8;

not NG1 (nc, c);   

and AND1 (ao1, a[0], nc);
and AND2 (ao3, a[1], nc);
and AND3 (ao5, a[2], nc);
and AND4 (ao7, a[3], nc);

and AND5 (ao2, b[0], c);
and AND6 (ao4, b[1], c);
and AND7 (ao6, b[2], c);
and AND8 (ao8, b[3], c);

or OR1 (p[0], ao1, ao2);
or OR2 (p[1], ao3, ao4);
or OR3 (p[2], ao5, ao6);
or OR4 (p[3], ao7, ao8);


endmodule


// RTL Model    

module cct (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire c,
    output wire [3:0] p,
);

// Normal Method


assign p[0] = (a[0] & ~c) | (b[0] & c);
assign p[1] = (a[1] & ~c) | (b[1] & c);
assign p[2] = (a[2] & ~c) | (b[2] & c);
assign p[3] = (a[3] & ~c) | (b[3] & c);


// Replication Method (Bus Signals)

assign cbus = {4{c}};

assign p = (a & ~cbus) | (b & cbus);

endmodule

