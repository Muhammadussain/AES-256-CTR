// module mixcolumn (
//     input wire [127:0] mixcolumn_i,
//     output reg [127:0] mixcolumn_o
// );
//    reg[127:0] temp;
//    reg[31:0] COLUMN_1,COLUMN_2,COLUMN_3,COLUMN_4,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,NEW_COLUMN_1,NEW_COLUMN_2,NEW_COLUMN_3,NEW_COLUMN_4;
//     always @(*) begin
    
    
    
//     COLUMN_1={mixcolumn_i[103:96],mixcolumn_i[71:64],mixcolumn_i[39:32],mixcolumn_i[7:0]};
//     COLUMN_2={mixcolumn_i[111:104],mixcolumn_i[79:72],mixcolumn_i[47:40],mixcolumn_i[15:8]};
//     COLUMN_3={mixcolumn_i[119:112],mixcolumn_i[87:80],mixcolumn_i[55:48],mixcolumn_i[23:16]};
//     COLUMN_4={mixcolumn_i[127:120],mixcolumn_i[95:88],mixcolumn_i[63:56],mixcolumn_i[31:24]};
    

//      temp1[7:0]=(COLUMN_1[7]?(COLUMN_1[7:0]<<1'h1) ^8'h1B:COLUMN_1[7:0]<<1);
//      temp2 = (COLUMN_1[15] ? ((COLUMN_1[15:8] << 1) ^ 8'h1B) : (COLUMN_1[15:8] << 1));
//      temp1[15:8] = temp2 ^ COLUMN_1[15:8];
//      temp1 [23:16]=COLUMN_1[23:16];
//      temp1 [31:24]=COLUMN_1[31:24];
//      NEW_COLUMN_1[7:0] =temp1[31:24]^temp1[23:16]^temp1[15:8]^temp1[7:0];
    
//      temp1 [7:0]=COLUMN_1[7:0];
//      temp1[15:8] =(COLUMN_1[15]?(COLUMN_1[15:8] <<1'h1) ^8'h1B:COLUMN_1[15:8] <<1);
//      temp2 = (COLUMN_1[23] ? ((COLUMN_1[23:16] << 1) ^ 8'h1B) : (COLUMN_1[23:16] << 1));
//      temp1[23:16] = temp2 ^ COLUMN_1[23:16];
//      temp1 [31:24]=COLUMN_1[31:24];
//      NEW_COLUMN_1[15:8] =temp1[31:24]^temp1[23:16]^temp1[15:8]^temp1[7:0];

//      temp1 [7:0]=COLUMN_1[7:0];
//      temp1 [15:8]=COLUMN_1[15:8];
//      temp1[23:16]=(COLUMN_1[23]?(COLUMN_1[23:16] <<1'h1) ^8'h1B:COLUMN_1[23:16] <<1);
//      temp2 = (COLUMN_1[31] ? ((COLUMN_1[31:24] << 1) ^ 8'h1B) : (COLUMN_1[31:24] << 1));
//      temp1[31:24] = temp2 ^ COLUMN_1[31:24];
//      NEW_COLUMN_1[23:16] =temp1[31:24]^temp1[23:16]^temp1[15:8]^temp1[7:0];


//      temp2 = (COLUMN_1[7] ? ((COLUMN_1[7:0] << 1) ^ 8'h1B) : (COLUMN_1[7:0] << 1));
//      temp1[7:0] = temp2 ^ COLUMN_1[7:0];
//      temp1 [15:8] =COLUMN_1[15:8] ;
//      temp1 [23:16] =COLUMN_1[23:16] ;
//      temp1[31:24] =(COLUMN_1[31]?(COLUMN_1[31:24] <<1'h1) ^8'h1B:COLUMN_1[31:24] <<1);
//      NEW_COLUMN_1[31:24] =temp1[31:24]^temp1[23:16]^temp1[15:8]^temp1[7:0];
    
