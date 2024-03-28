# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

set insertion_type _METHOD_
set pitch _PITCH_

set tap_offset [expr ([format %.4f $cpp]/1000)*$pitch + 0.135]
set tap_pitch [expr ([format %.4f $cpp]/1000)*$pitch]

set track [string range [lindex [split $lib_name "_"] 0] 0 end-1]
set cell_height [expr ([format %.4f $m0p]/1000) * $track]

if {[string match "BS" $pdn]} {
  set cppwidth 6
} else {
  set cppwidth 2
}

set tap_name_vdd "POWERTAP_${cppwidth}CPP_VDD_${lib_name}"
set tap_name_vss "POWERTAP_${cppwidth}CPP_VSS_${lib_name}"

set core_llx [dbGet top.fPlan.coreBox_llx]
set core_lly [dbGet top.fPlan.coreBox_lly]
set core_urx [dbGet top.fPlan.coreBox_urx]
set core_ury [dbGet top.fPlan.coreBox_ury]

set num_col [expr int(($core_urx-$core_llx)/$tap_pitch)]
set num_row [expr int(($core_ury-$core_lly)/(2*$cell_height))]

if {[string match "FSBPR" $pdn]||[string match "BS" $pdn]} {
  if {[string match "C" $insertion_type]} {
    for {set i 0} {$i < $num_col} {incr i} {
      for {set j 0} {$j <= $num_row} {incr j} {

        if {$i % 2 == 0} {
          set cell $tap_name_vss
          set y_offset 0.000
        } else {
          set cell $tap_name_vdd
          set y_offset $cell_height
        }

        set x [format %.4f [expr $i*$tap_pitch + $tap_offset + $core_llx]]
        set y [format %.4f [expr $j*2*$cell_height + $core_lly + $y_offset]]
        if {$y >= [expr $core_ury - $cell_height]} continue
        addInst -cell $cell -loc [list $x $y] -inst "TAP_${i}_${j}" -physical -place_status fixed
      }
    }
  } else {
    for {set i 0} {$i < $num_col} {incr i} {
      for {set j 0} {$j <= $num_row} {set j [expr $j+2]} {

        if {$i % 2 == 0} {
          set cell $tap_name_vss
          set y_offset 0.000
        } else {
          set cell $tap_name_vdd
          set y_offset $cell_height
        }

        set x [format %.4f [expr $i*$tap_pitch + $tap_offset + $core_llx]]
        set y [format %.4f [expr $j*2*$cell_height + $core_lly + $y_offset]]
        if {$y >= [expr $core_ury - $cell_height]} continue
        addInst -cell $cell -loc [list $x $y] -inst "TAP_${i}_${j}" -physical -place_status fixed
      }
    }
  }
}



