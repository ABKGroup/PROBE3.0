#################################################################################################
#                                                                                               #
#     Portions Copyright © 2022 Synopsys, Inc. All rights reserved. Portions of                 #
#     these TCL scripts are proprietary to and owned by Synopsys, Inc. and may only             #
#     be used for internal use by educational institutions (including United States             #
#     government labs, research institutes and federally funded research and                    # 
#     development centers) on Synopsys tools for non-profit research, development,              #
#     instruction, and other non-commercial uses or as otherwise specifically set forth         #
#     by written agreement with Synopsys. All other use, reproduction, modification, or         #
#     distribution of these TCL scripts is strictly prohibited.                                 #
#                                                                                               #
#################################################################################################

########## USER INPUT #########

set top_module _DESIGN_
set libname _LIBNAME_
set list_lib "${libname}.db"
set rtl_list "${top_module}.v"
set sdc "${top_module}.sdc"

###############################

# Target library
set link_library $list_lib
set target_library $list_lib

set symbol_library {}
set wire_load_model ""
set wire_load_mode enclosed
set timing_use_enhanced_capacitance_modeling true

set search_path [concat $search_path ]
set dont_use_cells 1
set dont_use_cell_list ""

set synthetic_library {}
set link_path [concat  $link_library $synthetic_library]

# Start
remove_design -all
if {[file exists template]} {
	exec rm -rf template
}
exec mkdir template
if {![file exists gate]} {
	exec mkdir gate
}
if {![file exists rpt]} {
	exec mkdir rpt
}

# Compiler drectives
set compile_effort   "high"
set compile_flatten_all 1
set compile_no_new_cells_at_top_level false
set hdlin_enable_vpp true
set hdlin_auto_save_templates false
set design_lib WORK
define_design_lib $design_lib -path template
set verilogout_single_bit false
set enforce_input_fanout_one 0

# read RTL
foreach rtl_file $rtl_list {
	analyze -format verilog -lib $design_lib $rtl_file
}
elaborate $top_module -lib $design_lib -update

current_design $top_module

# Link Design
set dc_shell_status [ link ]
if {$dc_shell_status == 0} {
	echo "****************************************************"
	echo "* ERROR!!!! Failed to Link...exiting prematurely.  *"
	echo "****************************************************"
	exit
}

# Default SDC Constraints
read_sdc ${sdc}

# Environment and compile options 
set_max_area 0
set_leakage_optimization true

# Input Fanout Control
if {[info exists enforce_input_fanout_one] && ($enforce_input_fanout_one  == 1)} {
	set_max_fanout 1 $non_ideal_inputs
}

# More constraints and setup before compile
foreach_in_collection design [ get_designs "*" ] {
	current_design $design
	set_fix_multiple_port_nets -all
}
current_design $top_module

foreach_in_collection flop [all_registers] {
  set flopName [get_attri $flop full_name]
  set_register_merging $flopName FALSE
}

set_fix_hold [all_clocks]

# Compile
if {[info exists compile_flatten_all] && ($compile_flatten_all  == 1)} {
	ungroup -flatten -all
}
set_fix_multiple_port_nets -all


set dc_shell_status [ compile_ultra -scan -no_autoungroup -timing_high_effort_script  -exact_map ]

if {$dc_shell_status == 0} {
	echo "*******************************************************"
	echo "* ERROR!!!! Failed to compile...exiting prematurely.  *"
	echo "*******************************************************"
	exit
}
sh date

current_design $top_module
define_name_rules verilog -remove_internal_net_bus -remove_port_bus
change_names -rules verilog -hierarchy

if {[info exists use_physopt] && ($use_physopt == 1)} {
	write -format verilog -hier -output [format "%s%s%s" gate/ $top_module _hier_fromdc.v]
} else {
	write -format verilog -hier -output [format "%s%s%s" gate/ $top_module .v]
}

current_design $top_module
write_sdc [format "%s%s%s" gate/ $top_module .sdc]

# Write Reports
redirect [format "%s%s%s" rpt/ $top_module _area.rep] { report_area }
redirect -append [format "%s%s%s" rpt/ $top_module _area.rep] { report_reference }
redirect [format "%s%s%s" rpt/ $top_module _cell.rep] { report_cell }
redirect [format "%s%s%s" rpt/ $top_module _design.rep] { report_design }
redirect [format "%s%s%s" rpt/ $top_module _power.rep] { report_power }
redirect [format "%s%s%s" rpt/ $top_module _timing.rep] \
  { report_timing -path full -max_paths 100 -nets -transition_time -capacitance -significant_digits 3}
redirect [format "%s%s%s" rpt/ $top_module _check_timing.rep] { check_timing }
redirect [format "%s%s%s" rpt/ $top_module _check_design.rep] { check_design }


set inFile  [open rpt/$top_module\_area.rep]
while { [gets $inFile line]>=0 } {
    if { [regexp {Total cell area:} $line] } {
        set AREA [lindex $line 3]
    }
}
close $inFile
set inFile  [open rpt/$top_module\_power.rep]
while { [gets $inFile line]>=0 } {
    if { [regexp {Total Dynamic Power} $line] } {
        set PWR [lindex $line 4]
    } elseif { [regexp {Cell Leakage Power} $line] } {  
        set LEAK [lindex $line 4] 
    }
}
close $inFile

set path    [get_timing_path -nworst 1]
set WNS     [get_attribute $path slack]

set outFile [open result_dc.rpt w]
puts $outFile "$AREA\t$WNS\t$PWR\t$LEAK"
close $outFile

## Create cellmaster file
set cellList [get_cells -hier * -filter "is_hierarchical==false"]
set outfp [open ${top_module}_cell.master "w"]
foreach_in_collection cell $cellList {
    set master [get_attribute -quiet $cell ref_name]
    set name   [get_attribute -quiet $cell full_name]
    if { [regexp {Logic} $name] } { continue }
    if { [regexp {Mem} $name] } {
        puts $outfp "$name $master"
    }
}
close $outfp

# Check Design and Detect Unmapped Design
set unmapped_designs [get_designs -filter "is_unmapped == true" $top_module]
if {  [sizeof_collection $unmapped_designs] != 0 } {
	echo "****************************************************"
	echo "* ERROR!!!! Compile finished with unmapped logic.  *"
	echo "****************************************************"
	exit
}
echo "run.scr completed successfully"

exit
