
module mux_3b_4to1(
    input wire [2:0] a,
    input wire [2:0] b,
    input wire [2:0] c,
    input wire [2:0] d,
    input wire [1:0] se,
    input wire en, // enable signal
    output reg [2:0] y
    // here output is declared as reg because we will assign it in an always block
);


//assign y = en ? (se[1] ? (se[0] ? d : c) : (se[0] ? b : a)) : 3'bzzz; 
// output variable type should be wire when using assign statement
// output is zero when enable is low


// alternative implementation using always block    

always @(*) begin
    if (en) begin
        case (se)
            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;
            default: y = 3'bzzz; // default case to avoid latches high impedance
            // this case is not necessary but good practice to avoid latches
        endcase
    end 
    else begin
        y = 3'bzzz; // output is zero when enable is low
    end
end

endmodule