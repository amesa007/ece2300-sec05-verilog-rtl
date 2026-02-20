//========================================================================
// Subtractor_4b_RTL
//========================================================================

`ifndef SUBTRACTOR_4B_RTL_V
`define SUBTRACTOR_4B_RTL_V

`include "ece2300/ece2300-misc.v"

module Subtractor_4b_RTL
(
  (* keep=1 *) input  logic [3:0] in0,
  (* keep=1 *) input  logic [3:0] in1,
  (* keep=1 *) input  logic       bin,
  (* keep=1 *) output logic       bout,
  (* keep=1 *) output logic [3:0] diff
);

logic [4:0] result;
  always_comb begin
    result = in0 - in1;
    result = result - {3'b0,bin};
    bout   = result[4];
    diff   = result[3:0];
  end

endmodule

`endif /* SUBTRACTOR_4B_RTL_V */

