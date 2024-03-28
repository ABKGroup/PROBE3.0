# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

setMultiCpuUsage -localCpu 1
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

source invs_func.tcl

if {![file exists invs_report]} {
	exec mkdir invs_report
}

if {[file exists $design]} {
	exec chmod -R 777 $design
	exec rm -r $design
}

set netlist "./gate/$design.v"
set sdc "./gate/$design.sdc"


set dir ""

if {[string match "mesh" $design]} {
  set lef "${lib_name}.tech.lef ${lib_name}.lef"
} else {
  #set lef "${lib_name}.tech.lef ${lib_name}.bloat.lef"
  set lef "${lib_name}.tech.lef ${lib_name}.lef  ${lib_name}.tap.lef"
}

set qrc "PROBE.tch"

set lib "${lib_name}.lib"

set wc_lib_list $lib
set bc_lib_list $lib

create_library_set -name WC_LIB -timing $wc_lib_list
create_library_set -name BC_LIB -timing $bc_lib_list
	
set site "coresite"

set rptDir rpt/
set encDir enc/

if {![file exists $rptDir/]} {
    exec mkdir $rptDir/
}

if {![file exists $encDir/]} {
    exec mkdir $encDir/
}

# default settings
set init_pwr_net VDD
set init_gnd_net VSS

create_rc_corner -name Cmax -qx_tech_file $qrc
create_rc_corner -name Cmin -qx_tech_file $qrc

create_delay_corner -name WC -library_set WC_LIB -rc_corner Cmax
create_delay_corner -name BC -library_set BC_LIB -rc_corner Cmin

create_constraint_mode -name CON -sdc_file [list $sdc]

create_analysis_view -name WC_VIEW -delay_corner WC -constraint_mode CON
create_analysis_view -name BC_VIEW -delay_corner BC -constraint_mode CON

# default settings
set init_verilog "$netlist"
set init_design_netlisttype "Verilog"
set init_design_settop 1
set init_top_cell "$design"
set init_lef_file "$lef"

# MCMM setup


init_design -setup {WC_VIEW} -hold {BC_VIEW}

set_power_analysis_mode -leakage_power_view WC_VIEW -dynamic_power_view WC_VIEW

set_interactive_constraint_modes {CON}
setDesignMode -process 5

clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -inst * -override
globalNetConnect VSS -type pgpin -pin VSS -inst * -override
globalNetConnect VDD -type tiehi -inst * -override
globalNetConnect VSS -type tielo -inst * -override


setOptMode -powerEffort low -leakageToDynamicRatio 0.5

setGenerateViaMode -auto false

# basic path groups
createBasicPathGroups -expanded

set offset_v [expr [format %f [string range [lindex [split $lib_name "_"] 0] 0 end-1]]*$m0p/2000]
set offset_h [expr [format %f $cpp]*3/1000]

# floorplan
floorPlan -site $site -r 1.0 $util $offset_h $offset_v $offset_h $offset_v

#M2 track offset
if {![string match "BPR" $pgpin]} {
  set M0_offset [expr [format %f $m0p]/2000]
  set M2_offset [expr [format %f $m2p]/2000]
  deleteTrack -layer M2
  #add_tracks -offsets {M0 horiz $M0_offset M2 horiz $M2_offset} -honor_pitch 
  set offsetList "{M0 horiz $M0_offset M2 horiz $M2_offset}"
  add_tracks -offsets $offsetList -honor_pitch 
}

if {[string match "FSBPR" $pdn] || [string match "BS" $pdn]} {
  source insert_power_tap_invs.tcl
}

# Powerplan
if {[string match "FS*" $pdn]} {
  source pdn_invs.tcl
} 


setPlaceMode -place_detail_use_check_drc false
setPlaceMode -place_global_place_io_pins true

place_opt_design -out_dir $rptDir -prefix place


####SWAP
#randSwapCells


set_ccopt_property post_conditioning_enable_routing_eco 1
set_ccopt_property -cts_def_lock_clock_sinks_after_routing true
setOptMode -unfixClkInstForOpt false

create_ccopt_clock_tree_spec
ccopt_design

set_interactive_constraint_modes [all_constraint_modes -active]
set_propagated_clock [all_clocks]
set_clock_propagation propagated

# ------------------------------------------------------------------------------
# Routing
# ------------------------------------------------------------------------------

#setNanoRouteMode -routeTopRoutingLayer $top_layer
setNanoRouteMode -routeExpUseAutoVia false
setDesignMode -bottomRoutingLayer M1

##Recommended by lib owners
# Prevent router modifying M1 pins shapes
#setNanoRouteMode -routeWithViaInPin "1:1"
#setNanoRouteMode -routeWithViaOnlyForStandardCellPin "1:1"
#setNanoRouteMode -routeWithViaOnlyForStandardCellPin false

## allows route of tie off nets to internal cell pin shapes rather than routing to special net structure.
setNanoRouteMode -routeAllowPowerGroundPin true

## limit VIAs to ongrid only for VIA1 (S1)
setNanoRouteMode -drouteOnGridOnly "via 1:1"
setNanoRouteMode -dbCheckRule true
setNanoRouteMode -drouteAutoStop true
setNanoRouteMode -drouteExpKeepVia {*RW*, *MAR*}
setNanoRouteMode -drouteExpAdvancedMarFix false
setNanoRouteMode -routeExpAdvancedTechnology true
setAnalysisMode -cppr both
setAnalysisMode -analysisType onChipVariation


setExtractRCMode -effortLevel medium
extractRC

routeDesign

saveDesign ${design}_route.enc


## report 
summaryReport -noHtml -outfile $rptDir/route_design.rpt
report_timing > $rptDir/route_timing.rpt
report_power > $rptDir/route_power.rpt
verify_drc -exclude_pg_net -limit 1000000 > $rptDir/drc.rpt


rcOut -spef ${design}.spef
saveNetlist ${design}.v


if {[string match "BS*" $pdn]} {

  #remove all signal/pg patterns
  editDelete -status ROUTED

  source pdn_invs_bs.tcl
  source gen_virtual_vsrc_invs.tcl

  defOut ${design}_bs.def
} else {

  source gen_virtual_vsrc_invs.tcl
  defOut -routing ${design}.def

}


exit
