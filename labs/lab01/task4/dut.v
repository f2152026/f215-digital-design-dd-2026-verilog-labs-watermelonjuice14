// dut.v
// Task 4 wrapper
// Option 1: rca64 is currently active.

module dut(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  // ---------------------------------------------
  // Option 1: 64-bit Ripple Carry Adder
  // ACTIVE
  // ---------------------------------------------
  rca64 U_IMPL (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  // ---------------------------------------------
  // Option 2: Flat 64-bit CLA
  // ---------------------------------------------
  // cla64_flat U_IMPL (
  //   .a(a),
  //   .b(b),
  //   .cin(cin),
  //   .sum(sum),
  //   .cout(cout)
  // );

  // ---------------------------------------------
  // Option 3: Blocked 64-bit CLA
  // ---------------------------------------------
  // cla64_blocked U_IMPL (
  //   .a(a),
  //   .b(b),
  //   .cin(cin),
  //   .sum(sum),
  //   .cout(cout)
  // );

endmodule