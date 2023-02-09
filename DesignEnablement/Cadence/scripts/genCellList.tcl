#!/usr/bin/tclsh

set result_dir [lindex $argv 0]
set script_dir [lindex $argv 1]
set libname [lindex $argv 2]
set cell_list [lrange $argv 3 end]

set output_filename "${result_dir}/libchar/cells.tcl"
set output [open $output_filename "w"]

puts $output "set libname $libname"

puts $output "set cells \{ \\"

foreach cell $cell_list {
  puts $output "${cell}_${libname} \\"
}

puts $output "\}"

# dir
puts $output "set SCRIPTS_DIR ${script_dir}"
puts $output "set RESULTS_DIR ${result_dir}"

close $output
