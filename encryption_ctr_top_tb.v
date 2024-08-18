`timescale 1ns/1ps

module ctr_encryption_tb;
    // Inputs
    reg [1023:0] plaintext_in;  // Up to 2000 bits of plaintext
    reg [255:0] key;
    reg [127:0] iv;
    reg clk;
    reg rst;

    // Output
    wire [1999:0] text;

    // Instantiate the ctr_encryption module
    ctr_encryption uut (
        .plaintext_in(plaintext_in),
        .key(key),
        .iv(iv),
        .clk(clk),
        .rst(rst),
        .text(text)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        plaintext_in = 1024'h0;
        key = 256'h0;
        iv = 128'h0;

        // Apply Reset
        #10 rst = 0;

        // Test Case 1: Basic input
        #10 plaintext_in = 1024'h0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
            key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
            iv = 128'h00112233445566778899aabbccddeeff;

        // // Test Case 2: Larger input
        // #20 plaintext_in = 1024'hff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00;
        //     key = 256'hffeeddccbbaa99887766554433221100ffeeddccbbaa99887766554433221100;
        //     iv = 128'h11223344556677889900aabbccddeeff;

        // // Test Case 3: Max-length input
        // #20 plaintext_in = 1024'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        //     key = 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        //     iv = 128'hffffffffffffffffffffffffffffffff;

        // // Test Case 4: Reset during operation
        // #10 rst = 1;
        // #10 rst = 0;
        
        // // Test Case 5: Random input
        // #20 plaintext_in = 1024'hdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef;
        //     key = 256'hcafebabecafebabecafebabecafebabecafebabecafebabecafebabecafebabe;
        //     iv = 128'hbeefbeefbeefbeefbeefbeefbeefbeef;
            
        // Finish simulation after some time
        #12000 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t: plaintext_in=%h, key=%h, iv=%h, text=%h", $time, plaintext_in, key, iv, text);
    end

    // Dump file and dump variables for waveform generation
    initial begin
        $dumpfile("ctr_encryption_tb.vcd");  // Specify the dump file name
        $dumpvars(0, ctr_encryption_tb);     // Dump all variables in the testbench
    end
endmodule
