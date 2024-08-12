module inverse_shiftrows (
    input wire [127:0] state_in,
    output reg [127:0] state_out
);
    reg [31:0] row0, row1, row2, row3;
    reg [31:0] row1_shifted, row2_shifted, row3_shifted;

    always @(*) begin
        row0 = state_in[31:0];
        row1 = state_in[63:32];
        row2 = state_in[95:64];
        row3 = state_in[127:96];

        row1_shifted = {row1[7:0], row1[31:8]};  // Circular right shift by 1 byte
        row2_shifted = {row2[15:0], row2[31:16]};  // Circular right shift by 2 bytes
        row3_shifted = {row3[23:0], row3[31:24]};    // Circular right shift by 3 bytes

        state_out = {row0, row1_shifted, row2_shifted, row3_shifted};
    end
endmodule
