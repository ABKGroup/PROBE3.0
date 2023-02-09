#!/usr/bin/tclsh

set input_dir [lindex $argv 0]
set result_dir [lindex $argv 1]
set libname [lindex $argv 2]
set cells [lrange $argv 3 end]

set output_filename "${result_dir}/libchar/${libname}_template.lib"
set output [open $output_filename "w"]

puts $output "library (PROBE) \{"

puts $cells

foreach cell $cells {
  set width 0
  set height 0
  set output_pin ""
  set input_pins ""

  set info_file "${result_dir}/gdslefgen/${libname}/${cell}_${libname}.info"
  if {![file exist $info_file]} {
    puts "ERROR: No info file for cell ${cell}_${libname}"
    continue
  }

  set input [open ${info_file} "r"]
  set lines [split [read $input] \n]
  set line1 [lindex $lines 0]
  set line2 [lindex $lines 1]
  set cell_full_name [lindex [split $line1 " "] 0]
  set footprint_name [lindex [split $cell_full_name "_"] 0]
  set output_pin [lindex [split $line1 " "] 1]
  set input_pins [lrange [split $line1 " "] 2 end]
  set width [lindex [split $line2 " "] 0]
  set height [lindex [split $line2 " "] 1]
  set area [expr $width*$height]
  
  puts $output "  cell (${cell}_${libname}) \{"
  puts $output "    area : ${area};"
  puts $output "    cell_footprint : \"${footprint_name}\";"
  puts $output "  \}"

  close $input
}

puts $output "\}"
close $output
