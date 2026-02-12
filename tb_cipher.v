// tb_cipher.v
// Testbench: encrypt and decrypt an 8-bit message (example: 10101100)
// Checks that decrypted == plaintext for every bit and prints PASS/FAIL.

module tb_cipher;

    reg clk;
    reg reset;

    reg [4:0] key1;
    reg [6:0] key2;
    reg [8:0] key3;

    reg  plaintext;
    wire keystream;
    wire ciphertext;
    wire decrypted;

    cipher uut (
        .clk(clk),
        .reset(reset),
        .key1(key1),
        .key2(key2),
        .key3(key3),
        .plaintext(plaintext),
        .keystream(keystream),
        .ciphertext(ciphertext),
        .decrypted(decrypted)
    );

    // 10ns clock period
    initial clk = 1'b0;
    always #5 clk = ~clk;

    reg [7:0] msg;
    integer i;

    initial begin
        // Non-zero seeds
        key1 = 5'h15;     // 10101
        key2 = 7'h65;     // 1100101
        key3 = 9'h14b;    // 101001011

        // Example message from the project statement
        msg = 8'b1010_1100;

        // Load seeds
        plaintext = 1'b0;
        reset = 1'b1;
        #20;
        reset = 1'b0;

        // Send bits MSB -> LSB, one bit per clock, and verify decryption
        for (i = 7; i >= 0; i = i - 1) begin
            plaintext = msg[i];
            #10; // wait 1 clock
            if (decrypted !== plaintext) begin
                $display("FAIL at bit %0d: pt=%b dec=%b ks=%b ct=%b", i, plaintext, decrypted, keystream, ciphertext);
                $stop;
            end
        end

        $display("PASS: decrypted matches plaintext for all bits.");
        $stop;
    end

endmodule
