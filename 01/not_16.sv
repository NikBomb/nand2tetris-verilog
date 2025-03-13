`ifndef not_n2t
   `include "not_n2t.sv"
`endif
`define not_16 1

module not_16(
    input [15:0] in,
    output [15:0] out
);

    //assign out[15:0] = ~in[15:0];
    not_n2t not_15[15:0](.in(in[15:0]), .out(out[15:0]));
endmodule
