// `include "sbox.v"
// `include "key_expansion.v"
// `include "mixcolumn.v"
// `include "shiftrows.v"
// `include "addroundkey.v"
// module encryptiontop (
//     input wire clk,
//     input wire rst,
//     // input wire start,
//     input wire [127:0] plaintext,
//     input wire [255:0] key_i,
//     output reg [127:0] ciphertext
// );

//     // Internal signals
//     reg [127:0] state_reg [0:14];
//     reg [127:0] temp,temp2, sub_bytes_temp_in;
//     wire [127:0] round_keys [1:15]; // Round keys from 1 to 15
//     // wire [127:0] round1; // Round keys from 1 to 15
//     wire round1_en,round2_en,round3_en,round4_en,round5_en,round6_en,round7_en,round8_en,round9_en,round10_en,round11_en,round12_en,round13_en,round14_en,round15_en;
//     wire [127:0] sub_bytes_temp_out, shift_rows_out, mix_columns_out,out,round1,round2;
//     reg [127:0] add_round_key_out;

//     // Key expansion module
//     keyexpansion key_expansion (
//         .key(key_i),
//         .clk(clk),
//         .rst(rst),
//         .round1(round1),
//         .round2(round2),
//         .round3(round_keys[3]),
//         .round4(round_keys[4]),
//         .round5(round_keys[5]),
//         .round6(round_keys[6]),
//         .round7(round_keys[7]),
//         .round8(round_keys[8]),
//         .round9(round_keys[9]),
//         .round10(round_keys[10]),
//         .round11(round_keys[11]),
//         .round12(round_keys[12]),
//         .round13(round_keys[13]),
//         .round14(round_keys[14]),
//         .round15(round_keys[15]),
//         .round1_en(round1_en),
//         .round2_en(round2_en),
//         .round3_en(round3_en),
//         .round4_en(round4_en),
//         .round5_en(round5_en),
//         .round6_en(round6_en),
//         .round7_en(round7_en),
//         .round8_en(round8_en),
//         .round9_en(round9_en),
//         .round10_en(round10_en),
//         .round11_en(round11_en),
//         .round12_en(round12_en),
//         .round13_en(round13_en),
//         .round14_en(round14_en),
//         .round15_en(round15_en)
//     );

//     // SubBytes module instantiations
//     sbox sbox0 (.s_in(sub_bytes_temp_in[7:0]), .sub(sub_bytes_temp_out[7:0]));
//     sbox sbox1 (.s_in(sub_bytes_temp_in[15:8]), .sub(sub_bytes_temp_out[15:8]));
//     sbox sbox2 (.s_in(sub_bytes_temp_in[23:16]), .sub(sub_bytes_temp_out[23:16]));
//     sbox sbox3 (.s_in(sub_bytes_temp_in[31:24]), .sub(sub_bytes_temp_out[31:24]));
//     sbox sbox4 (.s_in(sub_bytes_temp_in[39:32]), .sub(sub_bytes_temp_out[39:32]));
//     sbox sbox5 (.s_in(sub_bytes_temp_in[47:40]), .sub(sub_bytes_temp_out[47:40]));
//     sbox sbox6 (.s_in(sub_bytes_temp_in[55:48]), .sub(sub_bytes_temp_out[55:48]));
//     sbox sbox7 (.s_in(sub_bytes_temp_in[63:56]), .sub(sub_bytes_temp_out[63:56]));
//     sbox sbox8 (.s_in(sub_bytes_temp_in[71:64]), .sub(sub_bytes_temp_out[71:64]));
//     sbox sbox9 (.s_in(sub_bytes_temp_in[79:72]), .sub(sub_bytes_temp_out[79:72]));
//     sbox sbox10 (.s_in(sub_bytes_temp_in[87:80]), .sub(sub_bytes_temp_out[87:80]));
//     sbox sbox11 (.s_in(sub_bytes_temp_in[95:88]), .sub(sub_bytes_temp_out[95:88]));
//     sbox sbox12 (.s_in(sub_bytes_temp_in[103:96]), .sub(sub_bytes_temp_out[103:96]));
//     sbox sbox13 (.s_in(sub_bytes_temp_in[111:104]), .sub(sub_bytes_temp_out[111:104]));
//     sbox sbox14 (.s_in(sub_bytes_temp_in[119:112]), .sub(sub_bytes_temp_out[119:112]));
//     sbox sbox15 (.s_in(sub_bytes_temp_in[127:120]), .sub(sub_bytes_temp_out[127:120]));

