module fsm
(input clk,
 input rst,
 input din,
 output reg dout);

parameter idle = 0;
parameter s1 = 1;
parameter s2 = 2;

reg [1:0] state, nstate;

//---------------------------------
//------------RESET_LOGIC----------
//---------------------------------

always @(posedge clk) begin
    if(rst) state <= idle;
    else state <= nstate;
end

//---------------------------------
//------------OUTPUT_LOGIC---------
//---------------------------------

always @(state,din) begin
    case(state)
        idle : begin
           dout = 'd0;
       end
       s1 : begin
           if(din) dout = 'd1;
           else dout = 'd0;
       end
       s2 : begin
           dout = 'd0;
       end
       default : dout = 'd0;
    endcase
end

//---------------------------------
//------------NST------------------
//---------------------------------

always @(state,din) begin
    case(state)
        idle : begin
           nstate = s1;
       end
       s1 : begin
          if(din) nstate = s2;
          else nstate = s1;
      end
       
       s2 : begin
          if(din) nstate = s1;
          else nstate = s2;
      end 
    endcase
end
endmodule

