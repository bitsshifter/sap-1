`include "../mar.v"
`timescale 1ns / 1ps

module mar_tb;

  reg clk_tb;
  reg load_tb;

  reg [7:0] w_bus_driver;

  wire [7:0] w_bus;
  wire [3:0] RAM_address_tb;

  mar mar_DUT (
    .clk(clk_tb),
    .load(load_tb),
    .w_bus(w_bus[3:0]),
    .RAM_address(RAM_address_tb)
  );

  always begin
    #1;
    clk_tb <= ~clk_tb;
  end

  initial begin
    $dumpfile("mar.vcd"); 
    $dumpvars(0, mar_tb);

    clk_tb = 1'b0;
    load_tb = 1'b1;
    w_bus_driver = 8'bzzzz1010;

    #10;
    load_tb = 1'b0;

    #10;
    load_tb = 1'b1;

    #100;
    $finish;

  end

  assign w_bus = w_bus_driver;

endmodule
