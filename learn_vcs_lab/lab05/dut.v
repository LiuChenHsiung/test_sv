module dut (
  input       rst_b,
  input       clk,
  input       wr,
  input [7:0] dat,
  input       disp
);

reg [128*8-1:0] mem;
reg [7:0]       addr;

always @(posedge clk or negedge rst_b) begin
  if (~rst_b) begin
    mem   <= '0;
    addr  <= 127;
  end
  else begin
    if (wr == 1) begin
      mem[addr*8+:8] <= dat;
      addr           <= addr -1;
    end
  end
end

always @(posedge clk) begin
  if (disp == 1) begin
    $display("[dut] time = %0t : mem = '%0s'", $time, mem);
  end
end

endmodule
