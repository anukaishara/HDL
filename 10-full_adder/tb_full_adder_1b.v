`timescale 1ns/1ps
`include "full_adder_1b.v"

module tb();

    // Inputs
    reg a;
    reg b;
    reg cin;


    // Output
    wire s;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder_1b uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)

    );

    initial begin
        $dumpfile("full_adder_1b_dump.vcd");
        $dumpvars(0, tb);

        // Test cases
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | a=%b b=%b cin=%b | s=%b cout=%b ", 
                 $time, a, b, cin, s, cout);
    end

endmodule
