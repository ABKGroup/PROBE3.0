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

array set cell_locs []
proc swapCells {} {

    # read mesh info
    set infile [open design_info.txt]
    gets $infile line
    close $infile
    set num_rows [lindex $line 0]
    set num_cols [lindex $line 1]

    # initialize mapping
    for {set i 1} {$i <= $num_rows} {incr i} {
        for {set j 1} {$j <= $num_cols} {incr j} {
            set index($i-$j) "$i $j"
            set map($i-$j)   "$i $j"
        }
    }

    set inFile [open swap.list]
    while {[gets $inFile line]>=0} {

        set r1 [lindex $line 0]
        set c1 [lindex $line 1]
        set d  [lindex $line 2]

        set cur_i [lindex $index($r1-$c1) 0]
        set cur_j [lindex $index($r1-$c1) 1]

        set nbr_i $cur_i
        set nbr_j $cur_j
        if {$d == 0} {
            set nbr_i [expr $cur_i + 1]
        }
        if {$d == 1} {
            set nbr_j [expr $cur_j - 1]
        }
        if {$d == 2} {
            set nbr_j [expr $cur_j + 1]
        }
        if {$d == 3} {
            set nbr_i [expr $cur_i - 1]
        }

        set r2 [lindex $map($nbr_i-$nbr_j) 0]
        set c2 [lindex $map($nbr_i-$nbr_j) 1]

        set cell1 [get_cells g_${r1}_${c1}]
        set cell2 [get_cells g_${r2}_${c2}]
        set bbox1 [get_attri $cell1 bbox]
        set bbox2 [get_attri $cell2 bbox]
        set x1 [lindex [lindex $bbox1 0] 0]
        set y1 [lindex [lindex $bbox1 0] 1]
        set x2 [lindex [lindex $bbox2 0] 0]
        set y2 [lindex [lindex $bbox2 0] 1]
        set_cell_location -coordinates "$x2 $y2" -ignore_fixed [get_cell g_${r1}_${c1}] -fixed
        set_cell_location -coordinates "$x1 $y1" -ignore_fixed [get_cell g_${r2}_${c2}] -fixed

        set index($r1-$c1) "$nbr_i $nbr_j"
        set index($r2-$c2) "$cur_i $cur_j"
        set map($cur_i-$cur_j) "$r2 $c2"
        set map($nbr_i-$nbr_j) "$r1 $c1"
        puts "swap g_${r1}_${c1} and g_${r2}_${c2}"
    }
    close $inFile
}

proc swapTwoCells {cell1_name cell2_name} {

    if { $cell1_name == ""  || $cell2_name == "" } {
        return 0
    }
    #puts "$cell1_name $cell2_name"

    set cell1 [get_cells $cell1_name]
    set cell2 [get_cells $cell2_name]

    set lib_cell_name [get_attribute $cell2 ref_name]

    # not allow swapping FF for now
    if { [regexp {FF} $lib_cell_name] } {
        return 0
    }

    set cell1_org [get_attribute $cell1 origin]
    set cell1_ori [get_attribute $cell1 orientation]
    set cell1_width [get_attribute $cell1 width]
    set cell1_height [get_attribute $cell1 height]
    set cell2_org [get_attribute $cell2 origin]
    set cell2_ori [get_attribute $cell2 orientation]
    set cell2_width [get_attribute $cell2 width]
    set cell2_height [get_attribute $cell2 height]
    set diff [expr $cell2_width - $cell1_width]

    #puts "$diff *$cell1_width* *$cell2_width*"

    if { $diff != 0 } {
        return 0
    }

    set cell1_org_x [lindex $cell1_org 0]
    set cell1_org_y [lindex $cell1_org 1]
    set cell2_org_x [lindex $cell2_org 0]
    set cell2_org_y [lindex $cell2_org 1]

    if {[string match "R180" $cell1_ori]} {
      set cell1_org_x [format "%.4f" [expr $cell1_org_x - $cell1_width]]
      set cell1_org_y [format "%.4f" [expr $cell1_org_y - $cell1_height]]
    } elseif {[string match "MX" $cell1_ori]} {
      set cell1_org_y [format "%.4f" [expr $cell1_org_y - $cell1_height]]
    } elseif {[string match "MY" $cell1_ori]} {
      set cell1_org_x [format "%.4f" [expr $cell1_org_x - $cell1_width]]
    }

    if {[string match "R180" $cell2_ori]} {
      set cell2_org_x [format "%.4f" [expr $cell2_org_x - $cell1_width]]
      set cell2_org_y [format "%.4f" [expr $cell2_org_y - $cell1_height]]
    } elseif {[string match "MX" $cell2_ori]} {
      set cell2_org_y [format "%.4f" [expr $cell2_org_y - $cell1_height]]
    } elseif {[string match "MY" $cell2_ori]} {
      set cell2_org_x [format "%.4f" [expr $cell2_org_x - $cell1_width]]
    }

    set cell1_org [list $cell1_org_x $cell1_org_y]
    set cell2_org [list $cell2_org_x $cell2_org_y]
    set_cell_location -coordinates $cell2_org -orientation $cell2_ori -ignore_fixed $cell1 -fixed
    set_cell_location -coordinates $cell1_org -orientation $cell1_ori -ignore_fixed $cell2 -fixed
    #puts "swap $cell1_name $cell2_name"
    return 1
}

