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
        plaintext = 128'hffeeddccbbaa99887766554433221100;
        key_i = 256'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;

        // Apply reset
        #10 rst = 0;

        // Wait for encryption to complete
        #3000;

        // Check the result
        $display("Ciphertext: %h", ciphertext);

        // Finish simulation
        $finish;
    end

endmodule
