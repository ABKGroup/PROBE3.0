#################################################################################################
#                                                                                               #
#     Portions Copyright © 2022 Synopsys, Inc. All rights reserved. Portions of                 #
#     these TCL scripts are proprietary to and owned by Synopsys, Inc. and may only             #
#     be used for internal use by educational institutions (including United States             #
#     government labs, research institutes and federally funded research and                    # 
#     development centers) on Synopsys tools for non-profit research, development,              #
#     instruction, and other non-commercial uses or as otherwise specifically set forth         #
#     by written agreement with Synopsys. All other use, reproduction, modification, or         #
#     distribution of these TCL scripts is strictly prohibited.                                 #
#                                                                                               #
#################################################################################################

exec date >> timer
set lib_name _LIBNAME_
set design _DESIGN_

# read lib
set clib_name "probe"
set lib "${lib_name}.db"
set techfile "${lib_name}.tf"
set lef "${lib_name}.lef ${lib_name}.tap.lef"

if {[file exists "ndm"]} {
	exec rm -r ndm
}
exec mkdir ndm

create_workspace -technology $techfile -scale_factor 10000 -flow "normal" ${clib_name}

read_lef $lef
read_db $lib

check_workspace
commit_workspace -force -output ndm/${clib_name}.ndm

exec date >> timer

exit

