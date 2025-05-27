`timescale 1ns / 1ps
`include "fsm-moor.v"

module fsm_moor_tb;

    reg clk;
    reg reset;
    wire y;
    wire [2:0] state;
    wire [2:0] nextstate;

    divide_by3fsm uut (
        .clk(clk),
        .reset(reset),
        .y(y),
        .state(state),
        .nextstate(nextstate)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, fsm_moor_tb);
    end

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $display("Starting FSM Moore Testbench...");
        reset = 1;
        #12;
        reset = 0;
        #100;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | reset=%b | y=%b | state=%b | nextstate=%b", $time, reset, y, state, nextstate);
    end

endmodule
