// lfsr.v
// Three independent LFSRs with different lengths and tap polynomials.
// Pure Verilog-2001 (ModelSim-friendly)

module lfsr5 (
    input  wire       clk,
    input  wire       reset,    // when 1: load seed
    input  wire [4:0] seed,
    output wire       out_bit
);
    reg [4:0] s;
    // taps: x^5 + x^3 + 1  (feedback = s[4] ^ s[2])
    wire fb = s[4] ^ s[2];

    assign out_bit = s[0];

    always @(posedge clk) begin
        if (reset) s <= seed;
        else       s <= {s[3:0], fb};
    end
endmodule


module lfsr7 (
    input  wire       clk,
    input  wire       reset,    // when 1: load seed
    input  wire [6:0] seed,
    output wire       out_bit
);
    reg [6:0] s;
    // taps: x^7 + x^6 + 1 (feedback = s[6] ^ s[5])
    wire fb = s[6] ^ s[5];

    assign out_bit = s[0];

    always @(posedge clk) begin
        if (reset) s <= seed;
        else       s <= {s[5:0], fb};
    end
endmodule


module lfsr9 (
    input  wire       clk,
    input  wire       reset,    // when 1: load seed
    input  wire [8:0] seed,
    output wire       out_bit
);
    reg [8:0] s;
    // taps: x^9 + x^5 + 1 (feedback = s[8] ^ s[4])
    wire fb = s[8] ^ s[4];

    assign out_bit = s[0];

    always @(posedge clk) begin
        if (reset) s <= seed;
        else       s <= {s[7:0], fb};
    end
endmodule
