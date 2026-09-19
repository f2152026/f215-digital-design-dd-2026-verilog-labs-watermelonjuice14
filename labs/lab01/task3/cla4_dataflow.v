// cla4_dataflow.v
// 4-bit carry-lookahead adder using dataflow modeling.
// Every assign statement has an explicit delay.

module cla4_dataflow(
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout
);

  wire [3:0] p;
  wire [3:0] g;

  wire c1, c2, c3, c4;

  // Step 1: Propagate and Generate signals

  assign #(2) p[0] = a[0] ^ b[0];
  assign #(2) p[1] = a[1] ^ b[1];
  assign #(2) p[2] = a[2] ^ b[2];
  assign #(2) p[3] = a[3] ^ b[3];

  assign #(2) g[0] = a[0] & b[0];
  assign #(2) g[1] = a[1] & b[1];
  assign #(2) g[2] = a[2] & b[2];
  assign #(2) g[3] = a[3] & b[3];

  // Step 2: Direct carry equations

  assign #(2) c1 =
      g[0] |
      (p[0] & cin);

  assign #(2) c2 =
      g[1] |
      (p[1] & g[0]) |
      (p[1] & p[0] & cin);

  assign #(2) c3 =
      g[2] |
      (p[2] & g[1]) |
      (p[2] & p[1] & g[0]) |
      (p[2] & p[1] & p[0] & cin);

  assign #(2) c4 =
      g[3] |
      (p[3] & g[2]) |
      (p[3] & p[2] & g[1]) |
      (p[3] & p[2] & p[1] & g[0]) |
      (p[3] & p[2] & p[1] & p[0] & cin);

  // Step 3: Sum bits

  assign #(2) sum[0] = p[0] ^ cin;
  assign #(2) sum[1] = p[1] ^ c1;
  assign #(2) sum[2] = p[2] ^ c2;
  assign #(2) sum[3] = p[3] ^ c3;

  assign #(2) cout = c4;

endmodule