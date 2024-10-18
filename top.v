// `include "encryptiontop.v"
module top (
    input wire clk,
    input wire rst,
    output reg led    // Declare 'led' as reg
);
    wire[127:0] ciphertext;
    reg [127:0] plaintext,Check;
    
    reg [255:0] key_i;


 encryptiontop uut (
        .clk(clk),
        .rst(rst),
        .plaintext(plaintext),
        .key_i(key_i),
      //  .cipher_counter_o(cipher_counter_o),
        .ciphertext(ciphertext)
    );
    always @(posedge clk) begin
      if (rst) begin
          plaintext <= 128'h0;
          key_i <= 256'h0;
         
      end
         else begin
            Check<=128'h17e984f3fac5c9509d19086f0b84bdff;
          plaintext <=128'hffeeddccbbaa99887766554433221100;
          key_i <= 256'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100;
        
      end
       if (ciphertext == Check) begin
          led <= 1'b0;  // Assign 1 to 'led'
      end
      else begin
          led <= 1'b1;  // Assign 0 to 'led'
      end
    end
  endmodule

