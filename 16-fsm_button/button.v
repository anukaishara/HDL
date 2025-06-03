module button
(
    input wire reset,
    input wire clk,
    input wire button,

    output reg led

);

parameter LED_ON = 1'b1;
parameter LED_OFF = 1'b0;

reg status;
parameter STATE_LEDON = 1'b1;
parameter STATE_LEDOFF = 1'b0;

parameter BTN_PRESSED = 1'b1;
parameter BTN_RELEASED = 1'b0;



always @(posedge clk or posedge reset) begin
    if (reset) begin
        led <= LED_OFF; // Reset the LED to OFF state
    end 

    else begin
        case (status)
            STATE_LEDON: begin
                if (button == BTN_RELEASED) begin
                    status <= STATE_LEDOFF;
                    led <= LED_OFF; // Turn OFF the LED when button is released
                end

                else begin
                    led <= LED_ON; // Keep the LED ON if button is pressed
                end

            end

            STATE_LEDOFF: begin
                if (button == BTN_PRESSED) begin
                    status <= STATE_LEDON;
                    led <= LED_ON; // Turn ON the LED when button is pressed
                end

                else begin
                    led <= LED_OFF; // Keep the LED OFF if button is not pressed
                end

            end

        endcase
    end
    

end
    
endmodule