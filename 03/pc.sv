`define pc 1

module pc(
    input  [15:0] in,
    input         load,
    input         inc,
    input         reset,
    input         clk,
    output [15:0] out
);

    reg [15:0] pc_reg = 16'b0;  
  
    always @(posedge clk) begin  
        if (reset) begin  
            pc_reg <= 16'b0;  // Reset PC to 0  
        end else if (load) begin  
            pc_reg <= in;      // Load PC from 'in' input  
        end else if (inc) begin  
            pc_reg <= pc_reg + 16'b1; // Increment PC  
        end else begin
            pc_reg <= pc_reg;
        end  
    end  
  
    assign out = pc_reg; 

endmodule