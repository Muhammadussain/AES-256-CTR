module shiftrows_tb;
reg [127:0] state_in;
wire [127:0] state_out;
shiftrows uut (
    .state_in(state_in),
    .state_out(state_out)
);
initial begin
    state_in = 128'h00112233445566778899aabbccddeeff;
    #10;
    $finish;
    end
        initial begin
        $dumpfile("shiftrows.vcd");
        $dumpvars(0,shiftrows_tb);
    end

 endmodule
