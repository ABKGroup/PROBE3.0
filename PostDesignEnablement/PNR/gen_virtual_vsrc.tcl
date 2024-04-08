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

## make src point for each intersection btw M8/M9

if {[string match "BS*" $pdn]} {
  set top_layer M2
} else {
  set top_layer M13
}

set VDD_list [get_attribute [get_shapes -of_objects VDD -filter "layer_name == ${top_layer}"] bounding_box]
set VSS_list [get_attribute [get_shapes -of_objects VSS -filter "layer_name == ${top_layer}"] bounding_box]

set VDD_y_list [list]
set VSS_y_list [list]

foreach_in_collection sh $VDD_list {
  set lly [lindex [lindex [lindex [lindex [collection_to_list $sh] 0] 0] 1] 1]
  set ury [lindex [lindex [lindex [lindex [collection_to_list $sh] 0] 0] 2] 1]
  
  puts $lly
  puts $ury

  set y [expr ($lly + $ury)/2]

  lappend VDD_y_list $y
}

foreach_in_collection sh $VSS_list {
  set lly [lindex [lindex [lindex [lindex [collection_to_list $sh] 0] 0] 1] 1]
  set ury [lindex [lindex [lindex [lindex [collection_to_list $sh] 0] 0] 2] 1]
  
  puts $lly
  puts $ury

  set y [expr ($lly + $ury)/2]

  lappend VSS_y_list $y
}


set outputFile "VDD.vsrc"
set output [open $outputFile "w"]

puts $output "*vsrc_name   x   y   layer_name"
set k 1
for {set i 0} {$i<[llength $VDD_y_list]} {set i [expr $i + 1]} {
    for {set j 0} {$j<[llength $VDD_y_list]} {set j [expr $j + 1]} {
        set VDD_x_1 [expr [lindex $VDD_y_list $i]]
        set VDD_y_1 [expr [lindex $VDD_y_list $j]]
        
        set out "VDDvsrc${k} $VDD_x_1 $VDD_y_1 $top_layer"
        puts $output $out
        set k [expr $k+1]
    }
}


close $output


set outputFile_vss "VSS.vsrc"
set output_vss [open $outputFile_vss "w"]

puts $output_vss "*vsrc_name   x   y   layer_name"
set k 1
for {set i 0} {$i<[llength $VSS_y_list]} {set i [expr $i + 1]} {
    for {set j 0} {$j<[llength $VSS_y_list]} {set j [expr $j + 1]} {
        set VSS_x_1 [expr [lindex $VSS_y_list $i]]
        set VSS_y_1 [expr [lindex $VSS_y_list $j]]
        
        set out "VSSvsrc${k} $VSS_x_1 $VSS_y_1 $top_layer"
        puts $output_vss $out
        set k [expr $k+1]
    }
}


close $output_vss
