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

set insertion_type _METHOD_
set pitch _PITCH_
#set tap_width "2.0"
#set tap_pitch [expr ([format %f $cpp]/1000)*($pitch+$tap_width)]
set tap_offset [expr ([format %f $cpp]/1000)*$pitch + 0.135]
set tap_pitch [expr ([format %f $cpp]/1000)*$pitch]

if {[string match "BS" $pdn]} {
  set cppwidth 6
} else {
  set cppwidth 2
}

  set tap_name_vdd "probe_phy/POWERTAP_${cppwidth}CPP_VDD_${lib_name}"
  set tap_name_vss "probe_phy/POWERTAP_${cppwidth}CPP_VSS_${lib_name}"

set pattern ""
if {[string match "C" $insertion_type]} {
  set pattern "every_row"
} else {
  set pattern "stagger"
}

if {[string match "FSBPR" $pdn]} {
  if {[string match "C" $insertion_type]} {
    create_tap_cells -lib_cell ${tap_name_vss} -pattern ${pattern} -distance [expr 2*$tap_pitch] 
    create_tap_cells -lib_cell ${tap_name_vdd} -pattern ${pattern} -distance [expr 2*$tap_pitch] -offset [expr $tap_offset]
  } else {
    create_tap_cells -lib_cell ${tap_name_vss} -pattern ${pattern} -distance [expr 4*$tap_pitch] 
    create_tap_cells -lib_cell ${tap_name_vdd} -pattern ${pattern} -distance [expr 4*$tap_pitch] -offset [expr $tap_offset]
  }
} else {
  if {[string match "C" $insertion_type]} {
    create_tap_cells -lib_cell ${tap_name_vss} -pattern ${pattern} -distance [expr 2*$tap_pitch] -offset 1.0
    create_tap_cells -lib_cell ${tap_name_vdd} -pattern ${pattern} -distance [expr 2*$tap_pitch] -offset [expr $tap_pitch + 1.0]
  } else {
    create_tap_cells -lib_cell ${tap_name_vss} -pattern ${pattern} -distance [expr 4*$tap_pitch] -offset 1.0
    create_tap_cells -lib_cell ${tap_name_vdd} -pattern ${pattern} -distance [expr 4*$tap_pitch] -offset [expr $tap_pitch + 1.0]
  }

}


