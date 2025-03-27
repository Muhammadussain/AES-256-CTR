`timescale 1ns / 1ps

module decryptedctr_tb;
    // Parameters
    parameter CIPHERTEXTIN = 1024;

    // Inputs
    logic [CIPHERTEXTIN-1:0] ciphertext_in;
    logic [255:0] key;
    logic [127:0] iv;
    logic clk;
    logic rst;

    // Outputs
    logic [CIPHERTEXTIN-1:0] decryptedtext;

    // Instantiate the decryptedctr module
    decryptedctr #(
        .CIPHERTEXTIN(CIPHERTEXTIN)
    ) uut (
        .ciphertext_in(ciphertext_in),
        .key(key),
        .iv(iv),
        .clk(clk),
        .rst(rst),
        .decryptedtext(decryptedtext)
    );

    // Clock generation
    always #0.1 clk = ~clk;  // 100 MHz clock

    // Testbench logic
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        ciphertext_in = 0;
        key = 256'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;
        iv = 128'hffeeddccbbaa99887766554433221100;
        
        // Reset the system
        #10 rst = 0;
      //  #10 rst = 1;

        // Test Case 1: Apply a plaintext input and observe the output
        ciphertext_in = 1024'h29e41b63f65ec80aa71739040dd4bf6b90c300cacdf1e6c174e18efca4bd2edae05e970d4ce449fe7fa449400389a31084e0980edc89760a17cf81eb9cd65d1c03e389364e54829b9961222aa0ee974ea9d79e7634b53dce1d448406a43b430e0f68f3199b9460024357306645b1ae77d9036bf3dba55147db69bd9911467a88;
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
        $dumpfile("decryptedctr.vcd");
        $dumpvars(0, decryptedctr_tb);
    end

    // Monitor the outputs
    initial begin
        $monitor("At time %t, decryptedtext = %h", $time, decryptedtext);
    end
endmodule
//decryptedtext//d22db0709729e679160a8b41285f0779766d7f6d7af9298265cfe7239554c5742e9b36f62eeba8cf8148597270872e742c092a14554c32013c451bc4d2f314f5...
//cipher text in//29e41b63f65ec80aa71739040dd4bf6b90c300cacdf1e6c174e18efca4bd2edae05e970d4ce449fe7fa449400389a31084e0980edc89760a17cf81eb9cd65d1c...

//plaiintext =d22db0709729e679160a8b41285f0779766d7f6d7af9298265cfe7239554c5742e9b36f62eeba8cf8148597270872e742c092a14554c32013c451bc4d2f314f5ba9cc254a8b36753e1d0e2b3e63ac718069956e26f5e22bdd8d18db4f434120103a531e7ea1c4a0f30e808271bcc00f6506322b84becadad642cdac8dbf1d806
//encryptedtext=29e41b63f65ec80aa71739040dd4bf6b90c300cacdf1e6c174e18efca4bd2edae05e970d4ce449fe7fa449400389a31084e0980edc89760a17cf81eb9cd65d1c03e389364e54829b9961222aa0ee974ea9d79e7634b53dce1d448406a43b430e0f68f3199b9460024357306645b1ae77d9036bf3dba55147db69bd9911467a88