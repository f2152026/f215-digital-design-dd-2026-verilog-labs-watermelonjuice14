// and_beh_intra.v
// Two-input AND gate with an intra-assignment delay.

module and_beh_intra (

  input      a,

  input      b,

  output reg y

);

  always @(*) begin

    y = #1 a & b;

  end

endmodule