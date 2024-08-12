// Multiply s0 by 0x0e
        //temp = {s0[6:0], 1'b0};
        //temp = temp ^ (8'h1b & {8{s0[7]}});
        //x_s0 = temp;
// Multiply s0 by 0x0b
        //temp = x_s0;
       // temp = {temp[6:0], 1'b0} ^ (8'h1b & {8{temp[7]}});
       // x_s0 = temp ^ s0;
// Multiply s0 by 0x0d
        //x_s0 = x_s0 ^ {x_s0[6:0], 1'b0} ^ (8'h1b & {8{x_s0[7]}});

//mul by 0x09
        //x_s3 ^ {x_s3[6:0], 1'b0}

        // Function to perform multiplication in GF(2^8)
   // function [7:0] xtime;
        //input [7:0] b;
       // begin
            //xtime = {b[6:0], 1'b0} ^ (8'h1b & {8{b[7]}});
        //end
   // endfunction

    // Function to perform multiplication by 2 in GF(2^8)
    //function [7:0] mul2;
        //input [7:0] b;
       // begin
           // mul2 = xtime(b);
       // end
   // endfunction

    // Function to perform multiplication by 3 in GF(2^8)
   // function [7:0] mul3;
        //input [7:0] b;
        //begin
            //mul3 = xtime(b) ^ b;
        //end
    //endfunction

   // assign col0_out[31:24] = mul2(col0[31:24]) ^ mul3(col0[23:16]) ^ col0[15:8]  ^ col0[7:0];
    //assign col0_out[23:16] = col0[31:24] ^ mul2(col0[23:16]) ^ mul3(col0[15:8])  ^ col0[7:0];
    //assign col0_out[15:8]  = col0[31:24] ^ col0[23:16] ^ mul2(col0[15:8]) ^ mul3(col0[7:0]);
    //assign col0_out[7:0]   = mul3(col0[31:24]) ^ col0[23:16] ^ col0[15:8] ^ mul2(col0[7:0]);


//module mixcolumn (
  //  input wire [127:0] mixcolumn_i,
    //output reg [127:0] mixcolumn_o
