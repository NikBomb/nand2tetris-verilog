`ifndef half_adder
  `include "half_adder.sv"
`endif
`define full_adder 1

module full_adder(
    input  a,
    input  b,
    input  c,
    output carry,
    output sum
);

    assign sum = (a ^ b) ^ c;
    assign carry = (a & b) | (a & c) | (b & c); 

endmodule
