`timescale 1ns / 1ps
`include "mux.v" // Make sure this points to your mux_3b_4to1 module file

module tb();

    // Inputs
    reg [2:0] a;
    reg [2:0] b;
    reg [2:0] c;
    reg [2:0] d;
    reg [1:0] se;
    reg en;

    // Output
    wire [2:0] y;

    // Instantiate the Unit Under Test (UUT)
    mux_3b_4to1 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .se(se),
        .en(en),
        .y(y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Test cases
        a = 3'b000; b = 3'b001; c = 3'b010; d = 3'b011;

        en = 1; se = 2'b00; #10;
        se = 2'b01; #10;
        se = 2'b10; #10;
        se = 2'b11; #10;

        en = 0; se = 2'b10; #10; // Output should be high impedance

        $finish;
    end

    initial begin
        $monitor("Time=%0t | en=%b se=%b | a=%b b=%b c=%b d=%b | y=%b", 
                 $time, en, se, a, b, c, d, y);
                 // here the | is used to separate the different signals in the output
                 // There is no any meaning of | in this context, it is just a separator
                 // you can use any other character or string like a comma, a space to separate the signals
    end

endmodule
