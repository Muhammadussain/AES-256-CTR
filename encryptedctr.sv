module encryptedctr#(
    parameter PLAINTEXTIN = 1024
) (
    input logic [PLAINTEXTIN - 1 :0] plaintext_in, 
    input logic [255:0] key,          
    input logic [127:0] iv,
    input logic clk, 
    input logic rst,     
    output logic [PLAINTEXTIN - 1 :0] encryptedtext
);
    logic [PLAINTEXTIN - 1 :0] a;
    logic cipher_counter_o;
    logic [127:0] key_i, plaintext, ciphertext;
    logic [127:0] iv_reg;              
    logic [3:0] roundcounter;            
    logic [1:0] state, next_state;       

    localparam IDLE    = 2'b00;
    localparam PROCESS = 2'b01;
   localparam FINAL   = 2'b10;

    encryptiontop uut (
        .clk(clk),
        .rst(rst),
        .plaintext(iv_reg),          
        .key_i(key),
        .cipher_counter_o( cipher_counter_o), 
        .ciphertext(ciphertext)        
    );

    always @(posedge clk) begin
       
        if (rst) begin
            state <= IDLE;
            roundcounter <= 0;
            encryptedtext <= 0;
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
                    if ( cipher_counter_o) begin
                        iv_reg <= iv_reg + 1;
                        a[roundcounter*128+127-:128] <= ciphertext ^ ((plaintext_in >> ((roundcounter ) * 128)));
                      
                        roundcounter <= roundcounter + 1;
                    end

                    if (roundcounter < PLAINTEXTIN / 128) begin
                        next_state <= PROCESS;
                    end else begin
                        next_state <= FINAL;
                    end
                end

                FINAL: begin
                    encryptedtext = a; 
                end

                default: next_state <= IDLE;
            endcase
        end
    end
endmodule
