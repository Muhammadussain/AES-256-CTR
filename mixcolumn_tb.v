module mixcolumn_tb;

    reg [127:0] mixcolumn_i;
    wire [127:0] mixcolumn_o;

    mixcolumn uut (
        .mixcolumn_i(mixcolumn_i),
        .mixcolumn_o(mixcolumn_o)
    );

    initial begin
        // Initialize input
        mixcolumn_i = 128'H95D88CA6C34AE746EC904C6E974DF287;

        // Wait for the computation to complete
        #100;

        // Print the output
        $display("Output: %h", mixcolumn_o);
        $finish;
    end

    initial begin
        $dumpfile("mixcolumn.vcd");
        $dumpvars(0, mixcolumn_tb);
    end

endmodule
