module sva_checker (
  input       clk,
`ifdef CORRECT
  input       max,
`endif
  input [3:0] num
);

`ifdef CORRECT
property carry;
  @(posedge clk) num == 9 |-> max == 1;
endproperty
`else
property carry;
  @(posedge clk) num == 9 |=> num == 0;
endproperty
`endif

SVA_CHK_CARRY:
  assert property (carry);

endmodule


// bind checker into design
bind bcd_counter sva_checker u_sva_checker(.*);
