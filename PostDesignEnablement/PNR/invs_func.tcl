# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

array set cell_locs []
array set remaining_ws []

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
        set x1 [get_property $cell1 x_coordinate_min]
        set y1 [get_property $cell1 y_coordinate_min]

        set x2 [get_property $cell2 x_coordinate_min]
        set y2 [get_property $cell2 y_coordinate_min]

        placeInstance g_${r1}_${c1} [expr $x2] $y2 -fixed
        placeInstance g_${r2}_${c2} [expr $x1] $y1 -fixed

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

    set cell1 [get_cells $cell1_name]
    set cell2 [get_cells $cell2_name]

    set lib_cell_name [get_property $cell2 ref_lib_cell_name]

    # not allow swapping FF for now
    if { [regexp {DFF} $lib_cell_name] } {
        return 0
    }

    set cord1 [dbGet [dbGet -p1 top.insts.name $cell1_name].box_ll]
    set org1 [dbGet [dbGet -p1 top.insts.name $cell1_name].orient]
    set cord2 [dbGet [dbGet -p1 top.insts.name $cell2_name].box_ll]
    set org2 [dbGet [dbGet -p1 top.insts.name $cell2_name].orient]

    #set x1 [get_property $cell1 x_coordinate_min]
    #set y1 [get_property $cell1 y_coordinate_min]
    #set x1_2 [get_property $cell1 x_coordinate_max]
    #set y1_2 [get_property $cell1 y_coordinate_max]

    #set x2 [get_property $cell2 x_coordinate_min]
    #set y2 [get_property $cell2 y_coordinate_min]
    #set x2_2 [get_property $cell2 x_coordinate_max]
    #set y2_2 [get_property $cell2 y_coordinate_max]

    #set cell1_width [expr $x1_2 - $x1]
    #set cell2_width [expr $x2_2 - $x2]
    #if { $cell1_width != $cell2_width } {
    #    return 0
    #}

    #placeInstance $cell1_name [expr $x2] $y2 -fixed
    #placeInstance $cell2_name [expr $x1] $y1 -fixed
    placeInstance $cell1_name $cord2 $org2 -fixed 
    placeInstance $cell2_name $cord1 $org1 -fixed

    puts "swap $cell1_name $cell2_name"

    return 1
}

# store cells based on Y-coordinates, sorted by X-coordinates
proc sortCells {} {
    global cell_locs
    global remaining_ws
    unset cell_locs
    unset remaining_ws
    array set row_area  []
    set cells [dbGet top.insts.name]
   
    foreach name $cells {
        set cell [get_cell $name]
        set x [format "%.3f" [get_property $cell x_coordinate_min]]
        set x_max [format "%.3f" [get_property $cell x_coordinate_max]]
        set y [format "%.3f" [get_property $cell y_coordinate_min]]
        lappend cell_locs($y) [list $name $x]
        if { ![info exists row_area($y)] } {
            set row_area($y) 0
        }
        set row_area($y) [expr $row_area($y) + $x_max - $x] 
    }

    set row_width [dbGet top.fPlan.coreBox_sizex]
    foreach y [array names row_area] {
        set remaining_ws($y) [expr $row_width - $row_area($y)]
        if { $remaining_ws($y) < 0 } {
            puts "[PROBE] Warning: Remaining whitespace for the row ($y) is less than zero."
        }
    }
    
    #set outFile [open orig.list w]
    foreach y [array names cell_locs] {
        set cell_locs_sorted_x [lsort -real -index 1 $cell_locs($y)]
        set cell_locs($y) $cell_locs_sorted_x 
        #puts $outFile "$y $cell_locs($y)"
    }
    #close $outFile
}

