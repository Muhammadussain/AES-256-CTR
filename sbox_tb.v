module tb_sbox;

reg [7:0] s_in;
wire [7:0] sub;


sbox uut(
    .s_in(s_in),
    .sub(sub)
);

initial begin
    
    s_in=8'h0a;
    #10;
end

initial begin
        $dumpfile("sbox.vcd");
        $dumpvars(0, tb_sbox);
    end
endmodule