`ifndef full_adder
  `include "full_adder.sv"
`endif
`define inc_16 1

module inc_16(input [15:0] in, output [15:0] out);

    wire [15:0] carry;
    genvar i;
    generate
    for (i = 0; i < 16 ; i = i+1) begin : adder_inst
        full_adder fa(
            .a(in[i]),
            .b(i == 0 ? 1'b1 : 1'b0),
            .c(i == 0 ? 1'b0 : carry[i-1]), 
            .carry(carry[i]),
            .sum(out[i])
        );
    end
    endgenerate

endmodule