proc swapNCell { height width cell_name dir {MAX_UTIL 1.0}} {
    global cell_locs
    global remaining_ws

    # dir 0 1 2 3 = W E N S
    #
    set cell [get_cell $cell_name]
    set lib_cell_name [get_property $cell ref_lib_cell_name]

    # not allow swapping FF for now
    if { [regexp {DFF} $lib_cell_name] } {
        return 0
    }

    set x [format "%.3f" [get_property $cell x_coordinate_min]]
    set y [format "%.3f" [get_property $cell y_coordinate_min]]
    set index [lsearch -index 0  $cell_locs($y) $cell_name]

    # West / East swap
    if { $dir == 0 || $dir == 1 } {

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

        set new_loc [list $cell_name [get_property [get_cell $cell_name] x_coordinate_min]]
        set new_nloc [list $NCell [get_property [get_cell $NCell] x_coordinate_min]]
        set temp [lreplace $cell_locs($y) $index $index $new_nloc]
        set cell_locs($y) [lreplace $temp $n_index $n_index $new_loc]


    # North / South swap
    } elseif { $dir == 2 || $dir == 3 } {

        set n_y 0

        if { $dir == 2 } {
            set n_y [format "%.3f" [expr $y + $height]]
        } else {
            set n_y [format "%.3f" [expr $y - $height]]
        }

        if { ![info exists cell_locs($n_y)] } {
            return 0
        }

        set n_index 0
        foreach loc $cell_locs($n_y) {
            if { [expr [lindex $loc 1] + $width] > $x } {
                break
            }
            incr n_index
        }

        if { $n_index == [llength $cell_locs($n_y)] } {
            return 0
        }

        set n_loc [lindex $cell_locs($n_y) $n_index]
        set NCell [lindex $n_loc 0]

        set x [get_property [get_cell $cell_name] x_coordinate_min]
        set x_max [get_property [get_cell $cell_name] x_coordinate_max]
        set cell_width [expr $x_max - $x] 
        
        set x [get_property [get_cell $NCell] x_coordinate_min]
        set x_max [get_property [get_cell $NCell] x_coordinate_max]
        set ncell_width [expr $x_max - $x] 

        set row_width [dbGet top.fPlan.coreBox_sizex]

        # check cell row overflow
        if { $cell_width != $ncell_width } {

            set new_row_util [expr ($remaining_ws($y) + $cell_width - $ncell_width)/$row_width]  
            if { $new_row_util > $MAX_UTIL } { 
                return 0
            }
            set new_row_util [expr ($remaining_ws($n_y) + $ncell_width - $cell_width)/$row_width]  
            if { $new_row_util > $MAX_UTIL } { 
                return 0
            }
        }

        if { ![swapTwoCells $cell_name $NCell] } {
            return 0
        }



        set new_loc [list $cell_name [get_property [get_cell $cell_name] x_coordinate_min]]
        set new_nloc [list $NCell [get_property [get_cell $NCell] x_coordinate_min]]
        set temp [lreplace $cell_locs($y) $index $index $new_nloc]
        set cell_locs($y) $temp
        set remaining_ws($y) [expr $remaining_ws($y) + $cell_width - $ncell_width]  


        set temp [lreplace $cell_locs($n_y) $n_index $n_index $new_loc]
        set cell_locs($n_y) $temp
        set remaining_ws($n_y) [expr $remaining_ws($n_y) + $ncell_width - $cell_width]  

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

proc randSwapCells {{MAX_UTIL 1.0}} {

    # give row util margin 
    if { $MAX_UTIL != 1.0 } {
        set MAX_UTIL [expr $MAX_UTIL + 0.01]
    }

    set cells [dbGet top.insts.name]
    set cell [lindex $cells 0]
    set y1 [get_property [get_cell $cell] y_coordinate_min]
    set y2 [get_property [get_cell $cell] y_coordinate_max]
    set x1 [get_property [get_cell $cell] x_coordinate_min]
    set x2 [get_property [get_cell $cell] x_coordinate_max]
    set height [expr $y2 - $y1]
    set width [expr $x2 - $x1]

    # read swap info
    set infile [open swap_info.txt]
    gets $infile line
    close $infile
    set k [lindex $line 0]
    set seedNum [lindex $line 1]
    set seed [expr srand($seedNum)]

    set cells [dbGet top.insts.name]
    set num_cells [llength $cells]
    set num [expr $k*$num_cells]
    sortCells

    set outFile [open swap.list w]
    set i 0
    while {$i < $num} {
        set rand_cell [format %.0f [expr rand()*($num_cells - 1)]]
        set dir [format %.0f [expr round(rand()*3)]]
        set cell_name [lindex $cells $rand_cell]
        set ret [swapNCell $height $width $cell_name $dir $MAX_UTIL] 
        if { $ret == 1 } {
            incr i
            puts $outFile "$cell_name $dir"
        }
    }
    close $outFile
}

proc randSwapCellsAll {} {
    set cells [dbGet top.insts.name]
    set cell [lindex $cells 0]
    set y1 [get_property [get_cell $cell] y_coordinate_min]
    set y2 [get_property [get_cell $cell] y_coordinate_max]
    set height [expr $y2 - $y1]

    # read swap info
    set infile [open swap_info.txt]
    gets $infile line
    close $infile
    set k [lindex $line 0]
    set seedNum [lindex $line 1]
    set seed [expr srand($seedNum)]

    set cells [dbGet top.insts.name]
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
        }
    }
    close $outFile
}

