module encryptiontop_tb;

    reg clk;
    reg rst;
    reg [127:0] plaintext;
    reg [255:0] key_i;
    wire [127:0] ciphertext;

    // Instantiate the encryptiontop module
    encryptiontop uut (
        .clk(clk),
        .rst(rst),
        .plaintext(plaintext),
        .key_i(key_i),
        .ciphertext(ciphertext)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        $dumpfile("encryptiontop.vcd");
        $dumpvars(0, encryptiontop_tb);
        clk = 0;
        rst = 1;
        plaintext = 128'h00112233445566778899aabbccddeeff;
        key_i = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;

        // Apply reset
        #10 rst = 0;

        // Wait for encryption to complete
        #1000;

        // Check the result
        $display("Ciphertext: %h", ciphertext);

        // Finish simulation
        $finish;
    end

endmodule
