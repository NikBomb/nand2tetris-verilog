`ifndef mux_16
  `include "mux_16.sv"
`endif
`define mux_4_way_16 1

module mux_4_way_16(
    input  [15:0] a,
    input  [15:0] b,
    input  [15:0] c,
    input  [15:0] d,
    input  [1:0]  select,
    output [15:0] out
);
    wire [15:0] mux_ab_out;
    wire [15:0] mux_cd_out;

    mux_16 mux_ab (
        .a(a),
        .b(b),
        .select(select[0]),
        .out(mux_ab_out)
    );

    mux_16 mux_cd (
        .a(c),
        .b(d),
        .select(select[0]),
        .out(mux_cd_out)
    );

    mux_16 mux_final (
        .a(mux_ab_out),
        .b(mux_cd_out),
        .select(select[1]),
        .out(out)
    );

endmodule