// // column

//       temp3[7:0]=(COLUMN_2[7]?(COLUMN_2[7:0]<<1'h1) ^8'h1B:COLUMN_2[7:0]<<1);
//      temp4 = (COLUMN_2[15] ? ((COLUMN_2[15:8] << 1) ^ 8'h1B) : (COLUMN_2[15:8] << 1));
//      temp3[15:8] = temp4 ^ COLUMN_2[15:8];
//      temp3 [23:16]=COLUMN_2[23:16];
//      temp3 [31:24]=COLUMN_2[31:24];
//      NEW_COLUMN_2[7:0] =temp3[31:24]^temp3[23:16]^temp3[15:8]^temp3[7:0];
    
//      temp3 [7:0]=COLUMN_2[7:0];
//      temp3[15:8] =(COLUMN_2[15]?(COLUMN_2[15:8] <<1'h1) ^8'h1B:COLUMN_2[15:8] <<1);
//      temp4 = (COLUMN_2[23] ? ((COLUMN_2[23:16] << 1) ^ 8'h1B) : (COLUMN_2[23:16] << 1));
//      temp3[23:16] = temp4 ^ COLUMN_2[23:16];
//      temp3 [31:24]=COLUMN_2[31:24];
//      NEW_COLUMN_2[15:8] =temp3[31:24]^temp3[23:16]^temp3[15:8]^temp3[7:0];

//      temp3 [7:0]=COLUMN_2[7:0];
//      temp3 [15:8]=COLUMN_2[15:8];
//      temp3[23:16]=(COLUMN_2[23]?(COLUMN_2[23:16] <<1'h1) ^8'h1B:COLUMN_2[23:16] <<1);
//      temp4 = (COLUMN_2[31] ? ((COLUMN_2[31:24] << 1) ^ 8'h1B) : (COLUMN_2[31:24] << 1));
//      temp3[31:24] = temp4 ^ COLUMN_2[31:24];
//      NEW_COLUMN_2[23:16] =temp3[31:24]^temp3[23:16]^temp3[15:8]^temp3[7:0];


//      temp4 = (COLUMN_2[7] ? ((COLUMN_2[7:0] << 1) ^ 8'h1B) : (COLUMN_2[7:0] << 1));
//      temp3[7:0] = temp4 ^ COLUMN_2[7:0];
//      temp3 [15:8] =COLUMN_2[15:8] ;
//      temp3 [23:16] =COLUMN_2[23:16] ;
//      temp3[31:24] =(COLUMN_2[31]?(COLUMN_2[31:24] <<1'h1) ^8'h1B:COLUMN_2[31:24] <<1);
//      NEW_COLUMN_2[31:24] =temp3[31:24]^temp3[23:16]^temp3[15:8]^temp3[7:0];
   

// //column

//       temp5[7:0]=(COLUMN_3[7]?(COLUMN_3[7:0]<<1'h1) ^8'h1B:COLUMN_3[7:0]<<1);
//      temp6 = (COLUMN_3[15] ? ((COLUMN_3[15:8] << 1) ^ 8'h1B) : (COLUMN_3[15:8] << 1));
//      temp5[15:8] = temp6 ^ COLUMN_3[15:8];
//      temp5 [23:16]=COLUMN_3[23:16];
//      temp5 [31:24]=COLUMN_3[31:24];
//      NEW_COLUMN_3[7:0] =temp5[31:24]^temp5[23:16]^temp5[15:8]^temp5[7:0];
    
//      temp5 [7:0]=COLUMN_3[7:0];
//      temp5[15:8] =(COLUMN_3[15]?(COLUMN_3[15:8] <<1'h1) ^8'h1B:COLUMN_3[15:8] <<1);
//      temp6 = (COLUMN_3[23] ? ((COLUMN_3[23:16] << 1) ^ 8'h1B) : (COLUMN_3[23:16] << 1));
//      temp5[23:16] = temp6 ^ COLUMN_3[23:16];
//      temp5 [31:24]=COLUMN_3[31:24];
//      NEW_COLUMN_3[15:8] =temp5[31:24]^temp5[23:16]^temp5[15:8]^temp5[7:0];

