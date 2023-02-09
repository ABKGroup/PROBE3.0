# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence. 
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.

source ./results/libchar/cells.tcl

# Example Liberate Tcl File 
#####----------------------------------------
##### Set and print user define variables
#####----------------------------------------
#set SRC_DIR              [pwd]    ;# directory where all source data (netlist, models, etc...) are stored
set SRC_DIR              $SCRIPTS_DIR
#set RUN_DIR              [pwd]    ;# directory where all generated data (ldb, liberty, etc...) are saved
set RUN_DIR              $RESULTS_DIR
set LIB                  $libname
set PROCESS              [lindex $argv 0]
set VDD                  [lindex $argv 1]
set TEMP                 [lindex $argv 2]
#set SETTINGS_FILE        ${SRC_DIR}/tcl/settings_liberate.tcl
set SETTINGS_FILE        ${SRC_DIR}/settings_liberate.tcl
set TEMPLATE_FILE        ${SRC_DIR}/template.tcl
set CELLS_FILE           ${RUN_DIR}/libchar/cells.tcl
set NETLIST_DIR          ${RUN_DIR}/lvspex/
set USERDATA             ${RUN_DIR}/libchar/${libname}_template.lib

#####----------------------------------------
##### Process command line 25put
#####   Allow cmdline option to set local TCL variables - liberate <script> <var>=<value>
#####   ex: liberate char.tcl VDD=3.6
#####----------------------------------------
puts "INFO: Process command line input:"
foreach arg $argv {
    if { [string match *=* $arg] } {
        lassign [split $arg =] a b
        set $a $b
        puts "INFO:   Setting $a = $b"
    }
}

#####----------------------------------------
##### Set dependent variables
#####----------------------------------------
set PVT                  ${PROCESS}_${VDD}_${TEMP}
set LIBNAME              ${LIB}_${PVT}
set MODEL_INCLUDE_FILE   [pwd]/inputs/PROBE.pm

#####----------------------------------------
##### Distributed Resource Management (DRM) setup
#####   Liberate supports both LSF and SunGrid - just update variable rsh_cmd
#####     LSF    : set RSH_CMD "bsub -q <queueName> -n $THREAD -R <ResourceDefinition> -o %B/%L -e %B/%L"
#####     SunGrid: set RSH_CMD "qsub -b y -q <queueName> -n $THREAD"
#####     Local  : set RSH_CMD "local"   ;# local machine only
#####   Variables :
#####     THREAD  - number of cpus to use on a given machine; 0-use all cpus on machine
#####     CLIENTS - number of Distributed Resource Management (DRM) jobs; 0=disable DRM
#####----------------------------------------
### run using debug mode ###
set THREAD    1
set CLIENTS   0
### run using local mode ###
#set THREAD    1
# set CLIENTS   1
# set RSH_CMD   "local"
### run using distributed mode ###
# set THREAD    2
# set CLIENTS   4
# if {![info exists MEM]} {set MEM [expr ${THREAD}*2000]}   ;# default = 2G per thread
# if {![info exists JOBNAME]} {set JOBNAME liberate}
# set RSH_CMD   "bsub -q lnx64 -J ${JOBNAME} -W 255:0 -P LIBERATE:17.1:AE:test -n ${THREAD} -R \"(OSREL==EE60) rusage\[mem=$MEM\] span\[hosts=1\]\" -o %B/%L -e %B/%L"
#set_var packet_arcs_per_thread 1   ;# use for large cells, default=10

#####----------------------------------------
##### Print user define settings to output
#####----------------------------------------
puts "INFO:"
puts "    SRC_DIR              = ${SRC_DIR}"
puts "    RUN_DIR              = ${RUN_DIR}"
puts "    LIBNAME              = ${LIBNAME}"
puts "    PVT                  = ${PVT}"
puts "    SETTINGS_FILE        = ${SETTINGS_FILE}"
puts "    TEMPLATE_FILE        = ${TEMPLATE_FILE}"
puts "    MODEL_INCLUDE_FILE   = ${MODEL_INCLUDE_FILE}"
puts "    NETLIST_DIR          = ${NETLIST_DIR}"
puts "    USERDATA             = ${USERDATA}"
if { [info exists CELLS_FILE] } { puts "    CELLS_FILE           = ${CELLS_FILE}" }
puts ""
puts "    THREAD               = ${THREAD}"
if { [info exists CLIENTS] } { 
    puts "    CLIENTS              = ${CLIENTS}"
    if { [info exists RSH_CMD] } { puts "    RSH_CMD              = ${RSH_CMD}" }
}
puts ""

