module controller (
  input clk,
  input [3:0] opcode,
  output [11:0] cw_bus
);

  wire clk;
  wire [3:0] opcode;

  reg [2:0] step = 3'b000;
  reg [11:0] microcodes [127:0];

  initial begin
    /* LDA */
    // FETCH
    microcodes[7'b0000000] = 12'b010111100011; 
    microcodes[7'b0000001] = 12'b101001100011;
    // EXECUTE
    microcodes[7'b0000010] = 12'b000110100011;
    microcodes[7'b0000011] = 12'b001011000011;
    microcodes[7'b0000100] = 12'b001111100011; // NOP

    /* ADD */
    // FETCH
    microcodes[7'b0001000] = 12'b010111100011;
    microcodes[7'b0001001] = 12'b101001100011;
    // EXECUTE
    microcodes[7'b0001010] = 12'b000110100011;
    microcodes[7'b0001011] = 12'b001011100001;
    microcodes[7'b0001100] = 12'b001111000111;

    /* SUB */
    // FETCH
    microcodes[7'b0010000] = 12'b010111100011;
    microcodes[7'b0010001] = 12'b101001100011;
    // EXECUTE
    microcodes[7'b0010010] = 12'b000110101011;
    microcodes[7'b0010011] = 12'b001011100001;
    microcodes[7'b0010100] = 12'b001111000111;

    /* OUT */
    // FETCH
    microcodes[7'b1110000] = 12'b010111100011;
    microcodes[7'b1110001] = 12'b101001100011;
    // EXECUTE
    microcodes[7'b1110010] = 12'b001111110010;
    microcodes[7'b1110011] = 12'b001111100011;
    microcodes[7'b1110100] = 12'b001111100011; // NOP

    /* HLT */
    microcodes[7'b1111000] = 12'b010111100011;
    microcodes[7'b1111001] = 12'b101001100011;
    microcodes[7'b1111010] = 12'b001111100011; // NOP
    microcodes[7'b1111011] = 12'b001111100011; // NOP
    microcodes[7'b1111100] = 12'b001111100011; // NOP

  end

  always @(posedge clk) begin
    if(step == 3'b100) begin
      step <= 3'b000;
    end
    else begin
      step <= step + 1;
    end
  end

  assign cw_bus = microcodes[{ opcode, step }];

endmodule
