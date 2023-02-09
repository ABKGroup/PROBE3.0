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

remove_pg_patterns -all
remove_pg_strategies -all
remove_pg_strategy_via_rules -all
remove_pg_via_master_rules -all
remove_shapes [get_shapes -of_objects VDD]
remove_shapes [get_shapes -of_objects VSS]
remove_vias [get_vias -of_objects VDD]
remove_vias [get_vias -of_objects VSS]

set tap_pitch [expr ([format %f $cpp]/1000)*$pitch]

set bottom_layer M0

if {[string match "DENSE" $pp]} {
  set mx_pitch 5
} elseif {[string match "MIDDLE" $pp]} {
  set mx_pitch 5
} elseif {[string match "SPARSE" $pp]} {
  set mx_pitch 5 
}

set upper_metal_pitch 4.32

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


if {[string match "FSBPR" $pdn]} {

  set_pg_via_master_rule V0_1x1 -contact_code V0_HV -via_array_dimension {1 1}
  set_pg_via_master_rule V1_1x1 -contact_code V1_VH -via_array_dimension {1 1}
  set_pg_via_master_rule V2_1x1 -contact_code V2_HV -via_array_dimension {1 1}
  set_pg_via_master_rule V3_1x1 -contact_code V3_VH -via_array_dimension {1 1}
  set_pg_via_master_rule V4_4x1 -contact_code V4_HV -via_array_dimension {4 1}
  set_pg_via_master_rule V5_4x4 -contact_code V5_VH -via_array_dimension {4 4}
  set_pg_via_master_rule V6_4x4 -contact_code V6_HV -via_array_dimension {4 4}
  set_pg_via_master_rule V7_4x4 -contact_code V7_VH -via_array_dimension {4 4}
  set_pg_via_master_rule V8_4x4 -contact_code V8_HV -via_array_dimension {4 4}
  set_pg_via_master_rule V9_4x4 -contact_code V9_VH -via_array_dimension {4 4}
  set_pg_via_master_rule V10_4x4 -contact_code V10_HV -via_array_dimension {4 4}
  set_pg_via_master_rule V11_4x4 -contact_code V11_VH -via_array_dimension {4 4}
  set_pg_via_master_rule V12_2x2 -contact_code V12_HV -via_array_dimension {2 2}
  
  #set tap_pitch [expr ([format %f $cpp]/1000)*24]
  set tap_pitch [expr ([format %f $cpp]/1000)*$pitch]

  #set m1_spacing [expr $tap_pitch-0.045]
  set m1_spacing [expr $tap_pitch-0.045]
  set m1_offset [expr $tap_pitch/2 + 0.045]
  set m4_spacing [expr $tap_pitch-0.064]

  #set m5_spacing [expr $tap_pitch-0.5]
  #set m5_pitch [expr $tap_pitch*2]
  #set m5_offset [expr $tap_pitch/2 + 0.045]

  if {$pitch == 128} {
    set div 4.5
    set m5_spacing 0.072
  } elseif {$pitch == 96} {
    set div 3.5
    set m5_spacing 0.072
  } elseif {$pitch == 48} {
    set div 2.5
    set m5_spacing 0.288
  } elseif {$pitch == 32} {
    set div 2.5
    set m5_spacing 0.144
  } else {
    set div 2.5
    set m5_spacing 0.072
  }

  set m5_pitch [expr $tap_pitch/$div]
  #set m5_spacing [expr $m5_pitch/2 - 0.032]
  set m5_offset [expr $tap_pitch/2 + 0.045]
  #set m5_spacing 0.072


#{{horizontal_layer: M4}{width: 0.064}{spacing: @m4_spacing}{pitch: @m5_pitch} {offset: @m5_offset}}
  
  create_pg_mesh_pattern mesh_l \
    -parameters {mx_pitch m1_spacing m1_offset m4_spacing m5_spacing m5_pitch m5_offset} \
    -layers { \
      {{vertical_layer: M3}{width: 0.014}{spacing: @m5_spacing}{pitch: @m5_pitch} {offset: 0.183}} \
      {{horizontal_layer: M4}{width: 0.032}{spacing: 0.256}{pitch: 0.576} {offset: 0.064}} \
      {{vertical_layer: M5}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{horizontal_layer: M6}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{vertical_layer: M7}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{horizontal_layer: M8}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{vertical_layer: M9}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{horizontal_layer: M10}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{vertical_layer: M11}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
    } \
    -via_rule { \
      {{layers: M1} {layers: M2} {via_master: V1_1x1}} \
      {{layers: M2} {layers: M3} {via_master: V2_1x1}} \
      {{layers: M3} {layers: M4} {via_master: V3_1x1}} \
      {{layers: M4} {layers: M5} {via_master: V4_4x1}} \
      {{layers: M5} {layers: M6} {via_master: V5_4x4}} \
      {{layers: M6} {layers: M7} {via_master: V6_4x4}} \
      {{layers: M7} {layers: M8} {via_master: V7_4x4}} \
      {{layers: M8} {layers: M9} {via_master: V8_4x4}} \
      {{layers: M9} {layers: M10} {via_master: V9_4x4}} \
      {{layers: M10} {layers: M11} {via_master: V10_4x4}} \
    }

    #  {{vertical_layer: M3}{width: 0.012}{spacing: @m1_spacing}{pitch: @m5_pitch} {offset: @m5_offset}} \
    #  {{horizontal_layer: M4}{width: 0.032}{spacing: 0.032}{pitch: 0.592} {offset: 0.064}} \

  set pattern_mesh [list [list pattern: mesh_l] [list nets: VDD VSS] [list parameters: $mx_pitch $m1_spacing $m1_offset $m4_spacing $m5_spacing $m5_pitch $m5_offset]]
  set_pg_strategy smesh_l -pattern $pattern_mesh -core -extension {stop: design_boundary}

  create_pg_mesh_pattern mesh_u \
    -parameters {upper_metal_pitch} \
    -layers { \
      {{horizontal_layer: M12}{width: 1.8}{spacing: 0.36}{pitch: @upper_metal_pitch} {offset: 1}} \
      {{vertical_layer: M13}{width: 1.8}{spacing: 0.36}{pitch: @upper_metal_pitch} {offset: 1}} \
    } \
    -via_rule { \
      {{layers: M11} {layers: M12} {via_master: V11_4x4}} \
      {{layers: M12} {layers: M13} {via_master: V12_2x2}} \
    }
    #  {{layers: M8} {layers: M9} {via_master: V8_4x4}} \
    #  {{layers: M9} {layers: M10} {via_master: V9_4x4}} \
    #  {{layers: M10} {layers: M11} {via_master: V10_4x4}} \

  set pattern_mesh [list [list pattern: mesh_u] [list nets: VDD VSS] [list parameters: $upper_metal_pitch]]
  set_pg_strategy smesh_u -pattern $pattern_mesh -core -extension {stop: design_boundary}

  set_pg_strategy_via_rule via_rule1 \
    -via_rule { {{{strategies: mesh_l} {layers: M11}} \
        {{strategies: mesh_u} {layers: M12}} {via_master: V11_4x4}}}

  #set_pg_strategy_via_rule rail_via_rule \
  #  -via_rule { {{{strategies: M0_rail} {layers: M0}} \
  #      {{strategies: mesh_l} {layers: M1}} {via_master: V0_1x1}}}

  #compile_pg -strategies {rail_strategy smesh_l} -via_rule rail_via_rule
  compile_pg -strategies {smesh_l smesh_u rail_strategy} -via_rule via_rule1
  #compile_pg 

  #set_pg_strategy_via_rule rail_via_rule \
  #  -via_rule { {{{strategies: mesh_l} {layers: M1}} \
  #      {{strategies: rail_strategy} {layers: M0}} {via_master: V0_1x1}}}



        
#  compile_pg -strategies {smesh_l rail_strategy} -via_rule rail_via_rule
  #set_pg_via_master_rule V8_staple \
  #  -contact_code V8_HV -via_array_dimension {4 4} -cut_spacing {0.091 0.091}
  #set_pg_via_master_rule V9_staple \
  #  -contact_code V9_VH -via_array_dimension {4 4} -cut_spacing {0.091 0.091}
  #set_pg_via_master_rule V10_staple \
  #  -contact_code V10_HV -via_array_dimension {4 4} -cut_spacing {0.091 0.091}
  set_pg_via_master_rule V11_staple \
    -contact_code V11_VH -via_array_dimension {4 4} -cut_spacing {0.091 0.091}

  create_pg_vias \
    -nets {VSS VDD} \
    -from_layer M11 \
    -to_layer M12 \
    -create_via_matrix -via_masters {V11_staple} \
    -drc no_check
 
  set_pg_via_master_rule V0_staple \
    -contact_code V0_HV -via_array_dimension {1 1} -cut_spacing {0.043 0.043}
  set_pg_via_master_rule V1_staple \
    -contact_code V1_VH -via_array_dimension {1 1} -cut_spacing {0.034 0.034}
  set_pg_via_master_rule V2_staple \
    -contact_code V2_HV -via_array_dimension {1 1} -cut_spacing {0.034 0.034}
  set_pg_via_master_rule V3_staple \
    -contact_code V3_VH -via_array_dimension {1 1} -cut_spacing {0.091 0.091}
#set_pg_via_master_rule V4_staple \
#  -contact_code V4_HV -via_array_dimension {4 1} -cut_spacing {0.091 0.091}

  create_pg_vias \
    -nets {VSS VDD} \
    -from_layer M0 \
    -to_layer M3 \
    -create_via_matrix -via_masters {V0_staple V1_staple V2_staple} \
    -drc no_check
  

#  create_pg_vias \
#    -nets {VSS VDD} \
#    -from_layer M1 \
#    -to_layer M4 \
#    -create_via_matrix -via_masters {V1_staple V2_staple V3_staple} \
#    -drc no_check
  
#  set_pg_via_master_rule V0_staple \
#    -contact_code V0_HV -via_array_dimension {1 1} -cut_spacing {0.034 0.034}

#  create_pg_vias \
#    -nets {VSS VDD} \
#    -from_layer M0 \
#    -to_layer M1 \
#    -create_via_matrix -via_masters {V0_staple} \
#    -drc no_check


foreach_in_col via [get_vias -filter "lower_layer_name == M0"] {
  set origin [get_attr $via origin]
  if {![string match "tap*" [get_attribute [get_cells -at $origin] name]]} {
    remove_vias [get_vias $via]
  }
}
foreach_in_col via [get_vias -filter "lower_layer_name == M1"] {
  set origin [get_attr $via origin]
  if {![string match "tap*" [get_attribute [get_cells -at $origin] name]]} {
    remove_vias [get_vias $via]
  }
}
foreach_in_col via [get_vias -filter "lower_layer_name == M2"] {
  set origin [get_attr $via origin]
  if {![string match "tap*" [get_attribute [get_cells -at $origin] name]]} {
    remove_vias [get_vias $via]
  }
}



} elseif {[string match "FS" $pdn]} {

  set_pg_via_master_rule V0_1x1 -contact_code V0_HV -via_array_dimension {1 1}
  set_pg_via_master_rule V1_1x1 -contact_code V1_VH -via_array_dimension {1 1}
  set_pg_via_master_rule V2_1x1 -contact_code V2_HV -via_array_dimension {1 1}
  set_pg_via_master_rule V3_1x1 -contact_code V3_VH -via_array_dimension {1 1}
  set_pg_via_master_rule V4_4x1 -contact_code V4_HV -via_array_dimension {4 1}
  set_pg_via_master_rule V5_4x4 -contact_code V5_VH -via_array_dimension {4 4}
  set_pg_via_master_rule V6_4x4 -contact_code V6_HV -via_array_dimension {4 4}
  set_pg_via_master_rule V7_4x4 -contact_code V7_VH -via_array_dimension {4 4}
  set_pg_via_master_rule V8_4x4 -contact_code V8_HV -via_array_dimension {4 4}
  set_pg_via_master_rule V9_4x4 -contact_code V9_VH -via_array_dimension {4 4}
  set_pg_via_master_rule V10_4x4 -contact_code V10_HV -via_array_dimension {4 4}
  set_pg_via_master_rule V11_4x4 -contact_code V11_VH -via_array_dimension {4 4}
  set_pg_via_master_rule V12_2x2 -contact_code V12_HV -via_array_dimension {2 2}
  
  set tap_pitch [expr ([format %f $cpp]/1000)*24]

  set m1_spacing [expr $tap_pitch-0.045]
  #set m1_offset [expr $tap_pitch/2 + 0.045]
  #set m4_spacing [expr $tap_pitch-0.064]
  set m5_spacing [expr $tap_pitch-0.5]
  set m5_pitch [expr $tap_pitch*2]
  set m5_offset [expr $tap_pitch/2 + 0.045]
  
  #{{vertical_layer: M3}{width: 0.012}{spacing: 0.060}{pitch: 0.6} {offset: 0.024}}

  create_pg_mesh_pattern mesh_l \
    -parameters {mx_pitch upper_metal_pitch m1_spacing m5_spacing m5_pitch m5_offset} \
    -layers { \
      {{vertical_layer: M3}{width: 0.014}{spacing: 0.42}{pitch: 0.864} {offset: 0.048}} \
      {{horizontal_layer: M4}{width: 0.032}{spacing: 0.256}{pitch: 0.576} {offset: 0.064}} \
      {{vertical_layer: M5}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{horizontal_layer: M6}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{vertical_layer: M7}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{horizontal_layer: M8}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{vertical_layer: M9}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{horizontal_layer: M10}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
      {{vertical_layer: M11}{width: 1}{spacing: 1.5}{pitch: @mx_pitch} {offset: 1}} \
    } \
    -via_rule { \
      {{layers: M3} {layers: M4} {via_master: V3_1x1}} \
      {{layers: M4} {layers: M5} {via_master: V4_4x1}} \
      {{layers: M5} {layers: M6} {via_master: V5_4x4}} \
      {{layers: M6} {layers: M7} {via_master: V6_4x4}} \
      {{layers: M7} {layers: M8} {via_master: V7_4x4}} \
      {{layers: M8} {layers: M9} {via_master: V8_4x4}} \
      {{layers: M9} {layers: M10} {via_master: V9_4x4}} \
      {{layers: M10} {layers: M11} {via_master: V10_4x4}} \
    }

#      {{vertical_layer: M3}{width: 0.045}{spacing: @m1_spacing}{pitch: @m5_pitch} {offset: @m5_offset}} \
#      {{horizontal_layer: M4}{width: 0.032}{spacing: 0.032}{pitch: 0.592} {offset: 0.064}} \




  set pattern_mesh [list [list pattern: mesh_l] [list nets: VDD VSS] [list parameters: $mx_pitch $upper_metal_pitch $m1_spacing $m5_spacing $m5_pitch $m5_offset]]
  set_pg_strategy smesh_l -pattern $pattern_mesh -core -extension {stop: design_boundary}

  create_pg_mesh_pattern mesh_u \
    -parameters {mx_pitch upper_metal_pitch} \
    -layers { \
      {{horizontal_layer: M12}{width: 1.8}{spacing: 0.36}{pitch: @upper_metal_pitch} {offset: 1}} \
      {{vertical_layer: M13}{width: 1.8}{spacing: 0.36}{pitch: @upper_metal_pitch} {offset: 1}} \
    } \
    -via_rule { \
      {{layers: M11} {layers: M12} {via_master: V11_4x4}} \
      {{layers: M12} {layers: M13} {via_master: V12_2x2}} \
    }

    #  {{layers: M8} {layers: M9} {via_master: V8_4x4}} \
    #  {{layers: M9} {layers: M10} {via_master: V9_4x4}} \
    #  {{layers: M10} {layers: M11} {via_master: V10_4x4}} \

  set pattern_mesh [list [list pattern: mesh_u] [list nets: VDD VSS] [list parameters: $mx_pitch $upper_metal_pitch]]
  set_pg_strategy smesh_u -pattern $pattern_mesh -core -extension {stop: design_boundary}

  set_pg_strategy_via_rule via_rule1 \
    -via_rule { {{{strategies: mesh_l} {layers: M11}} \
        {{strategies: mesh_u} {layers: M12}} {via_master: V11_4x4}}}

  compile_pg -strategies {smesh_l smesh_u} -via_rule via_rule1

  set_pg_strategy_via_rule rail_via_rule \
    -via_rule { {{{strategies: mesh_l} {layers: M3}} \
        {{strategies: rail_strategy} {layers: M0}} {via_master: V0_1x1}}}



        
  compile_pg -strategies {smesh_l rail_strategy} -via_rule rail_via_rule
  
#set_pg_via_master_rule V8_staple \
#  -contact_code V8_HV -via_array_dimension {4 4} -cut_spacing {0.091 0.091}
#set_pg_via_master_rule V9_staple \
#  -contact_code V9_VH -via_array_dimension {4 4} -cut_spacing {0.091 0.091}
#set_pg_via_master_rule V10_staple \
#  -contact_code V10_HV -via_array_dimension {4 4} -cut_spacing {0.091 0.091}
set_pg_via_master_rule V11_staple \
  -contact_code V11_VH -via_array_dimension {4 4} -cut_spacing {0.091 0.091}

create_pg_vias \
  -nets {VSS VDD} \
  -from_layer M11 \
  -to_layer M12 \
  -create_via_matrix -via_masters {V11_staple} \
  -drc no_check

set_pg_via_master_rule V0_staple \
  -contact_code V0_HV -via_array_dimension {1 1} -cut_spacing {0.043 0.043}
set_pg_via_master_rule V1_staple \
  -contact_code V1_VH -via_array_dimension {1 1} -cut_spacing {0.034 0.034}
set_pg_via_master_rule V2_staple \
  -contact_code V2_HV -via_array_dimension {1 1} -cut_spacing {0.034 0.034}
set_pg_via_master_rule V3_staple \
  -contact_code V3_VH -via_array_dimension {1 1} -cut_spacing {0.091 0.091}
#set_pg_via_master_rule V4_staple \
  -contact_code V4_HV -via_array_dimension {4 1} -cut_spacing {0.091 0.091}

create_pg_vias \
  -nets {VSS VDD} \
  -from_layer M0 \
  -to_layer M3 \
  -create_via_matrix -via_masters {V0_staple V1_staple V2_staple} \
  -drc no_check
  

} else {

  compile_pg
}