//      temp5 [7:0]=COLUMN_3[7:0];
//      temp5 [15:8]=COLUMN_3[15:8];
//      temp5[23:16]=(COLUMN_3[23]?(COLUMN_3[23:16] <<1'h1) ^8'h1B:COLUMN_3[23:16] <<1);
//      temp6 = (COLUMN_3[31] ? ((COLUMN_3[31:24] << 1) ^ 8'h1B) : (COLUMN_3[31:24] << 1));
//      temp5[31:24] = temp6 ^ COLUMN_3[31:24];
//      NEW_COLUMN_3[23:16] =temp5[31:24]^temp5[23:16]^temp5[15:8]^temp5[7:0];


//      temp6 = (COLUMN_3[7] ? ((COLUMN_3[7:0] << 1) ^ 8'h1B) : (COLUMN_3[7:0] << 1));
//      temp5[7:0] = temp6 ^ COLUMN_3[7:0];
//      temp5 [15:8] =COLUMN_3[15:8] ;
//      temp5 [23:16] =COLUMN_3[23:16] ;
//      temp5[31:24] =(COLUMN_3[31]?(COLUMN_3[31:24] <<1'h1) ^8'h1B:COLUMN_3[31:24] <<1);
//      NEW_COLUMN_3[31:24] =temp5[31:24]^temp5[23:16]^temp5[15:8]^temp5[7:0];

// //column

//       temp7[7:0]=(COLUMN_4[7]?(COLUMN_4[7:0]<<1'h1) ^8'h1B:COLUMN_4[7:0]<<1);
//      temp8 = (COLUMN_4[15] ? ((COLUMN_4[15:8] << 1) ^ 8'h1B) : (COLUMN_4[15:8] << 1));
//      temp7[15:8] = temp8 ^ COLUMN_4[15:8];
//      temp7 [23:16]=COLUMN_4[23:16];
//      temp7 [31:24]=COLUMN_4[31:24];
//      NEW_COLUMN_4[7:0] =temp7[31:24]^temp7[23:16]^temp7[15:8]^temp7[7:0];
    
//      temp7 [7:0]=COLUMN_4[7:0];
//      temp7[15:8] =(COLUMN_4[15]?(COLUMN_4[15:8] <<1'h1) ^8'h1B:COLUMN_4[15:8] <<1);
//      temp8 = (COLUMN_4[23] ? ((COLUMN_4[23:16] << 1) ^ 8'h1B) : (COLUMN_4[23:16] << 1));
//      temp7[23:16] = temp8 ^ COLUMN_4[23:16];
//      temp7 [31:24]=COLUMN_4[31:24];
//      NEW_COLUMN_4[15:8] =temp7[31:24]^temp7[23:16]^temp7[15:8]^temp7[7:0];

//      temp7 [7:0]=COLUMN_4[7:0];
//      temp7 [15:8]=COLUMN_4[15:8];
//      temp7[23:16]=(COLUMN_4[23]?(COLUMN_4[23:16] <<1'h1) ^8'h1B:COLUMN_4[23:16] <<1);
//      temp8 = (COLUMN_4[31] ? ((COLUMN_4[31:24] << 1) ^ 8'h1B) : (COLUMN_4[31:24] << 1));
//      temp7[31:24] = temp8 ^ COLUMN_4[31:24];
//      NEW_COLUMN_4[23:16] =temp7[31:24]^temp7[23:16]^temp7[15:8]^temp7[7:0];


