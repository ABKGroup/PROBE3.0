*
*
*
*                       LINUX           Fri Feb  3 22:32:21 2023
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
.SUBCKT NAND3_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 ZN A1 VSS A2 VDD A3
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#5	A3#1	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	A2#1	ZN#5	VDD	pmos_rvt	nfin=2
MM2	ZN#3	A1#1	VDD	VDD	pmos_rvt	nfin=2
MM3	8	A3#1	VSS	VSS	nmos_rvt	nfin=2
MM4	7	A2#1	8	VSS	nmos_rvt	nfin=2
MM5	ZN#1	A1#1	7	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	ZN#1	ZN#2	M0	    0.1189
Rj2	ZN#3	ZN#4	M0	    0.1189
Rj3	ZN#4	ZN#5	M0	    1.3082
Rj4	A1#1	A1#2	M0	    0.2379
Rj8	A3#1	A3#2	M0	    0.2379
Ri1	ZN	ZN#2	M1	    5.0422
Ri2	ZN	ZN#4	M1	    5.0422
Ri3	A1	A1#2	M1	    5.0211
Ri7	A2	A2#1	M1	    5.0211
Ri6	A3	A3#2	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A1	A1#2	cmodel	1.36593e-18
C2	A1	ZN#4	cmodel	3.85776e-18
C3	A3	A3#2	cmodel	1.99073e-18
C4	ZN#4	A1#2	cmodel	1.4722e-18
C5	ZN#2	ZN#4	cmodel	9.26111e-19
C6	ZN#4	A1#1	cmodel	2.46008e-18
C7	A1	A2#1	cmodel	3.94024e-19
C8	A2#1	VDD	cmodel	4.36348e-19
C9	A3#2	VSS	cmodel	2.95769e-18
C10	A3	VDD	cmodel	7.17945e-19
C11	A2#1	ZN#5	cmodel	1.9057e-18
C12	A3#1	A2#1	cmodel	7.49777e-19
C13	A1#1	VDD	cmodel	2.06205e-18
C14	ZN	VSS	cmodel	5.70283e-19
C15	ZN#4	VDD	cmodel	1.66598e-18
C16	A1#2	VSS	cmodel	7.51972e-19
C17	A1	VSS	cmodel	1.6501e-18
C18	A2#1	ZN	cmodel	5.41293e-19
C19	ZN#2	VSS	cmodel	5.90588e-18
C20	A2#1	ZN#4	cmodel	9.64974e-19
C21	A1	VDD	cmodel	8.60523e-19
C22	ZN#4	VSS	cmodel	2.33359e-18
C23	A3#1	VSS	cmodel	2.61642e-18
C24	A3#2	VDD	cmodel	2.98439e-19
C25	VDD	VSS	cmodel	1.29428e-17
C26	A2#1	VSS	cmodel	7.57338e-18
C27	A3	A2#1	cmodel	1.42457e-18
C28	A3	VSS	cmodel	1.67582e-18
C29	A2#1	ZN#2	cmodel	1.88384e-18
C30	A1#1	VSS	cmodel	1.07473e-18
C31	A3#1	VDD	cmodel	4.88292e-19
C32	ZN#5	VDD	cmodel	2.15854e-18
C33	A1#2	VDD	cmodel	2.05664e-18
C34	ZN#5	VSS	cmodel	2.83979e-18
*
*
.ENDS NAND3_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