proc randSwapCellsSubGrid {num_grid ratio} {

    # basic info
    set cells [dbGet top.insts.name]
    set cell [lindex $cells 0]
    set y1 [get_property [get_cell $cell] y_coordinate_min]
    set y2 [get_property [get_cell $cell] y_coordinate_max]
    set x1 [get_property [get_cell $cell] x_coordinate_min]
    set x2 [get_property [get_cell $cell] x_coordinate_max]
    set height [expr $y2 - $y1]
    set width  [expr $x2 - $x1]

    # read swap info (TODO: CHECK INTERFACE WITH CURRENT FLOW)
    set infile [open swap_info.txt]
    gets $infile line
    close $infile
    set k [lindex $line 0]
    set seedNum [lindex $line 1]
    set seed    [expr srand($seedNum)]

    set num_cells [llength $cells]
    set num   [expr $k*$num_cells]
    set num_sub [expr $num/$num_grid/$num_grid]
    sortCells

    # block region
    set bbox [dbGet top.fPlan.coreBox]
    set X1 [lindex [lindex $bbox 0] 0]
    set Y1 [lindex [lindex $bbox 0] 1]
    set X2 [lindex [lindex $bbox 0] 2]
    set Y2 [lindex [lindex $bbox 0] 3]

    # grid size
    set W  [expr ($X2 - $X1) / $num_grid]
    set H  [expr ($Y2 - $Y1) / $num_grid]

    

    for { set X_IDX 0 } { $X_IDX < $num_grid } { incr X_IDX } {
    for { set Y_IDX 0 } { $Y_IDX < $num_grid } { incr Y_IDX } {

    # choose sub-grid based on scaling ratio
    set X_MIN [expr $X1 + $X_IDX  * $W + (1 - $ratio) / 2.0 * $W]
    set X_MAX [expr $X1 + ($X_IDX + 1) * $W - (1 - $ratio) / 2.0 * $W]
    set Y_MIN [expr $Y1 + $Y_IDX  * $H + (1 - $ratio) / 2.0 * $H]
    set Y_MAX [expr $Y1 + ($Y_IDX + 1) * $H - (1 - $ratio) / 2.0 * $H]

    # check
    #dehighlight -all 
    #foreach_in_collection cell [get_cells *] {
    #    set x [get_property $cell x_coordinate_min]
    #    set y [get_property $cell y_coordinate_min]
    #    if { $x > $X_MIN && $x < $X_MAX && $y > $Y_MIN && $y < $Y_MAX } {
    #        selectInst [get_property $cell full_name]
    #        highlight -color blue -index 1
    #        deselectAll
    #    }
    #}
    #return

    set outFile [open swap.list w]
    set i 0
    while {$i < $num_sub} {
        set rand_cell [format %.0f [expr rand()*($num_cells - 1)]]
        set dir       [format %.0f [expr round(rand()*3)]]
        set cell_name [lindex $cells $rand_cell]
        set cell      [get_cells $cell_name]
        set x_min     [get_property $cell x_coordinate_min]
        set x_max     [get_property $cell x_coordinate_max]
        set y_min     [get_property $cell y_coordinate_min]
        set y_max     [get_property $cell y_coordinate_max]
        if {$x_min >= $X_MIN && $x_max <= $X_MAX && $y_min >= $Y_MIN && $y_max <= $Y_MAX} {
            set ret [swapNCellSubRegion $height $width $cell_name $dir $X_MIN $X_MAX $Y_MIN $Y_MAX] 
        } else {
            set ret 0
        }
        if { $ret == 1 } {
            incr i
            puts $outFile "$cell_name $dir"
            selectInst [get_property $cell full_name]
            highlight -color blue -index 1
            deselectAll
        }
    }
    close $outFile
    }
    }
}

