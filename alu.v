module alu (
  input enable,
  input sub,
  input [7:0] a,
  input [7:0] b,
  output [7:0] w_bus
);

wire enable, sub;
wire [7:0] a; 
wire [7:0] b;

reg [7:0] result;

always @(*) begin
  if(sub == 1'b0) begin
      result <= a + b;
  end
  else if(sub == 1'b1) begin
      result <= a - b;
  end
end

assign w_bus = (enable) ? result : 8'bzzzzzzzz;

endmodule
