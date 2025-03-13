`define alu 1

module alu(
    input  [15:0] x,
    input  [15:0] y,
    input         zx,
    input         nx,
    input         zy,
    input         ny,
    input         f,
    input         no,
    output [15:0] out,
    output        zr,
    output        ng
);
   
reg [5:0] selector;
reg[15:0] alu_tmp; 

always_comb begin
  selector = {zx, nx, zy, ny, f, no};
end 

always_comb begin
  case (selector)
    6'b101010 : alu_tmp = 16'b0;
    6'b111111 : alu_tmp = 16'b1;
    6'b111010 : alu_tmp = 16'b1111111111111111;
    6'b001100 : alu_tmp = x;
    6'b110000 : alu_tmp = y;
    6'b001101 : alu_tmp = ~x;
    6'b110001 : alu_tmp = ~y;
    6'b001111 : alu_tmp = (~x) + 16'b1;
    6'b110011 : alu_tmp = (~y) + 16'b1;
    6'b011111 : alu_tmp = x + 16'b1;
    6'b110111 : alu_tmp = y + 16'b1;
    6'b001110 : alu_tmp = x - 16'b1;
    6'b110010 : alu_tmp = y - 16'b1;
    6'b000010 : alu_tmp = x + y;
    6'b010011 : alu_tmp = x - y;
    6'b000111 : alu_tmp = y - x;
    6'b000000 : alu_tmp = x & y;
    6'b010101 : alu_tmp = x | y;
    default   : alu_tmp = 16'b0;  
  endcase
end

assign out = alu_tmp;
assign zr = (16'b0 == alu_tmp) ? 1'b1 : 1'b0;
assign ng = alu_tmp[15];

endmodule
