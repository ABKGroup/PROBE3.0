#################################################################################################
#												#
#	Portions Copyright © 2022 Synopsys, Inc. All rights reserved. Portions of		#
#	these TCL scripts are proprietary to and owned by Synopsys, Inc. and may only		#
#	be used for internal use by educational institutions (including United States		#
#	government labs, research institutes and federally funded research and			#
#	development centers) on Synopsys tools for non-profit research, development,		#
#	instruction, and other non-commercial uses or as otherwise specifically set forth	#
#	by written agreement with Synopsys. All other use, reproduction, modification, or	#
#	distribution of these TCL scripts is strictly prohibited.				#
#												#
#################################################################################################

#!/usr/bin/tclsh

puts [llength $argv]

if { $argc != 4 } {
  puts "This tcl script requires three args to be inputed."
  puts "For example, tclsh genTech.tcl \[result_dir\] \[libname\]."
  exit
} 

set results_dir [lindex $argv 0]
set libname [lindex $argv 1]
set beol [lindex $argv 2]
set m2w [lindex $argv 3]

#assume m0=m2=m3
set m0w $m2w
set m3w $m2w


set ch [string range [lindex [split $libname "_"] 0] 0 end-1]
set fin [string range [lindex [split $libname "_"] 1] 0 end-1]
set cpp [string range [lindex [split $libname "_"] 2] 0 end-3]
set m0p [string range [lindex [split $libname "_"] 3] 0 end-3]
set m1p [string range [lindex [split $libname "_"] 4] 0 end-3]
set m2p [string range [lindex [split $libname "_"] 5] 0 end-3]
set mpo [string range [lindex [split $libname "_"] 6] 0 end-3]
set dr [lindex [split $libname "_"] 7]
set pgpin [lindex [split $libname "_"] 8]

set track [expr int($ch - 2)]

set beol_name [lindex [split $beol "_"] 0]
set num_stack [expr [llength [split $beol "_"]] - 1]

for {set i 0} {$i < $num_stack} {incr i} {
  dict set pitch_map $i [expr [format %.3f [lindex [split $beol "_"] $i+1]]/1000]
}

#Layer map
dict set layer_num M0 15
dict set layer_num V0 18
dict set layer_num M1 19
dict set layer_num V1 21
dict set layer_num M2 20
dict set layer_num V2 22
dict set layer_num M3 23
dict set layer_num V3 24
dict set layer_num M4 25
dict set layer_num V4 26
dict set layer_num M5 27
dict set layer_num V5 28
dict set layer_num M6 29
dict set layer_num V6 30
dict set layer_num M7 31
dict set layer_num V7 32
dict set layer_num M8 33
dict set layer_num V8 34
dict set layer_num M9 35
dict set layer_num V9 36
dict set layer_num M10 37
dict set layer_num V10 38
dict set layer_num M11 39
dict set layer_num V11 40
dict set layer_num M12 41
dict set layer_num V12 42
dict set layer_num M13 43
dict set layer_num V13 44
dict set layer_num M14 45




set outputFile "./${results_dir}/${ch}T_${beol}.tf"
set output [open $outputFile "w"]

#header
puts $output "Technology \{"
puts $output "  name = \"PROBE\" "
puts $output "  unitTimeName = \"ns\" "
puts $output "  timePrecision = 1000 "
puts $output "  unitLengthName = \"micron\" "
puts $output "  lengthPrecision = 10000 "
puts $output "  unitVoltageName = \"v\" "
puts $output "  voltagePrecision = 1000000 "
puts $output "  unitCurrentName = \"ma\" "
puts $output "  currentPrecision = 1000 "
puts $output "  unitPowerName = \"mw\" "
puts $output "  powerPrecision = 100000 "
puts $output "  unitResistanceName = \"kohm\" "
puts $output "  resistancePrecision = 10000000 "
puts $output "  unitCapacitanceName = \"pf\" "
puts $output "  capacitancePrecision = 10000000 "
puts $output "  unitInductanceName = \"nh\" "
puts $output "  inductancePrecision = 100 "
puts $output "  gridResolution = 1 "
puts $output "  minEdgeMode = 1 "
puts $output "  metalAboveMiMCap = \"metal${num_stack}\""
puts $output "\}"
puts $output ""

set cpp_nm [expr [format %.3f $cpp]/1000]
set ch_nm [format %.3f [expr $ch*[dict get $pitch_map 0]]]


