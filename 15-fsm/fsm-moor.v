module divide_by3fsm (
    input reset,
    input clk,
    output y,
    output [2:0] state,      
    output [2:0] nextstate   
);

reg [2:0] state_reg, nextstate_reg;

parameter S0 = 3'b000, // state 0
          S1 = 3'b001, // state 1
          S2 = 3'b010; // state 2

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        state_reg <= S0; // reset to state 0
    end 
    else begin
        state_reg <= nextstate_reg; // transition to next state
    end
end

// Next state logic
always @ (*) begin
    case (state_reg)
        S0: nextstate_reg = S1;
        S1: nextstate_reg = S2;
        S2: nextstate_reg = S0;
        default: nextstate_reg = S0; // reset to state 0
    endcase
end

// Output logic
assign y = (state_reg == S0);

// Debug outputs
assign state = state_reg;
assign nextstate = nextstate_reg;

endmodule