//);
  // reg [31:0] col0,col1,col2,col3;
   //reg [31:0] col0_out,col1_out,col2_out,col3_out;
 //  reg [7:0] s0,s1,s2,s3;
   //reg [7:0] s0_out,s1_out,s2_out,s3_out;
 //  reg [7:0] x_s0,x_s1,x_s2,x_s3,x_b0,x_b1,x_b2,x_b3;

   //always @(*)begin

    // col0 = mixcolumn_i [31:0];
     //col1 = mixcolumn_i [63:32];
     //col2 = mixcolumn_i [95:64];
     //col3 = mixcolumn_i [127:96];


     // MixColumns transformation for col0
     //s0 = col0[7:0]; s1 = col0[15:8]; s2 = col0[23:16]; s3 = col0[31:24];

     //multiply by0x0E
     //x_s0 = {s0[6:0],1'b0} ^ (8'h1b & {8{s0[7]}});
    // x_s1 = {s1[6:0],1'b0} ^ (8'h1b & {8{s1[7]}});
     //x_s2 = {s2[6:0],1'b0} ^ (8'h1b & {8{s2[7]}}); 
     //x_s3 = {s3[6:0],1'b0} ^ (8'h1b & {8{s3[7]}});

     //multiply by0x0B
     //x_b0 = ({temp[6:0], 1'b0} ^ (8'h1b & {8{temp[7]}})) ^ s0;
     //x_b1 = ({temp[6:0], 1'b0} ^ (8'h1b & {8{temp[7]}})) ^ s1;
     //x_b2 = ({temp[6:0], 1'b0} ^ (8'h1b & {8{temp[7]}})) ^ s2;
     //x_b3 = ({temp[6:0], 1'b0} ^ (8'h1b & {8{temp[7]}})) ^ s3;

     //multiply by0x0



     //s0_out = x_s0 ^ (x_s1 ^ s1) ^ s2 ^ s3; // 2*s0 ^ 3*s1 ^ s2 ^ s3
     //s1_out = s0 ^ x_s1 ^ (x_s2 ^ s2) ^ s3; // s0 ^ 2*s1 ^ 3*s2 ^ s3
     //s2_out = s0 ^ s1 ^ x_s2 ^ (x_s3 ^ s3);  // s0 ^ s1 ^ 2*s2 ^ 3*s3
     //s3_out = (x_s0 ^ s0) ^ s1 ^ s2 ^ x_s3; // 3*s0 ^ s1 ^ s2 ^ 2*s3

     //col0_out = {s3_out,s2_out,s1_out,s0_out};

     // MixColumns transformation for col1
     //s0 = col1[7:0]; s1 = col1[15:8]; s2 = col1[23:16]; s3 = col1[31:24];

     //x_s0 = {s0[6:0],1'b0} ^ (8'h1b & {8{s0[7]}});
     //x_s1 = {s1[6:0],1'b0} ^ (8'h1b & {8{s1[7]}});
    // x_s2 = {s2[6:0],1'b0} ^ (8'h1b & {8{s2[7]}}); 
     //x_s3 = {s3[6:0],1'b0} ^ (8'h1b & {8{s3[7]}});

    // s0_out = x_s0 ^ (x_s1 ^ s1) ^ s2 ^ s3; // 2*s0 ^ 3*s1 ^ s2 ^ s3
     //s1_out = s0 ^ x_s1 ^ (x_s2 ^ s2) ^ s3; // s0 ^ 2*s1 ^ 3*s2 ^ s3
     //s2_out = s0 ^ s1 ^ x_s2 ^ (x_s3 ^ s3);  // s0 ^ s1 ^ 2*s2 ^ 3*s3
     //s3_out = (x_s0 ^ s0) ^ s1 ^ s2 ^ x_s3; // 3*s0 ^ s1 ^ s2 ^ 2*s3

     //col1_out = {s3_out,s2_out,s1_out,s0_out};

     // MixColumns transformation for col2
    // s0 = col2[7:0]; s1 = col2[15:8]; s2 = col2[23:16]; s3 = col2[31:24];

     //x_s0 = {s0[6:0],1'b0} ^ (8'h1b & {8{s0[7]}});
     //x_s1 = {s1[6:0],1'b0} ^ (8'h1b & {8{s1[7]}});
     //x_s2 = {s2[6:0],1'b0} ^ (8'h1b & {8{s2[7]}}); 
     //x_s3 = {s3[6:0],1'b0} ^ (8'h1b & {8{s3[7]}});

     ////s0_out = x_s0 ^ (x_s1 ^ s1) ^ s2 ^ s3; // 2*s0 ^ 3*s1 ^ s2 ^ s3
     //s1_out = s0 ^ x_s1 ^ (x_s2 ^ s2) ^ s3; // s0 ^ 2*s1 ^ 3*s2 ^ s3
    // s2_out = s0 ^ s1 ^ x_s2 ^ (x_s3 ^ s3);  // s0 ^ s1 ^ 2*s2 ^ 3*s3
     //s3_out = (x_s0 ^ s0) ^ s1 ^ s2 ^ x_s3; // 3*s0 ^ s1 ^ s2 ^ 2*s3

     //col2_out = {s3_out,s2_out,s1_out,s0_out};

     // MixColumns transformation for col3
     //s0 = col3[7:0]; s1 = col3[15:8]; s2 = col3[23:16]; s3 = col3[31:24];

     //x_s0 = {s0[6:0],1'b0} ^ (8'h1b & {8{s0[7]}});
     //x_s1 = {s1[6:0],1'b0} ^ (8'h1b & {8{s1[7]}});
     //x_s2 = {s2[6:0],1'b0} ^ (8'h1b & {8{s2[7]}}); 
    // x_s3 = {s3[6:0],1'b0} ^ (8'h1b & {8{s3[7]}});

     //s0_out = x_s0 ^ (x_s1 ^ s1) ^ s2 ^ s3; // 2*s0 ^ 3*s1 ^ s2 ^ s3
     //s1_out = s0 ^ x_s1 ^ (x_s2 ^ s2) ^ s3; // s0 ^ 2*s1 ^ 3*s2 ^ s3
     //s2_out = s0 ^ s1 ^ x_s2 ^ (x_s3 ^ s3);  // s0 ^ s1 ^ 2*s2 ^ 3*s3
     ////s3_out = (x_s0 ^ s0) ^ s1 ^ s2 ^ x_s3; // 3*s0 ^ s1 ^ s2 ^ 2*s3

     //col3_out = {s3_out,s2_out,s1_out,s0_out};

     //mixcolumn_o = {col3_out, col2_out, col1_out, col0_out};


    
   //end
    
//endmodule

module inverse_mixcolumn (
    input wire [127:0] mixcolumn_i,
    output reg [127:0] mixcolumn_o
);

    // GF(2^8) multiplication functions
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
    reg[127:0] temp;
    reg [31:0] col0, col1, col2, col3;
    reg [31:0] col0_out, col1_out, col2_out, col3_out;
    reg [7:0] s0, s1, s2, s3;
    reg [7:0] s0_out, s1_out, s2_out, s3_out;

    always @(*) begin
        col0 ={mixcolumn_i[103:96],mixcolumn_i[71:64],mixcolumn_i[39:32],mixcolumn_i[7:0]};
        col1 = {mixcolumn_i[111:104],mixcolumn_i[79:72],mixcolumn_i[47:40],mixcolumn_i[15:8]};
        col2 = {mixcolumn_i[119:112],mixcolumn_i[87:80],mixcolumn_i[55:48],mixcolumn_i[23:16]};;
        col3 = {mixcolumn_i[127:120],mixcolumn_i[95:88],mixcolumn_i[63:56],mixcolumn_i[31:24]};

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


        temp = {col3_out, col2_out, col1_out, col0_out};
        mixcolumn_o[31:0] ={temp[103:96],temp[71:64],temp[39:32],temp[7:0]};
        mixcolumn_o[63:32]= {temp[111:104],temp[79:72],temp[47:40],temp[15:8]};
        mixcolumn_o[95:64] = {temp[119:112],temp[87:80],temp[55:48],temp[23:16]};;
        mixcolumn_o[127:96] = {temp[127:120],temp[95:88],temp[63:56],temp[31:24]};
        
    end
    
endmodule

