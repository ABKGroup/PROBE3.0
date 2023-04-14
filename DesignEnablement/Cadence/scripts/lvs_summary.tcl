#!/usr/bin/tclsh
set logdir [lindex $argv 0]
set libname [lindex $argv 1]
set cells [lrange $argv 2 end]

set outputFile "./${logdir}/lvs.summary"
set output [open $outputFile "w"]


foreach cell $cells {
  set cell_name "${cell}_${libname}"
  puts $cell_name 

  set file_name "./${logdir}/${cell_name}.pvslvs.log"

  if {[file exists $file_name]} {
    set input [open $file_name "r"]
    set file_data [split [read $input] \n]
    foreach line $file_data {
      if {[string match "*Run Result*" $line]} {
        set pass_fail [lindex [split $line " "] 20]
        puts $output "$cell_name $pass_fail"
      }
    }
  }
}

close $output