#####----------------------------------------
##### Set operating condition
#####----------------------------------------
puts "INFO: Set Operating Condition"
set_operating_condition -name ${PVT} -voltage ${VDD} -temp ${TEMP}

#####----------------------------------------
##### Set Liberate variables
#####----------------------------------------
puts "INFO: Read settings file ${SETTINGS_FILE}"
source ${SETTINGS_FILE}

#####----------------------------------------
##### Debug variables
#####----------------------------------------
# select_index -style 1x1             ;# run only 1st point in table

# set_var bisection_info 4            ;# print additional bisection search info to output log
# set_var power_info 2                ;# print additional power calculation info of table's 1st point to file decks/powerInfo1.log

# set_var ski_enable 0 
# set_var extsim_save_passed all      ;# save all run decks and output files
# set_var extsim_save_failed all      ;# save all run decks and output files
# set_var extsim_save_verify 2        ;# save verify deck
# set_var extsim_deck_dir [file normalize "decks"]   ;# specify directory for SPICE decks and output files
# set_var extsim_tar_cmd ""           ;# disable tgz of simulation decks and run logs


#####----------------------------------------
##### Read template
#####----------------------------------------
puts "INFO: Read template file ${TEMPLATE_FILE}"

set MIN_TRAN		[lindex $argv 3]
set MAX_TRAN		[lindex $argv 4]
set MIN_OUT_CAP		[lindex $argv 5]
set INV_X1_PIN_CAP	[lindex $argv 6]

source ${TEMPLATE_FILE}

#####----------------------------------------
##### Read CELLS_FILE
#####----------------------------------------
if {[info exists CELLS_FILE]} {
    if {[file exists ${CELLS_FILE}]} {
	puts "INFO: Read cell list file"
	source ${CELLS_FILE}
    } else {
	puts "WARNING: Specified CELLS_FILE (${CELLS_FILE}) does not exist."
    }
}

#####----------------------------------------
##### define device models
#####----------------------------------------
puts "INFO: Define device models (spectre, define_leafcell)."
set_var extsim_model_include ${MODEL_INCLUDE_FILE}
define_leafcell -type nmos -pin_position {0 1 2 3} { nmos_rvt }
define_leafcell -type pmos -pin_position {0 1 2 3} { pmos_rvt }

#####----------------------------------------
##### read cell netlists
#####----------------------------------------
puts "INFO: Read cell netlist "
## setup client to read only netlist of cells being characterized
set packet_cells [packet_slave_cells]
if {[llength $packet_cells]>0} { set cells $packet_cells }
## read netlist
set spicefiles {}
foreach cell $cells { lappend spicefiles ${NETLIST_DIR}/${cell}.sp }
read_spice -format spectre "$MODEL_INCLUDE_FILE $spicefiles"

#####----------------------------------------
##### Distributed Resource Management (DRM) setup
#####----------------------------------------
if { [info exists CLIENTS] && ($CLIENTS > 0) } {
    set_var packet_mode      arc
    set_var rsh_cmd          $RSH_CMD
    if { ($RSH_CMD eq "local") } {
	set_var packet_clients 1
    } else {
	set_var packet_clients $CLIENTS
	if {${THREAD}<1} {
	    puts "WARNING: When using DRM, THREAD=0 can cause client machine to overload; resetting THREAD=1."
	    set THREAD 1
	}
    }
}

#####----------------------------------------
##### Run characterization
#####----------------------------------------
##  Simple command
puts "INFO: Run Characterization"
char_library -extsim spectre -cells $cells -thread $THREAD

#####----------------------------------------
##### Write output
#####----------------------------------------
### Write ldb ###
puts "INFO: Write ldb"
file mkdir ${RUN_DIR}/ldb
# In packet_arc mode, by default, existing ldb does not get overwritten. User should use -overwrite option
write_ldb -overwrite ${RUN_DIR}/ldb/${LIBNAME}.ldb

### Write Liberty ###
puts "INFO: Write Liberty"
file mkdir ${RUN_DIR}/lib 
write_library -driver_waveform -unique_pin_data -bus_syntax {[]} -user_data ${USERDATA} -overwrite -filename ${RUN_DIR}/lib/${LIBNAME}_nldm.lib ${LIBNAME}
