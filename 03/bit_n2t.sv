`ifndef mux
    `include "../01/mux.sv"
`endif
`ifndef dff
    `include "dff.sv"
`endif
`define bit_n2t 1

module bit_n2t(
    input  in,
    input  load,
    input  clk,
    output out
);


dff dff_inst (  
    .in(load ? in : out), // Select input based on 'load'  
    .clk(clk),  
    .out(out)             // Connect output directly  
);  

endmodule
