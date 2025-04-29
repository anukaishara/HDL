module full_adder_Nb #(parameter N = 4) 
(
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire [N-1:0] s,
    output wire cout
);

assign {cout, s} = a + b + cin; // Concatenation operator
// The sum is the least significant bit (LSB) and the carry out is the most significant bit (MSB)

endmodule