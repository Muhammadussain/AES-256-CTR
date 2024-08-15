module inverse_mixcolumn (
    input wire [127:0] mixcolumn_i,
    output reg [127:0] mixcolumn_o
);

    function [7:0] mult_02(input [7:0] x);
        begin
            mult_02 = {x[6:0], 1'b0} ^ (8'h1b & {8{x[7]}});
        end
    endfunction

    function [7:0] mult_09(input [7:0] x);
        begin
            mult_09 = mult_02(mult_02(mult_02(x))) ^ x;
        end
    endfunction

    function [7:0] mult_0b(input [7:0] x);
        begin
            mult_0b = mult_02(mult_02(mult_02(x))) ^ mult_02(x) ^ x;
        end
    endfunction

    function [7:0] mult_0d(input [7:0] x);
        begin
            mult_0d = mult_02(mult_02(mult_02(x))) ^ mult_02(mult_02(x)) ^ x;
        end
    endfunction

    function [7:0] mult_0e(input [7:0] x);
        begin
            mult_0e = mult_02(mult_02(mult_02(x))) ^ mult_02(mult_02(x)) ^ mult_02(x);
        end
    endfunction

    reg [31:0] col0, col1, col2, col3;
    reg [31:0] col0_out, col1_out, col2_out, col3_out;
    reg [7:0] s0, s1, s2, s3;
    reg [7:0] s0_out, s1_out, s2_out, s3_out;

    always @(*) begin
    
        col0 = mixcolumn_i[31:0];
        col1 = mixcolumn_i[63:32];
        col2 = mixcolumn_i[95:64];
        col3 = mixcolumn_i[127:96];

        // Inverse MixColumns for col0
        s0 = col0[7:0]; s1 = col0[15:8]; s2 = col0[23:16]; s3 = col0[31:24];
        s0_out = mult_0e(s0) ^ mult_0b(s1) ^ mult_0d(s2) ^ mult_09(s3);
        s1_out = mult_09(s0) ^ mult_0e(s1) ^ mult_0b(s2) ^ mult_0d(s3);
        s2_out = mult_0d(s0) ^ mult_09(s1) ^ mult_0e(s2) ^ mult_0b(s3);
        s3_out = mult_0b(s0) ^ mult_0d(s1) ^ mult_09(s2) ^ mult_0e(s3);
        col0_out = {s3_out, s2_out, s1_out, s0_out};

        // Inverse MixColumns for col1
        s0 = col1[7:0]; s1 = col1[15:8]; s2 = col1[23:16]; s3 = col1[31:24];
        s0_out = mult_0e(s0) ^ mult_0b(s1) ^ mult_0d(s2) ^ mult_09(s3);
        s1_out = mult_09(s0) ^ mult_0e(s1) ^ mult_0b(s2) ^ mult_0d(s3);
        s2_out = mult_0d(s0) ^ mult_09(s1) ^ mult_0e(s2) ^ mult_0b(s3);
        s3_out = mult_0b(s0) ^ mult_0d(s1) ^ mult_09(s2) ^ mult_0e(s3);
        col1_out = {s3_out, s2_out, s1_out, s0_out};

        // Inverse MixColumns for col2
        s0 = col2[7:0]; s1 = col2[15:8]; s2 = col2[23:16]; s3 = col2[31:24];
        s0_out = mult_0e(s0) ^ mult_0b(s1) ^ mult_0d(s2) ^ mult_09(s3);
        s1_out = mult_09(s0) ^ mult_0e(s1) ^ mult_0b(s2) ^ mult_0d(s3);
        s2_out = mult_0d(s0) ^ mult_09(s1) ^ mult_0e(s2) ^ mult_0b(s3);
        s3_out = mult_0b(s0) ^ mult_0d(s1) ^ mult_09(s2) ^ mult_0e(s3);
        col2_out = {s3_out, s2_out, s1_out, s0_out};

        // Inverse MixColumns for col3
        s0 = col3[7:0]; s1 = col3[15:8]; s2 = col3[23:16]; s3 = col3[31:24];
        s0_out = mult_0e(s0) ^ mult_0b(s1) ^ mult_0d(s2) ^ mult_09(s3);
        s1_out = mult_09(s0) ^ mult_0e(s1) ^ mult_0b(s2) ^ mult_0d(s3);
        s2_out = mult_0d(s0) ^ mult_09(s1) ^ mult_0e(s2) ^ mult_0b(s3);
        s3_out = mult_0b(s0) ^ mult_0d(s1) ^ mult_09(s2) ^ mult_0e(s3);
        col3_out = {s3_out, s2_out, s1_out, s0_out};

        mixcolumn_o = {col3_out, col2_out, col1_out, col0_out};
    end
    
endmodule

