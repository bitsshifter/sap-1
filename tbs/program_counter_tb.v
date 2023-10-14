`include "../program_counter.v"
`timescale 1ns / 1ps

module program_counter_tb;

  reg clk_tb;
  reg reset_tb;
  reg enable_tb;
  reg cp_tb;
  
  wire [7:0] w_bus;

  program_counter program_counter_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .enable(enable_tb),
    .cp(cp_tb),
    .w_bus(w_bus[3:0])
  );

  always begin
    #1;
    clk_tb <= ~clk_tb;
  end

  initial begin

    $dumpfile("program_counter.vcd");
    $dumpvars(0, program_counter_tb);

    clk_tb = 1'b1;
    reset_tb = 1'b0;
    enable_tb = 1'b0;
    cp_tb = 1'b0;

    #10
    cp_tb = 1'b1;

    #10
    cp_tb = 1'b0;
    
    #10
    enable_tb = 1'b1;

    #10
    enable_tb = 1'b0;

    #10
    reset_tb = 1'b1;

    #10
    reset_tb = 1'b0;

    #100;
    $finish;
  end

  assign w_bus = (enable_tb) ? w_bus : 8'bzzzzzzzz;

endmodule
