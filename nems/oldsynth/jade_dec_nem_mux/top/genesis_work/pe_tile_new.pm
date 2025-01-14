package pe_tile_new;
use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

use Exporter;
use FileHandle;
use Env; # Make environment variables available


use Genesis2::Manager 1.00;
use Genesis2::UniqueModule 1.00;

@ISA = qw(Exporter Genesis2::UniqueModule);
@EXPORT = qw();
@EXPORT_OK = qw();
$VERSION = '1.0';
sub get_SrcSuffix {Genesis2::UniqueModule::private_to_me(); return ".svp";};
sub get_OutfileSuffix {Genesis2::UniqueModule::private_to_me(); return ".sv"};
############################### Module Starts Here ###########################


  sub to_verilog{ 
      # START PRE-GENERATED TO_VERILOG PREFIX CODE >>>
      my $self = shift;
      
      print STDERR "$self->{BaseModuleName}->to_verilog: Start user code\n" 
	  if $self->{Debug} & 8;
      # <<< END PRE-GENERATED TO_VERILOG PREFIX CODE
	$self->SUPER::to_verilog('/Users/akashlevy/OneDrive - Levylab/Documents/Research/Hybrid-RRAM-NEMS/cgra/jade/pe_tile_new/pe_tile_new.svp');
# START USER CODE FROM /Users/akashlevy/OneDrive - Levylab/Documents/Research/Hybrid-RRAM-NEMS/cgra/jade/pe_tile_new/pe_tile_new.svp PARSED INTO PACKAGE >>>
# line 1 "/Users/akashlevy/OneDrive - Levylab/Documents/Research/Hybrid-RRAM-NEMS/cgra/jade/pe_tile_new/pe_tile_new.svp"
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '///////////////////////////////////////////////////////////////////';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '// CGRA PE generator';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '//';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '// (C) Stanford University';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '// Please do not remove this header';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '//////////////////////////////////////////////////////////////////';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 use POSIX;
 #global
 my $bus_config = parameter(Name=>'bus_config', val=> "BUS16:16b#4_2:2_4:1_16:1_8:1_4 BUS1:1b#4_2:2_4:1_16:1_8:1_4", doc=>'buses used at global level.');
 my $all_segments_for_all_tiles =  parameter(Name=>'all_segments_for_all_tiles', val=> "1", doc=>'stagger or overlap segments');
 my $global_signal_count = parameter(Name=>'global_signal_count', val=> "4", doc=>'number of global signals supported');
 # for sb
 my $sides = parameter(Name=>'sides', val=> 4, doc=>'number of edges for a SB');
 my $feedthrough_outputs = parameter(Name=>'feedthrough_outputs', val=> "11000", doc=>'binary vector for feedthrough output config. Affects all sides. MSB corresponds to output 0 eg: 00000010 means output 7 is feedthrough. Length in bits = num_tracks.');
 my $registered_outputs = parameter(Name=>'registered_outputs', val=> "00110", doc=>'binary vector for registered output config. Affects all sides. MSB corresponds to output 0. Registering feedthrough outputs is ignored.');
 my $is_bidi = parameter(Name=>'is_bidi', val=> 0, doc=>'1 if SB pins are bidi. TBD.');
 my $sb_fs = parameter(Name=>'sb_fs', val=> "10000#10000#10000", doc=>'binary vector for modifying fanin of sb muxes');
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 # for cb
 my $cb_connections = parameter(Name=>'cb_connections', val=> "1111111111", doc=>'binary vector for specifying tracks that are muxed. MSB corresponds to track 0 eg: 1011 means tracks 0, 2, 3 are muxed to produce output for PE. Length in bits = num_tracks.');
 my $has_constant = parameter(Name=>'has_constant', val=> 1, doc=>'set to 1 if the CB has a register to supply a constant ');
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 # for pe
 my $reg_inputs = parameter(Name=>'reg_inputs', val=> 1, List=>[1, 0], doc=>'Add register on the inputs');
 my $reg_out    = parameter(Name=>'reg_out', val=> 1, List=>[1, 0], doc=>'Add register on the outputs');
 my $use_add    = parameter(Name=>'use_add', val=> 2, List=>[2, 1, 0], doc=>'0 - no adders, 1 - simple ADDs, 2 - SAD');
 my $use_cntr   = parameter(Name=>'use_cntr', val=> 1, List=>[1, 0],  doc=>'0 - no counter mode, 1 - enable counter mode');
 my $use_bool   = parameter(Name=>'use_bool', Val=> 1, List=>[1, 0], Doc=>"0 - no booleans, 1 - simple gates");
 my $use_shift  = parameter(Name=>'use_shift', val=> 1, List=>[1, 0], doc=>'Use shift operations');
 my $mult_mode  = parameter(Name=>'mult_mode', val=> 2, List=>[2, 1, 0], doc=>'Use MAD(2) or MULT(1) or None(0)');
 my $use_div    = parameter(Name=>'use_div', val=> 0, List=>[1, 0],  doc=>'0 - no divide, 1 - enable iterrative divide');
 my $is_msb     = parameter(Name=>'is_msb', val=> 0, List=>[1, 0], doc=>'1 - MSB in 32b mode, 0 - LSB result');
 my $en_double  = parameter(Name=>'en_double', val=> 0, List=>[1, 0], doc=>'1 - 32b supported, 0 - No 32b support');
 my $lut_inps   = parameter(Name=>'lut_inps',
                               Val=>3, Min=>0, Step=>1, Max=>16,
                               Doc=>"0 - no LUT, 1-16 - uses LUTs with that number of inputs");
      
 my $en_debug = parameter(Name=>'en_debug', val=> 1, List=>[1, 0], doc=>'Enable debuging registers?');
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 my $intra_tile_addr = 0;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 my $use_sad  = $use_add > 1;
 my $use_lut  = ($lut_inps > 1);
 my $use_c_input = ($use_sad > 0 || $mult_mode > 1 || $lut_inps > 3);
 my $use_cntr = ($use_add > 1) ? 1 : 0;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 #####################################################
 #Populate bus track hash
 #####################################################
 my %bus_width_hash = ();
 my %bus_segment_hash = ();
 my %bus_registered_outputs_hash = ();
 my %bus_num_tracks_hash = ();
 my $wide_bus_width = 0;
 foreach my $bus (split(' ', $bus_config)) {
   my $track_count=0;
   if ($bus=~m/(BUS\S+):(\S+)b#(\S+)/) {
     my $bus_name = $1;
     $bus_width_hash{ $bus_name } = $2;
     $bus_segment_hash{ $bus_name } = $3;
     if ($wide_bus_width < $bus_width_hash{ $bus_name }) {
       $wide_bus_width = $bus_width_hash{ $bus_name };
     }
     foreach my $seg_info (split(':',$bus_segment_hash{ $bus_name })) {
       $seg_info =~ m/(\S+)_(\S+)/;
       my $segment_length = $1;
       if ($all_segments_for_all_tiles==1) {
         $track_count += $segment_length;
       } else {
         $track_count += 1;
       }
     }
     $bus_num_tracks_hash{ $bus_name } = $track_count;
   }
 }
 my $filename = "TILE".$self->mname();
 open(TILEINFO, ">$filename") or die "Couldn't open file $filename, $!";
 my $tile_info_hash;
 my $rename_hash;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'module '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } mname; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' (';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'clk_in,';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'config_addr,';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'config_data,';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'config_read,';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'config_write,';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
   for my $bus (sort keys %bus_width_hash) {
     my $num_tracks = $bus_num_tracks_hash { $bus };
     for(my $i=0; $i<$sides; $i++) {
       for(my $j=0; $j<$num_tracks; $j++) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $bus; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ',';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'in_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $bus; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ',';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
      }
     }
   }
   for (my $i=0; $i<$global_signal_count; $i++) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'gin_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${i}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ',';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
   }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'gout,';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'reset,';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'tile_id,';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'read_data';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ');';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 my $config_bits_used = 0;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input clk_in;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input [31:0] config_addr;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input [31:0] config_data;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input config_read;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input config_write;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
   for my $bus (sort keys %bus_num_tracks_hash) {
     my $num_tracks = $bus_num_tracks_hash { $bus };
     my $bus_width = $bus_width_hash { $bus };
     for(my $i=0; $i<$sides; $i++) {
       for(my $j=0; $j<$num_tracks; $j++) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  output ['; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $bus_width-1; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ':0] out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $bus; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input ['; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $bus_width-1; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ':0] in_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $bus; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
      }
     }
   }
   for (my $i=0; $i<$global_signal_count; $i++) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input gin_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${i}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
   }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  output reg gout;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input [15:0] tile_id;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  input reset;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  output reg [31:0] read_data;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  wire clk_en;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  wire ___genesis_wire_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${global_signal_count}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${bus_config}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${all_segments_for_all_tiles}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${sides}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${feedthrough_outputs}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${registered_outputs}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${is_bidi}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${sb_fs}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${cb_connections}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${has_constant}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${reg_inputs}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${reg_out}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${use_add}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${use_cntr}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${use_bool}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${use_shift}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${mult_mode}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${use_div}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${is_msb}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${en_double}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${lut_inps}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 # wire clk;
 #############################################################
 # Generate PE enables
 #############################################################
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 if($use_lut || $reg_inputs) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '   reg config_en_pe;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '   always @(*) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '     if (reset) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '        config_en_pe = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '     end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '        if ((config_addr[15:0]==tile_id)&&(config_addr[23:16]==8\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $intra_tile_addr; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ')&&config_write) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '          config_en_pe = 1\'b1;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '        end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '          config_en_pe = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '        end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '     end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '   end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    } 
    $tile_info_hash->{ 'pe' } = {
      address => $intra_tile_addr
    };
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '     logic [31:0] read_data_pe;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '   ';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '   ';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
   $intra_tile_addr+=1;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '   ';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    if(!($use_lut || $reg_inputs)) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  reg [31:0] opcode;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  always @(posedge clk_in or posedge reset) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    if (reset) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       opcode <= 32\'d0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       if ((config_addr[15:0]==tile_id)&&(config_addr[23:16]==8\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $intra_tile_addr; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ')) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '         opcode <= config_data;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 $tile_info_hash->{ 'opcode' } = {
   address => $intra_tile_addr
 };
}
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  ';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 #############################################################
 # Generate CBs and corresponding config enables
 #############################################################
 my @non_pe_inputs = ("BUS1#cg_en");
 my @pe_inputs = ("BUS16#data0","BUS16#data1","BUS1#bit0","BUS1#bit1","BUS1#bit2");
 if ($en_double & $use_shift) {
   push @pe_inputs, "BUS16#op_a_shift";
 }
 if ($use_c_input) {
   push @pe_inputs, "BUS16#data2";
 }
 if($en_double & $use_add > 0) {
   if($is_msb) {
     push @pe_inputs, "BUS16#carry_in";
     push @pe_inputs, "BUS1#cmpr_eq_in";
   } else {
     push @pe_inputs, "BUS1#res_p_msb";
   }
 }
 if($use_div) {
   if($is_msb) {
     push @pe_inputs,  "BUS16#div_low_msb";
   } elsif(!$en_double) {
     push @pe_inputs,  "BUS1#res_p_msb";
   }
   push @pe_inputs,  "BUS16#div_ci";
 }
 my $num_tracks_wide = $bus_num_tracks_hash{'BUS16'};
 my $num_tracks_1b = $bus_num_tracks_hash{'BUS1'};
 my $cb_wide = generate('cb', 'cbwide_base', width=>$wide_bus_width, num_tracks=>($num_tracks_wide*2), has_constant=>$has_constant, feedthrough_outputs=>$cb_connections);
 my $cb_1b = generate('cb', 'cb1b_base', width=>1, num_tracks=>(($num_tracks_1b*2)+$global_signal_count), has_constant=>$has_constant, feedthrough_outputs=>$cb_connections);
 my $cb_cg = generate('cb', 'cb1b_cg', width=>1, num_tracks=>(($num_tracks_1b*2)+$global_signal_count), has_constant=>0, feedthrough_outputs=>$cb_connections);
 my @cb_connections_arr = split('',$cb_connections);
 my $input_count=0;
 my $num_tracks;
 my $cb;

 #######

