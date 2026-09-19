// tb.v
// Self-checking testbench for the 4-bit ALU.

module tb;

  reg  [3:0] t_a;
  reg  [3:0] t_b;
  reg        t_op;

  wire [3:0] t_result;

  reg  [3:0] expected;

  integer a_value;
  integer b_value;
  integer op_value;
  integer errors;
  integer total;

  alu DUT (

    .a      (t_a),

    .b      (t_b),

    .op     (t_op),

    .result (t_result)

  );

  // Waveform dump configuration

  string vcd_file;

  initial begin

    if ($value$plusargs("vcd=%s", vcd_file)) begin

      $dumpfile(vcd_file);

      $dumpvars(0, DUT);

    end

  end

  initial begin

    errors = 0;

    total = 0;

    for (a_value = 0; a_value < 16; a_value = a_value + 1) begin

      for (b_value = 0; b_value < 16; b_value = b_value + 1) begin

        for (op_value = 0; op_value < 2; op_value = op_value + 1) begin

          t_a  = a_value;

          t_b  = b_value;

          t_op = op_value;

          #5;

          if (t_op == 0)

            expected = t_a + t_b;

          else

            expected = t_a - t_b;

          total = total + 1;

          if (t_result !== expected) begin

            $display("FAIL: a=%0d b=%0d op=%0d got=%0d expected=%0d",

                     t_a, t_b, t_op, t_result, expected);

            errors = errors + 1;

          end

        end

      end

    end

    $display("SUMMARY: %0d passed out of %0d; %0d failed",

             total - errors, total, errors);

    $finish;

  end

endmodule