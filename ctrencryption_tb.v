`timescale 1ns/1ps

module ctrencryption_tb;
    // Inputs
    reg [1023:0] plaintext_in;  // Up to 2000 bits of plaintext
    reg [255:0] key;
    reg [127:0] iv;
    reg clk;
    reg rst;

    // Output
    wire [1999:0] text;

    // Instantiate the ctr_encryption module
    ctrencryption uut (
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
        // plaintext_in = 1024'h0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
        // key = 256'h0;
        // iv = 128'h0;

        // Apply Reset
        #10 rst = 0;

        // Test Case 1: Basic input
        #10 plaintext_in = 1024'h0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
            key = 256'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;
            iv = 128'hffeeddccbbaa99887766554433221100;
        // #10;
        // plaintext_in=1024'h0;
        // iv=128'h0;
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
 
    // Dump file and dump variables for waveform generation
    initial begin
        $dumpfile("ctrencryption.vcd");  // Specify the dump file name
        $dumpvars(0, ctrencryption_tb);     // Dump all variables in the testbench
    end
endmodule
