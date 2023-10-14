module mar(
  input clk,
  input load,
  input [3:0] w_bus,
  output [3:0] RAM_address
);

wire clk, load;
wire [3:0] w_bus;

reg [3:0] register;

always @(posedge clk) begin
  if(load == 1'b0) begin
    register <= w_bus;
  end
end

assign RAM_address = register;

endmodule
