// cipher.v
// Stream cipher using 3 LFSRs and a non-linear combiner:
// keystream = (a & b) ^ c
// ciphertext = plaintext ^ keystream
// decrypted  = ciphertext ^ keystream

module cipher (
    input  wire       clk,
    input  wire       reset,        // loads seeds into LFSRs when 1
    input  wire [4:0] key1,
    input  wire [6:0] key2,
    input  wire [8:0] key3,
    input  wire       plaintext,
    output wire       keystream,
    output wire       ciphertext,
    output wire       decrypted
);

    wire a, b, c;

    lfsr5 u_l1 (.clk(clk), .reset(reset), .seed(key1), .out_bit(a));
    lfsr7 u_l2 (.clk(clk), .reset(reset), .seed(key2), .out_bit(b));
    lfsr9 u_l3 (.clk(clk), .reset(reset), .seed(key3), .out_bit(c));

    assign keystream  = (a & b) ^ c;
    assign ciphertext = plaintext ^ keystream;
    assign decrypted  = ciphertext ^ keystream;

endmodule
