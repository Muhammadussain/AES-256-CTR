`include "sbox.v"
`include "key_expansion.v"
`include "mixcolumn.v"
`include "shiftrows.v"
`include "addroundkey.v"

module encryptiontop (
    input wire clk,
    input wire rst,
    input wire [127:0] plaintext,
    input wire [255:0] key_i,
    output reg [127:0] ciphertext
);

    // Internal signals
    reg [127:0] temp3,rk;
    reg [127:0] temp, temp2, sub_bytes_temp_in;
   
    wire round1_en, round2_en, round3_en, round4_en, round5_en, round6_en, round7_en, round8_en, round9_en, round10_en, round11_en, round12_en, round13_en, round14_en, round15_en;
    wire [127:0] sub_bytes_temp_out, shift_rows_out, mix_columns_out, out, round1,round2,round3,round4,round5,round6,round7,round8,round9,round10,round11,round12,round13,round14,round15;

    reg [4:0] state, next_state; // Increased size to handle more states
    reg [3:0] rounds_counter = 4'h0;
    localparam IDLE = 5'b00000;
    localparam INITIAL_ADD_ROUND_KEY = 5'b00001;
    localparam ROUND1 = 5'b00010;
    localparam ROUND2 = 5'b00011;
    localparam ROUND3 = 5'b00100;
    localparam ROUND4 = 5'b00101;
    localparam ROUND5 = 5'b00110;
    localparam ROUND6 = 5'b00111;
    localparam ROUND7 = 5'b01000;
    localparam ROUND8 = 5'b01001;
    localparam ROUND9 = 5'b01010;
    localparam ROUND10 = 5'b01011;
    localparam ROUND11 = 5'b01100;
    localparam ROUND12 = 5'b01101;
    localparam ROUND13 = 5'b01110;
    localparam FINAL_ROUND = 5'b01111;
    // Key expansion module
    keyexpansion key_expansion (
        .key(key_i),
        .clk(clk),
        .rst(rst),
        .round1(round1),
        .round2(round2),
        .round3(round3),
        .round4(round4),
        .round5(round5),
        .round6(round6),
        .round7(round7),
        .round8(round8),
        .round9(round9),
        .round10(round10),
        .round11(round11),
        .round12(round12),
        .round13(round13),
        .round14(round14),
        .round15(round15),
        .round1_en(round1_en),
        .round2_en(round2_en),
        .round3_en(round3_en),
        .round4_en(round4_en),
        .round5_en(round5_en),
        .round6_en(round6_en),
        .round7_en(round7_en),
        .round8_en(round8_en),
        .round9_en(round9_en),
        .round10_en(round10_en),
        .round11_en(round11_en),
        .round12_en(round12_en),
        .round13_en(round13_en),
        .round14_en(round14_en),
        .round15_en(round15_en)
    );

    // SubBytes module instantiations
    sbox sbox0 (.s_in(rk),
    .clk(clk),
    .rst(rst),
    //.counter(rounds_counter),
    .s_ready(s_ready),
    .s_o(sub_bytes_temp_out));
  
    // ShiftRows module
    shiftrows shift_rows (
        .state_in(sub_bytes_temp_out),
        .state_out(shift_rows_out)
    );

    // MixColumns module
    mixcolumn mix_columns (
        .mixcolumn_i(shift_rows_out),
        .mixcolumn_o(mix_columns_out)
    ); 
    // AddRoundKey module
    addroundkey addroundKey (
        .data(temp),
        .rkey(temp2),
        .out(out)
    );


    // FSM sequential logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            IDLE: begin
                next_state = INITIAL_ADD_ROUND_KEY;
                rounds_counter=1'h0;
            end
            INITIAL_ADD_ROUND_KEY: begin
                temp = plaintext;
                temp2 = round1;
                rk=out;
                if (round1_en) begin
                    rounds_counter = 4'h1;
                    next_state = ROUND1;
                end
            end
            ROUND1: begin
                 rk<=128'h0;
                if(sub_bytes_temp_out)begin
                temp = mix_columns_out;
                temp2 = round2;
                end
                if (round2_en && sub_bytes_temp_out && out) begin
                    rounds_counter =4'h2;
                             rk<=128'h0;

                    next_state = ROUND2;
                end
            end
            ROUND2: begin
                temp = mix_columns_out;
                temp2 = round3;
                if (round3_en) begin
                    next_state = ROUND3;
                end
            end
            ROUND3: begin
                temp = mix_columns_out;
                temp2 = round4;
                if (round4_en) begin
                    next_state = ROUND4;
                end
            end
            // Add other rounds here as needed
            // FINAL_ROUND: begin
            //     ciphertext = out;
            //     next_state = IDLE;
            // end
          
        endcase
    end

endmodule
