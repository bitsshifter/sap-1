`include "a_register.v"
`include "b_register.v"
`include "alu.v"
`include "memory.v"
`include "mar.v"
`include "program_counter.v"
`include "instruction_register.v"
`include "output_register.v"
`include "controller.v"
`timescale 1ns / 1ps

module cpu;

  reg clk_tb;
  reg inv_clk_tb;
  reg reset_tb;

  // Main bus
  wire [7:0] w_bus;
  // Controll word bus
  wire [11:0] cw_bus;

  // Inner connections
  wire [7:0] AtoALU;
  wire [7:0] BtoALU;
  wire [3:0] MARtoRAM;
  wire [3:0] IRtoCONTROLLER;

  // Clocks
  always begin
    #1;
    clk_tb <= ~clk_tb;
    inv_clk_tb <= ~inv_clk_tb;
  end

  a_register a_register_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .enable(cw_bus[4]),
    .load(cw_bus[5]),
    .alu_connection(AtoALU),
    .w_bus(w_bus)
  );

  b_register b_register_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .load(cw_bus[1]),
    .alu_connection(BtoALU),
    .w_bus(w_bus)
  );

  program_counter program_counter_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .enable(cw_bus[10]),
    .cp(cw_bus[11]),
    .w_bus(w_bus[3:0])
  );

  alu alu_DUT (
    .enable(cw_bus[2]),
    .sub(cw_bus[3]),
    .a(AtoALU),
    .b(BtoALU),
    .w_bus(w_bus)
  );

  mar mar_DUT (
    .clk(clk_tb),
    .load(cw_bus[9]),
    .w_bus(w_bus[3:0]),
    .RAM_address(MARtoRAM)
  );

  memory memory_DUT (
    .enable(cw_bus[8]),
    .address(MARtoRAM),
    .w_bus(w_bus)
  );

  instruction_register instruction_register_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .enable(cw_bus[6]),
    .load(cw_bus[7]),
    .w_bus(w_bus),
    .address(w_bus[3:0]),
    .opcode(IRtoCONTROLLER)
  );

  output_register output_register_DUT (
    .clk(clk_tb),
    .reset(reset_tb),
    .load(cw_bus[0]),
    .w_bus(w_bus),
    .out()
  );

  controller controller_DUT (
    .clk(inv_clk_tb),
    .opcode(IRtoCONTROLLER),
    .cw_bus(cw_bus)
  );

  initial begin

    $dumpfile("cpu.vcd");
    $dumpvars(0, cpu);
    
    $display("CPU running...");
    reset_tb = 1'b1;
    #10;
    reset_tb = 1'b0;
    #10;

    inv_clk_tb = 1'b0;
    clk_tb = 1'b1;

    #1000;
    $finish;

  end

endmodule
