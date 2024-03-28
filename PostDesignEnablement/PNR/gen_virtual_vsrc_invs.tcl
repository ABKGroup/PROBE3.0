# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

if {[string match "BS*" $pdn]} {
  set top_layer M2
  set top_l_layer M1
} else {
  set top_layer M13
  set top_l_layer M12
}

set VDD_list [dbGet [dbGet -p2 [dbGet -p1 top.nets.name VDD].sWires.layer.name ${top_layer}].box]
set VSS_list [dbGet [dbGet -p2 [dbGet -p1 top.nets.name VSS].sWires.layer.name ${top_layer}].box]
set VDD_list_l [dbGet [dbGet -p2 [dbGet -p1 top.nets.name VDD].sWires.layer.name ${top_l_layer}].box]
set VSS_list_l [dbGet [dbGet -p2 [dbGet -p1 top.nets.name VSS].sWires.layer.name ${top_l_layer}].box]

set VDD_x_list [list]
set VSS_x_list [list]
set VDD_y_list [list]
set VSS_y_list [list]

foreach sh $VDD_list {
  set llx [lindex $sh 0]
  set lly [lindex $sh 1]
  set urx [lindex $sh 2]
  set ury [lindex $sh 3]
  
  set x [expr ($llx + $urx)/2]
  #set y [expr ($lly + $ury)/2]

  lappend VDD_x_list $x
  #lappend VDD_y_list $y
}
foreach sh $VDD_list_l {
  set llx [lindex $sh 0]
  set lly [lindex $sh 1]
  set urx [lindex $sh 2]
  set ury [lindex $sh 3]
  
  #set x [expr ($llx + $urx)/2]
  set y [expr ($lly + $ury)/2]

  #lappend VDD_x_list $x
  lappend VDD_y_list $y
}

foreach sh $VSS_list {
  set llx [lindex $sh 0]
  set lly [lindex $sh 1]
  set urx [lindex $sh 2]
  set ury [lindex $sh 3]
  
  set x [expr ($llx + $urx)/2]
  #set y [expr ($lly + $ury)/2]

  lappend VSS_x_list $x
  #lappend VSS_y_list $y
}
foreach sh $VSS_list {
  set llx [lindex $sh 0]
  set lly [lindex $sh 1]
  set urx [lindex $sh 2]
  set ury [lindex $sh 3]
  
  #set x [expr ($llx + $urx)/2]
  set y [expr ($lly + $ury)/2]

  #lappend VSS_x_list $x
  lappend VSS_y_list $y
}


set outputFile "VDD.vsrc"
set output [open $outputFile "w"]

puts $output "*vsrc_name   x   y   layer_name"
set k 1
foreach VDD_x $VDD_x_list {
  foreach VDD_y $VDD_y_list {
    set out "VDDvsrc${k} $VDD_x $VDD_y $top_layer"
    puts $output $out
    set k [expr $k+1]
  }
}


close $output


set outputFile_vss "VSS.vsrc"
set output_vss [open $outputFile_vss "w"]

puts $output_vss "*vsrc_name   x   y   layer_name"
set k 1
foreach VSS_x $VSS_x_list {
  foreach VSS_y $VSS_y_list {
    set out "VSSvsrc${k} $VSS_x $VSS_y $top_layer"
    puts $output $out
    set k [expr $k+1]
  }
}


close $output_vss
