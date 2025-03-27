module decryptedctr#(
    parameter   CIPHERTEXTIN = 1024
) (
    input logic [CIPHERTEXTIN - 1 :0] ciphertext_in, 
    input logic [255:0] key,          
    input logic [127:0] iv,
    input logic clk,
    input logic rst,     
    output logic [CIPHERTEXTIN - 1 :0] decryptedtext
);
    logic [CIPHERTEXTIN - 1 :0] a;                 
    logic plain_counter_o;
    logic [127:0] key_i, plaintext_O, ciphertext;
    logic [127:0] iv_reg;               
    logic [3:0] roundcounter;           
    logic [1:0] state, next_state;        

    
    localparam IDLE    = 2'b00;
    localparam PROCESS = 2'b01;
    localparam FINAL_STATE   = 2'b10;

    
    encryptiontop uut (
        .clk(clk),
        .rst(rst),
        .plaintext(iv_reg),          
        .key_i(key),
        .cipher_counter_o(plain_counter_o), 
        .ciphertext(plaintext_O)        
    );

    always @(posedge clk) begin
     
        if (rst) begin
            state <= IDLE;
            roundcounter <= 0;
            decryptedtext <= 0;
            a <= 0;  
        end else begin
            state <= next_state;

            case (state)
                IDLE: begin
                    roundcounter <= 0;
                    iv_reg <= iv;
                    a <= 0;  
                    next_state <= PROCESS; 
                end

                PROCESS: begin
                    if (plain_counter_o) begin
                        iv_reg <= iv_reg + 1; 
                        a[roundcounter*128 + 127 -: 128] <= plaintext_O ^ (ciphertext_in >> (roundcounter * 128)); // Decrypt block
                        roundcounter <= roundcounter + 1;

                        // If more rounds are left, stay in PROCESS state
                        if (roundcounter < CIPHERTEXTIN / 128) begin
                            next_state <= PROCESS;
                        end else begin
                            next_state <= FINAL_STATE; // Transition to FINAL_STATE
                        end
                    end
                end

                FINAL_STATE: begin // Final state for output
                    decryptedtext <= a; // Store the final decrypted text
                    next_state <= IDLE; // Transition back to IDLE after completion
                end

                default: next_state <= IDLE; // Default state transition
            endcase
        end
    end
endmodule
