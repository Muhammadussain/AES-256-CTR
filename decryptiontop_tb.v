module decryptiontop_tb;

    reg clk;
    reg rst;
    reg [127:0] ciphertext;
    reg [255:0] key_i;
    wire [127:0] plaintext;

    // Instantiate the encryptiontop module
    decryptiontop uut (
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
        $dumpfile("decryptiontop.vcd");
        $dumpvars(0, decryptiontop_tb);
        clk = 0;
        rst = 1;
        ciphertext = 128'h96d7fc70869423fa7e946bead1d1a6cb;
        key_i = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;

        // Apply reset
        #10 rst = 0;

        // Wait for encryption to complete
        #4000;

        // Check the result
        $display("Plaintext: %h", plaintext);

        // Finish simulation
        $finish;
    end

endmodule
// iverilog -o decryptiontop.out decryptiontop.v decryptiontop_tb.v
// vvp decryptiontop.out