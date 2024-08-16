module ctr_encryption (
    input wire [1999:0] plaintext,   // Input plaintext (up to 2000 bits)
    input wire [255:0] key,          // AES-256 key (256 bits)
    input wire [127:0] iv,           // Initial Counter (IV)
    input wire [10:0] length,        // Actual length of the plaintext in bits (0 to 2000)
    output reg [1999:0] ciphertext   // Output ciphertext
);

    reg [127:0] block[0:15];         // Array to hold each 128-bit block (16 blocks for 2000 bits)
    reg [127:0] ctr_value;   g