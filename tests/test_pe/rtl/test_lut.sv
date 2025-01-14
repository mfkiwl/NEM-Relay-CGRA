//
//--------------------------------------------------------------------------------
//          THIS FILE WAS AUTOMATICALLY GENERATED BY THE GENESIS2 ENGINE        
//  FOR MORE INFORMATION: OFER SHACHAM (CHIP GENESIS INC / STANFORD VLSI GROUP)
//    !! THIS VERSION OF GENESIS2 IS NOT FOR ANY COMMERCIAL USE !!
//     FOR COMMERCIAL LICENSE CONTACT SHACHAM@ALUMNI.STANFORD.EDU
//--------------------------------------------------------------------------------
//
//  
//	-----------------------------------------------
//	|            Genesis Release Info             |
//	|  $Change: 11879 $ --- $Date: 2013/06/11 $   |
//	-----------------------------------------------
//	
//
//  Source file: /Users/akashlevy/OneDrive - Levylab/Documents/Research/CGRAGenerator/hardware/generator_z/pe_new/pe/rtl/test_lut.svp
//  Source template: test_lut
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter lut_inps 	= 3
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Command Line input (priority=4):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From XML input (priority=3):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Config File input (priority=2):
//
// ---------------- End Pre-Generation Pramameters Status Report ----------------

// lut_inps (_GENESIS2_INHERITANCE_PRIORITY_) = 3
//
module  test_lut  #(
  parameter DataWidth = 16
) (
  input                  cfg_clk,
  input                  cfg_rst_n,
  input  [31:0]          cfg_d,
  input  [7:0]           cfg_a,
  input                  cfg_en,

  input  [DataWidth-1:0] op_a_in,
  input  [DataWidth-1:0] op_b_in,

  input               op_c_in,
  output logic [31:0] read_data,
  output logic [DataWidth-1:0] res
);

genvar ggg;
generate
  for (ggg = 0; ggg < DataWidth; ggg = ggg +1) begin : GEN_LUT

    logic [7:0] lut;

    always_ff @(posedge cfg_clk or negedge cfg_rst_n) begin
      if(~cfg_rst_n) begin
        lut   <= 8'h0;
      end else if(cfg_en && (cfg_a == $unsigned(ggg/4)) ) begin
        lut   <= cfg_d[7: 0];
      end
    end

    assign res[ggg] = lut[{op_c_in, op_b_in[ggg], op_a_in[ggg]}];
    assign read_data = {24'b0, lut};
  end
endgenerate

endmodule




