#!/usr/bin/tclsh

puts [llength $argv]

if { $argc != 2 } {
  puts "This tcl script requires two args to be inputed."
  puts "For example, tclsh genTech.tcl \[result_dir\] \[libname\]."
  exit
} 

set results_dir [lindex $argv 0]
set libname [lindex $argv 1]
#set pdn [lindex $argv 2]


set ch [string range [lindex [split $libname "_"] 0] 0 end-1]
set fin [string range [lindex [split $libname "_"] 1] 0 end-1]
set cpp [string range [lindex [split $libname "_"] 2] 0 end-3]
set m0p [string range [lindex [split $libname "_"] 3] 0 end-3]
set m1p [string range [lindex [split $libname "_"] 4] 0 end-3]
set m2p [string range [lindex [split $libname "_"] 5] 0 end-3]
set mpo [string range [lindex [split $libname "_"] 6] 0 end-3]
set dr [lindex [split $libname "_"] 7]
set pgpin [lindex [split $libname "_"] 8]


set outputFile_lef "./${results_dir}/${libname}.tap.lef"
set output_lef [open $outputFile_lef "w"]


puts $output_lef "VERSION 5.8 ;"
puts $output_lef "BUSBITCHARS \"\[\]\" ;"
puts $output_lef "DIVIDERCHAR \"/\" ;"
puts $output_lef "CLEARANCEMEASURE EUCLIDEAN ;"


# pdn FSBPR --> power tap connects M1 to BPR (2CPP, through small vias (supervias))
# cell width == 2CPP

# pdn BS --> power tap connects M0 to BS (100nm+keepout --> 5CPP through nTSV)
# cell width == 6CPP

if {[string match $pgpin "BPR"]} {
  set cppwidth 2
  set pgwidth [format %.3f [expr [format %.3f $m0p]/2000]]
} else {
  #BS
  #double height VDD/VSS
  set cppwidth 6
  set pgwidth [format %.3f [expr 3*[format %.3f $m0p]/2000]]
}
  
  set width [format %.3f [expr [format %.3f $cpp]*$cppwidth/1000]]
  set height [format %.3f [expr $ch*[format %.3f $m0p]/1000]]
  
  #set pgwidth [format %.3f [expr 3*[format %.3f $m0p]/2000]]
  
  puts $output_lef "MACRO POWERTAP_${cppwidth}CPP_VDD_${libname}"
  puts $output_lef "  CLASS CORE ;"
  puts $output_lef "  ORIGIN 0 0 ;"
  puts $output_lef "  FOREIGN POWERTAP_${cppwidth}CPP_VDD_${libname} ;"
  puts $output_lef "  SIZE ${width} BY [expr 2*${height}] ;"
  puts $output_lef "  SYMMETRY X Y ;"
  puts $output_lef "  SITE coresite ;"
  puts $output_lef "  PIN VSS"
  puts $output_lef "    DIRECTION INOUT ;"
  puts $output_lef "    USE GROUND ;"
  puts $output_lef "    SHAPE ABUTMENT ;"
  puts $output_lef "    PORT"
  puts $output_lef "      LAYER M0 ;"
  puts $output_lef "        RECT 0.000 -[format %.3f [expr ($pgwidth/2)]] ${width} [format %.3f [expr ($pgwidth/2)]] ;"
  puts $output_lef "        RECT 0.000 [format %.3f [expr (2*${height})-($pgwidth/2)]] ${width} [format %.3f [expr ($pgwidth/2)+(2*${height})]] ;"
  puts $output_lef "    END"
  puts $output_lef "  END VSS"
  puts $output_lef "  PIN VDD"
  puts $output_lef "    DIRECTION INOUT ;"
  puts $output_lef "    USE POWER ;"
  puts $output_lef "    SHAPE ABUTMENT ;"
  puts $output_lef "    PORT"
  puts $output_lef "      LAYER M0 ;"
  puts $output_lef "        RECT 0.000 [format %.3f [expr ${height}-($pgwidth/2)]] ${width} [format %.3f [expr ($pgwidth/2)+${height}]] ;"
  puts $output_lef "    END"
  puts $output_lef "  END VDD"
  puts $output_lef "END POWERTAP_${cppwidth}CPP_VDD_${libname}"
  puts $output_lef ""
  puts $output_lef "MACRO POWERTAP_${cppwidth}CPP_VSS_${libname}"
  puts $output_lef "  CLASS CORE ;"
  puts $output_lef "  ORIGIN 0 0 ;"
  puts $output_lef "  FOREIGN POWERTAP_${cppwidth}CPP_VSS_${libname} ;"
  puts $output_lef "  SIZE ${width} BY [expr 2*${height}] ;"
  puts $output_lef "  SYMMETRY X Y ;"
  puts $output_lef "  SITE coresite ;"
  puts $output_lef "  PIN VDD"
  puts $output_lef "    DIRECTION INOUT ;"
  puts $output_lef "    USE POWER ;"
  puts $output_lef "    SHAPE ABUTMENT ;"
  puts $output_lef "    PORT"
  puts $output_lef "      LAYER M0 ;"
  puts $output_lef "        RECT 0.000 -[format %.3f [expr ($pgwidth/2)]] ${width} [format %.3f [expr ($pgwidth/2)]] ;"
  puts $output_lef "        RECT 0.000 [format %.3f [expr (2*${height})-($pgwidth/2)]] ${width} [format %.3f [expr ($pgwidth/2)+(2*${height})]] ;"
  puts $output_lef "    END"
  puts $output_lef "  END VDD"
  puts $output_lef "  PIN VSS"
  puts $output_lef "    DIRECTION INOUT ;"
  puts $output_lef "    USE GROUND ;"
  puts $output_lef "    SHAPE ABUTMENT ;"
  puts $output_lef "    PORT"
  puts $output_lef "      LAYER M0 ;"
  puts $output_lef "        RECT 0.000 [format %.3f [expr ${height}-($pgwidth/2)]] ${width} [format %.3f [expr ($pgwidth/2)+${height}]] ;"
  puts $output_lef "    END"
  puts $output_lef "  END VSS"
  puts $output_lef "END POWERTAP_${cppwidth}CPP_VSS_${libname}"

close $output_lef
