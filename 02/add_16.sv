`ifndef full_adder
   `include "full_adder.sv"
`endif
`define add_16 1

module add_16(
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] out
);

    wire [15:0] cout;
    genvar i;
    generate
    for (i = 0; i < 16 ; i = i+1) begin : adder_inst
        full_adder fa(
            .a(a[i]),
            .b(b[i]),
            .c(i ==0 ? 1'b0 : cout[i-1]), 
            .carry(cout[i]),
            .sum(out[i])
        );
    end
    endgenerate
    
endmodule