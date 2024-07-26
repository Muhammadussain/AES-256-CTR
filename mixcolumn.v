module mixcolumn (
    input wire [127:0] mixcolumn_i,
    output reg [127:0] mixcolumn_o
);
   reg[127:0] temp;
   reg[31:0] COLUMN_1,COLUMN_2,COLUMN_3,COLUMN_4,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,NEW_COLUMN_1,NEW_COLUMN_2,NEW_COLUMN_3,NEW_COLUMN_4;
    always @(*) begin
    
    COLUMN_1={mixcolumn_i[103:96],mixcolumn_i[71:64],mixcolumn_i[39:32],mixcolumn_i[7:0]};
    COLUMN_2={mixcolumn_i[111:104],mixcolumn_i[79:72],mixcolumn_i[47:40],mixcolumn_i[15:8]};
    COLUMN_3={mixcolumn_i[119:112],mixcolumn_i[87:80],mixcolumn_i[55:48],mixcolumn_i[23:16]};
    COLUMN_4={mixcolumn_i[127:120],mixcolumn_i[95:88],mixcolumn_i[63:56],mixcolumn_i[31:24]};
    

     temp1[7:0]=(COLUMN_1[7]?(COLUMN_1[7:0]<<1'h1) ^8'h1B:COLUMN_1[7:0]<<1);
     temp2 = (COLUMN_1[15] ? ((COLUMN_1[15:8] << 1) ^ 8'h1B) : (COLUMN_1[15:8] << 1));
     temp1[15:8] = temp2 ^ COLUMN_1[15:8];
     temp1 [23:16]=COLUMN_1[23:16];
     temp1 [31:24]=COLUMN_1[31:24];
     NEW_COLUMN_1[7:0] =temp1[31:24]^temp1[23:16]^temp1[15:8]^temp1[7:0];
    
     temp1 [7:0]=COLUMN_1[7:0];
     temp1[15:8] =(COLUMN_1[15]?(COLUMN_1[15:8] <<1'h1) ^8'h1B:COLUMN_1[15:8] <<1);
     temp2 = (COLUMN_1[23] ? ((COLUMN_1[23:16] << 1) ^ 8'h1B) : (COLUMN_1[23:16] << 1));
     temp1[23:16] = temp2 ^ COLUMN_1[23:16];
     temp1 [31:24]=COLUMN_1[31:24];
     NEW_COLUMN_1[15:8] =temp1[31:24]^temp1[23:16]^temp1[15:8]^temp1[7:0];

     temp1 [7:0]=COLUMN_1[7:0];
     temp1 [15:8]=COLUMN_1[15:8];
     temp1[23:16]=(COLUMN_1[23]?(COLUMN_1[23:16] <<1'h1) ^8'h1B:COLUMN_1[23:16] <<1);
     temp2 = (COLUMN_1[31] ? ((COLUMN_1[31:24] << 1) ^ 8'h1B) : (COLUMN_1[31:24] << 1));
     temp1[31:24] = temp2 ^ COLUMN_1[31:24];
     NEW_COLUMN_1[23:16] =temp1[31:24]^temp1[23:16]^temp1[15:8]^temp1[7:0];


     temp2 = (COLUMN_1[7] ? ((COLUMN_1[7:0] << 1) ^ 8'h1B) : (COLUMN_1[7:0] << 1));
     temp1[7:0] = temp2 ^ COLUMN_1[7:0];
     temp1 [15:8] =COLUMN_1[15:8] ;
     temp1 [23:16] =COLUMN_1[23:16] ;
     temp1[31:24] =(COLUMN_1[31]?(COLUMN_1[31:24] <<1'h1) ^8'h1B:COLUMN_1[31:24] <<1);
     NEW_COLUMN_1[31:24] =temp1[31:24]^temp1[23:16]^temp1[15:8]^temp1[7:0];
    
// column

      temp3[7:0]=(COLUMN_2[7]?(COLUMN_2[7:0]<<1'h1) ^8'h1B:COLUMN_2[7:0]<<1);
     temp4 = (COLUMN_2[15] ? ((COLUMN_2[15:8] << 1) ^ 8'h1B) : (COLUMN_2[15:8] << 1));
     temp3[15:8] = temp4 ^ COLUMN_2[15:8];
     temp3 [23:16]=COLUMN_2[23:16];
     temp3 [31:24]=COLUMN_2[31:24];
     NEW_COLUMN_2[7:0] =temp3[31:24]^temp3[23:16]^temp3[15:8]^temp3[7:0];
    
     temp3 [7:0]=COLUMN_2[7:0];
     temp3[15:8] =(COLUMN_2[15]?(COLUMN_2[15:8] <<1'h1) ^8'h1B:COLUMN_2[15:8] <<1);
     temp4 = (COLUMN_2[23] ? ((COLUMN_2[23:16] << 1) ^ 8'h1B) : (COLUMN_2[23:16] << 1));
     temp3[23:16] = temp4 ^ COLUMN_2[23:16];
     temp3 [31:24]=COLUMN_2[31:24];
     NEW_COLUMN_2[15:8] =temp3[31:24]^temp3[23:16]^temp3[15:8]^temp3[7:0];

     temp3 [7:0]=COLUMN_2[7:0];
     temp3 [15:8]=COLUMN_2[15:8];
     temp3[23:16]=(COLUMN_2[23]?(COLUMN_2[23:16] <<1'h1) ^8'h1B:COLUMN_2[23:16] <<1);
     temp4 = (COLUMN_2[31] ? ((COLUMN_2[31:24] << 1) ^ 8'h1B) : (COLUMN_2[31:24] << 1));
     temp3[31:24] = temp4 ^ COLUMN_2[31:24];
     NEW_COLUMN_2[23:16] =temp3[31:24]^temp3[23:16]^temp3[15:8]^temp3[7:0];


     temp4 = (COLUMN_2[7] ? ((COLUMN_2[7:0] << 1) ^ 8'h1B) : (COLUMN_2[7:0] << 1));
     temp3[7:0] = temp4 ^ COLUMN_2[7:0];
     temp3 [15:8] =COLUMN_2[15:8] ;
     temp3 [23:16] =COLUMN_2[23:16] ;
     temp3[31:24] =(COLUMN_2[31]?(COLUMN_2[31:24] <<1'h1) ^8'h1B:COLUMN_2[31:24] <<1);
     NEW_COLUMN_2[31:24] =temp3[31:24]^temp3[23:16]^temp3[15:8]^temp3[7:0];
   

//column

      temp5[7:0]=(COLUMN_3[7]?(COLUMN_3[7:0]<<1'h1) ^8'h1B:COLUMN_3[7:0]<<1);
     temp6 = (COLUMN_3[15] ? ((COLUMN_3[15:8] << 1) ^ 8'h1B) : (COLUMN_3[15:8] << 1));
     temp5[15:8] = temp6 ^ COLUMN_3[15:8];
     temp5 [23:16]=COLUMN_3[23:16];
     temp5 [31:24]=COLUMN_3[31:24];
     NEW_COLUMN_3[7:0] =temp5[31:24]^temp5[23:16]^temp5[15:8]^temp5[7:0];
    
     temp5 [7:0]=COLUMN_3[7:0];
     temp5[15:8] =(COLUMN_3[15]?(COLUMN_3[15:8] <<1'h1) ^8'h1B:COLUMN_3[15:8] <<1);
     temp6 = (COLUMN_3[23] ? ((COLUMN_3[23:16] << 1) ^ 8'h1B) : (COLUMN_3[23:16] << 1));
     temp5[23:16] = temp6 ^ COLUMN_3[23:16];
     temp5 [31:24]=COLUMN_3[31:24];
     NEW_COLUMN_3[15:8] =temp5[31:24]^temp5[23:16]^temp5[15:8]^temp5[7:0];

     temp5 [7:0]=COLUMN_3[7:0];
     temp5 [15:8]=COLUMN_3[15:8];
     temp5[23:16]=(COLUMN_3[23]?(COLUMN_3[23:16] <<1'h1) ^8'h1B:COLUMN_3[23:16] <<1);
     temp6 = (COLUMN_3[31] ? ((COLUMN_3[31:24] << 1) ^ 8'h1B) : (COLUMN_3[31:24] << 1));
     temp5[31:24] = temp6 ^ COLUMN_3[31:24];
     NEW_COLUMN_3[23:16] =temp5[31:24]^temp5[23:16]^temp5[15:8]^temp5[7:0];


     temp6 = (COLUMN_3[7] ? ((COLUMN_3[7:0] << 1) ^ 8'h1B) : (COLUMN_3[7:0] << 1));
     temp5[7:0] = temp6 ^ COLUMN_3[7:0];
     temp5 [15:8] =COLUMN_3[15:8] ;
     temp5 [23:16] =COLUMN_3[23:16] ;
     temp5[31:24] =(COLUMN_3[31]?(COLUMN_3[31:24] <<1'h1) ^8'h1B:COLUMN_3[31:24] <<1);
     NEW_COLUMN_3[31:24] =temp5[31:24]^temp5[23:16]^temp5[15:8]^temp5[7:0];

//column

      temp7[7:0]=(COLUMN_4[7]?(COLUMN_4[7:0]<<1'h1) ^8'h1B:COLUMN_4[7:0]<<1);
     temp8 = (COLUMN_4[15] ? ((COLUMN_4[15:8] << 1) ^ 8'h1B) : (COLUMN_4[15:8] << 1));
     temp7[15:8] = temp8 ^ COLUMN_4[15:8];
     temp7 [23:16]=COLUMN_4[23:16];
     temp7 [31:24]=COLUMN_4[31:24];
     NEW_COLUMN_4[7:0] =temp7[31:24]^temp7[23:16]^temp7[15:8]^temp7[7:0];
    
     temp7 [7:0]=COLUMN_4[7:0];
     temp7[15:8] =(COLUMN_4[15]?(COLUMN_4[15:8] <<1'h1) ^8'h1B:COLUMN_4[15:8] <<1);
     temp8 = (COLUMN_4[23] ? ((COLUMN_4[23:16] << 1) ^ 8'h1B) : (COLUMN_4[23:16] << 1));
     temp7[23:16] = temp8 ^ COLUMN_4[23:16];
     temp7 [31:24]=COLUMN_4[31:24];
     NEW_COLUMN_4[15:8] =temp7[31:24]^temp7[23:16]^temp7[15:8]^temp7[7:0];

     temp7 [7:0]=COLUMN_4[7:0];
     temp7 [15:8]=COLUMN_4[15:8];
     temp7[23:16]=(COLUMN_4[23]?(COLUMN_4[23:16] <<1'h1) ^8'h1B:COLUMN_4[23:16] <<1);
     temp8 = (COLUMN_4[31] ? ((COLUMN_4[31:24] << 1) ^ 8'h1B) : (COLUMN_4[31:24] << 1));
     temp7[31:24] = temp8 ^ COLUMN_4[31:24];
     NEW_COLUMN_4[23:16] =temp7[31:24]^temp7[23:16]^temp7[15:8]^temp7[7:0];


     temp8 = (COLUMN_4[7] ? ((COLUMN_4[7:0] << 1) ^ 8'h1B) : (COLUMN_4[7:0] << 1));
     temp7[7:0] = temp8 ^ COLUMN_4[7:0];
     temp7 [15:8] =COLUMN_4[15:8] ;
     temp7 [23:16] =COLUMN_4[23:16] ;
     temp7[31:24] =(COLUMN_4[31]?(COLUMN_4[31:24] <<1'h1) ^8'h1B:COLUMN_4[31:24] <<1);
     NEW_COLUMN_4[31:24] =temp7[31:24]^temp7[23:16]^temp7[15:8]^temp7[7:0];

mixcolumn_o={NEW_COLUMN_4,NEW_COLUMN_3,NEW_COLUMN_2,NEW_COLUMN_1};


    end

endmodule