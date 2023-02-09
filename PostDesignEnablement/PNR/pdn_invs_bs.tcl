# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

#pdn
#assume pp, pdn, m0p are defined

set tap_pitch [expr ([format %f $cpp]/1000)*$pitch]
set bottom_layer M0

createPGPin VDD
createPGPin VSS

editDelete -type Special -net {VDD VSS}

setAddStripeMode -orthogonal_only false -ignore_DRC false  -via_using_exact_crossover_size false
setViaGenMode -ignore_DRC false 

sroute -corePinLayer $bottom_layer

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

set upper_metal_pitch_bm1 [expr $tap_pitch/$div]
set upper_metal_pitch_bm2 4.32

if {[string match "BS" $pdn]} {

  set bm1_spacing [expr $upper_metal_pitch_bm1/2 -$bm1_width]


  setAddStripeMode -stacked_via_bottom_layer M0 -stacked_via_top_layer M1
  addStripe -nets {VSS VDD} \
	  -layer M1  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width $bm1_width  \
	  -spacing $bm1_spacing \
	  -set_to_set_distance $upper_metal_pitch_bm1 -via_columns 4 -via_rows 1

  setAddStripeMode -stacked_via_bottom_layer M1 -stacked_via_top_layer M2
  addStripe -nets {VSS VDD} \
	  -layer M4  \
	  -direction horizontal \
    -ybottom_offset 0.01 \
    -xleft_offset 0.01 \
	  -width 1.8  \
	  -spacing 0.36 \
	  -set_to_set_distance $upper_metal_pitch_bm2 -via_columns 4 -via_rows 4

} elseif {[string match "BSBPR" $pdn]} {

  setAddStripeMode -stacked_via_bottom_layer M0 -stacked_via_top_layer M1
  addStripe -nets {VSS VDD} \
	  -layer M1  \
	  -direction vertical \
    -ybottom_offset 1.0 \
    -xleft_offset 1.0 \
	  -width 1.8  \
	  -spacing 0.36 \
	  -set_to_set_distance 4.32 -via_columns 4 -via_rows 1

  setAddStripeMode -stacked_via_bottom_layer M1 -stacked_via_top_layer M2
  addStripe -nets {VSS VDD} \
	  -layer M4  \
	  -direction horizontal \
    -ybottom_offset 0.01 \
    -xleft_offset 0.01 \
	  -width 1.8  \
	  -spacing 0.36 \
	  -set_to_set_distance 4.32 -via_columns 4 -via_rows 4


}


