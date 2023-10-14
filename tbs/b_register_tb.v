`include "../b_register.v"
`timescale 1ns / 1ps

module b_register_tb;

  reg clk_tb;
  reg reset_tb;
  reg load_tb;

  reg [7:0] w_bus_tb_driver;

  wire [7:0] alu_connection_tb;
  wire [7:0] w_bus_tb;

  b_register b_register_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .load(load_tb),
    .alu_connection(alu_connection_tb),
    .w_bus(w_bus_tb)
  );


  always begin
    #1;
    clk_tb <= ~clk_tb;
  end

  initial begin

    $dumpfile("b_register.vcd");
    $dumpvars(0, b_register_tb);
    
    w_bus_tb_driver = 8'b00001010;

    clk_tb = 1'b0;
    reset_tb = 1'b0;
    load_tb = 1'b1;

    #10;
    load_tb = 1'b0;

    #10;
    load_tb = 1'b1;

    #10;
    reset_tb = 1'b1;

    #10;
    reset_tb = 1'b0;

    #100;
    $finish;

  end

  assign w_bus_tb = w_bus_tb_driver;

endmodule
