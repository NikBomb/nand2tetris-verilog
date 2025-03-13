`ifndef dmux
  `include "dmux.sv"
`endif
`define dmux_4_way 1

module dmux_4_way(
    input       in,
    input [1:0] sel,
    output a,
    output b,
    output c,
    output d
);

    assign a = (sel == 2'b00) ? in : 1'b0;  
    assign b = (sel == 2'b01) ? in : 1'b0;  
    assign c = (sel == 2'b10) ? in : 1'b0;  
    assign d = (sel == 2'b11) ? in : 1'b0;  

endmodule
