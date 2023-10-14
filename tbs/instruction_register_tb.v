`include "../instruction_register.v"
`timescale 1ns / 1ps

module instruction_register_tb;

  reg clk_tb;
  reg reset_tb;
  reg enable_tb;
  reg load_tb;
    
  reg [7:0] w_bus_driver = 8'b10101011;

  wire [7:0] w_bus;
  wire [3:0] opcode_tb;

  instruction_register instruction_register_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .enable(enable_tb),
    .load(load_tb),
    .w_bus(w_bus),
    .address(w_bus[3:0]),
    .opcode(opcode_tb)
  );

  always begin
    #1;
    clk_tb <= ~clk_tb;
  end

  initial begin
    $dumpfile("instruction_register.vcd");
    $dumpvars(0, instruction_register_tb);

    clk_tb = 1'b0;
    reset_tb = 1'b0;
    enable_tb = 1'b1;
    load_tb = 1'b1;

    #10;
    load_tb = 1'b0;

    #10;
    load_tb = 1'b1;

    #10;
    enable_tb = 1'b0;

    #10;
    enable_tb = 1'b1;

    #100
    $finish;

  end

  assign w_bus = (load_tb) ? 8'bzzzzzzzz : w_bus_driver;

endmodule
