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

set dir "./results/lib"

foreach f [glob -nocomplain ${dir}/*.lib] {
  set lib_name [string range $f [expr [string length $dir]+1] end-9]
  read_lib $f
  write_lib -format db -output ${dir}/${lib_name}_nldm.db $lib_name
}

exit
