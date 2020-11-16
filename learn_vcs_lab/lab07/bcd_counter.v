module bcd_counter (
  input             rst_b,
  input             clk,
  input             incr,
  output reg [3:0]  num,
  output reg        max
);

reg [3:0] num_nxt;

always @(posedge clk or negedge rst_b) begin
  if (~rst_b) begin
    num   <= 4'h0;
  end
  else begin
    num   <= num_nxt;
  end
end

always @* begin
  if (incr ==1) begin
    if (num == 9)
      num_nxt = 0;
    else
      num_nxt = num + 1;
  end
  else begin
    num_nxt = num;
  end
end

always @* begin
  if (num == 9)
    max = 1;
  else
    max = 0;
end

endmodule
