module decryptiontop_tb;

    reg clk;
    reg rst;
    reg [127:0] ciphertext;
    reg [255:0] key_i;
    wire [127:0] plaintext;
    reg display_done = 0;

    // Instantiate the decryptiontop module
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
        ciphertext = 128'h8960494b9049fceabf456751cab7a28e;
        key_i = 256'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;

        // Apply reset
        #10 rst = 0;

        // Wait for decryption to complete
        #4000;
        
        // Finish simulation
        $finish;
    end

    // Use $monitor to display plaintext when it's valid for the first time
    initial begin
        $monitor("At time %t, Plaintext = %h", $time, plaintext);
    end

    // Condition to check if plaintext has a valid result and stop simulation
   
    

endmodule
