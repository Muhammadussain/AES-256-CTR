module keyexpansion_tb;

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
        key = 256'h642423baa95efb4362d3f2ce993c0904150f258aa1fe796841d7b4429c9b5a30;

        // Reset the system
        #10;
        rst = 0;
        #10;
        // rst = 1;

        // Apply test vectors
        #1100; // Run simulation for some time

        // End simulation
        $finish;
        
    end

    // Waveform dump
    initial begin
        $dumpfile("keyexpansion.vcd");
        $dumpvars(0,keyexpansion_tb);
    end

 endmodule
// iverilog -o key_expansion.out key_expansion.v key_expansion_tb.v
// vvp key_expansion.out
// gtkwave keyexpansion.vcd