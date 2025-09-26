//========================================================================
// mux-rtl-sim +in0=0000 +in1=0000 +sel=0
//========================================================================
// Author : Christopher Batten (Cornell)
// Date   : September 27, 2024

`include "absdiff/Mux2_4b_RTL.v"

//========================================================================
// Top
//========================================================================

module Top();

  //----------------------------------------------------------------------
  // Instantiate mux
  //----------------------------------------------------------------------

  logic [3:0] in0;
  logic [3:0] in1;
  logic       sel;
  logic [3:0] out;

  Mux2_4b_RTL mux
  (
    .in0 (in0),
    .in1 (in1),
    .sel (sel),
    .out (out)
  );

  //----------------------------------------------------------------------
  // Perform the simulation
  //----------------------------------------------------------------------

  initial begin

    // Process command line arguments

    if ( !$value$plusargs( "in0=%b", in0 ) )
      in0 = 4'b0000;

    if ( !$value$plusargs( "in1=%b", in1 ) )
      in1 = 4'b0000;

    if ( !$value$plusargs( "sel=%b", sel ) )
      sel = 1'b0;

    // Advance time

    #10;

    // Display output

    $display( "in0 = %b", in0 );
    $display( "in1 = %b", in1 );
    $display( "sel = %b", sel );
    $display( "out = %b", out );

    $finish;
  end

endmodule

