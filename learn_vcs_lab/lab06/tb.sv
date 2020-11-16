module tb;

reg         rst_b = 1'b1;
reg         clk   = 1'b1;
reg         incr  = 1'b0;
wire [3:0]  num;
wire        max;

reg  [3:0]  golden;

// free run clock
always #5 clk = ~clk;

initial begin
  if ($test$plusargs("dump")) begin
    $fsdbDumpfile("waveform.fsdb");
    $fsdbDumpvars(0, tb, "+all");
  end
end

initial begin
  $monitor("%0t :  num = %0d  max = %0b", $time, num, max);

  // reset signal control flow
  #1  rst_b = 1'b0;
      incr  = 1'b0;
  #10 rst_b = 1'b1;

  repeat (2) @(posedge clk);

  // check reset value is 0
  golden = 4'd0;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end

  // start counting
  @(posedge clk);
  #1 incr = 1;

  // check reset value is 1
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 2
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 3
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 4
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 5
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 6
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end

  // pause counting
  incr = 0;
  repeat (3) @(posedge clk);
  // re-start counting
  #1 incr = 1;

  // check reset value is 7
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 8
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 9
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b1) begin
    $display("%0t Error: max should be 1", $time);
  end
  // check reset value is 0
  @(posedge clk);
  #1 golden = 4'd0;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 1
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end
  // check reset value is 2
  @(posedge clk);
  #1 golden += 1;
  if (num !== golden) begin
    $display("%0t Error: golden=%0d, num=%0d", $time, golden, num);
  end
  if (max !== 1'b0) begin
    $display("%0t Error: max should be 0", $time);
  end

  $finish;
end


bcd_counter u_bcd_counter(
  .rst_b(rst_b),
  .clk  (clk  ),
  .incr (incr ),
  .num  (num  ),
  .max  (max  )
);

endmodule
