#!/usr/bin/tclsh

# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

puts [llength $argv]

if { $argc != 4 } {
  puts "This tcl script requires 3 args to be inputed."
  puts "For example, tclsh genRules.tcl \[libname\] \[cellname\] \[input_dir\] \[temp_info\]."
  exit
} 

set libname [lindex $argv 0]
set cellname [lindex $argv 1]
set input_dir [lindex $argv 2]
set temp_info [lindex $argv 3]

set output_filename "run_quantus_${cellname}_${libname}.cmd"
set output [open $output_filename "w"]

puts $output "distributed_processing -multi_cpu 4\n\n"
puts $output "process_technology -technology_library_file \"../../../inputs/techlib.defs\" -technology_name PROBE -temperature ${temp_info}\n\n"
puts $output "output_setup -file_name ${cellname}_${libname}.sp\n\n"

puts $output "input_db -type pvs -run_name ${cellname}_${libname} -directory_name ${input_dir} -format GDS -design_cell_name ${cellname}_${libname}\n"
puts $output "output_db -type spice -include_cap_model true -include_res_model true -include_parasitic_cap_model true -include_parasitic_res_model true"
puts $output "capacitance -ground_net VSS -decoupling_factor 1.0"
puts $output "extract -selection all -type rc_coupled"

close $output
