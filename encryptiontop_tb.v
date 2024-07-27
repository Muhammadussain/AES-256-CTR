// module encryptiontop_tb;

//     reg clk;
//     reg rst;
//     // reg start;
//     reg [127:0] plaintext;
//     reg [255:0] key_i;
//     wire [127:0] ciphertext;
//     wire done;

//     // Instantiate the encryptiontop module
//     encryptiontop uut (
//         .clk(clk),
//         .rst(rst),
//         // .start(start),
//         .plaintext(plaintext),
//         .key_i(key_i),
//         .ciphertext(ciphertext)
//         // .done(done)
//     );

//     // Clock generation
//     always #5 clk = ~clk;

//     initial begin
//         // Initialize signals
//         $dumpfile("encryptiontop.vcd");
//         $dumpvars(0, encryptiontop_tb);
//         clk = 1;
//         rst = 1;
//         // start = 0;
//         plaintext = 128'h00112233445566778899aabbccddeeff;
//         key_i = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;

//         // Apply reset
//         #10 rst = 0;

//         // Start encryption
//         // #10 start = 1;
//         // #10 start = 0;

//         // Wait for the encryption process to complete
//         // wait(done);

//         // Check ciphertext
//         $display("Ciphertext: %h", ciphertext);

//         // End simulation
//         #500 $finish;
//     end

// endmodule
// // iverilog -o encryptiontop.out encryptiontop.v encryptiontop_tb.v
// // vvp encryptiontop.out
// // gtkwave encryptiontop.vcd
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
        #500;

        // Check the result
        $display("Ciphertext: %h", ciphertext);

        // Finish simulation
        $finish;
    end

endmodule
