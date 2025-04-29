module d_flipflop(
    input wire d, 
    input wire en,
    input wire clk, // Clock input
    input wire rst, // Reset input

    output reg q

);

always @ (posedge clk or posedge rst) begin // Sensitivity list
    if (rst) begin
        q <= 0; // If enable is high, output follows input
    end

    else if (en) begin
        q <= d; // If enable is high, output follows input
        
        
        /* 
        
        <= - Non-blocking assignment operator, used for sequential logic
         = - Blocking assignment operator

         example:

         Let's say x = 3, y = 7

            x = y; // x will be 7
            z = x; // z will be 7

        But if we use non-blocking assignment operator

            x <= y; // x will be 7
            z <= x; // z will be 3

         */
         
    end

    else begin
        q <= q; // If enable is low, output holds its value
    end 

end

endmodule