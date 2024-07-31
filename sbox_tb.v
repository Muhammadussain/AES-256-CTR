module tb_sbox;

    reg [127:0] s_in;
    reg clk;
     reg rst; // Uncomment if reset is needed in the module
    wire [127:0] s_o;

    // Instantiate the sbox module
    sbox uut (
        .s_in(s_in),
        .clk(clk),
         .rst(rst), // Uncomment if reset is needed in the module
        .s_o(s_o) // Change sub_o to s_out to match the module definition
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk;  // 100 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
         rst = 1; // Uncomment if reset is needed in the module
        #10;
        s_in = 128'h00112233445566778899aabbccddeeff;
        rst=1'b0;
        // Apply reset
        #10;
       
        // Finish simulation
        #160;
        $finish;
    end

    // Monitor outputs
    // initial begin
    //     $monitor("Time=%0d, s_in=%h, s_out=%h", $time, s_in, s_out);
    // end

    // Generate waveform file
    initial begin
        $dumpfile("sbox.vcd");
        $dumpvars(0, tb_sbox);
    end
endmodule
