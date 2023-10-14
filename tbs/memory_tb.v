`include "../memory.v"
`timescale 1ns / 1ps

module memory_tb;
 
  reg enable_tb;
  reg [3:0] address_tb;
  wire [7:0] w_bus;

  memory memory_DUT (
    .enable(enable_tb),
    .address(address_tb),
    .w_bus(w_bus)
  );

  initial begin
    $dumpfile("memory.vcd");
    $dumpvars(0, memory_tb);
   
    address_tb = 4'b0000;
    enable_tb = 1'b1;
    
    #10;
    enable_tb = 1'b0;

    #10;
    enable_tb = 1'b1;

    #10;
    address_tb = 4'b0111;

    #10;
    enable_tb = 1'b0;

    #10;
    enable_tb = 1'b1;

    #100;
    $finish;

  end

endmodule
