# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

#pdn
#assume pp, pdn, m0p are defined

set tap_pitch [expr ([format %f $cpp]/1000)*$pitch]
set bottom_layer M0
set mx_pitch 5
set upper_metal_pitch 4.32

createPGPin VDD
createPGPin VSS

editDelete -type Special -net {VDD VSS}

setAddStripeMode -orthogonal_only false -ignore_DRC false  -via_using_exact_crossover_size false
setViaGenMode -ignore_DRC false 

sroute -corePinLayer $bottom_layer


if {[string match "FS" $pdn]} {

  set tap_pitch [expr ([format %f $cpp]/1000)*24]
  #set tap_pitch [expr ([format %f $cpp]/1000)*$pitch]

  #set m1_spacing [expr $tap_pitch-0.045]
  set m1_spacing [expr $tap_pitch-0.045]
  set m1_offset [expr $tap_pitch/2 + 0.045]
  set m4_spacing [expr $tap_pitch-0.064]
  set m5_spacing [expr $tap_pitch-0.5]
  set m5_pitch [expr $tap_pitch*2]
  set m5_offset [expr $tap_pitch/2 + 0.045]

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

  setAddStripeMode -stacked_via_bottom_layer M0 -stacked_via_top_layer M3
  addStripe -nets {VSS VDD} \
	  -layer M3  \
	  -direction vertical \
    -ybottom_offset 0.048 \
    -xleft_offset 0.048 \
	  -width 0.014  \
	  -spacing 0.420 \
	  -set_to_set_distance 0.864 -via_columns 1 -via_rows 1

  setAddStripeMode -stacked_via_bottom_layer M3 -stacked_via_top_layer M4
  addStripe -nets {VSS VDD} \
	  -layer M4  \
	  -direction horizontal \
    -ybottom_offset 0.064 \
    -xleft_offset 0.064 \
	  -width 0.032  \
	  -spacing 0.256 \
	  -set_to_set_distance 0.576 -via_columns 1 -via_rows 1

  setAddStripeMode -stacked_via_bottom_layer M4 -stacked_via_top_layer M5
  addStripe -nets {VSS VDD} \
	  -layer M5  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 1

  setAddStripeMode -stacked_via_bottom_layer M5 -stacked_via_top_layer M6
  addStripe -nets {VSS VDD} \
	  -layer M6  \
	  -direction horizontal \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M6 -stacked_via_top_layer M7
  addStripe -nets {VSS VDD} \
	  -layer M7  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M7 -stacked_via_top_layer M8
  addStripe -nets {VSS VDD} \
	  -layer M8  \
	  -direction horizontal \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M8 -stacked_via_top_layer M9
  addStripe -nets {VSS VDD} \
	  -layer M9  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M9 -stacked_via_top_layer M10
  addStripe -nets {VSS VDD} \
	  -layer M10  \
	  -direction horizontal \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M10 -stacked_via_top_layer M11
  addStripe -nets {VSS VDD} \
	  -layer M11  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M11 -stacked_via_top_layer M12
  addStripe -nets {VSS VDD} \
    -layer M12  \
    -direction horizontal \
    -ybottom_offset 1 \
    -xleft_offset 1 \
    -width 1.8  \
    -spacing 0.36 \
    -set_to_set_distance $upper_metal_pitch -extend_to design_boundary -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M12 -stacked_via_top_layer M13
  addStripe -nets {VSS VDD} \
    -layer M13  \
    -direction vertical \
    -ybottom_offset 1 \
    -xleft_offset 1 \
    -width 1.8  \
    -spacing 0.36 \
    -set_to_set_distance $upper_metal_pitch -extend_to design_boundary -via_columns 2 -via_rows 2

} elseif {[string match "FSBPR" $pdn]} {

  set tap_pitch [expr ([format %f $cpp]/1000)*$pitch]

  set m1_spacing [expr $tap_pitch-0.045]
  set m1_offset [expr $tap_pitch/2 + 0.045]
  set m4_spacing [expr $tap_pitch-0.064]

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
  
  setAddStripeMode -stacked_via_bottom_layer M0 -stacked_via_top_layer M3
  addStripe -nets {VSS VDD} \
	  -layer M3  \
	  -direction vertical \
    -ybottom_offset 0.183 \
    -xleft_offset 0.183 \
	  -width 0.014  \
	  -spacing $m5_spacing \
	  -set_to_set_distance $m5_pitch -via_columns 1 -via_rows 1

  setAddStripeMode -stacked_via_bottom_layer M3 -stacked_via_top_layer M4
  addStripe -nets {VSS VDD} \
	  -layer M4  \
	  -direction horizontal \
    -ybottom_offset 0.064 \
    -xleft_offset 0.064 \
	  -width 0.032  \
	  -spacing 0.256 \
	  -set_to_set_distance 0.576 -via_columns 1 -via_rows 1

  setAddStripeMode -stacked_via_bottom_layer M4 -stacked_via_top_layer M5
  addStripe -nets {VSS VDD} \
	  -layer M5  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 1

  setAddStripeMode -stacked_via_bottom_layer M5 -stacked_via_top_layer M6
  addStripe -nets {VSS VDD} \
	  -layer M6  \
	  -direction horizontal \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M6 -stacked_via_top_layer M7
  addStripe -nets {VSS VDD} \
	  -layer M7  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M7 -stacked_via_top_layer M8
  addStripe -nets {VSS VDD} \
	  -layer M8  \
	  -direction horizontal \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M8 -stacked_via_top_layer M9
  addStripe -nets {VSS VDD} \
	  -layer M9  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M9 -stacked_via_top_layer M10
  addStripe -nets {VSS VDD} \
	  -layer M10  \
	  -direction horizontal \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M10 -stacked_via_top_layer M11
  addStripe -nets {VSS VDD} \
	  -layer M11  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.0  \
	  -spacing 1.5 \
	  -set_to_set_distance $mx_pitch -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M11 -stacked_via_top_layer M12
  addStripe -nets {VSS VDD} \
    -layer M12  \
    -direction horizontal \
    -ybottom_offset 1 \
    -xleft_offset 1 \
    -width 1.8  \
    -spacing 0.36 \
    -set_to_set_distance $upper_metal_pitch -extend_to design_boundary -via_columns 4 -via_rows 4

  setAddStripeMode -stacked_via_bottom_layer M12 -stacked_via_top_layer M13
  addStripe -nets {VSS VDD} \
    -layer M13  \
    -direction vertical \
    -ybottom_offset 1 \
    -xleft_offset 1 \
    -width 1.8  \
    -spacing 0.36 \
    -set_to_set_distance $upper_metal_pitch -extend_to design_boundary -via_columns 2 -via_rows 2


}


