module tb_dynamic_concat;

    // Inputs
    reg [127:0] dynamic_input;
    reg [7:0] length;

    // Output
    wire [127:0] fixed_output;

    // Instantiate the Unit Under Test (UUT)
    dynamic_concat uut (
        .dynamic_input(dynamic_input),
        .length(length),
        .fixed_output(fixed_output)
    );

    initial begin
        // Test Case 1: Full 128-bit input
        dynamic_input = 128'h123456789ABCDEF0123456789ABCDEF0;
        length = 8'd128;
        #10;
        $display("Test Case 1 - Full 128-bit input");
        $display("Input: %h", dynamic_input);
        $display("Length: %d", length);
        $display("Output: %h\n", fixed_output);

        // Test Case 2: 64-bit input
        dynamic_input = 128'h123456789ABCDEF0123456789ABCDEF0;
        length = 8'd64;
        #10;
        $display("Test Case 2 - 64-bit input");
        $display("Input: %h", dynamic_input);
        $display("Length: %d", length);
        $display("Output: %h\n", fixed_output);

        // Test Case 3: 32-bit input
        dynamic_input = 128'h123456789ABCDEF0123456789ABCDEF0;
        length = 8'd32;
        #10;
        $display("Test Case 3 - 32-bit input");
        $display("Input: %h", dynamic_input);
        $display("Length: %d", length);
        $display("Output: %h\n", fixed_output);

        // Test Case 4: 16-bit input
        dynamic_input = 128'h123456789ABCDEF6789ABCDEF0;
        length = 8'd16;
        #10;
        $display("Test Case 4 - 16-bit input");
        $display("Input: %h", dynamic_input);
        $display("Length: %d", length);
        $display("Output: %h\n", fixed_output);

        // Test Case 5: 0-bit input
        dynamic_input = 128'h123456789ABCDEF0123456789;
        length = 8'd32;
        #10;
        $display("Test Case 5 - 0-bit input");
        $display("Input: %h", dynamic_input);
        $display("Length: %d", length);
        $display("Output: %h\n", fixed_output);

        $finish;
    end
endmodule
