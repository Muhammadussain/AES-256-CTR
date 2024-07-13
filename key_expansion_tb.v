module tb_keyexpansion;

    // Testbench signals
    reg clk;
    reg rst;
    reg [255:0] key;
    wire [127:0] out_key;

    // Instantiate the keyexpansion module
    keyexpansion uut (
        .key(key),
        .clk(clk),
        .rst(rst),
        .out_key(out_key)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        key = 256'h0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;

        // Reset the system
        #10;
        rst = 0;
        #10;
        rst = 1;

        // Apply test vectors
        #160; // Run simulation for some time

        // End simulation
        $stop;
    end

    // Waveform dump
    initial begin
        $dumpfile("keyexpansion_tb.vcd");
        $dumpvars(0, tb_keyexpansion);
    end

endmodule
