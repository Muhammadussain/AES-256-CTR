module inverse_shiftrows (
    input wire [127:0] state_in,
    output reg [127:0] state_out
);  reg [127:0] temp;
    reg [31:0] row0, row1, row2, row3;
    reg [31:0] row1_shifted, row2_shifted, row3_shifted;

    always @(*) begin
             row0 ={state_in[103:96],state_in[71:64],state_in[39:32],state_in[7:0]};
             row1 ={state_in[111:104],state_in[79:72],state_in[47:40],state_in[15:8]};
             row2 ={state_in[119:112],state_in[87:80],state_in[55:48],state_in[23:16]};
             row3={state_in[127:120],state_in[95:88],state_in[63:56],state_in[31:24]};
     
        row1_shifted = {row1[23:0], row1[31:24]};  // Circular right shift by 1 byte
        row2_shifted = {row2[15:0], row2[31:16]};  // Circular right shift by 2 bytes
        row3_shifted = {row3[7:0], row3[31:8]};    // Circular right shift by 3 bytes

         temp={row3_shifted,row2_shifted,row1_shifted,row0};
         state_out[31:0] ={temp[103:96],temp[71:64],temp[39:32],temp[7:0]};
        state_out[63:32]= {temp[111:104],temp[79:72],temp[47:40],temp[15:8]};
        state_out[95:64] = {temp[119:112],temp[87:80],temp[55:48],temp[23:16]};;
        state_out[127:96] = {temp[127:120],temp[95:88],temp[63:56],temp[31:24]};

       
    end
endmodule
