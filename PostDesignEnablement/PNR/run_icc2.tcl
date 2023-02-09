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
set design _DESIGN_
set lib_name _LIBNAME_
set util _UTIL_
set pp _PP_
set pdn _PDN_
set beol _BEOL_
set pgpin _PGPIN_
set m0p _M0P_
set m1p _M1P_
set m2p _M2P_
set cpp _CPP_
set insertion_type _METHOD_
set pitch _PITCH_
###############################

#source icc2_func.tcl

if {![file exists icc2_report]} {
	exec mkdir icc2_report
}

if {[file exists $design]} {
	exec chmod -R 777 $design
	exec rm -r $design
}

# read lib
set clib_name "probe"
set search_path "."
set target_library "${lib_name}.db"
set link_library "* $target_library"
set techfile "${lib_name}.tf"
#set M1_offset [expr [format %f $cpp]/2000]
set M1_offset 0.0

if {[string match "BPR" $pgpin]} {
  set tech_info "{M0 horizontal 0.0} {M1 vertical $M1_offset} {M2 horizontal 0.0} {M3 vertical 0.0} {M4 horizontal 0.0} {M5 vertical 0.0} {M6 horizontal 0.0} {M7 vertical 0.0} {M8 horizontal 0.0} {M9 vertical 0.0} {M10 horizontal 0.0} {M11 vertical 0.0} {M12 horizontal 0.0} {M13 vertical 0.0}"
} else {
  set M0_offset [expr [format %f $m0p]/2000]
  set M2_offset [expr [format %f $m2p]/2000]
  set tech_info "{M0 horizontal $M0_offset} {M1 vertical $M1_offset} {M2 horizontal $M2_offset} {M3 vertical 0.0} {M4 horizontal 0.0} {M5 vertical 0.0} {M6 horizontal 0.0} {M7 vertical 0.0} {M8 horizontal 0.0} {M9 vertical 0.0} {M10 horizontal 0.0} {M11 vertical 0.0} {M12 horizontal 0.0} {M13 vertical 0.0}"
}

set tlup "PROBE.tlup"
set ndm "./ndm/${clib_name}.ndm  ./ndm/${clib_name}_phy.ndm"



create_lib $design -tech $techfile -ref_libs $ndm

read_verilog -top $design "./gate/${design}.v"
current_block $design
link_block
save_lib

connect_pg_net -automatic 
read_parasitic_tech -tlup $tlup -name wst

#scenario
remove_modes -all; remove_corners -all; remove_scenarios -all
set corner "WC"
create_mode $corner
create_corner $corner
create_scenario -name $corner -mode $corner -corner $corner
current_scenario $corner
source ./gate/${design}.sdc
set_scenario_status $corner -none -setup true -hold true -leakage_power true -dynamic_power true -max_transition true -max_capacitance true -min_capacitance false -active true
set_parasitic_parameters -late_spec wst -early_spec wst


# floorplan
foreach direction_offset_pair $tech_info {
	set layer [lindex $direction_offset_pair 0]
	set direction [lindex $direction_offset_pair 1]
	set offset [lindex $direction_offset_pair 2]
	set_attribute [get_layers $layer] routing_direction $direction
	if {$offset != ""} {
		set_attribute [get_layers $layer] track_offset $offset
	}
}

set offset_v [expr [format %f [string range [lindex [split $lib_name "_"] 0] 0 end-1]]*$m0p/2000]
set offset_h [expr [format %f $cpp]*3/1000]
set core_offset [list $offset_v $offset_h]

  initialize_floorplan -core_utilization ${util} -core_offset $core_offset
  place_pins -self 

if {[string match "BS" $pdn]||[string match "FSBPR" $pdn]} {
  source insert_power_tap_icc2.tcl
}

  #power rail
  source pdn_icc2.tcl

  set_app_options -as -list { place.coarse.continue_on_missing_scandef true }
  set_app_options -name route.global.timing_driven -value false
  set_extraction_options -reference_direction vertical
  set_scenario_status -active true [all_scenarios]
  set_voltage 0.70 -object_list [get_supply_nets VDD]
  set_voltage 0.00 -object_list [get_supply_nets VSS]

# Placement option
set_app_options -name place.legalize.enable_advanced_legalizer -value true
set_app_options -name place.legalize.enable_advanced_prerouted_net_check -value true
set_app_options -name place.legalize.pin_color_alignment_layers -value {M1}
set_app_options -name place.legalize.enable_pin_color_alignment_check -value true

place_opt

report_design -all > ./icc2_report/place_design.rpt
report_qor  > ./icc2_report/place_qor.rpt
report_power > ./icc2_report/place_power.rpt

# ICC2 routing options
# Source this file before running routing

set_ignored_layers -min_routing_layer M1

set_app_options -list {route.common.single_connection_to_pins standard_cell_pins}
set_app_options -list {route.common.global_min_layer_mode hard}
set_app_options -list {route.common.net_min_layer_mode allow_pin_connection}
set_app_options -list {route.common.number_of_vias_under_global_min_layer 1}
set_app_options -list {route.common.number_of_vias_under_net_min_layer 0}
set_app_options -list {route.common.net_max_layer_mode hard}

set_app_options -list {route.detail.var_spacing_to_same_net true}
set_app_options -list {route.detail.check_pin_min_area_min_length true }
set_app_options -list {route.detail.check_port_min_area_min_length true}

set die_size [get_attr [get_designs *] boundary_bbox]
create_routing_guide -boundary $die_size -layers {M0 M1 M2 M3 M4 M5 M6 M7 M8 M9 M10 M11} -preferred_direction_only

#CTS
set_app_options -name cts.common.user_instance_name_prefix -value "CTS_"
set_max_transition 0.70 -clock_path [get_clocks clk]

clock_opt -from build_clock -to final_opto

report_design -all > ./icc2_report/cts_design.rpt
report_qor  > ./icc2_report/cts_qor.rpt
report_power > ./icc2_report/cts_power.rpt

#ROUTE
route_opt -xtalk_reduction

save_block -as ${design}_route.design

check_routes > ./icc2_report/drc.rpt
report_design -all > ./icc2_report/route_design.rpt
report_qor  > ./icc2_report/route_qor.rpt
report_power > ./icc2_report/route_power.rpt
report_timing -significant_digits 3 > icc2_report/route_timing.rpt

write_parasitics -format spef -output ${design}.spef
write_verilog ${design}.v

sh exec cp gate/${design}.sdc .

if {[string match "BS*" $pdn]} {

  #remove all signal/pg patterns
  remove_shapes *
  remove_vias *

  source pdn_icc2_bs.tcl
  source gen_virtual_vsrc.tcl

  write_def ${design}_bs.def
} else {

  source gen_virtual_vsrc.tcl
  write_def -routed_nets ${design}.def

}


exit

