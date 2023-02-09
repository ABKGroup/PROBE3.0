# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

#$Id$

set_vdd -type primary VDD $VDD
set_gnd -type primary VSS 0
set_gnd -no_model     GND 0

set_var slew_lower_rise 0.2
set_var slew_lower_fall 0.2
set_var slew_upper_rise 0.5
set_var slew_upper_fall 0.5

set_var measure_slew_lower_rise 0.2
set_var measure_slew_lower_fall 0.2
set_var measure_slew_upper_rise 0.5
set_var measure_slew_upper_fall 0.5

set_var delay_inp_rise 0.35
set_var delay_inp_fall 0.35
set_var delay_out_rise 0.35
set_var delay_out_fall 0.35

set_var def_arc_msg_level 0
set_var process_match_pins_to_ports 1
set_var min_transition $MIN_TRAN
set_var max_transition $MAX_TRAN
set_var min_output_cap $MIN_OUT_CAP

### Define templates - slew (0-100%) min,max=10ps,500ps
#define_template -type delay      -index_1 {0.006 0.3 } -index_2 {0.0001 0.07 } delay_template
#define_template -type power      -index_1 {0.006 0.3 } -index_2 {0.0001 0.07 } power_template
#define_template -type constraint -index_1 {0.006 0.3 } -index_2 {0.006 0.3 } const_template
#max cap --> 45 X INV_X1 input cap (0.000377353)
#--> 2C 4C 8C 16C 24C 32C 45C
#define_template -type delay      -index_1 {0.000754706 0.001509412 0.003018824 0.006037648 0.009056472 0.012075296 0.016980885} -index_2 {0.00001392 0.00002785 0.00005571 0.00011143 0.00022287 0.00044574 0.00089148} delay_template
#define_template -type power      -index_1 {0.000754706 0.001509412 0.003018824 0.006037648 0.009056472 0.012075296 0.016980885} -index_2 {0.00001392 0.00002785 0.00005571 0.00011143 0.00022287 0.00044574 0.00089148} power_template
#define_template -type constraint -index_1 {0.000754706 0.001509412 0.003018824 0.006037648 0.009056472 0.012075296 0.016980885} -index_2 {0.00001392 0.00002785 0.00005571 0.00011143 0.00022287 0.00044574 0.00089148} const_template


set inv_x1_pin_cap $INV_X1_PIN_CAP
#set inv_x1_pin_cap 0.000427093
set cap_idx_coef_list [list 2.0 4.0 8.0 16.0 24.0 32.0 45.0]
set cap_idx_list [list]

foreach c $cap_idx_coef_list {
  lappend cap_idx_list [format %.9f [expr $inv_x1_pin_cap*$c]]
}

#set max_tran_list [list 0.010 0.020 0.030 0.040 0.050 0.060 0.070]
set max_tran_list [list 0.005 0.010 0.020 0.040 0.080 0.160 0.320]

define_template -type delay -index_2 $cap_idx_list -index_1 $max_tran_list delay_template
define_template -type power -index_2 $cap_idx_list -index_1 $max_tran_list power_template
define_template -type constraint -index_2 $cap_idx_list -index_1 $max_tran_list const_template


source ./results/libchar/cells.tcl

### Define related supply for all cells and pins
set_pin_vdd -supply_name VDD $cells {*}
set_pin_gnd -supply_name VSS $cells {*}

foreach cell $cells {
  if {[string match "INV*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { I } \
       -output { ZN } \
       -pinlist { I ZN } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "BUF*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { I } \
       -output { Z } \
       -pinlist { I Z } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "AND2*" $cell] || [string match "OR2*" $cell] || [string match "XOR2*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { A1 A2 } \
       -output { Z } \
       -pinlist { A1 A2 Z } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "AND3*" $cell] || [string match "OR3*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { A1 A2 A3 } \
       -output { Z } \
       -pinlist { A1 A2 A3 Z } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "NAND2*" $cell] || [string match "NOR2*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { A1 A2 } \
       -output { ZN } \
       -pinlist { A1 A2 ZN } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "NAND3*" $cell] || [string match "NOR3*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { A1 A2 A3 } \
       -output { ZN } \
       -pinlist { A1 A2 A3 ZN } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "NAND4*" $cell] || [string match "NOR4*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { A1 A2 A3 A4 } \
       -output { ZN } \
       -pinlist { A1 A2 A3 A4 ZN } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "AOI21*" $cell] || [string match "OAI21*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { A1 A2 B } \
       -output { ZN } \
       -pinlist { A1 A2 B ZN } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "AOI22*" $cell] || [string match "OAI22*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { A1 A2 B1 B2 } \
       -output { ZN } \
       -pinlist { A1 A2 B1 B2 ZN } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

  if {[string match "DFFHQN*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -clock { CLK } \
       -input { D } \
       -output { QN } \
       -pinlist { CLK D QN } \
       -delay delay_template \
       -power power_template \
       -constraint const_template \
       $cell
    }
  }

  if {[string match "DFFRNQ*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -async { RN } \
       -clock { CK } \
       -input { D } \
       -output { Q } \
       -pinlist { CK D RN Q } \
       -delay delay_template \
       -power power_template \
       -constraint const_template \
       $cell
    }
  }

  if {[string match "LHQ*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -clock { E } \
       -input { D } \
       -output { Q } \
       -pinlist { E D Q } \
       -delay delay_template \
       -power power_template \
       -constraint const_template \
       $cell
    }
  }

  if {[string match "MUX2*" $cell]} {
    if {[ALAPI_active_cell $cell]} {
      define_cell \
       -input { I0 I1 S } \
       -output { Z } \
       -pinlist { I0 I1 S Z } \
       -delay delay_template \
       -power power_template \
       $cell
    }
  }

}
