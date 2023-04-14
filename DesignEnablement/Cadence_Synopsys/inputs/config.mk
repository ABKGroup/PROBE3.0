# Technology parameters
# RT 	: Routing Track number
# FIN	: Fin count
# CPP	: Contact Poly Pitch
# M*P	: Metal Pitch for M0 / M1 / M2
# MPO	: Minimum Pin Opening (# of pin access points) [2, 3]
# DR	: Design Rule set [EL: EUV-Loose / ET: EUV-Tight]
# PGPIN	: Power-Ground Pin type [BPR: Buried Power Rail / M0]
# CHSTR : Cell Height (string)
export RT = 4
export FIN = 2
export CPP = 45
export M0P = 24
export M1P = 30
export M2P = 24
export MPO = 2
export DR = ET
export PGPIN = M0
export ENC = 5
export SITE_NAME = coresite # site name (temp)
export CHSTR = 6

# Additional technology configurations
export FINWIDTH = 0.006
export FINPITCH = 0.024
export GATEWIDTH = 0.016

# Width = Pitch / 2 is the default, but users can change this to have a different width-space duty cycle
# Pitch = Width + Spacing
export M0WIDTH = 0.014
export M1WIDTH = 0.015
export M2WIDTH = 0.014

# Design parameters
# BEOL   : Back End Of Line option
# PDN    : Power Delivery Network
# TOOL   : Place & Route tool name
# UTIL   : Design target utility percentage
# DESIGN : Design name
export BEOL = BEOL1_24_30_24_24_64_64_64_64_64_64_64_64_720_720
export PDN = MIDDLE
export TOOL = ICC2
export UTIL = 70
export DESIGN = AES

# 41 cell masters
export CELLS = INV_X1 INV_X2 INV_X4 INV_X8 AND2_X1 AND2_X2 AND3_X1 AND3_X2 \
OR2_X1 OR2_X2 OR3_X1 OR3_X2 NAND2_X1 NAND2_X2 NAND3_X1 NAND3_X2 NAND4_X1 NAND4_X2 \
NOR2_X1 NOR3_X1 NOR4_X1 NOR2_X2 NOR3_X2 NOR4_X2 \
AOI21_X1 AOI21_X2 OAI21_X1 OAI21_X2 AOI22_X1 AOI22_X2 OAI22_X1 OAI22_X2 \
XOR2_X1 MUX2_X1 BUF_X1 BUF_X2 BUF_X4 BUF_X8 DFFHQN_X1 DFFRNQ_X1 LHQ_X1

# Library name (Do not mofify)
export LIB_NAME = $(CHSTR)T_$(FIN)F_$(CPP)CPP_$(M0P)M0P_$(M1P)M1P_$(M2P)M2P_$(MPO)MPO_$(DR)_$(PGPIN)

# Input files
export CDL_FILE = $(INPUT_DIR)/$(LIB_NAME).cdl

export MIPT_FILE = $(INPUT_DIR)/PROBE.mipt
export PROCESS = tt
export VDD = 0.7
export TEMP = 25

export MIN_TRAN = 6e-12
export MAX_TRAN = 7e-11
export MIN_OUT_CAP = 1e-16
export INV_X1_PIN_CAP = 0.0003096

# PROBE Tech variable 
# PROBE_FS	: Frontside PDN with M0 rails
# PROBE_FSBPR	: Frontside PDN with BPR (Buried Power Rail)
# PROBE_BS	: Backside PDN with M0 rails
# PROBE_BSBPR	: Backside PDN with BPR (Buried Power Rail)
export PROBE_TECH = PROBE_BSBPR

export ITF_FILE = $(INPUT_DIR)/PROBE.itf