for {set i 0} {$i < $num_stack} {incr i} {
  set metal_name "M${i}"
  set via_name "V[expr $i - 1]"
  set pitch [format %.3f [dict get $pitch_map $i]]
  set pitch_nm [format %.3f [expr int($pitch * 1000)]]
  set cpp_um [expr [format %.3f $cpp]/1000]
  if {$i == 0 || $i == 2 || $i == 3} {
    set width [format %.3f $m2w]
    set spc [format %.3f [expr $pitch-$m2w]]
  } else {
    set width [format %.3f [expr $pitch/2]]
    set spc [format %.3f [expr $pitch/2]]
  }

  set metal_num [dict get $layer_num $metal_name]
  if {$i > 0} {
    set via_num [dict get $layer_num $via_name]
  }

  #ET
  set area [format %.3f [expr $pitch*$pitch/2]]
  set tspc $pitch

  set via_width 0.000
  if {$i == 0} { 
    set via_width 0.000
  } elseif {$i == 1} {
    set via_width [format %.3f [expr min($m2w,[dict get $pitch_map [expr $i-1]]/2)]]
  } elseif {$i == 2} {
    set via_width [format %.3f [expr min($m2w,$m3w)]]
  } elseif {$i == 3} {
    set via_width [format %.3f [expr min([dict get $pitch_map $i]/2,$m3w)]]
  } else {
    set via_width [format %.3f [expr min([dict get $pitch_map $i],[dict get $pitch_map [expr $i-1]])/2]]
  }

  set vcspc [format %.3f [expr sqrt(2)*$pitch]]
  set enc_u 0.007
  set enc_l 0.007
  
  set dir "HORIZONTAL"
  if {$i % 2 == 0} {
    set dir "HORIZONTAL"
  } else {
    set dir "VERTICAL"
  }

  # Layer definition
  if {$i > 0} {
    puts $output "Layer \"${via_name}\" \{ "
    #puts $output "  layerNumber = [expr $i + 514] "
    puts $output "  layerNumber = $via_num "
    puts $output "  maskName = \"via[expr ${i}-1]\"" 
    puts $output "  isDefaultLayer = 1" 
    puts $output "  visible = 1 "
    puts $output "  selectable = 1" 
    puts $output "  blink = 0 "
    puts $output "  lineStyle = \"solid\"" 
    puts $output "  pattern = \"rectangleX\" "
    puts $output "  color = \"cyan\"" 
    puts $output "  cutTblSize = 1 "
    puts $output "  cutNameTbl = ( Vx )" 
    puts $output "  cutWidthTbl = ( $via_width )"
    puts $output "  cutHeightTbl = ( $via_width )"
    puts $output "  cutDataTypeTbl = ( 0 ) "
    puts $output "  enclosureTblSize = 4"
    puts $output "  enclosureTbl = ( Vx, -1.0, -1.0, ${enc_u}, 0.0, -1.0, -1.0,"
    puts $output "                 Vx, -1.0, -1.0, 0.0, ${enc_u}, -1.0, -1.0,"
    puts $output "                 Vx, ${enc_l}, 0.0, -1.0, -1.0, -1.0, -1.0,"
    puts $output "                 Vx, 0.0, ${enc_l}, -1.0, -1.0, -1.0, -1.0)"
    puts $output "\}"
    puts $output ""
  }

  puts $output "Layer \"${metal_name}\" \{ "
  #puts $output "  layerNumber = [expr $i + 14] "
  puts $output "  layerNumber = $metal_num "
  puts $output "  maskName = \"metal${i}\" "
  puts $output "  onWireTrack = 1"
  puts $output "  isDefaultLayer = 1 "
  puts $output "  visible = 1 "
  puts $output "  selectable = 1" 
  puts $output "  blink = 0 "
  puts $output "  lineStyle = \"solid\"" 
  puts $output "  pattern = \"dot\"" 
  puts $output "  color = \"green\" "
  puts $output "  pitch = $pitch"
  puts $output "  defaultWidth = $width"
  puts $output "  minWidth = $width"
  puts $output "  minSpacing = $spc"
  puts $output "  minArea = $area"
  puts $output "  endOfLine1NeighborEndToEndThreshold = $tspc"
  puts $output "  endOfLine1NeighborEndToEndThreshold2 = $tspc" 
  puts $output "  endOfLine1NeighborEndToEndParallelWidth = 0.000 "
  puts $output "  endOfLine1NeighborEndToEndMinSpacing = $tspc"
  puts $output "\}"
  puts $output ""

}

puts $output "Layer \"OUTLINE\" \{ "
puts $output "  layerNumber = 1 "
puts $output "  visible = 1 "
puts $output "  selectable = 1 "
puts $output "  blink = 0 "
puts $output "  lineStyle = \"solid\"" 
puts $output "  pattern = \"blank\"" 
puts $output "  color = \"red\" "
puts $output "\}"
puts $output ""
 