proc randSwapCellsSubRegionNum {size} {

    # basic info
    set cells [dbGet top.insts.name]
    set cell [lindex $cells 0]
    set y1 [get_property [get_cell $cell] y_coordinate_min]
    set y2 [get_property [get_cell $cell] y_coordinate_max]
    set x1 [get_property [get_cell $cell] x_coordinate_min]
    set x2 [get_property [get_cell $cell] x_coordinate_max]
    set height [expr $y2 - $y1]
    set width  [expr $x2 - $x1]

    # design info
    set infile [open design_info.txt]
    gets $infile line
    close $infile
    set num_rows [lindex $line 0]
    set num_cols [lindex $line 1]


    # read swap info (TODO: CHECK INTERFACE WITH CURRENT FLOW)
    set infile [open swap_info.txt]
    gets $infile line
    close $infile
    set k [lindex $line 0]
    set seedNum [lindex $line 1]
    set seed    [expr srand($seedNum)]

    set num_cells [llength $cells]
    set num   [expr $k*$num_cells]
    sortCells

    # block region
    set bbox [dbGet top.fPlan.coreBox]
    set X1 [lindex [lindex $bbox 0] 0]
    set Y1 [lindex [lindex $bbox 0] 1]
    set X2 [lindex [lindex $bbox 0] 2]
    set Y2 [lindex [lindex $bbox 0] 3]

    # get region
    set start_x [format "%d" [expr int($num_cols/2 - $size/2)]]
    set start_y [format "%d" [expr int($num_rows/2 - $size/2)]]

    set cell [get_cell g_${start_y}_${start_x}]

    set Y_MIN [get_property $cell y_coordinate_min]
    set X_MIN [get_property $cell x_coordinate_min]

    set end_x [format "%d" [expr $start_x + $size - 1]]
    set end_y [format "%d" [expr $start_y + $size - 1]]

    set cell [get_cell g_${end_y}_${end_x}]
    set Y_MAX [get_property $cell y_coordinate_max]
    set X_MAX [get_property $cell x_coordinate_max]



    # check
    dehighlight -all 
    foreach_in_collection cell [get_cells *] {
        set x_min [get_property $cell x_coordinate_min]
        set y_min [get_property $cell y_coordinate_min]
        set x_max [get_property $cell x_coordinate_max]
        set y_max [get_property $cell y_coordinate_max]
        if { $x_min >= $X_MIN && $x_max <= $X_MAX && $y_min >= $Y_MIN && $y_max <= $Y_MAX} {
            selectInst [get_property $cell full_name]
            highlight -color blue -index 1
            deselectAll
        }

    }

    set outFile [open swap.list a]
    set i 0
    while {$i < $num} {
        set rand_cell [format %.0f [expr rand()*($num_cells - 1)]]
        set dir       [format %.0f [expr round(rand()*3)]]
        set cell_name [lindex $cells $rand_cell]
        set cell      [get_cells $cell_name]
        set x_min     [get_property $cell x_coordinate_min]
        set x_max     [get_property $cell x_coordinate_max]
        set y_min     [get_property $cell y_coordinate_min]
        set y_max     [get_property $cell y_coordinate_max]
        if {$x_min >= $X_MIN && $x_max <= $X_MAX && $y_min >= $Y_MIN && $y_max <= $Y_MAX} {
            set ret [swapNCellSubRegion $height $width $cell_name $dir $X_MIN $X_MAX $Y_MIN $Y_MAX] 
        } else {
            set ret 0
        }
        if { $ret == 1 } {
            incr i
            puts $outFile "$cell_name $dir"
            selectInst [get_property $cell full_name]
            highlight -color blue -index 1
            deselectAll
        }
    }
    close $outFile
}

