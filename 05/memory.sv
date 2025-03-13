`ifndef mux_16
  `include "../01/mux_16.sv"
`endif
`include "../03/ram_16K_optimized.sv"
`include "screen_8K.sv"

module memory(input[15:0] in, input clock, load, input[14:0] address, output[15:0] out);
  reg [15:0] scancode /*verilator public*/;

  reg[15:0] tmp_out;
  wire [15:0] ram_out;  
  wire [15:0] screen_out;  
  
  // Instantiate RAM  
  ram_16K_optimized ram (  
      .in(in),   
      .address(address[13:0]), // Use 14 bits for RAM address  
      .load(load),   
      .clock(clock),   
      .out(ram_out)  
  );  
  
  // Instantiate screen  
  screen_8K screen (  
      .in(in),  
      .address(address[12:0]), // Use 13 bits for screen address  
      .load(load),  
      .clock(clock),  
      .out(screen_out)  
  );  
  
    // Select output based on address range within the clocked block  
    always @(posedge clock) begin  
        if (load) begin   
            if (address[14]) begin  
                tmp_out <= screen_out;  
            end else begin  
                tmp_out <= ram_out;   
            end  
        end   
    end 

  assign out = tmp_out;

endmodule