`include "../a_register.v"
`timescale 1ns / 1ps

module a_register_tb;

  reg clk_tb;
  reg enable_tb;
  reg load_tb;
  reg reset_tb;

  reg [7:0] w_bus_tb_driver;

  wire [7:0] alu_connection_tb;
  wire [7:0] w_bus_tb;

  a_register a_register_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .enable(enable_tb),
    .load(load_tb),
    .alu_connection(alu_connection_tb),
    .w_bus(w_bus_tb)
  );


  always begin
    #1;
    clk_tb <= ~clk_tb;
  end

  initial begin

    $dumpfile("a_register.vcd");
    $dumpvars(0, a_register_tb);
    
    w_bus_tb_driver = 8'b00001111;

    clk_tb = 1'b0;
    reset_tb = 1'b0;
    enable_tb = 1'b0;
    load_tb = 1'b1;

    #10;
    load_tb = 1'b0;

    #10;
    load_tb = 1'b1;

    #10;
    w_bus_tb_driver = 8'bzzzzzzzz;

    #10;
    enable_tb = 1'b1;

    #10;
    enable_tb = 1'b0;

    #10;
    reset_tb = 1'b1;

    #10;
    reset_tb = 1'b0;

    #100;
    $finish;

  end

  assign w_bus_tb = w_bus_tb_driver;

endmodule