//     // ShiftRows module
//     shiftrows shift_rows (
//         .state_in(sub_bytes_temp_out),
//         .state_out(shift_rows_out)
//     );

//     // MixColumns module
//     mixcolumn mix_columns (
//         .mixcolumn_i(shift_rows_out),
//         .mixcolumn_o(mix_columns_out)
//     );
//     addroundkey addroundKey(
//         .data(temp),
//         .rkey (temp2),
//         .out(out)

//     );
    

    
//     reg [4:0] state, next_state; // Increased size to handle more states

//     localparam IDLE = 'b00000;
//     localparam INITIAL_ADD_ROUND_KEY = 5'b00001;
//     localparam ROUND2 = 4'b0010;
//     localparam ROUND3 = 4'b0011;
//     localparam ROUND4 = 4'b0100;
//     localparam ROUND5 = 4'b0101;
//     localparam ROUND6 = 4'b0110;
//     localparam ROUND7 = 4'b0111;
//     localparam ROUND8 = 4'b1000;
//     localparam ROUND9 = 4'b1001;
//     localparam ROUND10 = 4'b1010;
//     localparam ROUND11 = 4'b1011;
//     localparam ROUND12 = 4'b1100;
//     localparam ROUND13 = 4'b1101;
//     localparam ROUND14 = 4'b1110;
//     localparam FINAL_ROUND = 4'b1111;

//     // FSM sequential logic
//     always @(posedge clk or posedge rst) begin
//         if (rst)
//             state <= IDLE;
//         else
//             state <= next_state;
//     end

  
//     always @(*) begin
        
//             case (state)
//                 IDLE: begin
//                         if (rst)
//                     next_state = INITIAL_ADD_ROUND_KEY;
                
//             end
//             INITIAL_ADD_ROUND_KEY: begin
//              temp =plaintext;
//              temp2=round1;
//              if (round1_en) begin
//                next_state = ROUND2; 
//              end
//             end
//             ROUND2:begin
                
            
//                   sub_bytes_temp_in=out;
//                   temp=mix_columns_out;
//                   temp2=round2;
//                   if (round2_en) begin
//                next_state = ROUND2; 
//              end
//                   end
    
//     // ciphertext <= add_round_key_out;
//             endcase

//         end
    

