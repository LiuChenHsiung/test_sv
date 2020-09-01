module tb;

reg       rst_b = 1'b1;
reg       clk   = 1'b1;
reg       wr    = 1'b0;
reg [7:0] dat;
reg       disp  = 1'b0;
string    test_data = "Hello World";
int       i;

// free run clock
always #5 clk = ~clk;

initial begin
  // use simulation option to control test case
  if ($value$plusargs("testdata=%s", test_data)) begin
    $display("Use test string = '%0s'", test_data);
  end
  else begin
    $display("Default test string = '%0s'", test_data);
  end

  // reset signal control flow
  #1  rst_b = 1'b0;
  #10 rst_b = 1'b1;

  // write string data to memory
  for (i = 0; i < test_data.len(); i++) begin
    @(posedge clk);
    #1;
    wr  = 1;
    dat = test_data.getc(i);
  end
  @(posedge clk);
  wr  <= #1 1'b0;
  dat <= #1 8'h0;
  repeat (3) @(posedge clk);

  // trigger dut display memory content
  disp <= #1 1'b1;
  @(posedge clk);
  disp <= #1 1'b0;
  repeat (3) @(posedge clk);

  $finish;
end


dut u_dut(
  .rst_b(rst_b),
  .clk  (clk  ),
  .wr   (wr   ),
  .dat  (dat  ),
  .disp (disp )
);

endmodule
