module memory (
  input enable,
  input [3:0] address,
  output [7:0] w_bus 
);

wire enable;
wire [3:0] address;

reg [7:0] ram [15:0];

initial begin

  // Sample program

  // Instructions
  ram[4'b0000] = 8'b00000111;
  ram[4'b0001] = 8'b00010110;
  ram[4'b0010] = 8'b11110000;

  // Data
  ram[4'b0110] = 8'b00010010;
  ram[4'b0111] = 8'b00101010;
end

assign w_bus = (enable) ? 8'bzzzzzzzz : ram[address];

endmodule
