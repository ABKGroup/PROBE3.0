default: all

# Setup working directories
export LOG_DIR     = ./logs
export REPORTS_DIR = ./reports
export RESULTS_DIR = ./results
export SCRIPTS_DIR = ./scripts
export INPUT_DIR = ./inputs

# Tool binary
INNOVUS = 	  # innovus command (used: ool/cadence/INNOVUS201/tools/bin/innovus
PYTHON =  	  # python command (used: anaconda3)
TCL =    	  # tcl command
GDT2GDS =    	  # gdt2gds command (used: GDT-4.0.4)
Z3 =      	  # z3 command (used: 4.8.5)
LIBERATE = 	  # liberate command (used: LIBERATE161)
GRDGEN =  	  # grdgenxo command (used: O-2018.06-SP5-6)
LIBRARYCOMPILER = # lc_shell command (used: L-2016.06-SP3-1)
QRCTECHGEN = 	  # Techgen command (used: Quantus 21.1)
PVS = 		  # PVS command (used: 21.12-s022)
QUANTUS =	  # Quantus command (used: 21.1.0-p101)

include $(INPUT_DIR)/config.mk

setup:
	mkdir -p $(RESULTS_DIR)
	mkdir -p $(LOG_DIR)
	mkdir -p $(REPORTS_DIR)

# Step 0-1: ITF to TLUP
tlupgen:
	mkdir -p $(RESULTS_DIR)/tlup
	$(GRDGEN) -itf2TLUPlus -i $(ITF_FILE) -o $(RESULTS_DIR)/tlup/PROBE.tlup
	touch tlupgen.done

# Step 0-2: ITF to nxtgrd
grdgen:
	mkdir -p $(RESULTS_DIR)/nxtgrd
	$(GRDGEN) $(ITF_FILE) 
	mv PROBE.nxtgrd $(RESULTS_DIR)/nxtgrd/
	touch grdgen.done

# Step 0-3: ICT to QRCTechfile
qrcgen:
	mkdir -p $(RESULTS_DIR)/qrc
	$(QRCTECHGEN) -cell -plan $(INPUT_DIR)/$(PROBE_TECH).ict
	$(QRCTECHGEN) -cell -parallel -autoconcat $(INPUT_DIR)/$(PROBE_TECH).ict $(RESULTS_DIR)/qrc/$(PROBE_TECH).tch

	touch qrcgen.done

# Step 1: Standard-cell Layout Generation
stdgen:
	echo "Standard-Cell Layout Generation"
	mkdir -p $(RESULTS_DIR)/inputsSMT
	mkdir -p $(RESULTS_DIR)/Z3
	mkdir -p $(RESULTS_DIR)/solutionsSMT
	mkdir -p $(RESULTS_DIR)/solutionsSMT/$(FIN)F_$(RT)T
	$(foreach i,$(CELLS),\
		$(SCRIPTS_DIR)/genSMTInput.pl $(INPUT_DIR)/pinLayouts_$(FIN)F_$(RT)T/$(i).pinLayout $(DR) $(MPO) $(RT);\
		$(Z3) $(RESULTS_DIR)/inputsSMT/$(i)_$(FIN)F_$(RT)T_$(DR)_MPO$(MPO).smt2 > $(RESULTS_DIR)/Z3/$(i)_$(FIN)F_$(RT)T_$(DR)_MPO$(MPO).z3;\
		$(SCRIPTS_DIR)/convSMTResult.pl $(RESULTS_DIR)/Z3/$(i)_$(FIN)F_$(RT)T_$(DR)_MPO$(MPO).z3 $(i) $(RESULTS_DIR)/solutionsSMT/$(FIN)F_$(RT)T $(INPUT_DIR)/pinLayouts_$(FIN)F_$(RT)T;)
	touch stdgen.done


# Step 2: GDS/LEF Generation
gdslefgen:
	echo "GDS and LEF Generation"
	mkdir -p $(RESULTS_DIR)/gdslefgen
	mkdir -p $(RESULTS_DIR)/gdslefgen/$(LIB_NAME)
	$(PYTHON) $(SCRIPTS_DIR)/genGdsLef.py $(RESULTS_DIR)/solutionsSMT/$(FIN)F_$(RT)T $(RESULTS_DIR)/gdslefgen $(M1P) $(M2P) $(CPP) $(ENC) $(SITE_NAME) $(MPO) $(DR) best 0 0 $(FINWIDTH) $(FINPITCH) $(GATEWIDTH) $(M0WIDTH) $(M1WIDTH) $(M2WIDTH)
	$(GDT2GDS) < ./$(RESULTS_DIR)/gdslefgen/$(LIB_NAME)/$(LIB_NAME).gdt > ./$(RESULTS_DIR)/gdslefgen/$(LIB_NAME)/$(LIB_NAME).gds
	touch genlefgen.done

# Step 2-1: Power Tap Cell Generation
taplefgen:
	echo "Power Tap Cell Generation"
	mkdir -p $(RESULTS_DIR)/taplefgen
	mkdir -p $(RESULTS_DIR)/taplefgen/$(LIB_NAME)
	$(SCRIPTS_DIR)/genPowerTapLef.tcl $(RESULTS_DIR)/taplefgen/$(LIB_NAME) $(LIB_NAME)
	touch taplefgen.done