proc randSwapCellsSubRegion {region ratio} {

    # basic info
    set cells [dbGet top.insts.name]
    set cell [lindex $cells 0]
    set y1 [get_property [get_cell $cell] y_coordinate_min]
    set y2 [get_property [get_cell $cell] y_coordinate_max]
    set x1 [get_property [get_cell $cell] x_coordinate_min]
    set x2 [get_property [get_cell $cell] x_coordinate_max]
    set height [expr $y2 - $y1]
    set width  [expr $x2 - $x1]

    # read swap info (TODO: CHECK INTERFACE WITH CURRENT FLOW)
    set infile [open swap_info.txt]
    gets $infile line
    close $infile
    set k [lindex $line 0]
    set seedNum [lindex $line 1]
    set seed    [expr srand($seedNum)]

    set num_cells [llength $cells]
    set num   [expr $k*$num_cells]
    sortCells

    # block region
    set bbox [dbGet top.fPlan.coreBox]
    set X1 [lindex [lindex $bbox 0] 0]
    set Y1 [lindex [lindex $bbox 0] 1]
    set X2 [lindex [lindex $bbox 0] 2]
    set Y2 [lindex [lindex $bbox 0] 3]

    # grid size
    set W  [expr ($X2 - $X1) / 3.0]
    set H  [expr ($Y2 - $Y1) / 3.0]

    # choose grid coordinate based on region location
    if {$region == "center"} {
        set X_IDX 1
        set Y_IDX 1
    } elseif {$region == "corner"} {
        set rand_idx [format %.0f [expr rand()*3.9999]]
        if {$rand_idx == 0} {
            set X_IDX 0
            set Y_IDX 0
        } elseif {$rand_idx == 1} {
            set X_IDX 2
            set Y_IDX 0
        } elseif {$rand_idx == 2} {
            set X_IDX 2
            set Y_IDX 2
        } else {
            set X_IDX 0
            set Y_IDX 2
        }
    } elseif {$region == "edge"} {
        set rand_idx [format %.0f [expr rand()*3.9999]]
        if {$rand_idx == 0} {
            set X_IDX 1
            set Y_IDX 0
        } elseif {$rand_idx == 1} {
            set X_IDX 2
            set Y_IDX 1
        } elseif {$rand_idx == 2} {
            set X_IDX 1
            set Y_IDX 2
        } else {
            set X_IDX 0
            set Y_IDX 1
        }
    }

    # choose sub-grid based on scaling ratio
    set X_MIN [expr $X1 + $X_IDX  * $W + (1 - $ratio) / 2.0 * $W]
    set X_MAX [expr $X1 + ($X_IDX + 1) * $W - (1 - $ratio) / 2.0 * $W]
    set Y_MIN [expr $Y1 + $Y_IDX  * $H + (1 - $ratio) / 2.0 * $H]
    set Y_MAX [expr $Y1 + ($Y_IDX + 1) * $H - (1 - $ratio) / 2.0 * $H]

    # check
    #dehighlight -all 
    #foreach_in_collection cell [get_cells *] {
    #    set x [get_property $cell x_coordinate_min]
    #    set y [get_property $cell y_coordinate_min]
    #    if { $x > $X_MIN && $x < $X_MAX && $y > $Y_MIN && $y < $Y_MAX } {
    #        selectInst [get_property $cell full_name]
    #        highlight -color blue -index 1
    #        deselectAll
    #    }
    #}
    #return

    set outFile [open swap.list a]
    set i 0
    while {$i < $num} {
        set rand_cell [format %.0f [expr rand()*($num_cells - 1)]]
        set dir       [format %.0f [expr round(rand()*3)]]
        set cell_name [lindex $cells $rand_cell]
        set cell      [get_cells $cell_name]
        set x_min     [get_property $cell x_coordinate_min]
        set x_max     [get_property $cell x_coordinate_max]
        set y_min     [get_property $cell y_coordinate_min]
        set y_max     [get_property $cell y_coordinate_max]
        if {$x_min >= $X_MIN && $x_max <= $X_MAX && $y_min >= $Y_MIN && $y_max <= $Y_MAX} {
            set ret [swapNCellSubRegion $height $width $cell_name $dir $X_MIN $X_MAX $Y_MIN $Y_MAX] 
        } else {
            set ret 0
        }
        if { $ret == 1 } {
            incr i
            puts $outFile "$cell_name $dir"
            selectInst [get_property $cell full_name]
            highlight -color blue -index 1
            deselectAll
        }
    }
    close $outFile
}