foreach my $pe_input (@pe_inputs,@non_pe_inputs) {
 ##
 ## Generate config enables for the input CB
 ##
 $intra_tile_addr+=1;
 $pe_input =~ m/(\S*)#(\S*)/;
 my $pe_input_bus = $1;
 my $pe_input_name = $2;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  reg config_en_cb_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  always @(*) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    if (reset) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       config_en_cb_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       if ((config_addr[15:0]==tile_id)&&(config_addr[23:16]==8\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $intra_tile_addr; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ')&&config_write) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '         config_en_cb_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' = 1\'b1;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '         config_en_cb_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  logic [31:0] read_data_cb_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 $tile_info_hash->{ 'cb_'.$pe_input_name } = {
   address => $intra_tile_addr
 };
 ##
 ## Instantiate the CB
 ##
 my $xside;
 if ($input_count % 2 == 0) {
  $xside = 2;
 } else {
  $xside = 1;
 }
 if ($pe_input_bus eq "BUS16") {
   $cb = clone($cb_wide,'cb_'.$pe_input_name);
    $num_tracks=$num_tracks_wide;
 } elsif ($pe_input_name eq "cg_en") {
   $cb = clone($cb_cg,'cb_'.$pe_input_name);
   $num_tracks=$num_tracks_1b;
 } else {
   $cb = clone($cb_1b,'cb_'.$pe_input_name);
   $num_tracks=$num_tracks_1b;
 }
 if ($pe_input_bus eq "BUS16") {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  wire [15:0] '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
   } else {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  wire '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
   }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $cb->instantiate(); print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  (';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .clk(clk_in),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .reset(reset),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .out('; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 my $k=0;
   for(my $j=0; $j<$num_tracks*2; $j++, $k++) {
     my $dirn;
     my $track = $k % $num_tracks;
     if ($j < $num_tracks) {
       $dirn="in";
     } else {
       $dirn="out";
     }
     if (@cb_connections_arr[$j]==1) {
       if ($pe_input_bus eq "BUS16") {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .in_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $k; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '('; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${dirn}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_BUS16_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${xside}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${track}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
         $rename_hash->{ 'cb_'.$pe_input_name }{"in_${k}"} = "${dirn}_BUS16_S${xside}_T${track}";
       } else {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .in_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $k; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '('; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${dirn}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_BUS1_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${xside}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${track}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
         $rename_hash->{ 'cb_'.$pe_input_name }{"in_${k}"} = "${dirn}_BUS1_S${xside}_T${track}";
       }
     }
   }
   if ($pe_input_bus eq "BUS1") {
     for (my $i=0; $i<$global_signal_count; $i++, $k++) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .in_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $k; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(gin_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${i}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
       $rename_hash->{ 'cb_'.$pe_input_name }{"in_${k}"} = "gin_${i}";
     }
   }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_addr(config_addr),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_data(config_data),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_en(config_en_cb_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .read_data(read_data_cb_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_input_name; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ')';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  );';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 $tile_info_hash->{ 'cb_'.$pe_input_name }{'bus'} = $pe_input_bus;
 $tile_info_hash->{ 'cb_'.$pe_input_name }{'mname'} = $cb->mname();
 $rename_hash->{ 'cb_'.$pe_input_name }{'out'} = $pe_input_name;
 $input_count = $input_count+1;
 };
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 if($en_debug) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    wire pe_out_irq;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  assign clk_en = ~cg_en;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 #############################################################
 # Generate SB and corresponding config enables
 #############################################################
 ##
 ## wide SB
 ##
$intra_tile_addr+=1;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  reg config_en_sb_wide;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  always @(*) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    if (reset) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       config_en_sb_wide = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       if ((config_addr[15:0]==tile_id)&&(config_addr[23:16]==8\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $intra_tile_addr; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ')&&config_write) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '         config_en_sb_wide = 1\'b1;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '         config_en_sb_wide = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  logic [31:0] read_data_sb_wide;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 $tile_info_hash->{ 'sb_wide' } = {
   address => $intra_tile_addr
 };
 $feedthrough_outputs =~ m/BUS16:(\S+)/;
 my $bus_feedthrough_outputs = $1;
 $registered_outputs =~ m/BUS16:(\S+)/;
 my $bus_registered_outputs = $1;

 my @wide_outputs = ("res");
 if($en_double & $mult_mode > 0) {
   push @wide_outputs, "mult_res";
 }
 if($use_div) {
   push @wide_outputs, "div_co";
 }
 if($en_double & $use_add > 0) {
   if($is_msb) {
   } else {
      push @wide_outputs, "carry_out";
   }
 }
  foreach my $pe_output (@wide_outputs) {
    if ($pe_output eq "mult_res") {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  wire ['; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 2*$wide_bus_width-1; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ':0] pe_out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_output; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    } else {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  wire ['; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $wide_bus_width-1; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ':0] pe_out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_output; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    }
  }
   my $output_count = 0;
   my $sb_wide = generate('sb', 'sb_wide', width => $wide_bus_width, num_tracks => $bus_num_tracks_hash{'BUS16'}, sides => $sides, feedthrough_outputs=>$bus_feedthrough_outputs, registered_outputs=>$bus_registered_outputs, pe_output_count=>(scalar @wide_outputs), is_bidi=>$is_bidi, sb_fs=>$sb_fs);
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $sb_wide->instantiate(); print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  (';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .clk(clk_in),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .clk_en(clk_en),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .reset(reset),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
  foreach my $pe_output (@wide_outputs) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .pe_output_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $output_count; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(pe_out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_output; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    $rename_hash->{ 'sb_wide' }{'pe_output_'.$output_count} = "pe_out_".$pe_output;
    $output_count = $output_count + 1;
  }
 for(my $i=0; $i<$sides; $i++) {
  for(my $j=0; $j<$bus_num_tracks_hash{'BUS16'}; $j++) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(out_BUS16_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .in_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(in_BUS16_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    $rename_hash->{ 'sb_wide' }{"out_${i}_${j}"} = "out_BUS16_S${i}_T${j}";
    $rename_hash->{ 'sb_wide' }{"in_${i}_${j}"} = "in_BUS16_S${i}_T${j}";
  }
 }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_addr(config_addr),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_data(config_data),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_en(config_en_sb_wide),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .read_data(read_data_sb_wide)';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  );';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 $tile_info_hash->{ 'sb_wide' }{'bus'} = 'BUS16';
 $tile_info_hash->{ 'sb_wide' }{'mname'} = $sb_wide->mname();
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 ##
 ## 1-bit SB
 ##

 $feedthrough_outputs =~ m/BUS1:(\S+)/;
 my $bus_feedthrough_outputs = $1;
 $registered_outputs =~ m/BUS1:(\S+)/;
 my $bus_registered_outputs = $1;
  $intra_tile_addr+=1;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  reg config_en_sb_1bit;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  always @(*) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    if (reset) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       config_en_sb_1bit = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       if ((config_addr[15:0]==tile_id)&&(config_addr[23:16]==8\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $intra_tile_addr; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ')&&config_write) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '         config_en_sb_1bit = 1\'b1;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '         config_en_sb_1bit = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  logic [31:0] read_data_sb_1bit;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 $tile_info_hash->{ 'sb_1bit' } = {
   address => $intra_tile_addr
 };

 my @bit1_outputs = ("res_p");
 if($en_double & $use_add > 0) {
   if($is_msb) {
   } else {
   push @bit1_outputs, "cmpr_eq_out";
   }
 }
  foreach my $pe_output (@bit1_outputs) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  wire pe_out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_output; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
  }
   my $output_count = 0;
   my $sb_1b = generate('sb', 'sb_1b', width => 1, num_tracks => $bus_num_tracks_hash{'BUS1'}, sides => $sides, feedthrough_outputs=>$bus_feedthrough_outputs, registered_outputs=>$bus_registered_outputs, pe_output_count=>(scalar @bit1_outputs), is_bidi=>$is_bidi, sb_fs=>$sb_fs);
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $sb_1b->instantiate(); print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  (';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .clk(clk_in),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .clk_en(clk_en),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .reset(reset),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
  foreach my $pe_output (@bit1_outputs) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .pe_output_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $output_count; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(pe_out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe_output; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    $rename_hash->{ 'sb_1bit' }{'pe_output_'.$output_count} = "pe_out_".$pe_output;
    $output_count = $output_count + 1;
  }
 for(my $i=0; $i<$sides; $i++) {
  for(my $j=0; $j<$bus_num_tracks_hash{'BUS1'}; $j++) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(out_BUS1_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .in_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(in_BUS1_S'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $i; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '_T'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $j; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    $rename_hash->{ 'sb_1bit' }{"out_${i}_${j}"} = "out_BUS1_S${i}_T${j}";
    $rename_hash->{ 'sb_1bit' }{"in_${i}_${j}"} = "in_BUS1_S${i}_T${j}";
  }
 }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_addr(config_addr),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_data(config_data),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .config_en(config_en_sb_1bit),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    .read_data(read_data_sb_1bit)';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  );';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 $tile_info_hash->{ 'sb_1bit' }{'bus'} = 'BUS1';
 $tile_info_hash->{ 'sb_1bit' }{'mname'} = $sb_1b->mname();
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 #####################################
 ## global out signal
 #####################################

  $intra_tile_addr+=1;
  my $gout_output_count = 1;
  if($en_debug) {
    $gout_output_count += 1;
  }
  my $number_of_gout_select_bits_needed = int(ceil(log($gout_output_count)/log(2)));

   $tile_info_hash->{ 'gout' } = {
     address => $intra_tile_addr,
     mux_map => ""
   };
 if ($number_of_gout_select_bits_needed > 0) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  reg ['; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $number_of_gout_select_bits_needed - 1; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ':0] gout_sel;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  always @(posedge clk_in or posedge reset) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    if (reset==1\'b1) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       gout_sel <= '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $number_of_gout_select_bits_needed; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '\'d0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end else begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       if ((config_addr[15:0]==tile_id)&&(config_addr[23:16]==8\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $intra_tile_addr; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ')) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '         gout_sel  <= config_data['; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $number_of_gout_select_bits_needed - 1; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ':0];';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '       end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 

   my $count = 0;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  always @(*) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    case (gout_sel)';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
    my @output_arr = ();
    push @output_arr, "1'b0";
    if ($en_debug) {push @output_arr, "pe_out_irq";}
    foreach my $pe_output (@output_arr) {
      if ($count==0) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '      default: gout = 1\'b0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
      }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '      '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $number_of_gout_select_bits_needed; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $count; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ': gout = '; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ${pe_output}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
      $pe_output =~ s/1'b//;
      my $str = "      <src sel='${count}'>${pe_output}</src>\n";
      $tile_info_hash->{ 'gout' }{ 'mux_map' } .= $str;
      $count = $count + 1;
    }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    endcase';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
  }
 #####################################
 ## clock_gating
 #####################################
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '/****************************************';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' * Clock gating should go inside each unit in order to unstall certain register';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' * assign clk = clk_in & cg_en;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' *';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' ****************************************/';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 #############################################################
 # Generate PE
 #############################################################
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
my $pe = generate('test_pe', 'test_pe', reg_inputs => $reg_inputs,
                   reg_out => $reg_out, use_add => $use_add,
                   use_cntr => $use_cntr, use_bool => $use_bool, use_shift => $use_shift,
                   mult_mode => $mult_mode, use_div => $use_div, is_msb => $is_msb,
                   en_double => $en_double, lut_inps => $lut_inps, en_debug => $en_debug);
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ''; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $pe->instantiate(); print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' (';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
if($use_lut || $reg_inputs || $reg_out) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .clk(clk_in),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .rst_n(~reset),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .clk_en(clk_en),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
}
 if($use_lut || $reg_inputs) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .cfg_d(config_data[31:0]),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .cfg_a(config_addr[31:24]),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .cfg_en(config_en_pe),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
} else {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .op_code(opcode[15:0]),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  // Note: verilator complains because opcode[31:16] goes unused...';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  // For now, I will try to fix it with a verilator directive (/* verilator lint_off UNUSED */)';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  // FIXME owner please verify that you mean for these bits to go unused and';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  // FIXME maybe add a comment to that effect...?';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
}
 foreach my $port (@pe_inputs) {
    $port =~ m/\S+#(\S*)/;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $1; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '('; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $1; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 }
 foreach my $port (@wide_outputs) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $port; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(pe_out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $port; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 }
 my $count=0;
 foreach my $port (@bit1_outputs) {
   $count = $count + 1;
   if ($count==(scalar @bit1_outputs)) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $port; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(pe_out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $port; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
  } else {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $port; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '(pe_out_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $port; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
  }
 }
 if($en_debug) {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '      .irq(pe_out_irq),';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '  .read_data(read_data_pe)';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ');';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
 $tile_info_hash->{ 'pe' }{'mname'} = $pe->mname();


#######################################################################
## MUX for read_data output 
##
#######################################################################
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'always_comb begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    if (config_read && (config_addr[15:0]==tile_id)) begin';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '        case (config_addr[23:16])';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
     foreach my $key (sort { $tile_info_hash->{$a}{'address'} cmp $tile_info_hash->{$b}{'address'} } keys(%$tile_info_hash))  {
       if($key ne 'gout') {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '          8\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $tile_info_hash->{$key}->{'address'}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' : read_data = read_data_'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $key; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ';';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
       } else {
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '               8\'d'; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } $tile_info_hash->{$key}->{'address'}; print { $Genesis2::UniqueModule::myself->{OutfileHandle} } ' : read_data = gout_sel;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
       }
     }
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '          default : read_data = \'d0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '        endcase';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    end ';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '    else';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '        read_data = \'d0;';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'end';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } '';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
#######################################################################
## Generate tile connectivity, and pe info
##
#######################################################################
foreach my $feature (sort keys %$tile_info_hash)  {
  my $value = $tile_info_hash->{$feature};
################### PEs
  if ($feature=~m/pe/) {
    print TILEINFO "    <pe feature_address='$value->{'address'}'>\n";
    my $filename = "PE".$value->{'mname'};
    open (INP, "<$filename") or die "Couldn't open file $filename, $!";
    while (<INP>) {
      my $line = $_;
      print TILEINFO $line;
    }
    close INP;
    print TILEINFO "    </pe>\n"
  }
################### CBs
  if ($feature=~m/cb/) {
    print TILEINFO "    <cb feature_address='$value->{'address'}' bus='$value->{'bus'}'>\n";
    my $filename = "CB".$value->{'mname'};
    open (INP, "<$filename") or die "Couldn't open file $filename, $!";
    while (<INP>) {
      my $line = $_;
      foreach my $find (keys %{$rename_hash->{$feature}}) {
         my $replace = ${$rename_hash->{$feature}}{$find};
#        print TILEINFO "$find###$replace###$line\n";
         $line=~s/>$find</>$replace</g;
         $line=~s/='$find'>/='$replace'>/g;
      }
      print TILEINFO $line;
    }
    close INP;
    print TILEINFO "    </cb>\n"
  }
################### SBs
  if ($feature=~m/sb_/) {
    print TILEINFO "    <sb feature_address='$value->{'address'}' bus='$value->{'bus'}'>\n";
    my $filename = "SB".$value->{'mname'};
    open (INP, "<$filename") or die "Couldn't open file $filename, $!";
    while (<INP>) {
      my $line = $_;
      foreach my $find (keys %{$rename_hash->{$feature}}) {
         my $replace = ${$rename_hash->{$feature}}{$find};
#        print TILEINFO "$find###$replace###$line\n";
         $line=~s/>$find</>$replace</g;
         $line=~s/'$find'/'$replace'/g;
      }
      print TILEINFO $line;
    }
    close INP;
    print TILEINFO "    </sb>\n"
  }
################### Global signal out
  if ($feature=~m/gout/) {
    print TILEINFO "    <gout feature_address='$value->{'address'}'>\n";
    foreach my $param_name (sort keys %$value) {
      my $param_value = $value->{$param_name};
      if ($param_name!~m/address/) {
        print TILEINFO "$param_value";
      }
    }
    print TILEINFO "    </gout>\n"
  }

 #End of TILEINFO loop
}
close TILEINFO;
print { $Genesis2::UniqueModule::myself->{OutfileHandle} } 'endmodule';print { $Genesis2::UniqueModule::myself->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /Users/akashlevy/OneDrive - Levylab/Documents/Research/Hybrid-RRAM-NEMS/cgra/jade/pe_tile_new/pe_tile_new.svp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
