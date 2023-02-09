*
*
*
*                       LINUX           Fri Feb  3 22:33:18 2023
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
.SUBCKT NOR2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A2 VSS A1 VDD ZN
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	6	A1#2	ZN#2	VDD	pmos_rvt	nfin=2
MM1	VDD	A2#1	6	VDD	pmos_rvt	nfin=2
MM2	ZN#3	A1#2	VSS	VSS	nmos_rvt	nfin=2
MM3	VSS	A2#1	ZN#3	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A1#1	A1#2	M0	    0.2379
Rj2	ZN#1	ZN#2	M0	    0.1189
Rj3	ZN#3	ZN#4	M0	    0.5946
Ri1	A2	A2#1	M1	    5.0211
Ri2	A1	A1#1	M1	    5.0211
Ri4	ZN	ZN#4	M1	    5.0211
Ri5	ZN	ZN#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A1	A2	cmodel	3.09605e-18
C2	ZN	A2	cmodel	7.00733e-20
C3	ZN#1	A2	cmodel	4.12049e-19
C4	A2	ZN#2	cmodel	1.94727e-19
C5	ZN	A1	cmodel	2.25966e-18
C6	A2	ZN#3	cmodel	8.29903e-19
C7	A2	A2#1	cmodel	2.20642e-18
C8	A1	A1#1	cmodel	9.96134e-19
C9	ZN	ZN#4	cmodel	1.19415e-18
C10	A1#2	ZN#3	cmodel	2.90097e-19
C11	A1	ZN#3	cmodel	1.09733e-18
C12	A1#2	A1	cmodel	3.58949e-19
C13	A1	A2#1	cmodel	4.30418e-19
C14	ZN#3	A2#1	cmodel	3.033e-18
C15	ZN	A1#2	cmodel	3.25028e-19
C16	ZN#4	ZN#2	cmodel	3.09595e-18
C17	ZN#1	ZN#2	cmodel	1.06398e-18
C18	A1#2	ZN#4	cmodel	1.84156e-18
C19	ZN#1	A2#1	cmodel	4.3548e-19
C20	A1#1	ZN#3	cmodel	2.12707e-18
C21	ZN#2	A2#1	cmodel	8.43805e-19
C22	A1#1	VSS	cmodel	2.78258e-18
C23	A2#1	VSS	cmodel	1.84998e-18
C24	ZN#3	VDD	cmodel	1.14138e-19
C25	A2	VSS	cmodel	1.86575e-18
C26	A2	VDD	cmodel	7.20036e-19
C27	ZN#4	VDD	cmodel	2.21034e-19
C28	ZN#2	VDD	cmodel	1.47471e-18
C29	A1	VSS	cmodel	1.76133e-18
C30	ZN#2	VSS	cmodel	1.52162e-18
C31	A2#1	VDD	cmodel	1.9508e-18
C32	VDD	VSS	cmodel	1.1097e-17
C33	ZN#1	VDD	cmodel	6.52547e-19
C34	ZN	VSS	cmodel	1.23581e-18
C35	A1	VDD	cmodel	5.05591e-19
C36	ZN#4	VSS	cmodel	1.65577e-18
C37	VSS	ZN#3	cmodel	1.23315e-18
C38	ZN#1	VSS	cmodel	4.48204e-19
C39	VSS	A1#2	cmodel	3.20046e-18
*
*
.ENDS NOR2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
