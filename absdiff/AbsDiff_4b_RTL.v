//========================================================================
// AbsDiff_4b_RTL
//========================================================================

`ifndef ABS_DIFF_4B_RTL_V
`define ABS_DIFF_4B_RTL_V

`include "ece2300/ece2300-misc.v"

`include "absdiff/GTComparator_4b_RTL.v"
`include "absdiff/Mux2_4b_RTL.v"
`include "absdiff/Subtractor_4b_RTL.v"

module AbsDiff_4b_RTL
(
  (* keep=1 *) input  logic [3:0] in0,
  (* keep=1 *) input  logic [3:0] in1,
  (* keep=1 *) output logic [3:0] diff
);
always_comb begin

  // must use default value

  diff = 'x;

  // absdiff logic

  if ( in0 > in1 )
    diff = in0 - in1;
  else
    diff = in1 - in0;

  // explicit x-propagation

    `ECE2300_XPROP( diff, $isunknown(in0) || $isunknown(in1) );

end




endmodule

`endif /* ABS_DIFF_4B_RTL_V */
