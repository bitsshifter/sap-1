module b_register (
  input clk,
  input load,
  input reset,
  output [7:0] alu_connection,
  inout [7:0] w_bus
);

wire clk, load, reset;
wire [7:0] alu_connection;

reg [7:0] register = 8'b00000000;

always @(posedge clk) begin
  if(reset == 1'b1) begin
      register <= 8'b00000000;
  end
  else if(load == 1'b0) begin
      register <= w_bus;
  end
end

assign alu_connection = register; 

endmodule
