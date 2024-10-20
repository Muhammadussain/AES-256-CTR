// `include "inv_sbox.v"
// `include "key_expansion.v"
// `include "inverse_mixcolumn.v"
// `include "inverse_shiftrows.v"
// `include "addroundkey.v"
module decryptiontop (
    input wire clk,
    input wire rst,
    input wire [127:0] ciphertext,
    input wire [255:0] key_i,
    output reg [127:0] plaintext
);

    // Internal signals
    reg [127:0] temp3,rk,rk_temp,rk_temp2,rk_temp3,rk_temp4,rk_temp5,rk_temp6,rk_temp7,rk_temp8,rk_temp9,rk_temp10,rk_temp11,rk_temp12,rk_temp13,rk_temp14,rk_temp15;
    reg [127:0] temp, temp2, sub_bytes_temp_in;
   
    wire round1_en, round2_en, round3_en, round4_en, round5_en, round6_en, round7_en, round8_en, round9_en, round10_en, round11_en, round12_en, round13_en, round14_en, round15_en;
    wire [127:0] sub_bytes_temp_out, shift_rows_out, mix_columns_out, out, round1,round2,round3,round4,round5,round6,round7,round8,round9,round10,round11,round12,round13,round14,round15,state_in;

    reg [4:0] state, next_state; // Increased size to handle more states
    reg [4:0] new_counter; // Increased size to handle more states
    reg [3:0] rounds_counter ;
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
    localparam DONE = 5'b10000;

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
    inv_sbox invsbox0 (
        .s_in(rk),
        .clk(clk),
        .rst(rst),
        .s_o(sub_bytes_temp_out)
    );
    inverse_shiftrows inverse_shift_rows (
        .state_in(temp3),
        .state_out(shift_rows_out)
    );
     inverse_mixcolumn inverse_mix_columns (
        .mixcolumn_i(out),
        .mixcolumn_o(mix_columns_out)
    ); 
    addroundkey addroundKey (
        .data(temp),
        .rkey(temp2),
        .out(out)
    );
      always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            new_counter <= 5'h0;
        end else begin
            state <= next_state;
            
                new_counter <= new_counter + 1;
            
        end
    end

    always @(*) begin
        case (state)
            IDLE: begin
                next_state = INITIAL_ADD_ROUND_KEY;
                rounds_counter = 4'h0;
                new_counter = 5'h0;
            end
            INITIAL_ADD_ROUND_KEY: begin
                 rounds_counter = 4'h1;
             
                if (round15_en &&rounds_counter==4'h1 ) begin
                
                     temp = ciphertext;
                     temp2 = round15;
                     temp3=out;
                      rk = shift_rows_out;
                    next_state <= ROUND1;
                       new_counter <= 5'h0;

                end
              
            end
            ROUND1: begin
               // new_counter = 5'h0;
               rounds_counter = 4'h2;
               if (new_counter == 4'h2 &&rounds_counter== 4'h2) begin
                    rk <= 128'h0;
                
                end
              if (sub_bytes_temp_out &&new_counter==5'h12 &&rounds_counter==4'h2) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round14;
                    rk_temp=shift_rows_out;
                    temp3=mix_columns_out;
                    next_state <=ROUND2;
                      new_counter <= 5'h0;
                    
                end
            end
            ROUND2: begin
                   
                
                rounds_counter = 4'h3;
                 rk = rk_temp;
                if (new_counter == 4'h2 &&rounds_counter== 4'h3) begin
                    rk <= 128'h0;
                    rk_temp <= 128'h0;
                end
                if (sub_bytes_temp_out &&new_counter==5'h12&&rounds_counter==4'h3) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round13;
                    temp3=mix_columns_out;
                    rk_temp2=shift_rows_out;
                    next_state <=ROUND3;
                      new_counter <= 5'h0;
                    
                end
            end
            ROUND3: begin
                rounds_counter = 4'h4;
                rk =rk_temp2;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'h4) begin
                    rk <= 128'h0;
                    rk_temp2<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round12;
                    temp3=mix_columns_out;
                    rk_temp3=shift_rows_out;
                    next_state <=ROUND4;
                      new_counter <= 5'h0;
                    
                end
            end
            ROUND4: begin
                rounds_counter = 4'h5;
                rk =rk_temp3;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'h5) begin
                    rk <= 128'h0;
                    rk_temp3<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round11;
                    temp3=mix_columns_out;
                     rk_temp4=shift_rows_out;
                    next_state <=ROUND5;
                      new_counter <= 5'h0;
                    
                end
            end
              ROUND5: begin
                rounds_counter = 4'h6;
                rk =rk_temp4;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'h6) begin
                    rk <= 128'h0;
                    rk_temp4<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round10;
                    temp3=mix_columns_out;
                    rk_temp5=shift_rows_out;
                    next_state <=ROUND6;
                      new_counter <= 5'h0;
                    
                end
             end
              ROUND6: begin
                rounds_counter = 4'h7;
                rk =rk_temp5;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'h7) begin
                    rk <= 128'h0;
                    rk_temp5<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round9;
                    temp3=mix_columns_out;
                     rk_temp6=shift_rows_out;
                    next_state <=ROUND7;
                      new_counter <= 5'h0;
                    
                end
             end
              ROUND7: begin
                rounds_counter = 4'h8;
                rk =rk_temp6;
                if ( new_counter == 4'h2 &&rounds_counter== 4'h8) begin
                    rk <= 128'h0;
                    rk_temp6<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round8;
                    temp3=mix_columns_out;
                     rk_temp7=shift_rows_out;
                    next_state <=ROUND8;
                      new_counter <= 5'h0;
                    
                end
            end
              ROUND8: begin
                rounds_counter = 4'h9;
                rk =rk_temp7;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'h9) begin
                    rk <= 128'h0;
                    rk_temp7<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round7;
                    temp3=mix_columns_out;
                     rk_temp8=shift_rows_out;
                    next_state <=ROUND9;
                      new_counter <= 5'h0;
                    
                end
            end
              ROUND9: begin
                rounds_counter = 4'hA;
                rk =rk_temp8;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'hA) begin
                    rk <= 128'h0;
                    rk_temp8<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round6;
                    temp3=mix_columns_out;
                     rk_temp9=shift_rows_out;
                    next_state <=ROUND10;
                      new_counter <= 5'h0;
                    
                end
            end
              ROUND10: begin
                rounds_counter = 4'hB;
                rk =rk_temp9;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'hB) begin
                    rk <= 128'h0;
                    rk_temp9<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round5;
                    temp3=mix_columns_out;
                    rk_temp10=shift_rows_out;
                    next_state <=ROUND11;
                      new_counter <= 5'h0;
                    
                end
            end
              ROUND11: begin
                rounds_counter = 4'hC;
                rk =rk_temp10;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'hC) begin
                    rk <= 128'h0;
                    rk_temp10<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round4;
                    temp3=mix_columns_out;
                        rk_temp11=shift_rows_out;
                    next_state <=ROUND12;
                      new_counter <= 5'h0;
                    
                end
             end
              ROUND12: begin
                rounds_counter = 4'hD;
                rk =rk_temp11;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'hD) begin
                    rk <= 128'h0;
                    rk_temp11<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round3;
                    temp3=mix_columns_out;
                    rk_temp12=shift_rows_out;
                    next_state <=ROUND13;
                      new_counter <= 5'h0;
                    
                end
            end
              ROUND13: begin
                rounds_counter = 4'hE;
                rk =rk_temp12;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'hE) begin
                    rk <= 128'h0;
                    rk_temp12<=128'h0;
                  
                end
                 if (sub_bytes_temp_out &&new_counter==5'h12) begin
                    temp = sub_bytes_temp_out;
                    temp2 = round2;
                    temp3=mix_columns_out;
                    rk_temp13=shift_rows_out;
                    next_state <=FINAL_ROUND;
                      new_counter <= 5'h0;
                    
                end
            end
              FINAL_ROUND: begin
                rounds_counter = 4'hF;
                rk =rk_temp13;
                
                if ( new_counter == 4'h2 &&rounds_counter== 4'hF) begin
                    rk <= 128'h0;
                    rk_temp13<=128'h0;
                  
                end
                  if (sub_bytes_temp_out &&new_counter==5'h12 &&state==5'h0f) begin
                       temp = sub_bytes_temp_out;
                      temp2 = round1;
                //     temp3=mix_columns_out;
                      plaintext=out;
                //     next_state= DONE;
                //       new_counter <= 5'h0;
                    
                 end
                                // plaintext=out;

            end
               
        endcase
    end

endmodule