proc swapNCellSubRegion { height width cell_name dir X_MIN X_MAX Y_MIN Y_MAX} {
    global cell_locs
    # dir 0 1 2 3 = W E N S
    #
    set cell [get_cell $cell_name]
    set lib_cell_name [get_property $cell ref_lib_cell_name]

    # not allow swapping FF for now
    if { [regexp {DFF} $lib_cell_name] } {
        return 0
    }

    set x [format "%.3f" [get_property $cell x_coordinate_min]]
    set y [format "%.3f" [get_property $cell y_coordinate_min]]
    set index [lsearch -index 0  $cell_locs($y) $cell_name]

    if { $dir == 0 || $dir == 1 } {

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

        # check whether the neighbor cell is also in the grid
        set cell  [get_cells $NCell]
        set x_min [get_property $cell x_coordinate_min]
        set x_max [get_property $cell x_coordinate_max]
        set y_min [get_property $cell y_coordinate_min]
        set y_max [get_property $cell y_coordinate_max]
        if {$x_min < $X_MIN || $x_max > $X_MAX || $y_min < $Y_MIN || $y_max > $Y_MAX} {
            return 0
        }

        if { ![swapTwoCells $cell_name $NCell] } {
            return 0
        }

        set new_loc [list $cell_name [lindex $n_loc 1]]
        set new_nloc [list $NCell $x]
        set temp [lreplace $cell_locs($y) $index $index $new_nloc]
        set cell_locs($y) [lreplace $temp $n_index $n_index $new_loc]


    } elseif { $dir == 2 || $dir == 3 } {

        set n_y 0

        if { $dir == 2 } {
            set n_y [format "%.3f" [expr $y + $height]]
        } else {
            set n_y [format "%.3f" [expr $y - $height]]
        }

        if { ![info exists cell_locs($n_y)] } {
            return 0
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

        # check whether the neighbor cell is also in the grid
        set cell  [get_cells $NCell]
        set x_min [get_property $cell x_coordinate_min]
        set x_max [get_property $cell x_coordinate_max]
        set y_min [get_property $cell y_coordinate_min]
        set y_max [get_property $cell y_coordinate_max]
        if {$x_min < $X_MIN || $x_max > $X_MAX || $y_min < $Y_MIN || $y_max > $Y_MAX} {
            return 0
        }

        if { ![swapTwoCells $cell_name $NCell] } {
            return 0
        }

        set new_loc [list $cell_name [lindex $n_loc 1]]
        set new_nloc [list $NCell $x]
        set temp [lreplace $cell_locs($y) $index $index $new_nloc]
        set cell_locs($y) $temp

        set temp [lreplace $cell_locs($n_y) $n_index $n_index $new_loc]
        set cell_locs($n_y) $temp

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
