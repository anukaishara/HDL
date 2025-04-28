// Comparator 1 bit input, 3 outputs   


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
        if (a==b) begin
            aeb = 1'b1, alb = 1'b0, agb = 1'b0; 
        end

        else if (a>b) begin 
            aeb = 1'b0, alb = 1'b0, agb = 1'b1; 
        end

        else if (a>b) begin 
            aeb = 1'b0, alb = 1'b0, agb = 1'b1; 
        end

        else begin 
            aeb = 1'b0, alb = 1'b0, agb = 1'b0;// default case  
        end  

    end


endmodule

// Comparator 4 bit input 3 outputs

module comp4b3o(
    input wire [3:0] a,
    input wire [3:0] b,
    output reg aeb,
    output reg agb,
    output reg alb
);      

always @ (*)
    begin
        if (a==b) begin
            aeb = 1'b1, alb = 1'b0, agb = 1'b0;
        end

        else if  (a>b) begin 
            aeb = 1'b0, alb = 1'b0, agb = 1'b1;
        end

        else if (a<b) begin 
            aeb = 1'b0, alb = 1'b1, agb = 1'b0;
        end
        else begin 
            aeb = 1'b0, alb = 1'b0, agb = 1'b0; // default case
        end

    end 

endmodule