module addroundkey(
    input logic [127:0] data,
input logic [127:0] rkey,
output logic [127:0] out
);


 always_comb begin    
 out = rkey ^ data;
end
endmodule