# Step 3: LVS/PEX
lvspex:
	mkdir -p $(RESULTS_DIR)/stdqrc
	cd $(RESULTS_DIR)/stdqrc;\
	$(QRCTECHGEN) -simulation -multi_cpu 32 ../../$(INPUT_DIR)/$(PROBE_TECH).ict;\
	$(QRCTECHGEN) -compilation -lvs ../../$(INPUT_DIR)/lvsfile -p2lvs p2lvsfile
	touch stdqrcgen.done
	mkdir -p $(RESULTS_DIR)/lvspex
	mkdir -p $(LOG_DIR)/lvs
	$(foreach CELL,$(CELLS),\
		$(PVS) -lvs -gds ./$(RESULTS_DIR)/gdslefgen/$(LIB_NAME)/$(LIB_NAME).gds -source_cdl $(INPUT_DIR)/PROBE_$(FIN)F.cdl -spice cdl -source_top_cell $(CELL) -layout_top_cell $(CELL)_$(LIB_NAME) $(INPUT_DIR)/lvs.pvl |& tee $(LOG_DIR)/lvs/$(CELL)_$(LIB_NAME).pvslvs.log;\
		rm $(CELL)_$(LIB_NAME).lmap;\
		rm $(CELL)_$(LIB_NAME).lvsrpt*;)
	touch lvs.done
	mkdir -p $(LOG_DIR)/pvspex
	$(foreach CELL,$(CELLS),\
		$(PVS) -ext -gds ./$(RESULTS_DIR)/gdslefgen/$(LIB_NAME)/$(LIB_NAME).gds -spice cdl -rc_data -top_cell $(CELL)_$(LIB_NAME) $(INPUT_DIR)/lvs.pvl |& tee $(LOG_DIR)/pvspex/$(CELL)_$(LIB_NAME).pex.log;\
		rm $(CELL)_$(LIB_NAME).lmap;\
		rm $(CELL)_$(LIB_NAME).lvsrpt;)
	mv svdb $(RESULTS_DIR)/lvspex/
	touch pvspex.done
	$(foreach CELL,$(CELLS),\
		mkdir -p $(RESULTS_DIR)/lvspex/$(CELL)_$(LIB_NAME);\
		cd $(RESULTS_DIR)/lvspex/$(CELL)_$(LIB_NAME);\
		../../../$(SCRIPTS_DIR)/genQuantusCmd.tcl $(LIB_NAME) $(CELL) ../svdb $(TEMP);\
		$(QUANTUS) -multi_cpu 16 -cmd run_quantus_$(CELL)_$(LIB_NAME).cmd;\
		mv $(CELL)_$(LIB_NAME).sp ../;\
		cd ../../..;)
	touch lvspex.done

# Step 3-1: Check LVS pass
lvssummary:
	$(SCRIPTS_DIR)/lvs_summary.tcl $(LOG_DIR)/lvs $(LIB_NAME) $(CELLS)
	touch lvscheck.done

# Step 4: Library Characterization
libchar:
	mkdir -p $(RESULTS_DIR)/libchar
	$(SCRIPTS_DIR)/genLibTemplate.tcl $(INPUT_DIR) $(RESULTS_DIR) $(LIB_NAME) $(CELLS)
	$(SCRIPTS_DIR)/genCellList.tcl $(RESULTS_DIR) $(SCRIPTS_DIR) $(LIB_NAME) $(CELLS)
	$(LIBERATE) $(SCRIPTS_DIR)/char.tcl $(PROCESS) $(VDD) $(TEMP) $(MIN_TRAN) $(MAX_TRAN) $(MIN_OUT_CAP) $(INV_X1_PIN_CAP) 2>&1 | tee $(LOG_DIR)/char.log
	touch libchar.done

# Step 4-1: db Conversion for ICC2 (library_compiler)
dbconv:
	$(LIBRARYCOMPILER) -f $(SCRIPTS_DIR)/dbconv.tcl

# Step 5: Techfile Generation
techlefgen:
	$(SCRIPTS_DIR)/genTechLef.tcl $(RESULTS_DIR) $(LIB_NAME) $(BEOL) $(M2WIDTH)
	touch techlefgen.done

techfilegen:
	$(SCRIPTS_DIR)/genTechFile.tcl $(RESULTS_DIR) $(LIB_NAME) $(BEOL) $(M2WIDTH)
	touch techfilegen.done

all: setup tlupgen grdgen qrcgen stdgen gdslefgen taplefgen lvspex lvssummary libchar dbconv techlefgen techfilegen

clean_tlupgen:
	rm -r $(RESULTS_DIR)/tlupgen
	rm -f tlupgen.done

clean_stdgen:
	rm -r $(RESULTS_DIR)/inputsSMT
	rm -r $(RESULTS_DIR)/Z3
	rm -r $(RESULTS_DIR)/solutionsSMT
	rm -f stdgen.done

clean_gdslefgen:
	rm -r $(RESULTS_DIR)/gdslefgen
	rm -f gdslefgen.done

clean_lvspex:
	rm -r $(RESULTS_DIR)/lvspex
	rm -f lvspex.done

clean_libchar:
	rm -r $(RESULTS_DIR)/libchar
	rm -r $(RESULTS_DIR)/lib
	rm -r $(RESULTS_DIR)/ldb
	rm -f libchar.done

clean_techgen:
	rm -r $(RESULTS_DIR)/*tf
	rm -r $(RESULTS_DIR)/*tech.lef
	rm -f techlefgen.done techfilegen.done
	
clean_all:
	#@echo "Make clean."
	rm -r $(RESULTS_DIR) $(REPORTS_DIR) $(LOG_DIR) *done svdb 
