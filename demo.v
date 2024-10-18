// // `include "sbox.v"
// // `include "key_expansion.v"
// // `include "mixcolumn.v"
// // `include "shiftrows.v"
// // `include "addroundkey.v"

// module encryptiontop (
//     input wire clk,
//     input wire rst,
//     input wire [127:0] plaintext,
//     input wire [255:0] key_i,
//     output reg cipher_counter_o,
//     output reg [127:0] ciphertext
   
// );

//     // Internal signals
//     reg [127:0] rk,rk_temp,rk_temp2,rk_temp3,rk_temp4,rk_temp5,rk_temp6,rk_temp7,rk_temp8,rk_temp9,rk_temp10,rk_temp11,rk_temp12,rk_temp13;
//     reg [127:0] temp, temp2;
   
//     wire [127:0] sub_bytes_temp_out, shift_rows_out, mix_columns_out, out, round1,round2,round3,round4,round5,round6,round7,round8,round9,round10,round11,round12,round13,round14,round15;

//     reg [4:0] state, next_state; // Increased size to handle more states
//     reg [4:0] new_counter; // Increased size to handle more states
//     reg [3:0] rounds_counter ;
//     localparam IDLE = 5'b00000;
//     localparam INITIAL_ADD_ROUND_KEY = 5'b00001;
//     localparam ROUND1 = 5'b00010;
//     localparam ROUND2 = 5'b00011;
//     localparam ROUND3 = 5'b00100;
//     localparam ROUND4 = 5'b00101;
//     localparam ROUND5 = 5'b00110;
//     localparam ROUND6 = 5'b00111;
//     localparam ROUND7 = 5'b01000;
//     localparam ROUND8 = 5'b01001;
//     localparam ROUND9 = 5'b01010;
//     localparam ROUND10 = 5'b01011;
//     localparam ROUND11 = 5'b01100;
//     localparam ROUND12 = 5'b01101;
//     localparam ROUND13 = 5'b01110;
//     localparam FINAL_ROUND = 5'b01111;
//     localparam DONE = 5'b10000;

    
//     keyexpansion key_expansion (
//         .key(key_i),
//         .clk(clk),
//         .rst(rst),
//         .round1(round1),
//         .round2(round2),
//         .round3(round3),
//         .round4(round4),
//         .round5(round5),
//         .round6(round6),
//         .round7(round7),
//         .round8(round8),
//         .round9(round9),
//         .round10(round10),
//         .round11(round11),
//         .round12(round12),
//         .round13(round13),
//         .round14(round14),
//         .round15(round15)
       
//     );

//     // SubBytes module instantiations
//     sbox sbox0 (
//         .s_in(rk),
//         .clk(clk),
//         .rst(rst),
//         .s_o(sub_bytes_temp_out)
//     );
  
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

//     // AddRoundKey module
//     addroundkey addroundKey (
//         .data(temp),
//         .rkey(temp2),
//         .out(out)
//     );

//     // FSM sequential logic
//     always @(posedge clk or posedge rst) begin
//         if (rst) begin
//             state <= IDLE;
//             new_counter <= 5'h0;
               
          
//         end else begin
//             state <= next_state;
            
//                 new_counter <= new_counter + 1;
            
//         end
//     end

//     always @(*) begin
//          cipher_counter_o = 1'h0; 
           
               
//         case (state)
//             IDLE: begin
               
                
//                 next_state = INITIAL_ADD_ROUND_KEY;
//                 rounds_counter = 4'h0;
    
//             end
//             INITIAL_ADD_ROUND_KEY: begin
//                  rounds_counter = 4'h1;
                
               
//                 if (rounds_counter==4'h1 && new_counter == 5'h4 ) begin
//                    temp = plaintext;
//                    temp2 = round1;
//                    rk = out;
//                     next_state = ROUND1;
                      
//                 end
//                 else begin
//                 next_state = state;
//                 end
//             end
//             ROUND1: begin
//               rk_temp13=128'h0;
//               rounds_counter = 4'h2;
//                if (new_counter == 5'h6 &&rounds_counter== 4'h2) begin
//                     rk = 128'h0;
                  
//                 end
//                  if (sub_bytes_temp_out && new_counter==5'h12 &&rounds_counter==4'h2) begin
//                     temp = mix_columns_out;
//                     temp2 = round2;
//                     rk_temp=out;
//                     next_state =ROUND2;
                    
                    
//                 end
//                  else begin
//                 next_state = state;
//                 end
          
//             end
//  ROUND2: begin
                   
//                 rk_temp13=128'h0;
//                 rounds_counter = 4'h3;
//                  rk = rk_temp;
//                 if (new_counter == 5'h2 &&rounds_counter== 4'h3) begin
//                     rk = 128'h0;
//                     rk_temp = 128'h0;
//                 end
//                 if (sub_bytes_temp_out && new_counter==5'h12 &&rounds_counter==4'h3) begin
//                     temp = mix_columns_out;
//                     temp2 = round3;
//                     rk_temp2=out;
//                      next_state =ROUND3;
                   
                    
//                 end
//                  else begin
//                 next_state = state;
//                 end

//             end

//         endcase
//         end
//        endmodule;
