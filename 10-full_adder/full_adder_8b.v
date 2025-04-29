// 8bit full adder

module full_adder_1b (
    input wire a,
    input wire b,
    input wire cin,
    output wire s,
    output wire cout

);

assign {cout, s} = a + b + cin; // Concatenation operator
// The sum is the least significant bit (LSB) and the carry out is the most significant bit (MSB)


endmodule