for {set i 1} {$i < $num_stack} {incr i} {
  set via_name "V[expr $i - 1]"
  set pitch [format %.3f [dict get $pitch_map $i]]
  set vcspc [format %.3f [expr sqrt(2)*$pitch]]

  puts $output "DesignRule \{"
  puts $output " layer1 = \"${via_name}\""
  puts $output " layer2 = \"${via_name}\""
  puts $output " cut1TblSize = 1"
  puts $output " cut2TblSize = 1"
  puts $output " cut1NameTbl = (Vx)"
  puts $output " cut2NameTbl = (Vx)"
  puts $output " sameNetCenterMinSpacingTbl = ($vcspc)"
  puts $output " diffNetCenterMinSpacingTbl = ($vcspc)"
  puts $output "\}"
  puts $output ""

  set lower_width 0.000
  set upper_width 0.000
  set via_width 0.000
  if {$i == 1} {
    #V0
    set lower_width [format %.3f $m0w]
    set upper_width [format %.3f [expr [dict get $pitch_map $i]/2]]
    set via_width [format %.3f [expr min($m0w,[dict get $pitch_map $i]/2)]]
  } elseif {$i == 2} {
    #V1
    set lower_width [format %.3f [expr [dict get $pitch_map [expr $i-1]]/2]]
    set upper_width [format %.3f $m2w]
    set via_width [format %.3f [expr min([dict get $pitch_map [expr $i-1]]/2,$m2w)]]
  } elseif {$i == 3} {
    #V2
    set lower_width [format %.3f $m2w]
    set upper_width [format %.3f $m3w]
    set via_width [format %.3f [expr min($m2w,$m3w)]]
  } elseif {$i == 4} {
    #V3
    set lower_width [format %.3f $m3w]
    set upper_width [format %.3f [expr [dict get $pitch_map $i]/2]]
    set via_width [format %.3f [expr min([dict get $pitch_map $i]/2,$m3w)]]
  } else {
    set lower_width [format %.3f [expr [dict get $pitch_map [expr $i-1]]/2]]
    set upper_width [format %.3f [expr [dict get $pitch_map $i]/2]]
    set via_width [format %.3f [expr min([dict get $pitch_map $i],[dict get $pitch_map [expr $i-1]])/2]]
  }
  
  set vcspc [format %.3f [expr sqrt(2)*$pitch]]
  set enc_u 0.007
  set enc_l 0.007

  set enc_u_side 0.000
  set enc_l_side 0.000

  if {[lindex [split $beol "_"] $i+1] > [lindex [split $beol "_"] $i]} {
    #set enc_u_side [expr ([format %.3f [lindex [split $beol "_"] $i+1]]-[format %.3f [lindex [split $beol "_"] $i]]) / 4000]
    set enc_u_side [expr ($upper_width-$via_width)/2]
    set enc_l_side 0.000
  } elseif {[lindex [split $beol "_"] $i+1] < [lindex [split $beol "_"] $i]} {
    #set enc_l_side [expr ([format %.3f [lindex [split $beol "_"] $i]]-[format %.3f [lindex [split $beol "_"] $i+1]]) / 4000]
    set enc_l_side [expr ($lower_width-$via_width)/2]
    set enc_u_side 0.000
  } 

  set halfviawidth [format %.3f [expr $via_width / 2]]
  set enc_l_lef [expr $halfviawidth + $enc_l]
  set enc_l_side_lef [expr $halfviawidth + $enc_l_side]
  set enc_u_lef [expr $halfviawidth + $enc_u]
  set enc_u_side_lef [expr $halfviawidth + $enc_u_side]

}