//      temp8 = (COLUMN_4[7] ? ((COLUMN_4[7:0] << 1) ^ 8'h1B) : (COLUMN_4[7:0] << 1));
//      temp7[7:0] = temp8 ^ COLUMN_4[7:0];
//      temp7 [15:8] =COLUMN_4[15:8] ;
//      temp7 [23:16] =COLUMN_4[23:16] ;
//      temp7[31:24] =(COLUMN_4[31]?(COLUMN_4[31:24] <<1'h1) ^8'h1B:COLUMN_4[31:24] <<1);
//      NEW_COLUMN_4[31:24] =temp7[31:24]^temp7[23:16]^temp7[15:8]^temp7[7:0];

//  temp={NEW_COLUMN_4,NEW_COLUMN_3,NEW_COLUMN_2,NEW_COLUMN_1};
//    mixcolumn_o[31:0] ={temp[103:96],temp[71:64],temp[39:32],temp[7:0]};
//         mixcolumn_o[63:32]= {temp[111:104],temp[79:72],temp[47:40],temp[15:8]};
//         mixcolumn_o[95:64] = {temp[119:112],temp[87:80],temp[55:48],temp[23:16]};;
//         mixcolumn_o[127:96] = {temp[127:120],temp[95:88],temp[63:56],temp[31:24]};

//     end

// endmodule

