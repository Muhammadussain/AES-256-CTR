`include "encryptiontop.v"
module ctrencryption (
    input wire [1023:0] plaintext_in,   // Input plaintext (up to 2000 bits)
    input wire [255:0] key,          // AES-256 key (256 bits)
    input wire [127:0] iv,
    input wire clk,
    input wire rst,        // Initial Counter (IV)
       // Actual length of the plaintext in bits (0 to 2000)
    output reg [1023:0] text   // Output ciphertext
);
    wire [127:0]  key_i,plaintext,ciphertext;
    reg [127:0] iv_temp,iv_temp1,iv_temp2,iv_temp3,iv_temp4,iv_temp5,iv_temp6,iv_temp7,iv_temp8;
    
    reg [7:0] [127:0] encryptednonce;       
    reg [7:0] [127:0] encryptedctr;       
    reg [7:0] [127:0] plain;             
    reg [3:0]  state,next_state,counter=4'b0000;
    
    localparam IDLE=4'h0;
    localparam ROUND1=4'h1;
    localparam ROUND2=4'h2;
    localparam ROUND3=4'h3;
    localparam ROUND4=4'h4;
    localparam ROUND5=4'h5;
    localparam ROUND6=4'h6;
    localparam ROUND7=4'h7;
    localparam ROUND8=4'h8;
    localparam DONE=4'h9;

    encryptiontop uut(
        .clk(clk),
        .rst(rst),
        .plaintext(iv_temp),
        .key_i(key),
        .cipher_counter_o(cipher_counter_o),
        .ciphertext(ciphertext)
    );

always @(posedge clk) begin
        if (rst ) begin
            state <=IDLE;
                               
        end else begin
            state <= next_state;
            
            counter <= counter + 1;
        end
end
always @(*) begin
    case (state)
        IDLE: begin
            next_state=IDLE;
    
        plain[0]=plaintext_in[127:0];
        plain[1]=plaintext_in[255:128];
        plain[2]=plaintext_in[383:256];
        plain[3]=plaintext_in[511:384];
        plain[4]=plaintext_in[639:512];
        plain[5]=plaintext_in[767:640];
        plain[6]=plaintext_in[895:768];
        plain[7]=plaintext_in[1024:896];
     

    
                            iv_temp=iv;
                           
                   if(!rst && iv)begin
                    next_state=ROUND1;
                   end

          
     end
        

        ROUND1: begin
                   
               iv_temp<=128'h0;

            
            if (state==4'h1  && ciphertext &&counter ==4'h0) begin
                encryptednonce[0]=ciphertext;
                encryptedctr[0]=encryptednonce[0]^plain[0];
          
                   if(state==4'h1 &&cipher_counter_o)
                  iv_temp1=iv+1;
                next_state <=ROUND2;
        
            end
        end     
        ROUND2: begin

            iv_temp=iv_temp1;
            
          if(state ==4'h2 && counter >=4'h2)begin
                iv_temp1=4'h0;
               
            
          end
                if(state== 4'h2 && cipher_counter_o &&counter ==4'h1)begin
                encryptednonce[1]=ciphertext;
                encryptedctr[1]=encryptednonce[1]^plain[1];
                end                    
                if(state==4'h2 && cipher_counter_o && counter==4'h2)begin
                            next_state<=ROUND3;
                                         iv_temp2=iv+2;

        end
        end

          ROUND3: begin
          
            iv_temp<=iv_temp2;
            
          if(state ==4'h3 && counter >=4'h2)begin
                iv_temp2=4'h0;
                
                
          end
                if(state== 4'h3 && cipher_counter_o &&counter==2)begin
                encryptednonce[2]=ciphertext;
                encryptedctr[2]=encryptednonce[2]^plain[2];
                                  if(state== 4'h3 && cipher_counter_o &&counter==2)begin
                  iv_temp3=iv+3;

                  next_state <=ROUND4;
                end
                end
        end
         ROUND4: begin
          
            iv_temp<=iv_temp3;
            
          if(state ==4'h4 && counter >=4'h4)begin
               iv_temp3=4'h0;
               
                
                
          end                 

                if(state== 4'h4 && cipher_counter_o &&counter==3)begin
                encryptednonce[3]=ciphertext;
                encryptedctr[3]=encryptednonce[3]^plain[3];
                end
                                  if(state== 4'h4 && cipher_counter_o &&counter==4)begin
                                                      iv_temp4=iv+4;

                  next_state <=ROUND5;
                end
                
        end
         ROUND5: begin
          
            iv_temp<=iv_temp4;
            
          if(state ==4'h5 && counter >=4'h2)begin
                iv_temp4=4'h0;
                
                
          end
                if(state== 4'h5 && cipher_counter_o &&counter==4)begin
                encryptednonce[4]=ciphertext;
                encryptedctr[4]=encryptednonce[4]^plain[4];
                end
                if(state== 4'h5 && cipher_counter_o &&counter==4)begin
                                      iv_temp5=iv+5;

                  next_state <=ROUND6;
                end
                end
         ROUND6: begin
          
            iv_temp<=iv_temp5;
            
          if(state ==4'h6 && counter >=4'h6)begin
                iv_temp5=4'h0;
                
                
          end
                if(state== 4'h6 && cipher_counter_o &&counter==5)begin
                encryptednonce[5]=ciphertext;
                encryptedctr[5]=encryptednonce[5]^plain[5];
                end
                if(state== 4'h6 && cipher_counter_o &&counter==6)begin
                                      iv_temp6=iv+6;

                  next_state <=ROUND7;
                end
                end
          ROUND7: begin
          
            iv_temp<=iv_temp6;
            
          if(state ==4'h7 && counter >=4'h6)begin
                iv_temp6=4'h0;
                
                
          end
                if(state== 4'h7 && cipher_counter_o &&counter==6)begin
                encryptednonce[6]=ciphertext;
                encryptedctr[6]=encryptednonce[6]^plain[6];
                end
                if(state== 4'h7 && cipher_counter_o &&counter==6)begin
                                      iv_temp7=iv+7;

                  next_state <=ROUND8;
                end
                end
          ROUND8: begin
          
            iv_temp<=iv_temp7;
            
          if(state ==4'h8 && counter >=4'h8)begin
                iv_temp7=4'h0;
                
                
          end
                if(state== 4'h8 && cipher_counter_o &&counter==7)begin
                encryptednonce[7]=ciphertext;
                encryptedctr[7]=encryptednonce[7]^plain[7];
                end
                if(state== 4'h8 && cipher_counter_o &&counter==8)begin
                                      

                  next_state <=DONE;
                end
                end

                DONE:begin
                  text=encryptedctr;
                end
    endcase
end

endmodule







//         // Concatenate the processed blocks to form the final ciphertext
//         ciphertext = {block[0], block[1], block[2], block[3], block[4], block[5], 
//                       block[6], block[7], block[8], block[9], block[10], block[11],
//                       block[12], block[13], block[14], block[15]};

//         // Truncate the ciphertext to match the actual length
//         if (length < 2000) begin
//             ciphertext = ciphertext[1999:2000-length];
//         end
//     end

// endmodule
