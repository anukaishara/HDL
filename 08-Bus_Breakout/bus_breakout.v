module busbreakout(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [5:0] p
);

assign p = {a[1:0], a[2] & b[0], a[3] & b[1], b[3:2]};

endmodule
