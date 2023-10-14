`include "../alu.v"
`timescale 1ns / 1ps

module alu_tb;

  reg enable_tb;
  reg sub_tb;
  reg [7:0] a_tb;
  reg [7:0] b_tb;
  wire [7:0] w_bus;

  alu alu_DUT (
    .enable(enable_tb),
    .sub(sub_tb),
    .a(a_tb),
    .b(b_tb),
    .w_bus(w_bus)
  );

  initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    enable_tb = 1'b0;
    sub_tb = 1'b0;
    a_tb = 8'b00000000;
    b_tb = 8'b00000000;

    #10
    enable_tb = 1'b1;

    #10;
    enable_tb = 1'b0;

    #10;
    a_tb = 8'b00000011;
    b_tb = 8'b00000001;

    #10;
    enable_tb = 1'b1;

    #10;
    enable_tb = 1'b0;

    #10;
    enable_tb = 1'b1;
    
    #10;
    sub_tb = 1'b1;

    #10;
    sub_tb = 1'b0;

    #10;
    enable_tb = 1'b1;

    #10;
    enable_tb = 1'b0;

    #100;
    $finish;

  end

endmodule // alu_tb
