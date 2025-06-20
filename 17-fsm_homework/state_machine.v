module state_machine (
    input clk,           // Clock input
    input go,            // Start signal
    input kill,          // Abort signal
    output reg done      // Completion pulse
);

    // State definitions
    typedef enum logic [1:0] {
        IDLE,           // Waiting for go signal
        ACTIVE,         // Counting duration
        FINISH,        // Producing done pulse
        ABORT           // Waiting for kill to deassert
    } state_t;
    
    state_t current_state, next_state;
    
    // Duration counter (7 bits for 0-100)
    reg [6:0] duration_cnt;
    
    // State transition logic
    always @ (*) begin
        case (current_state)
            IDLE: begin
                next_state = go ? ACTIVE : IDLE;
            end
            
            ACTIVE: begin
                if (kill) begin
                    next_state = ABORT;
                end else if (duration_cnt == 7'd100) begin
                    next_state = FINISH;
                end else begin
                    next_state = ACTIVE;
                end
            end
            
            FINISH: begin
                next_state = IDLE;
            end
            
            ABORT: begin
                next_state = (!kill) ? IDLE : ABORT;
            end
            
            default: begin
                next_state = IDLE;
            end
        endcase
    end
    

    always @ (posedge clk) begin
        current_state <= next_state;
        
        // Counter logic
        case (current_state)
            IDLE: begin
                done <= 1'b0;
                duration_cnt <= 7'd0;
            end
            
            ACTIVE: begin
                if (!kill) begin
                    duration_cnt <= duration_cnt + 1;
                end
            end
            
            FINISH: begin
                done <= 1'b1;
            end
            
            ABORT: begin

            end
        endcase
        
        // Reset done signal after one clock
        if (current_state != FINISH) begin
            done <= 1'b0;
        end
    end

endmodule