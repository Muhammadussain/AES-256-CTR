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
        // Initialize signals and start VCD file dump
        $dumpfile("encryptiontop.vcd");
        $dumpvars(0, encryptiontop_tb);
        clk = 0;
        rst = 1;
            key_i = 256'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;

        // Apply reset
        #10 rst = 0;
 // Provide first plaintext after reset is deasserted
        #20 plaintext = 128'hffeeddccbbaa99887766554433221102;

        // Clear plaintext after some delay to trigger state change
        #10 plaintext = 128'h00000000000000000000000000000000;

        // // Provide another plaintext after clearing it
        // #100 plaintext = 128'hffeeddccbbaa99887766554433221100;

        // // // Clear plaintext again
        //  #110 plaintext = 128'h00000000000000000000000000000000;
        // // Wait for encryption to complete
        #3000;

        // Check the result
        $display("Ciphertext: %h", ciphertext);

        // Finish simulation
        $finish;
    end

endmodule
