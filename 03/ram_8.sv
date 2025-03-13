`ifndef and_n2t
    `include "../01/and_n2t.sv"
`endif
`ifndef dmux_8_way
    `include "../01/dmux_8_way.sv"
`endif
`ifndef mux_8_way_16
    `include "../01/mux_8_way_16.sv"
`endif
`ifndef register_n2t
    `include "register_n2t.sv"
`endif
`define ram_8 1

module ram_8(
    input  [15:0] in,
    input  [2:0]  address,
    input         load,
    input         clock,
    output [15:0] out
);

   
  reg[15:0] memory[0:2**8-1];
	
  assign out = memory[address];
	
  always @(posedge clock) begin
    if (load) memory[address] <= in;
  end 
    
endmodule
