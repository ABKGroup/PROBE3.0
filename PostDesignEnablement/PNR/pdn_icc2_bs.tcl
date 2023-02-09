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

#pdn
#assume pp, pdn, m0p are defined
#insertion_type, pitch

remove_pg_patterns -all
remove_pg_strategies -all
remove_pg_strategy_via_rules -all
remove_pg_via_master_rules -all
remove_shapes [get_shapes -of_objects VDD]
remove_shapes [get_shapes -of_objects VSS]
remove_vias [get_vias -of_objects VDD]
remove_vias [get_vias -of_objects VSS]

set bottom_layer M0

#if {[string match "DENSE" $pp]} {
#temp
#set mx_pitch 10 
#} elseif {[string match "MIDDLE" $pp]} {
#  set mx_pitch 20
#} elseif {[string match "SPARCE" $pp]} {
#  set mx_pitch 40 
#}
# for BS

set tap_pitch [expr ([format %f $cpp]/1000)*$pitch]


  if {$pitch == 128} {
    set div 1.5
    set bm1_width 1.8
  } elseif {$pitch == 96} {
    set div 1.5
    set bm1_width 1.3
  } else {
    set div 0.5
    set bm1_width 1.8
  }

#set upper_metal_pitch_bm1 4.32
#set upper_metal_pitch_bm1 4.32
set upper_metal_pitch_bm1 [expr $tap_pitch/$div]
set upper_metal_pitch_bm2 4.32

if {[string match "*BPR" $pdn]} {
  set rail_width [expr [format %f $m0p]/2000]
} else {
  set rail_width [expr [format %f $m0p]*3/2000]
}


## Create M1 std cell rail pattern and strategy
create_pg_std_cell_conn_pattern ${bottom_layer}_rail -layers $bottom_layer -rail_width $rail_width
set pattern_rail [list [list name: ${bottom_layer}_rail] [list nets: VDD VSS]]
set_pg_strategy rail_strategy -pattern $pattern_rail -core

## Run compile_pg to create the M1 rails
#compile_pg -strategies rail_strategy


if {[string match "BS" $pdn]} {

  set bm1_spacing [expr $upper_metal_pitch_bm1/2 -$bm1_width]



  set_pg_via_master_rule V0_4x1 -contact_code V0_HV -via_array_dimension {4 1}
  set_pg_via_master_rule V1_4x4 -contact_code V1_VH -via_array_dimension {4 4}

  create_pg_mesh_pattern mesh_u \
    -parameters {upper_metal_pitch_bm1 upper_metal_pitch_bm2 bm1_spacing bm1_width} \
    -layers { \
      {{vertical_layer: M1}{width: @bm1_width}{spacing: @bm1_spacing}{pitch: @upper_metal_pitch_bm1} {offset: 1.0}} \
      {{horizontal_layer: M2}{width: 1.8}{spacing: 0.36}{pitch: @upper_metal_pitch_bm2} {offset: 0.01}} \
    } \
    -via_rule { \
      {{layers: M1} {layers: M2} {via_master: V1_4x4}} \
    }

  set pattern_mesh [list [list pattern: mesh_u] [list nets: VDD VSS] [list parameters: $upper_metal_pitch_bm1 $upper_metal_pitch_bm2 $bm1_spacing $bm1_width]]
  set_pg_strategy smesh_u -pattern $pattern_mesh -core -extension {stop: design_boundary}

  set_pg_strategy_via_rule rail_via_rule \
    -via_rule { {{{strategies: mesh_l} {layers: M1}} \
        {{strategies: rail_strategy} {layers: M0}} {via_master: V0_4x1}}}

        
  compile_pg -strategies {smesh_u rail_strategy} -via_rule rail_via_rule


  #TSV
  set_pg_via_master_rule V0_staple \
    -contact_code V0_HV -via_array_dimension {1 1} -cut_spacing {0.043 0.043}

  create_pg_vias \
    -nets {VSS VDD} \
    -from_layer M0 \
    -to_layer M1 \
    -create_via_matrix -via_masters {V0_staple} \
    -drc no_check


  if {$pitch > 48} {
    foreach_in_col via [get_vias -filter "lower_layer_name == M0"] {
      set origin [get_attr $via origin]
      if {![string match "tap*" [get_attribute [get_cells -at $origin] name]]} {
        remove_vias [get_vias $via]
      }
    }
  }

} else {
#BSBPR

  set_pg_via_master_rule V0_4x1 -contact_code V0_HV -via_array_dimension {4 1}
  set_pg_via_master_rule V1_4x4 -contact_code V1_VH -via_array_dimension {4 4}

  create_pg_mesh_pattern mesh_u \
    -parameters {upper_metal_pitch_bm1 upper_metal_pitch_bm2} \
    -layers { \
      {{vertical_layer: M1}{width: 1.8}{spacing: 0.36}{pitch: 4.32} {offset: 1}} \
      {{horizontal_layer: M2}{width: 1.8}{spacing: 0.36}{pitch: 4.32} {offset: 1}} \
    } \
    -via_rule { \
      {{layers: M1} {layers: M2} {via_master: V1_4x4}} \
    }

  set pattern_mesh [list [list pattern: mesh_u] [list nets: VDD VSS] [list parameters: $upper_metal_pitch_bm1 $upper_metal_pitch_bm2]]
  set_pg_strategy smesh_u -pattern $pattern_mesh -core -extension {stop: design_boundary}

  set_pg_strategy_via_rule rail_via_rule \
    -via_rule { {{{strategies: mesh_l} {layers: M1}} \
        {{strategies: rail_strategy} {layers: M0}} {via_master: V0_4x1}}}

        
  compile_pg -strategies {smesh_u rail_strategy} -via_rule rail_via_rule


  #TSV
  set_pg_via_master_rule V0_staple \
    -contact_code V0_HV -via_array_dimension {1 1} -cut_spacing {0.043 0.043}

  create_pg_vias \
    -nets {VSS VDD} \
    -from_layer M0 \
    -to_layer M1 \
    -create_via_matrix -via_masters {V0_staple} \
    -drc no_check




  
}
