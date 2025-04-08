// Start Module
// Module represent a circuit
module firstmodule();

// Initial block
// (Procedural block)
// Circuit that runs once at the power on
initial begin
    // Can not be synthesized
    // Output to console, file, ..
    $display("Hello, World!");  // Display message to console
    $finish;   // Indicate end of simulation
end
endmodule // End Module