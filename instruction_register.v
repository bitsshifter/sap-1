module instruction_register (
  input clk,
  input load,
  input enable,
  input reset,
  input [7:0] w_bus,
  output [3:0] address,
  output [3:0] opcode
);

wire clk, load, enable, reset;
wire [7:0] w_bus;

reg [7:0] ir = 8'b00000000;

always @(posedge clk) begin
  if(reset == 1'b1) begin
    ir <= 8'b0000;
  end
  else if(load == 1'b0) begin
    ir <= w_bus;
  end
end

assign opcode = ir[7:4];
assign address = (enable) ? 4'bzzzz : ir[3:0];

endmodule
