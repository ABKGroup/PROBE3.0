# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

########## USER INPUT #########

set top_module _DESIGN_
set libname _LIBNAME_
set list_lib "${libname}.lib"
set rtl_list "${top_module}.v"
set sdc "${top_module}.sdc"

###############################

# Target library
set link_library $list_lib
set target_library $list_lib

# set path
set_db init_lib_search_path .
set_db init_hdl_search_path .
set_db library $list_lib

# Start
if {[file exists template]} {
	exec rm -rf template
}
exec mkdir template
if {![file exists gate]} {
	exec mkdir gate
}
if {![file exists rpt]} {
	exec mkdir rpt
}


# read RTL
foreach rtl_file $rtl_list {
  read_hdl $rtl_file
}
elaborate $top_module

# Default SDC Constraints
read_sdc ${sdc}

syn_generic
syn_map

syn_opt

ungroup -all -flatten

write_sdc > gate/${top_module}.sdc
write_hdl > gate/${top_module}.v

# Write Reports
redirect [format "%s%s%s" rpt/ $top_module _area.rep] { report_area -detail}
redirect [format "%s%s%s" rpt/ $top_module _cell.rep] { report_gates }
redirect [format "%s%s%s" rpt/ $top_module _power.rep] { report_power }
redirect [format "%s%s%s" rpt/ $top_module _timing.rep] { report_timing }

exit