proc sortCells {} {
    global cell_locs
    unset cell_locs
    set cells [get_cells *]

    foreach_in_collection cell $cells {
        set name [get_attribute $cell name]
      if {[string match "*tap*" $name]} continue

        set origin [get_attribute $cell origin]
        set orientation [get_attribute $cell orientation]
        set width [get_attribute $cell width]
        set height [get_attribute $cell height]

        set x [format "%.4f" [lindex $origin 0]]
        set y [format "%.4f" [lindex $origin 1]]

        #ICC2 orientation
        #R0, R90(v), R180, R270(v), MX, MXR90 (v), MY, MYR90 (v)
        #origin: ll, lr, ur, ul, ul, ll, lr, ur       

        if {[string match "R180" $orientation]} {
          set x [format "%.4f" [expr $x - $width]]
          set y [format "%.4f" [expr $y - $height]]
        } elseif {[string match "MX" $orientation]} {
          set y [format "%.4f" [expr $y - $height]]
        } elseif {[string match "MY" $orientation]} {
          set x [format "%.4f" [expr $x - $width]]
        }

        lappend cell_locs($y) [list $name $x]
        #puts "$name $x $y"
    }
    
    #set outFile [open orig.list w]
    foreach y [array names cell_locs] {
        set cell_locs_sorted_x [lsort -real -index 1 $cell_locs($y)]
        set cell_locs($y) $cell_locs_sorted_x 
        #puts $outFile "$y $cell_locs($y)"
    }
    #close $outFile
}

proc swapNCell { cell_name dir } {
    global cell_locs
    # dir 0 1 2 3 = W E N S
    
    set cell [get_cell $cell_name]
    set lib_cell_name [get_attribute $cell ref_name]
    set height [get_attribute $cell height]
    set width [get_attribute $cell width]
    set orientation [get_attribute $cell orientation]

    # not allow swapping FF for now
    if { [regexp {FF} $lib_cell_name] } {
        return 0
    }

    set origin [get_attribute $cell origin]
    set x [format "%.4f"  [lindex $origin 0]]
    set y [format "%.4f"  [lindex $origin 1]]

    #puts "MSK:: Y!! $y"

    #ICC2 orientation
    #R0, R90(v), R180, R270(v), MX, MXR90 (v), MY, MYR90 (v)
    #origin: ll, lr, ur, ul, ul, ll, lr, ur       
    if {[string match "R180" $orientation]} {
      set x [format "%.4f" [expr $x - $width]]
      set y [format "%.4f" [expr $y - $height]]
    } elseif {[string match "MX" $orientation]} {
      set y [format "%.4f" [expr $y - $height]]
    } elseif {[string match "MY" $orientation]} {
      set x [format "%.4f" [expr $x - $width]]
    }
        
    #puts "MSK:: Y!! $y $orientation" 

    set index [lsearch -index 0  $cell_locs($y) $cell_name]

    if { $dir == 0 || $dir == 1 } {
        
      # skip for unset Y axis
        if {![info exists cell_locs($y)]} {
            puts "UP: NO EXIST $y"
            return 0
        } else {
          # puts "UP: Exist $y in cell_locs"
        }

        if { ($dir == 0 && $index == 0) \
            || ($dir == 1 && $index == [expr [llength $cell_locs($y)] -1]) } {
            return 0
        }

        set n_index 0

        if { $dir == 0 } {
            set n_index [expr $index - 1]
        } else {
            set n_index [expr $index + 1]
        }

        set n_loc [lindex $cell_locs($y) $n_index]
        set NCell [lindex $n_loc 0]

        if { ![swapTwoCells $cell_name $NCell] } {
            return 0
        }

        set new_loc [list $cell_name [lindex $n_loc 1]]
        set new_nloc [list $NCell $x]
        set temp [lreplace $cell_locs($y) $index $index $new_nloc]
        set cell_locs($y) [lreplace $temp $n_index $n_index $new_loc]

        #puts [get_attribute [get_cell $cell_name] origin]
        #puts [get_attribute [get_cell $cell_name] orientation]
        #puts [get_attribute [get_cell $NCell] origin]
        #puts [get_attribute [get_cell $NCell] orientation]

        #puts "MSK:: $new_loc $y"
        #puts "MSK:: $new_nloc $y"


    } elseif { $dir == 2 || $dir == 3 } {

        set min_y [lindex [lindex [get_attribute [get_core_area] bbox] 0] 1]
        set max_y [format "%.4f" [expr [lindex [lindex [get_attribute [get_core_area] bbox] 1] 1] - $height]]

        if { $dir == 2 } {
          if {$y >= $max_y} {return 0}
          set n_y [format "%.4f" [expr $y + $height]]
        } else {
          if {$y <= $min_y} {return 0}
          set n_y [format "%.4f" [expr $y - $height]]
        }

        #if { $n_y >= $max_y || $n_y <= $min_y } {
        #    return 0
        #}
        
        # skip for unset Y axis
        if {![info exists cell_locs($n_y)]} {
            puts "DOWN: NO EXIST $n_y"
            return 0
        } else {
          # puts "DOWN: Exist $n_y in cell_locs"
        }
        
        set n_index 0
        foreach loc $cell_locs($n_y) {
            if { [expr [lindex $loc 1] + $width] > $x } {
                break
            }
            incr n_index
        }

        set n_loc [lindex $cell_locs($n_y) $n_index]
        set NCell [lindex $n_loc 0]
        #puts "$n_loc $NCell"

        if { ![swapTwoCells $cell_name $NCell] } {
            return 0
        }

        set new_loc [list $cell_name [lindex $n_loc 1]]
        set new_nloc [list $NCell $x]
        set temp [lreplace $cell_locs($y) $index $index $new_nloc]
        set cell_locs($y) $temp

        set temp [lreplace $cell_locs($n_y) $n_index $n_index $new_loc]
        set cell_locs($n_y) $temp
        
        #puts "MSK:: $new_loc $y"
        #puts "MSK:: $new_nloc $n_y"

    }

#    set outFile [open swap_loc.list w]
#    puts $outFile "after swap ......"
#    foreach y [array names cell_locs] {
#        set cell_locs_sorted_x [lsort -real -index 1 $cell_locs($y)]
#        set cell_locs($y) $cell_locs_sorted_x 
#        puts $outFile "$y $cell_locs($y)"
#    }
#    close $outFile
    return 1
}

