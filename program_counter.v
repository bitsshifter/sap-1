module program_counter (
  input clk,
  input cp,
  input enable,
  input reset,
  output [3:0] w_bus
);

wire clk, cp, enable, reset;

reg [3:0] counter = 4'b0000;

always @(posedge clk) begin
  if(reset == 1'b1) begin
    counter <= 4'b0000;
  end
  else if(cp == 1'b1) begin
    counter <= counter + 1'b1;
  end
end

assign w_bus = (enable) ? counter : 4'bzzzz;

endmodule
