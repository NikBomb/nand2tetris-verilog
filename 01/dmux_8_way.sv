`define dmux_8_way 1

module dmux_8_way(
    input       in,
    input [2:0] sel,
    output      a,
    output      b,
    output      c,
    output      d,
    output      e,
    output      f,
    output      g,
    output      h
);

    assign a = (sel == 3'b000) ? in : 1'b0;  
    assign b = (sel == 3'b001) ? in : 1'b0;  
    assign c = (sel == 3'b010) ? in : 1'b0;  
    assign d = (sel == 3'b011) ? in : 1'b0;
    assign e = (sel == 3'b100) ? in : 1'b0;
    assign f = (sel == 3'b101) ? in : 1'b0;
    assign g = (sel == 3'b110) ? in : 1'b0;
    assign h = (sel == 3'b111) ? in : 1'b0;  

endmodule
