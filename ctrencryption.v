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
    reg [127:0] iv_temp;
    
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
        if (rst) begin
            state <=IDLE;
        end else begin
            state <= next_state;
            
            counter <= counter + 1;
        end
end
always @(*) begin
    case (state)
        IDLE: begin
           
        plain[0]=plaintext_in[127:0];
        plain[1]=plaintext_in[255:128];
        plain[2]=plaintext_in[383:256];
        plain[3]=plaintext_in[511:384];
        plain[4]=plaintext_in[639:512];
        plain[5]=plaintext_in[767:640];
        plain[6]=plaintext_in[895:768];
        plain[7]=plaintext_in[1024:896];
     
       
       
     
        next_state <=ROUND1;

        end

        ROUND1: begin
            
            iv_temp=iv;
           
            if (state==4'h1  && ciphertext) begin
                encryptednonce[0]=ciphertext;
                encryptedctr[0]=encryptednonce[0]^plain[0];
                next_state <=ROUND2;
            end
        end 
        ROUND2: begin
            // counter =counter+1;
            iv_temp=iv+1;
          
            // if (state==4'h2 && counter ==4'hE && ciphertext) begin
                encryptednonce[1]=ciphertext;
                encryptedctr[1]=encryptednonce[1]^plain[1];
                // next_state <=ROUND3;
            // end
        end
    endcase
end

endmodule






//     // Padding and block assignment without using a for loop
//     always @(*) begin
//         ctr_value = iv;  // Initialize counter with IV

//         // Block 0 (First 128 bits)
//         if (length > 0) begin
//             if (length >= 128) begin
//                 block[0] = plaintext[127:0];  // Full block
//             end else begin
//                 block[0] = {plaintext[length-1:0], {(128-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[0] = 128'h0;  // Zero padding
//         end

//         // Block 1 (Next 128 bits)
//         if (length > 128) begin
//             if (length >= 256) begin
//                 block[1] = plaintext[255:128];  // Full block
//             end else begin
//                 block[1] = {plaintext[length-1:128], {(256-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[1] = 128'h0;  // Zero padding
//         end

//         // Block 2 (Next 128 bits)
//         if (length > 256) begin
//             if (length >= 384) begin
//                 block[2] = plaintext[383:256];  // Full block
//             end else begin
//                 block[2] = {plaintext[length-1:256], {(384-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[2] = 128'h0;  // Zero padding
//         end

//         // Block 3 (Next 128 bits)
//         if (length > 384) begin
//             if (length >= 512) begin
//                 block[3] = plaintext[511:384];  // Full block
//             end else begin
//                 block[3] = {plaintext[length-1:384], {(512-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[3] = 128'h0;  // Zero padding
//         end

//         // Block 4 (Next 128 bits)
//         if (length > 512) begin
//             if (length >= 640) begin
//                 block[4] = plaintext[639:512];  // Full block
//             end else begin
//                 block[4] = {plaintext[length-1:512], {(640-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[4] = 128'h0;  // Zero padding
//         end

//         // Block 5 (Next 128 bits)
//         if (length > 640) begin
//             if (length >= 768) begin
//                 block[5] = plaintext[767:640];  // Full block
//             end else begin
//                 block[5] = {plaintext[length-1:640], {(768-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[5] = 128'h0;  // Zero padding
//         end

//         // Block 6 (Next 128 bits)
//         if (length > 768) begin
//             if (length >= 896) begin
//                 block[6] = plaintext[895:768];  // Full block
//             end else begin
//                 block[6] = {plaintext[length-1:768], {(896-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[6] = 128'h0;  // Zero padding
//         end

//         // Block 7 (Next 128 bits)
//         if (length > 896) begin
//             if (length >= 1024) begin
//                 block[7] = plaintext[1023:896];  // Full block
//             end else begin
//                 block[7] = {plaintext[length-1:896], {(1024-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[7] = 128'h0;  // Zero padding
//         end

//         // Block 8 (Next 128 bits)
//         if (length > 1024) begin
//             if (length >= 1152) begin
//                 block[8] = plaintext[1151:1024];  // Full block
//             end else begin
//                 block[8] = {plaintext[length-1:1024], {(1152-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[8] = 128'h0;  // Zero padding
//         end

//         // Block 9 (Next 128 bits)
//         if (length > 1152) begin
//             if (length >= 1280) begin
//                 block[9] = plaintext[1279:1152];  // Full block
//             end else begin
//                 block[9] = {plaintext[length-1:1152], {(1280-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[9] = 128'h0;  // Zero padding
//         end

//         // Block 10 (Next 128 bits)
//         if (length > 1280) begin
//             if (length >= 1408) begin
//                 block[10] = plaintext[1407:1280];  // Full block
//             end else begin
//                 block[10] = {plaintext[length-1:1280], {(1408-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[10] = 128'h0;  // Zero padding
//         end

//         // Block 11 (Next 128 bits)
//         if (length > 1408) begin
//             if (length >= 1536) begin
//                 block[11] = plaintext[1535:1408];  // Full block
//             end else begin
//                 block[11] = {plaintext[length-1:1408], {(1536-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[11] = 128'h0;  // Zero padding
//         end

//         // Block 12 (Next 128 bits)
//         if (length > 1536) begin
//             if (length >= 1664) begin
//                 block[12] = plaintext[1663:1536];  // Full block
//             end else begin
//                 block[12] = {plaintext[length-1:1536], {(1664-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[12] = 128'h0;  // Zero padding
//         end

//         // Block 13 (Next 128 bits)
//         if (length > 1664) begin
//             if (length >= 1792) begin
//                 block[13] = plaintext[1791:1664];  // Full block
//             end else begin
//                 block[13] = {plaintext[length-1:1664], {(1792-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[13] = 128'h0;  // Zero padding
//         end

//         // Block 14 (Next 128 bits)
//         if (length > 1792) begin
//             if (length >= 1920) begin
//                 block[14] = plaintext[1919:1792];  // Full block
//             end else begin
//                 block[14] = {plaintext[length-1:1792], {(1920-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[14] = 128'h0;  // Zero padding
//         end

//         // Block 15 (Last 128 bits for 2000 bits)
//         if (length > 1920) begin
//             if (length >= 2000) begin
//                 block[15] = plaintext[1999:1920];  // Full block
//             end else begin
//                 block[15] = {plaintext[length-1:1920], {(2000-length){1'b0}}};  // Padding
//             end
//         end else begin
//             block[15] = 128'h0;  // Zero padding
//         end
//     end

//     // AES encryption process (CTR mode logic)
//     always @(*) begin
//         // Initialize ciphertext to zero
//         ciphertext = 2000'h0;

//         // Process each block with AES encryption using the counter (ctr_value)
//         // Note: The actual AES encryption function is not included here
//         // The encrypted counter value should be XORed with each block to produce the ciphertext

//         // Example loop for block processing (pseudo-code):
//         // for (int i = 0; i < 16; i = i + 1) begin
//         //     encrypted_ctr = AES_Encrypt(key, ctr_value);  // AES encryption function
//         //     ciphertext[127 + (i * 128) : i * 128] = block[i] ^ encrypted_ctr;  // XOR with encrypted counter
//         //     ctr_value = ctr_value + 1;  // Increment counter
//         // end

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
