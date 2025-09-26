//========================================================================
// AbsDiff_4b_RTL
//========================================================================

`ifndef ABS_DIFF_4B_RTL_V
`define ABS_DIFF_4B_RTL_V

`include "ece2300/ece2300-misc.v"

//''' ACTIVITY '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
// Include any other hardware modules as necessary
//''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

`include "absdiff/GTComparator_4b_RTL.v"
`include "absdiff/Mux2_4b_RTL.v"
`include "absdiff/Subtractor_4b_RTL.v"

module AbsDiff_4b_RTL
(
  (* keep=1 *) input  logic [3:0] in0,
  (* keep=1 *) input  logic [3:0] in1,
  (* keep=1 *) output logic [3:0] diff
);

  //''' ACTIVITY '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  // Implement 4b absolute difference unit using RTL
  //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  //:
  //: `ECE2300_UNUSED( in0 );
  //: `ECE2300_UNUSED( in1 );
  //: `ECE2300_UNDRIVEN( diff );

  logic cmp_gt;

  GTComparator_4b_RTL cmp
  (
    .in0 (in0),
    .in1 (in1),
    .gt  (cmp_gt)
  );

  logic [3:0] mux0_out;

  Mux2_4b_RTL mux0
  (
    .in0 (in1),
    .in1 (in0),
    .sel (cmp_gt),
    .out (mux0_out)
  );

  logic [3:0] mux1_out;

  Mux2_4b_RTL mux1
  (
    .in0 (in0),
    .in1 (in1),
    .sel (cmp_gt),
    .out (mux1_out)
  );

  logic bout_unused;

  Subtractor_4b_RTL sub
  (
    .in0  (mux0_out),
    .in1  (mux1_out),
    .bin  (1'b0),
    .bout (bout_unused),
    .diff (diff)
  );

  /*
  always_comb begin

    diff = 'x;

    if ( in0 > in1 )
      diff = in0 - in1;
    else
      diff = in1 - in0;

    `ECE2300_XPROP( diff, $isunknown(in0) || $isunknown(in1) );

  end
  */

endmodule

`endif /* ABS_DIFF_4B_RTL_V */
