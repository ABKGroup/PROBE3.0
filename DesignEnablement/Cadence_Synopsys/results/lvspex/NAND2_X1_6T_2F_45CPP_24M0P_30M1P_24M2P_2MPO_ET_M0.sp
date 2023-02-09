*
*
*
*                       LINUX           Fri Feb  3 22:31:53 2023
*
*
*
*  PROGRAM  advgen
*
*  Name           : advgen - Quantus - (64-bit)
*  Version        : 21.1.0-p101
*  Build Date     : Wed Mar 17 18:53:08 PDT 2021
*
*  HSPICE LIBRARY
*
*
*

*
.SUBCKT NAND2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A1 VSS A2 VDD ZN
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#2	A2#1	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	A1#2	ZN#2	VDD	pmos_rvt	nfin=2
MM2	6	A2#1	VSS	VSS	nmos_rvt	nfin=2
MM3	ZN#3	A1#2	6	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A1#1	A1#2	M0	    0.4757
Rj2	A2#1	A2#2	M0	    0.2379
Rj4	ZN#1	ZN#2	M0	    0.3568
Rj5	ZN#3	ZN#4	M0	    0.3568
Ri1	A1	A1#1	M1	    5.0211
Ri2	A2	A2#2	M1	    5.0211
Ri4	ZN	ZN#4	M1	    5.0211
Ri5	ZN	ZN#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A2	A1	cmodel	2.33726e-19
C2	ZN	A1	cmodel	2.25966e-18
C3	A1	A1#1	cmodel	1.5459e-18
C4	A2	ZN	cmodel	8.27356e-19
C5	ZN#3	A1	cmodel	1.27682e-18
C6	A1	A2#1	cmodel	1.41769e-19
C7	A2	A2#2	cmodel	1.99472e-18
C8	A2	ZN#4	cmodel	4.11175e-19
C9	ZN	ZN#4	cmodel	1.01095e-18
C10	A2	A1#2	cmodel	2.42545e-19
C11	ZN#4	ZN#1	cmodel	1.70347e-18
C12	ZN	A1#2	cmodel	5.59273e-19
C13	A1#2	ZN#4	cmodel	1.77956e-18
C14	A1#1	ZN#3	cmodel	2.10552e-18
C15	A1#2	ZN#3	cmodel	2.90097e-19
C16	A2#1	A1#2	cmodel	7.20401e-19
C17	ZN#1	VSS	cmodel	1.50658e-18
C18	A1#2	VSS	cmodel	2.87371e-18
C19	ZN#3	VDD	cmodel	5.11752e-19
C20	A1#1	VSS	cmodel	3.58721e-18
C21	A1	VSS	cmodel	1.52272e-18
C22	A2#1	VDD	cmodel	4.88292e-19
C23	A1	VDD	cmodel	6.49457e-19
C24	A2#2	VDD	cmodel	2.98439e-19
C25	A2	VSS	cmodel	1.72898e-18
C26	VDD	VSS	cmodel	1.08016e-17
C27	ZN#4	VDD	cmodel	3.15763e-20
C28	ZN#2	VSS	cmodel	2.21995e-18
C29	ZN#2	VDD	cmodel	1.15999e-18
C30	ZN	VSS	cmodel	1.29852e-18
C31	A2	VDD	cmodel	7.17945e-19
C32	ZN#1	VDD	cmodel	1.46502e-18
C33	A2#2	VSS	cmodel	2.95769e-18
C34	ZN#3	VSS	cmodel	7.41224e-19
C35	A1#1	VDD	cmodel	2.03533e-19
C36	ZN#4	VSS	cmodel	4.98631e-19
C37	A2#1	VSS	cmodel	2.6152e-18
*
*
.ENDS NAND2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
