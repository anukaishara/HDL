`timescale 1ns/1ps
`include "full_adder_Nb.v"

module tb();

    parameter N = 16; // Number of bits
    // Inputs
    reg [N-1:0] a;
    reg [N-1:0] b;
    reg cin;


    // Output
    wire [N-1:0] s;
    wire cout;

    integer i, j;

    // Instantiate the Unit Under Test (UUT)
    full_adder_Nb #(.N(N)) uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)

    );

    initial begin
        $dumpfile("full_adder_Nb_dump.vcd");
        $dumpvars(0, tb);

        // Test cases


        $finish;
    end

    initial begin
        $monitor("Time=%0t | a=%b b=%b cin=%b | s=%b cout=%b ", 
                 $time, a, b, cin, s, cout);
    end

endmodule
