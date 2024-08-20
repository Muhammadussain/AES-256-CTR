`include "encryptiontop.v"
module ctrencryption (
    input wire [1023:0] plaintext_in,   // Input plaintext (up to 2000 bits)
    input wire [255:0] key,          // AES-256 key (256 bits)
    input wire [127:0] iv,
    input wire clk,
    input wire rst,        // Initial Counter (IV)
       // Actual length of the plaintext in bits (0 to 2000)
    output reg [1999:0] text   // Output ciphertext
);
    wire [127:0]  key_i,plaintext,ciphertext;
    reg [127:0] iv_temp,iv_temp1;
    
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
    localparam ROUND9=4'h9;

    encryptiontop uut(
        .clk(clk),
        .rst(rst),
        .plaintext(iv_temp),
        .key_i(key),
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
          
                   
                  iv_temp1<=iv+1;
                next_state <=ROUND2;
        
            end
        end     
        ROUND2: begin
          
            iv_temp=iv_temp1;
            
          if(state ==4'h2 && counter >=4'h2)begin
                iv_temp1=4'h0;
          end
          
                encryptednonce[1]=ciphertext;
                encryptedctr[1]=encryptednonce[1]^plain[1];
                // next_state <=ROUND3;
            
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
