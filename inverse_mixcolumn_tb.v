module inverse_mixcolumn_tb;
reg [127:0] state_in;
wire [127:0] state_out;
inverse_mixcolumn uut (
    .state_in(state_in),
    .state_out(state_out)
);
initial begin
    //state_in = 128'h95c3ec97d84a904d8ce74cf2A6466E87;
    state_in = 128'hBCA6A5ED423AE4949F70D4374CA34047;
    #10;
    $finish;
    end
        initial begin
        $dumpfile("inverse_mixcolumn.vcd");
        $dumpvars(0,inverse_mixcolumn_tb);
    end

 endmodule