# ContactCode
set cnt 0
for {set i 1} {$i < $num_stack} {incr i} {

  incr cnt

  set metal_name "M${i}"
  set via_name "V[expr $i - 1]"
  set pitch [dict get $pitch_map $i]
  set pitch_nm [expr int($pitch * 1000)]
  set cpp_um [expr [format %.3f $cpp]/1000]
  if {$i == 0 || $i == 2 || $i == 3} {
    set width [format %.3f $m2w]
    set spc [format %.3f [expr $pitch-$m2w]]
  } else {
    set width [format %.3f [expr $pitch/2]]
    set spc [format %.3f [expr $pitch/2]]
  }

  #ET
  set area [format %.3f [expr $pitch*$pitch/2]]
  set tspc $pitch

  set lower_width 0.000
  set upper_width 0.000
  set via_width 0.000
  if {$i == 1} {
    #V0
    set lower_width [format %.3f $m0w]
    set upper_width [format %.3f [expr [dict get $pitch_map $i]/2]]
    set via_width [format %.3f [expr min($m0w,[dict get $pitch_map $i]/2)]]
  } elseif {$i == 2} {
    #V1
    set lower_width [format %.3f [expr [dict get $pitch_map [expr $i-1]]/2]]
    set upper_width [format %.3f $m2w]
    set via_width [format %.3f [expr min([dict get $pitch_map [expr $i-1]]/2,$m2w)]]
  } elseif {$i == 3} {
    #V2
    set lower_width [format %.3f $m2w]
    set upper_width [format %.3f $m3w]
    set via_width [format %.3f [expr min($m2w,$m3w)]]
  } elseif {$i == 4} {
    #V3
    set lower_width [format %.3f $m3w]
    set upper_width [format %.3f [expr [dict get $pitch_map $i]/2]]
    set via_width [format %.3f [expr min([dict get $pitch_map $i]/2,$m3w)]]
  } else {
    set lower_width [format %.3f [expr [dict get $pitch_map [expr $i-1]]/2]]
    set upper_width [format %.3f [expr [dict get $pitch_map $i]/2]]
    set via_width [format %.3f [expr min([dict get $pitch_map $i],[dict get $pitch_map [expr $i-1]])/2]]
  }

  set vcspc [format %.3f [expr sqrt(2)*$pitch]]
  set enc_u 0.007
  set enc_l 0.007
  
  set enc_u_side 0.000
  set enc_l_side 0.000
  
  if {[lindex [split $beol "_"] $i+1] > [lindex [split $beol "_"] $i]} {
    #set enc_u_side [expr ([format %.3f [lindex [split $beol "_"] $i+1]]-[format %.3f [lindex [split $beol "_"] $i]]) / 4000]
    set enc_u_side [expr ($upper_width-$via_width)/2]
    set enc_l_side 0.000
  } elseif {[lindex [split $beol "_"] $i+1] < [lindex [split $beol "_"] $i]} {
    #set enc_l_side [expr ([format %.3f [lindex [split $beol "_"] $i]]-[format %.3f [lindex [split $beol "_"] $i+1]]) / 4000]
    set enc_l_side [expr ($lower_width-$via_width)/2]
    set enc_u_side 0.000
  } 

      
  set halfviawidth [format %.3f [expr $via_width / 2]]
  set enc_l_lef [format %.3f [expr $halfviawidth + $enc_l]]
  set enc_l_side_lef [format %.3f [expr $halfviawidth + $enc_l_side]]
  set enc_u_lef [format %.3f [expr $halfviawidth + $enc_u]]
  set enc_u_side_lef [format %.3f [expr $halfviawidth + $enc_u_side]]

  if {$i%2==0} {
    puts $output "ContactCode \"${via_name}_VH\" \{"
    puts $output "  contactCodeNumber = $cnt"
    puts $output "  cutLayer = \"${via_name}\""
    puts $output "  lowerLayer = \"M[expr $i-1]\""
    puts $output "  upperLayer = \"${metal_name}\""
    puts $output "  upperLayerEncWidth = ${enc_u}"
    #puts $output "  upperLayerEncHeight = 0.0"
    puts $output "  upperLayerEncHeight = ${enc_u_side}"
    #puts $output "  lowerLayerEncWidth = 0.0"
    puts $output "  lowerLayerEncWidth = ${enc_l_side}"
    puts $output "  lowerLayerEncHeight = ${enc_l}"
    puts $output "  cutWidth = ${via_width}"
    puts $output "  cutHeight = ${via_width}"
    puts $output "  isDefaultContact = 1"
    puts $output "\}"
    puts $output ""
          
  } else {
    puts $output "ContactCode \"${via_name}_HV\" \{"
    puts $output "  contactCodeNumber = $cnt"
    puts $output "  cutLayer = \"${via_name}\""
    puts $output "  lowerLayer = \"M[expr $i-1]\""
    puts $output "  upperLayer = \"${metal_name}\""
    #puts $output "  upperLayerEncWidth = 0.0"
    puts $output "  upperLayerEncWidth = ${enc_u_side}"
    puts $output "  upperLayerEncHeight = ${enc_u}"
    puts $output "  lowerLayerEncWidth = ${enc_l}"
    #puts $output "  lowerLayerEncHeight = 0.0"
    puts $output "  lowerLayerEncHeight = ${enc_l_side}"
    puts $output "  cutWidth = ${via_width}"
    puts $output "  cutHeight = ${via_width}"
    puts $output "  isDefaultContact = 1"
    puts $output "\}"
    puts $output ""

  }


}

set cpp_nm [expr [format %.3f $cpp]/1000]
#set ch_nm [format %.3f [expr ($track+2)*([lindex [split $beol "_"] 1]/1000)]]
set ch_nm [format %.3f [expr $ch*[dict get $pitch_map 0]]]

puts $output "PRRule \{ "
puts $output "  rowSpacingTopTop = 0.0 "
puts $output "  rowSpacingBotBot = 0.0 "
puts $output "  abuttableTopTop = 1 "
puts $output "  abuttableTopBot = 0 "
puts $output "  abuttableBotBot = 1 "
puts $output "\} "
puts $output ""
puts $output "Tile \"coresite\" \{ "
puts $output "  width = $cpp_nm"
puts $output "  height = $ch_nm"
puts $output "\} "

close $output
