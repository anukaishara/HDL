// Description: D Flip-Flop 1 Bit

/* 
1. Reset Signal

If the reset signal is active on the positive edge (i.e., asynchronous or synchronous positive-edge reset), 
then on the rising edge of the reset signal, the output is immediately set to 0, 
regardless of the input or clock

After the reset is asserted (output is 0), the output will hold this value until the reset signal goes low 
(i.e., reset is de-asserted)

This is typical for an asynchronous reset. 
For a synchronous reset, the output would only reset to 0 on the clock edge if reset is high at that moment.


2. Enable Signal

When the reset is not active (reset is low), the output will follow the input value (D) only 
when the enable signal is high and on the positive edge of the clock

If enable is low, the output holds its previous value, regardless of the input or clock

3. Clock Signal

The D flip-flop is edge-triggered (usually positive edge). 
The output changes only on the rising edge of the clock, provided that enable is high and reset is not active
*/


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
        
         
    end

end

endmodule

        
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