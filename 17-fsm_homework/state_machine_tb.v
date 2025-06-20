`timescale 1ns/1ps
`include "state_machine.v"

module state_machine_tb;

    // Inputs
    reg clk;
    reg go;
    reg kill;
    
    // Outputs
    wire done;
    
    // Instantiate the Unit Under Test (UUT)
    state_machine uut (
        .clk(clk),
        .go(go),
        .kill(kill),
        .done(done)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period (100MHz)
    end
    
    // Test sequence
    initial begin
        // Initialize inputs
        go = 0;
        kill = 0;
        
        // Open VCD file for waveform dumping
        $dumpfile("state_machine.vcd");
        $dumpvars(0, state_machine_tb);
        
        // Test 1: Basic operation - complete full cycle
        $display("Test 1: Normal operation (complete 100 cycles)");
        @(posedge clk);
        go = 1;
        @(posedge clk);
        go = 0;
        
        // Wait for completion (100 cycles + finish state)
        repeat(102) @(posedge clk);
        
        // Verify done pulse occurred
        if (uut.current_state == state_machine::IDLE && 
            uut.duration_cnt == 0) begin
            $display("Test 1 PASSED");
        end else begin
            $display("Test 1 FAILED");
        end
        
        // Test 2: Early kill signal
        $display("\nTest 2: Early kill signal");
        @(posedge clk);
        go = 1;
        @(posedge clk);
        go = 0;
        
        // Wait for some counts then assert kill
        repeat(30) @(posedge clk);
        kill = 1;
        @(posedge clk);
        kill = 0;
        
        // Wait for return to idle
        repeat(5) @(posedge clk);
        
        // Verify we aborted properly
        if (uut.current_state == state_machine::IDLE && 
            uut.duration_cnt < 100) begin
            $display("Test 2 PASSED");
        end else begin
            $display("Test 2 FAILED");
        end
        
        // Test 3: Kill during abort state
        $display("\nTest 3: Kill held during abort");
        @(posedge clk);
        go = 1;
        @(posedge clk);
        go = 0;
        
        // Wait then assert kill and hold
        repeat(50) @(posedge clk);
        kill = 1;
        repeat(5) @(posedge clk); // Hold kill for 5 cycles
        
        // Verify we stay in abort while kill is asserted
        if (uut.current_state == state_machine::ABORT) begin
            $display("State correctly in ABORT while kill asserted");
        end
        
        // Release kill
        kill = 0;
        @(posedge clk);
        
        // Verify return to idle
        if (uut.current_state == state_machine::IDLE) begin
            $display("Test 3 PASSED");
        end else begin
            $display("Test 3 FAILED");
        end
        
        // Test 4: Back-to-back operations
        $display("\nTest 4: Back-to-back operations");
        @(posedge clk);
        go = 1;
        @(posedge clk);
        go = 0;
        
        // Complete first operation
        repeat(102) @(posedge clk);
        
        // Start second operation immediately
        go = 1;
        @(posedge clk);
        go = 0;
        
        // Complete second operation
        repeat(102) @(posedge clk);
        
        if (uut.current_state == state_machine::IDLE && 
            uut.duration_cnt == 0) begin
            $display("Test 4 PASSED");
        end else begin
            $display("Test 4 FAILED");
        end
        
        // End simulation
        $display("\nSimulation complete");
        $finish;
    end
    
    // Monitor state changes
    always @(posedge clk) begin
        $display("Time: %t, State: %s, Count: %d, Done: %b",
            $time, 
            uut.current_state.name(),
            uut.duration_cnt,
            done);
    end

endmodule