`timescale 1ns / 1ps // Time unit is 1 ns, time precision is 1 ps   
`include "mynotgate.v" // Include the design file
// Testbench for mynotgate module

module tb();
    // Inputs
    reg a; 

    // Outputs
    wire nota; 

    // Instantiate the Unit Under Test (UUT)
    mynotgate uut (
        .a(x), 
        .nota(y)
    );

    initial begin
        // Initialize Inputs
        x = 0;

        $dumpfile ("dump.vcd"); // Create a VCD file for waveform viewing
        $dumpvars (0, tb); // Dump all variables in the testbench
        
        // Add stimulus here
        #10 x = 1; // Apply input 1 after 10 time units
        #10 x = 0; // Apply input 0 after another 10 time units 
        #10 x = 1; // Apply input 1 again after another 10 time units
        #10 x = 0; // Apply input 0 again after another 10 time units

    end

    initial begin
        // Monitor the output
        $monitor("a = %b, nota = %b", x, y);
    end

endmodule

        