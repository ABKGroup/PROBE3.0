# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

setMultiCpuUsage -localCpu 1

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

set lef [list ${lib_name}.tech.lef ${lib_name}.lef  ${lib_name}.tap.lef]

if {[string match "BS*" $pdn]} {
  set def ${design}_bs.def
} else {
  set def ${design}.def
}
set qrc "PROBE.tch"

###############################

read_lib -lef $lef
read_view_definition viewDefinition.tcl
read_verilog ${design}.v
set_top_module ${design} -ignore_undefined_cell

read_def $def

set_pg_nets -net VDD -voltage 0.7 -threshold 0.4 -force
set_pg_nets -net VSS -voltage 0.0 -threshold 0.3 -force

read_spef ${design}.spef.wst_25.spef
specify_spef ${design}.spef.wst_25.spef

set_power_analysis_mode -reset
set_power_pads -reset
set_power_data -reset

set_pg_library_mode -celltype techonly \
  -default_area_cap 0.5 \
  -extraction_tech_file $qrc \
  -power_pins {VDD 0.7} \
  -ground_pins VSS

generate_pg_library 

set_power_analysis_mode -method dynamic_vectorless \
  -corner max \
  -create_binary_db true \
  -write_static_currents true

set_power_output_dir ./dynamic_power        

report_power

set_rail_analysis_mode -method dynamic \
  -power_switch_eco false \
  -accuracy xd \
  -power_grid_library "techonly.cl" \
  -process_techgen_em_rules false \
  -enable_rlrp_analysis false \
  -vsrc_search_distance 50 \
  -ignore_shorts false \
  -enable_manufacturing_effects false \
  -report_via_current_direction false \
  -limit_number_of_steps false

set_pg_nets -net VDD -voltage 0.7 -threshold 0.4 -force
set_pg_nets -net VSS -voltage 0.0 -threshold 0.3 -force
set_rail_analysis_domain -name core -pwrnets VDD -gndnets VSS
set_power_pads -net VDD -format xy -file VDD.vsrc
set_power_pads -net VSS -format xy -file VSS.vsrc

set_power_data -format current -scale 1 { dynamic_power/dynamic_VDD.ptiavg dynamic_power/dynamic_VSS.ptiavg}

analyze_rail -type domain -output dynamic_IR core

