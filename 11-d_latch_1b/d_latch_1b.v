module d_latch_1b (
    input wire d, 
    input wire en,
    output reg q

);

always @ (en or d) begin // Triggered by changes in enable or data input (Sensitivity list)
    if (en) begin
        q <= d; // If enable is high, output follows input
    end

    else begin
        q <= q; // If enable is low, output holds its value
    end 

end

endmodule