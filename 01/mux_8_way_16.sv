`ifndef mux_4_way_16
  `include "mux_4_way_16.sv"
`endif
`define mux_8_way_16 1

module mux_8_way_16(
    input  [15:0] a,
    input  [15:0] b,
    input  [15:0] c,
    input  [15:0] d,
    input  [15:0] e,
    input  [15:0] f,
    input  [15:0] g,
    input  [15:0] h,
    input  [2:0]  select,
    output [15:0] out
);

    wire [15:0] mux_abcd_out;
    wire [15:0] mux_efgh_out;

    mux_4_way_16 mux_abcd (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .select(select[1:0]),
        .out(mux_abcd_out)
    );

    mux_4_way_16 mux_efgh (
        .a(e),
        .b(f),
        .c(g),
        .d(h),
        .select(select[1:0]),
        .out(mux_efgh_out)
    );

    mux_16 mux_final (
        .a(mux_abcd_out),
        .b(mux_efgh_out),
        .select(select[2]),
        .out(out)
    );

endmodule
