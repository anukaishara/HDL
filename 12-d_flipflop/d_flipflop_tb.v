// This is the testbench for the D flip-flop module

`include "d_flipflop.v"
`timescale 1ns / 1ps

module tb_d_flipflop;

    // Inputs
    reg d;
    reg en;
    reg clk;
    reg rst;

    // Output
    wire q;

    // Instantiate the Unit Under Test (UUT)
    d_flipflop uut (
        .d(d),
        .en(en),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_d_flipflop);
    end

    initial begin
        // Clock generation
        clk <=0;
        forever begin
            #5 clk <= ~clk; // Toggle clock every 5 time units
        end
    end

    
    initial begin

        // Initialize inputs
        d = 0;
        en = 0;
        rst = 0;

        // Test cases
        #3 en = 1; d = 1;
        #15 d = 0;
        #5 en = 0;
        #5 d = 1;
        #5 d = 0;
        #5 en = 1;
        #5 d = 1;
        #10 rst = 1;
        #10 rst = 0; 
        #10 en = 0; 
        #10 d = 0;
        #10 en = 1;
        #7 $finish;

    end

    initial begin
        // Monitor the output
        $monitor("Time=%0t | d=%b en=%b clk=%b rst=%b | q=%b", 
                 $time, d, en, clk, rst, q);
    end

endmodule