proc randSwapCells {} {
    #set cell [index_collection [get_cells *] 0]
    #set bbox [get_attri $cell bbox]
    #set x1 [lindex [lindex $bbox 0] 0]
    #set y1 [lindex [lindex $bbox 0] 1]
    #set x2 [lindex [lindex $bbox 1] 0]
    #set y2 [lindex [lindex $bbox 1] 1]
    #set height [expr $y2 - $y1]
    #set width [expr $x2 - $x1]


    # read swap info (k=10) ?
    set infile [open swap_info.txt]
    gets $infile line
    close $infile
    set k [lindex $line 0]
    set seedNum [lindex $line 1]
    set seed [expr srand($seedNum)]

    set cells ""
    foreach_in_collection c [get_cells *] {
        set name [get_attribute $c name]
        if {![string match "*tap*" $name]} {
          set cells "$cells $name"
        }
    }

    set num_cells [llength $cells]
    set num [expr $k*$num_cells]
    sortCells

    set outFile [open swap.list w]
    set i 0
    while {$i < $num} {
        set rand_cell [format %.0f [expr rand()*($num_cells - 1)]]
        set dir [format %.0f [expr round(rand()*3)]]
        set cell_name [lindex $cells $rand_cell]
        #puts "MSK:: $cell_name $dir"
        set ret [swapNCell $cell_name $dir] 
        if { $ret == 1 } {
            incr i
            puts $outFile "$cell_name $dir"
        }
    }
    close $outFile
}

proc randSwapCellsAll {} {
    global height

    # read swap info
    set infile [open swap_info.txt]
    gets $infile line
    close $infile
    set k [lindex $line 0]
    set seedNum [lindex $line 1]
    set seed [expr srand($seedNum)]

    set cells ""
    foreach_in_collection c [get_cells *] {
      set name [get_attribute $c name]
      if {![string match "*tap*" $name]} {
        set cells "$cells $name"
      }
    }
    set num_cells [llength $cells]
    set num [expr $k*$num_cells]
    sortCells

    set outFile [open swap.list w]
    set i 0
    while {$i < $num} {
        set rand_cell [format %.0f [expr rand()*($num_cells - 1)]]
        set rand_cell2 [format %.0f [expr rand()*($num_cells - 1)]]

        if { $rand_cell == $rand_cell2 } {
            continue
        }
        set cell1_name [lindex $cells $rand_cell]
        set cell2_name [lindex $cells $rand_cell2]

        set ret [swapTwoCells $cell1_name $cell2_name]

        if { $ret == 1 } {
            incr i
            puts $outFile "$cell1_name $cell2_name"
            #puts $i
        }
    }
    close $outFile
}

#ICC2 orientation
#R0, R90(v), R180, R270(v), MX, MXR90 (v), MY, MYR90 (v)
#origin: ll, lr, ur, ul, ul, ll, lr, ur
