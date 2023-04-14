# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

#!/usr/bin/tclsh

puts [llength $argv]

if { $argc != 4 } {
  puts "This tcl script requires three args to be inputed."
  puts "For example, tclsh genTechLef.tcl \[result_dir\] \[libname\] \[beol] \[m2width]."
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


set outputFile_lef "./${results_dir}/${ch}T_${beol}.tech.lef"
set output_lef [open $outputFile_lef "w"]

#header

set cpp_nm [expr [format %.3f $cpp]/1000]
set ch_nm [format %.3f [expr $ch*[dict get $pitch_map 0]]]


puts $output_lef "VERSION 5.8 ;"
puts $output_lef "BUSBITCHARS \"\[\]\" ;"
puts $output_lef "DIVIDERCHAR \"/\" ;"
puts $output_lef "USEMINSPACING OBS OFF ;"
puts $output_lef "CLEARANCEMEASURE EUCLIDEAN ;"
puts $output_lef ""
puts $output_lef "UNITS"
puts $output_lef "  DATABASE MICRONS 2000 ;"
puts $output_lef "END UNITS"
puts $output_lef ""
puts $output_lef "MANUFACTURINGGRID 0.0005 ;"
puts $output_lef ""
puts $output_lef "PROPERTYDEFINITIONS"
puts $output_lef "  LAYER LEF58_RIGHTWAYONGRIDONLY STRING ;"
puts $output_lef "  LAYER LEF58_RECTONLY STRING ;"
puts $output_lef "END PROPERTYDEFINITIONS"
puts $output_lef ""
puts $output_lef "SITE coresite"
puts $output_lef "    SIZE $cpp_nm BY $ch_nm ;"
puts $output_lef "    CLASS CORE ;"
puts $output_lef "    SYMMETRY Y ;"
puts $output_lef "END coresite"


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
    puts $output_lef "LAYER $via_name"
    puts $output_lef "  TYPE CUT ;"
    puts $output_lef "  WIDTH $via_width ;"
    puts $output_lef "  SPACING $vcspc CENTERTOCENTER ;"
    puts $output_lef "END $via_name"
  }

  puts $output_lef "LAYER $metal_name"
  puts $output_lef "  TYPE ROUTING ;"
  puts $output_lef "  DIRECTION $dir ;"
  puts $output_lef "  PITCH $pitch ;"
  puts $output_lef "  OFFSET 0.0 ;"
  puts $output_lef "  WIDTH $width ;"
  puts $output_lef "  MINWIDTH $width ;"
  puts $output_lef "  AREA $area ;"
  puts $output_lef "  SPACING $tspc ENDOFLINE $tspc WITHIN 0.001 ;"
  puts $output_lef "  SPACING $spc ;"
  puts $output_lef "  SPACINGTABLE  PARALLELRUNLENGTH"
  puts $output_lef "                0  "
  puts $output_lef "  WIDTH 0       $spc ; "
  puts $output_lef "  PROPERTY LEF58_RIGHTWAYONGRIDONLY \" RIGHTWAYONGRIDONLY ; \" ;"
  puts $output_lef "  PROPERTY LEF58_RECTONLY \" RECTONLY ; \" ;"
  puts $output_lef "END $metal_name"


}

 
puts $output_lef "LAYER OVERLAP"
puts $output_lef "  TYPE OVERLAP ;"
puts $output_lef "END OVERLAP"


for {set i 1} {$i < $num_stack} {incr i} {
  set via_name "V[expr $i - 1]"
  set pitch [format %.3f [dict get $pitch_map $i]]
  set vcspc [format %.3f [expr sqrt(2)*$pitch]]

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

  puts $output_lef "VIARULE ${via_name}_RULE GENERATE"
  puts $output_lef "  LAYER M[expr $i-1] ;"
  puts $output_lef "    ENCLOSURE $enc_l $enc_l_side ;"
  puts $output_lef "  LAYER M$i ;"
  puts $output_lef "    ENCLOSURE $enc_u $enc_u_side ;"
  puts $output_lef "  LAYER $via_name ;"
  puts $output_lef "    RECT -$halfviawidth -$halfviawidth $halfviawidth $halfviawidth ;"
  puts $output_lef "    SPACING $vcspc BY $vcspc ;"
  puts $output_lef "END ${via_name}_RULE"

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
          
    puts $output_lef "VIA ${via_name}_VH DEFAULT"
    puts $output_lef "  LAYER M[expr $i-1] ;"
    puts $output_lef "  RECT -${enc_l_side_lef} -${enc_l_lef} ${enc_l_side_lef} ${enc_l_lef} ;"
    puts $output_lef "  LAYER ${via_name} ;"
    puts $output_lef "  RECT -$halfviawidth -$halfviawidth $halfviawidth $halfviawidth ;"
    puts $output_lef "  LAYER ${metal_name} ;"
    puts $output_lef "  RECT -${enc_u_lef} -${enc_u_side_lef} ${enc_u_lef} ${enc_u_side_lef} ;"
    puts $output_lef "END ${via_name}_VH"

  } else {

    puts $output_lef "VIA ${via_name}_HV DEFAULT"
    puts $output_lef "  LAYER M[expr $i-1] ;"
    puts $output_lef "  RECT -${enc_l_lef} -${enc_l_side_lef} ${enc_l_lef} ${enc_l_side_lef} ;"
    puts $output_lef "  LAYER ${via_name} ;"
    puts $output_lef "  RECT -$halfviawidth -$halfviawidth $halfviawidth $halfviawidth ;"
    puts $output_lef "  LAYER ${metal_name} ;"
    puts $output_lef "  RECT -${enc_u_side_lef} -${enc_u_lef} ${enc_u_side_lef} ${enc_u_lef} ;"
    puts $output_lef "END ${via_name}_HV"
  }


}

set cpp_nm [expr [format %.3f $cpp]/1000]
#set ch_nm [format %.3f [expr ($track+2)*([lindex [split $beol "_"] 1]/1000)]]
set ch_nm [format %.3f [expr $ch*[dict get $pitch_map 0]]]

puts $output_lef "END LIBRARY"

close $output_lef
