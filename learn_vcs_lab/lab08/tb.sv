module tb;

reg         rst_b = 1'b1;
reg         clk   = 1'b1;
reg         incr  = 1'b0;
wire [3:0]  num0;
wire [3:0]  num1;
wire        max;

reg  [7:0]  golden;

// free run clock
always #5 clk = ~clk;

initial begin
  if ($test$plusargs("dump")) begin
    $fsdbDumpfile("waveform.fsdb");
    $fsdbDumpvars(0, tb, "+all");
  end
end

initial begin
  $monitor("%0t :  num = %0d%0d  max = %0b", $time, num1, num0, max);

  // reset signal control flow
  #1  rst_b = 1'b0;
      incr  = 1'b0;
  #10 rst_b = 1'b1;

  repeat (2) @(posedge clk);

  // check reset value is 0
  golden = 4'd0;
  check_num_max(max, golden, num0, num1);

  // start counting
  #1 incr = 1;

  for (golden = 1; golden <= 99; golden += 1) begin
    @(posedge clk);
    #1 check_num_max(max, golden, num0, num1);
  end
  for (golden = 0; golden <= 25; golden += 1) begin
    @(posedge clk);
    #1 check_num_max(max, golden, num0, num1);
  end

  $finish;
end

function check_num_max (reg max, reg [7:0] golden, reg [3:0] num0, reg [3:0] num1);
  if ( (num1*10+num0) !== golden )
    $display("%0t Error: golden=%0d num=%0d%0d", $time, golden, num1, num0);
  if ( golden === 99 && max !== 1 )
    $display("%0t Error: max should be 1", $time);
  if ( golden < 99 && max !== 0 )
    $display("%0t Error: max should be 0", $time);
endfunction

bcd_2digit u_bcd_2digit(
  .rst_b(rst_b),
  .clk  (clk  ),
  .incr (incr ),
  .num0 (num0 ),
  .num1 (num1 ),
  .max  (max  )
);

endmodule
