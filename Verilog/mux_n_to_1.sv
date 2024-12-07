module mux_n_to_1 
#(parameter WIDTH = 4) 
(output y,
 input [1:0]  sel,
 input [WIDTH - 1 : 0] i);
  
  always @(*) begin
      case(sel)
          'd00 : y = i[0];
          'd01 : y = i[1];
          'd10 : y = i[2];
          'd11 : y = i[3];
          default : y = 'd0;
      endcase
  end

endmodule
