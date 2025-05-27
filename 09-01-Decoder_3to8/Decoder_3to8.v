module decoder_3to8 (
    input wire [2:0] a,
    input wire en,
    output reg [7:0] y
);

always @ (*) begin
    if (en) begin
        case (a)

        3'b000 : y = 8'b0000_0001;
        3'b001 : y = 8'b0000_0010;
        3'b010 : y = 8'b0000_0100;
        3'b011 : y = 8'b0000_1000:
        3'b100 : y = 8'b0001_0000;
        3'b101 : y = 8'b0010_0000;
        3'b110 : y = 8'b0100_0000;
        3'b111 : y = 8'b1000_0000;
        default : y = 8'bzzzz_zzzz;
        endcase
    end

    else begin
        y = 8'bzzzz_zzzz;


    end

end

endmodule