`timescale 1ns / 1ps
`include "button.v"

module button_tb;

    reg clk;
    reg reset;
    reg button;

    wire led;


    button uut (
        .clk(clk),
        .reset(reset),
        .button(button),
        
        .led(led)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, button_tb);
    end

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        reset = 0; button = 0; #12;
        button = 1; #10;
        button = 0; #10;
        button = 1; #10;

        reset = 1; #10; // Reset the FSM
        reset = 0; #10; // Release reset    
        button = 0; #10; // Ensure button is released
        button = 1; #8; // Press the button

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | reset=%b | clk=%b | led=%b", $time, reset, clk, led);
    end

endmodule