module mixcolumn (
    input wire [127:0] mixcolumn_i,
    output reg [127:0] mixcolumn_o
);
   reg [31:0] col0,col1,col2,col3;
   reg [31:0] col0_out,col1_out,col2_out,col3_out;
   reg [7:0] s0,s1,s2,s3;
   reg [7:0] s0_out,s1_out,s2_out,s3_out;
   reg [7:0] x_s0,x_s1,x_s2,x_s3;

   always @(*)begin

    // col0 ={mixcolumn_i[103:96],mixcolumn_i[71:64],mixcolumn_i[39:32],mixcolumn_i[7:0]};
    // col1 ={mixcolumn_i[111:104],mixcolumn_i[79:72],mixcolumn_i[47:40],mixcolumn_i[15:8]};
    // col2 ={mixcolumn_i[119:112],mixcolumn_i[87:80],mixcolumn_i[55:48],mixcolumn_i[23:16]};
    //  col3={mixcolumn_i[127:120],mixcolumn_i[95:88],mixcolumn_i[63:56],mixcolumn_i[31:24]};
     col0 = mixcolumn_i [31:0];
     col1 = mixcolumn_i [63:32];
     col2 = mixcolumn_i [95:64];
     col3 = mixcolumn_i [127:96];


     // MixColumns transformation for col0
     s0 = col0[7:0]; s1 = col0[15:8]; s2 = col0[23:16]; s3 = col0[31:24];

     x_s0 = {s0[6:0],1'b0} ^ (8'h1b & {8{s0[7]}});
     x_s1 = {s1[6:0],1'b0} ^ (8'h1b & {8{s1[7]}});
     x_s2 = {s2[6:0],1'b0} ^ (8'h1b & {8{s2[7]}}); 
     x_s3 = {s3[6:0],1'b0} ^ (8'h1b & {8{s3[7]}});

     s0_out = x_s0 ^ (x_s1 ^ s1) ^ s2 ^ s3; // 2*s0 ^ 3*s1 ^ s2 ^ s3
     s1_out = s0 ^ x_s1 ^ (x_s2 ^ s2) ^ s3; // s0 ^ 2*s1 ^ 3*s2 ^ s3
     s2_out = s0 ^ s1 ^ x_s2 ^ (x_s3 ^ s3);  // s0 ^ s1 ^ 2*s2 ^ 3*s3
     s3_out = (x_s0 ^ s0) ^ s1 ^ s2 ^ x_s3; // 3*s0 ^ s1 ^ s2 ^ 2*s3

     col0_out = {s3_out,s2_out,s1_out,s0_out};

     // MixColumns transformation for col1
     s0 = col1[7:0]; s1 = col1[15:8]; s2 = col1[23:16]; s3 = col1[31:24];

     x_s0 = {s0[6:0],1'b0} ^ (8'h1b & {8{s0[7]}});
     x_s1 = {s1[6:0],1'b0} ^ (8'h1b & {8{s1[7]}});
     x_s2 = {s2[6:0],1'b0} ^ (8'h1b & {8{s2[7]}}); 
     x_s3 = {s3[6:0],1'b0} ^ (8'h1b & {8{s3[7]}});

     s0_out = x_s0 ^ (x_s1 ^ s1) ^ s2 ^ s3; // 2*s0 ^ 3*s1 ^ s2 ^ s3
     s1_out = s0 ^ x_s1 ^ (x_s2 ^ s2) ^ s3; // s0 ^ 2*s1 ^ 3*s2 ^ s3
     s2_out = s0 ^ s1 ^ x_s2 ^ (x_s3 ^ s3);  // s0 ^ s1 ^ 2*s2 ^ 3*s3
     s3_out = (x_s0 ^ s0) ^ s1 ^ s2 ^ x_s3; // 3*s0 ^ s1 ^ s2 ^ 2*s3

     col1_out = {s3_out,s2_out,s1_out,s0_out};

     // MixColumns transformation for col2
     s0 = col2[7:0]; s1 = col2[15:8]; s2 = col2[23:16]; s3 = col2[31:24];

     x_s0 = {s0[6:0],1'b0} ^ (8'h1b & {8{s0[7]}});
     x_s1 = {s1[6:0],1'b0} ^ (8'h1b & {8{s1[7]}});
     x_s2 = {s2[6:0],1'b0} ^ (8'h1b & {8{s2[7]}}); 
     x_s3 = {s3[6:0],1'b0} ^ (8'h1b & {8{s3[7]}});

     s0_out = x_s0 ^ (x_s1 ^ s1) ^ s2 ^ s3; // 2*s0 ^ 3*s1 ^ s2 ^ s3
     s1_out = s0 ^ x_s1 ^ (x_s2 ^ s2) ^ s3; // s0 ^ 2*s1 ^ 3*s2 ^ s3
     s2_out = s0 ^ s1 ^ x_s2 ^ (x_s3 ^ s3);  // s0 ^ s1 ^ 2*s2 ^ 3*s3
     s3_out = (x_s0 ^ s0) ^ s1 ^ s2 ^ x_s3; // 3*s0 ^ s1 ^ s2 ^ 2*s3

     col2_out = {s3_out,s2_out,s1_out,s0_out};

     // MixColumns transformation for col3
     s0 = col3[7:0]; s1 = col3[15:8]; s2 = col3[23:16]; s3 = col3[31:24];

     x_s0 = {s0[6:0],1'b0} ^ (8'h1b & {8{s0[7]}});
     x_s1 = {s1[6:0],1'b0} ^ (8'h1b & {8{s1[7]}});
     x_s2 = {s2[6:0],1'b0} ^ (8'h1b & {8{s2[7]}}); 
     x_s3 = {s3[6:0],1'b0} ^ (8'h1b & {8{s3[7]}});

     s0_out = x_s0 ^ (x_s1 ^ s1) ^ s2 ^ s3; // 2*s0 ^ 3*s1 ^ s2 ^ s3
     s1_out = s0 ^ x_s1 ^ (x_s2 ^ s2) ^ s3; // s0 ^ 2*s1 ^ 3*s2 ^ s3
     s2_out = s0 ^ s1 ^ x_s2 ^ (x_s3 ^ s3);  // s0 ^ s1 ^ 2*s2 ^ 3*s3
     s3_out = (x_s0 ^ s0) ^ s1 ^ s2 ^ x_s3; // 3*s0 ^ s1 ^ s2 ^ 2*s3

     col3_out = {s3_out,s2_out,s1_out,s0_out};

     mixcolumn_o = {col3_out, col2_out, col1_out, col0_out};


    
   end
    
endmodule