// endmodule
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
    reg [127:0] temp, temp2,temp3, sub_bytes_temp_in;
    wire [127:0] round_keys [1:15]; // Round keys from 1 to 15
    wire round1_en, round2_en, round3_en, round4_en, round5_en, round6_en, round7_en, round8_en, round9_en, round10_en, round11_en, round12_en, round13_en, round14_en, round15_en;
    wire [127:0] sub_bytes_temp_out, shift_rows_out, mix_columns_out, out, round1, round2;

    // Key expansion module
    keyexpansion key_expansion (
        .key(key_i),
        .clk(clk),
        .rst(rst),
        .round1(round1),
        .round2(round2),
        .round3(round_keys[3]),
        .round4(round_keys[4]),
        .round5(round_keys[5]),
        .round6(round_keys[6]),
        .round7(round_keys[7]),
        .round8(round_keys[8]),
        .round9(round_keys[9]),
        .round10(round_keys[10]),
        .round11(round_keys[11]),
        .round12(round_keys[12]),
        .round13(round_keys[13]),
        .round14(round_keys[14]),
        .round15(round_keys[15]),
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
    sbox sbox0 (.s_in(out[7:0]), .sub(sub_bytes_temp_out[7:0]));
    sbox sbox1 (.s_in( out[15:8]), .sub(sub_bytes_temp_out[15:8]));
    sbox sbox2 (.s_in( out[23:16]), .sub(sub_bytes_temp_out[23:16]));
    sbox sbox3 (.s_in(out[31:24]), .sub(sub_bytes_temp_out[31:24]));
    sbox sbox4 (.s_in(out[39:32]), .sub(sub_bytes_temp_out[39:32]));
    sbox sbox5 (.s_in(out[47:40]), .sub(sub_bytes_temp_out[47:40]));
    sbox sbox6 (.s_in(out[55:48]), .sub(sub_bytes_temp_out[55:48]));
    sbox sbox7 (.s_in(out[63:56]), .sub(sub_bytes_temp_out[63:56]));
    sbox sbox8 (.s_in(out[71:64]), .sub(sub_bytes_temp_out[71:64]));
    sbox sbox9 (.s_in(out[79:72]), .sub(sub_bytes_temp_out[79:72]));
    sbox sbox10 (.s_in(out[87:80]), .sub(sub_bytes_temp_out[87:80]));
    sbox sbox11 (.s_in(out[95:88]), .sub(sub_bytes_temp_out[95:88]));
    sbox sbox12 (.s_in(sub_bytes_temp_in[103:96]), .sub(sub_bytes_temp_out[103:96]));
    sbox sbox13 (.s_in(sub_bytes_temp_in[111:104]), .sub(sub_bytes_temp_out[111:104]));
    sbox sbox14 (.s_in(sub_bytes_temp_in[119:112]), .sub(sub_bytes_temp_out[119:112]));
    sbox sbox15 (.s_in(sub_bytes_temp_in[127:120]), .sub(sub_bytes_temp_out[127:120]));

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

    reg [4:0] state, next_state; // Increased size to handle more states

    localparam IDLE = 5'b00000;
    localparam INITIAL_ADD_ROUND_KEY = 5'b00001;
    localparam ROUND2 = 5'b00010;
    localparam ROUND3 = 5'b00011;
    localparam ROUND4 = 5'b00100;
    localparam ROUND5 = 5'b00101;
    localparam ROUND6 = 5'b00110;
    localparam ROUND7 = 5'b00111;
    localparam ROUND8 = 5'b01000;
    localparam ROUND9 = 5'b01001;
    localparam ROUND10 = 5'b01010;
    localparam ROUND11 = 5'b01011;
    localparam ROUND12 = 5'b01100;
    localparam ROUND13 = 5'b01101;
    localparam ROUND14 = 5'b01110;
    localparam FINAL_ROUND = 5'b01111;

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
            end
            INITIAL_ADD_ROUND_KEY: begin
                 temp =plaintext;
                 temp2=round1;
                if (round1_en) begin
                    next_state = ROUND2;
                end 
            end
            ROUND2: begin
                //   temp3 = out;
                // sub_bytes_temp_in = temp3;
                temp = mix_columns_out;
                temp2 = round2;
                if (round2_en)
                    next_state = ROUND3;
            end
            ROUND3: begin
                if (round3_en) begin
                    next_state = ROUND4;
                end else begin
                    next_state = ROUND3;
                end
            end
            ROUND4: begin
                if (round4_en) begin
                    next_state = ROUND5;
                end else begin
                    next_state = ROUND4;
                end
            end
            ROUND5: begin
                if (round5_en) begin
                    next_state = ROUND6;
                end else begin
                    next_state = ROUND5;
                end
            end
            ROUND6: begin
                if (round6_en) begin
                    next_state = ROUND7;
                end else begin
                    next_state = ROUND6;
                end
            end
            ROUND7: begin
                if (round7_en) begin
                    next_state = ROUND8;
                end else begin
                    next_state = ROUND7;
                end
            end
            ROUND8: begin
                if (round8_en) begin
                    next_state = ROUND9;
                end else begin
                    next_state = ROUND8;
                end
            end
            ROUND9: begin
                if (round9_en) begin
                    next_state = ROUND10;
                end else begin
                    next_state = ROUND9;
                end
            end
            ROUND10: begin
                if (round10_en) begin
                    next_state = ROUND11;
                end else begin
                    next_state = ROUND10;
                end
            end
            ROUND11: begin
                if (round11_en) begin
                    next_state = ROUND12;
                end else begin
                    next_state = ROUND11;
                end
            end
            ROUND12: begin
                if (round12_en) begin
                    next_state = ROUND13;
                end else begin
                    next_state = ROUND12;
                end
            end
            ROUND13: begin
                if (round13_en) begin
                    next_state = ROUND14;
                end else begin
                    next_state = ROUND13;
                end
            end
            ROUND14: begin
                if (round14_en) begin
                    next_state = FINAL_ROUND;
                end else begin
                    next_state = ROUND14;
                end
            end
            FINAL_ROUND: begin
                ciphertext = out;
                next_state = IDLE;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule
