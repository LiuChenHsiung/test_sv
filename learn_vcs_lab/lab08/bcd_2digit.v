module bcd_2digit (
  input             rst_b,
  input             clk,
  input             incr,
  output reg [3:0]  num0,
  output reg [3:0]  num1,
  output            max
);

wire max0;
wire max1;

bcd_counter u_digit0 (
  .rst_b(rst_b),
  .clk  (clk  ),
  .incr (incr ),
  .num  (num0 ),
  .max  (max0 )
);

bcd_counter u_digit1 (
  .rst_b(rst_b),
  .clk  (clk  ),
  .incr (max  ),  // error connection
  .num  (num1 ),
  .max  (max1 )
);

assign max = max0 & max1;

endmodule
