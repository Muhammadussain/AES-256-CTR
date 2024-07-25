module mixcolumn (
    input wire [127:0] mixcolumn_i,
    output reg [127:0] mixcolumn_o
);
   reg[127:0] temp;
   reg[31:0] COLUMN_1,COLUMN_2,COLUMN_3,COLUMN_4;
    always @(*) begin
    
    COLUMN_1={mixcolumn_i[103:96],mixcolumn_i[71:64],mixcolumn_i[39:32],mixcolumn_i[7:0]};
    COLUMN_2={mixcolumn_i[111:104],mixcolumn_i[79:72],mixcolumn_i[47:40],mixcolumn_i[15:8]};
    COLUMN_3={mixcolumn_i[119:112],mixcolumn_i[87:80],mixcolumn_i[55:48],mixcolumn_i[23:16]};
    COLUMN_4={mixcolumn_i[127:120],mixcolumn_i[95:88],mixcolumn_i[63:56],mixcolumn_i[31:24]};
    
    
    
    
    
    end

endmodule