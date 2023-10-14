module a_register (
  input clk,
  input enable,
  input load,
  input reset,
  output [7:0] alu_connection,
  inout [7:0] w_bus
);

wire clk, enable, load, reset;
wire [7:0] alu_connection;

reg [7:0] accumulator = 8'b00000000;

always @(posedge clk) begin
  if(reset == 1'b1) begin
      accumulator <= 8'b00000000;
  end
  else if(load == 1'b0) begin
      accumulator <= w_bus;
  end
end

assign alu_connection = accumulator;
assign w_bus = (enable) ? accumulator : 8'bzzzzzzzz;

endmodule
