`timescale 1ns / 1ps

module encryptedctr_tb;
    // Parameters
    parameter PLAINTEXTIN = 1024;

    // Inputs
    logic [PLAINTEXTIN-1:0] plaintext_in;
    logic [255:0] key;
    logic [127:0] iv;
    logic clk;
    logic rst;

    // Outputs
    logic [PLAINTEXTIN-1:0] encryptedtext;

    // Instantiate the encryptedctr module
    encryptedctr #(
        .PLAINTEXTIN(PLAINTEXTIN)
    ) uut (
        .plaintext_in(plaintext_in),
        .key(key),
        .iv(iv),
        .clk(clk),
        .rst(rst),
        .encryptedtext(encryptedtext)
    );

    // Clock generation
    always #0.1 clk = ~clk;  // 100 MHz clock

    // Testbench logic
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        plaintext_in = 0;
        key = 256'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;
        iv = 128'hffeeddccbbaa99887766554433221100;
        
        // Reset the system
        #10 rst = 0;
      //  #10 rst = 1;
        // Test Case 1: Apply a plaintext input and observe the output
        plaintext_in = 1024'hD22DB0709729E679160A8B41285F0779766D7F6D7AF9298265CFE7239554C5742E9B36F62EEBA8CF8148597270872E742C092A14554C32013C451BC4D2F314F5BA9CC254A8B36753E1D0E2B3E63AC718069956E26F5E22BDD8D18DB4F434120103A531E7EA1C4A0F30E808271BCC00F6506322B84BECADAD642CDAC8DBF1D806;
;
        #50;  // Wait for some time to observe the output

        // Test Case 2: Change the IV and see if the output changes
        iv = 128'hffeeddccbbaa99887766554433221100;
        //#50;

        // Test Case 3: Change the plaintext and see how it affects the output
       // plaintext_in = 1024'habcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;
        #35000;

        // Finish the simulation
        $finish;
    end
    initial begin
        $dumpfile("encryptedctr.vcd");
        $dumpvars(0, encryptedctr_tb);
    end

    // Monitor the outputs
    initial begin
       $monitor("At time %t, encryptedtext = %h", $time, encryptedtext);
    end
endmodule
