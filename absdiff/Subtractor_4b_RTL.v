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

  //''' ACTIVITY '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  // Implement 4b subtractor using RTL
  //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  //:
  //: `ECE2300_UNUSED( in0 );
  //: `ECE2300_UNUSED( in1 );
  //: `ECE2300_UNUSED( bin );
  //: `ECE2300_UNDRIVEN( bout );
  //: `ECE2300_UNDRIVEN( diff );

  logic [4:0] result;
  assign result = in0 - in1 - {3'b0,bin};
  assign bout = result[4];
  assign diff = result[3:0];

  // logic [4:0] temp;
  // always_comb begin
  //   temp = in0 - in1;
  //   temp = temp - {3'b0,bin};
  //   bout = temp[4];
  //   diff = temp[3:0];
  // end

endmodule

`endif /* SUBTRACTOR_4B_RTL_V */

