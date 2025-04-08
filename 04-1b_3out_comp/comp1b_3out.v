// Comparator 1 bit 3 outputs   


// aeb = a equal b
// agb = a greater than b
// alb = a less than b
module comp1b3o(
    input wire a,
    input wire b,
    output reg aeb,
    output reg agb,
    output reg alb
);

always @ (*)
    begin
        if (a==b) aeb = 1'b1, alb = 1'b0, agb = 1'b0;

        else if (a>b) aeb = 1'b0, alb = 1'b0, agb = 1'b1;

        else if (a<b) aeb = 1'b0, alb = 1'b1, agb = 1'b0;

        else aeb = 1'b0, alb = 1'b0, agb = 1'b0; // default case
    end


endmodule

// Comparator 4 bit 3 outputs

module comp4b3o(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire aeb,
    output wire agb,
    output wire alb
);      



endmodule