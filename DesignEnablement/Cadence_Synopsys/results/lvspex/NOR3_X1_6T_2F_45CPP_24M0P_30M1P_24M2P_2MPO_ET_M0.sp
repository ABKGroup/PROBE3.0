*
*
*
*                       LINUX           Fri Feb  3 22:33:33 2023
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
.SUBCKT NOR3_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 ZN A3 VSS A2 VDD A1
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	8	A1#2	ZN#2	VDD	pmos_rvt	nfin=2
MM1	7	A2#1	8	VDD	pmos_rvt	nfin=2
MM2	VDD	A3#2	7	VDD	pmos_rvt	nfin=2
MM3	VSS	A1#2	ZN#5	VSS	nmos_rvt	nfin=2
MM4	ZN#3	A2#1	VSS	VSS	nmos_rvt	nfin=2
MM5	VSS	A3#2	ZN#3	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	ZN#1	ZN#2	M0	    0.1189
Rj2	ZN#3	ZN#4	M0	    1.3082
Rj3	ZN#4	ZN#5	M0	    0.1189
Rj4	A3#1	A3#2	M0	    0.2379
Rj8	A1#1	A1#2	M0	    0.2379
Ri1	ZN	ZN#4	M1	    5.0422
Ri2	ZN	ZN#1	M1	    5.0422
Ri3	A3	A3#1	M1	    5.0211
Ri7	A2	A2#1	M1	    5.0211
Ri6	A1	A1#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	ZN	A2	cmodel	3.33093e-19
C2	A2	A3	cmodel	1.09747e-18
C3	A1	A3	cmodel	3.32205e-19
C4	A3	A1#1	cmodel	1.63814e-19
C5	ZN	A2#1	cmodel	4.88301e-19
C6	A1	A2	cmodel	3.02285e-18
C7	A3	A3#1	cmodel	1.13873e-18
C8	ZN#4	A2	cmodel	1.22628e-19
C9	ZN#1	A2	cmodel	4.64238e-19
C10	A3	ZN#3	cmodel	9.51447e-19
C11	A3#2	A3	cmodel	5.77755e-19
C12	ZN#4	A1	cmodel	2.25966e-18
C13	A1	A1#1	cmodel	9.54489e-19
C14	A2	ZN#3	cmodel	1.3144e-18
C15	A2	A2#1	cmodel	1.43707e-18
C16	A1#2	ZN#5	cmodel	2.17628e-18
C17	A1	ZN#5	cmodel	1.14573e-18
C18	A1#2	A1	cmodel	3.58949e-19
C19	A1	A3#2	cmodel	2.40054e-19
C20	ZN#2	ZN#1	cmodel	1.16047e-18
C21	ZN#3	A2#1	cmodel	4.42651e-18
C22	ZN#4	ZN#5	cmodel	1.49046e-18
C23	ZN#4	A1#2	cmodel	3.28422e-19
C24	A1#1	ZN#5	cmodel	1.43083e-18
C25	A1#1	A3#2	cmodel	8.57519e-20
C26	ZN#5	ZN#2	cmodel	9.26111e-19
C27	A2	VDD	cmodel	7.20036e-19
C28	A2#1	VDD	cmodel	1.8622e-18
C29	ZN#3	VSS	cmodel	3.03571e-18
C30	ZN#1	VDD	cmodel	8.43027e-19
C31	ZN	VSS	cmodel	4.85626e-19
C32	A1#2	VSS	cmodel	3.18557e-18
C33	ZN#2	VSS	cmodel	1.55469e-18
C34	ZN#5	VDD	cmodel	5.55881e-19
C35	A3#2	VDD	cmodel	4.98136e-19
C36	ZN#4	VSS	cmodel	1.2466e-18
C37	A3	VSS	cmodel	1.75546e-18
C38	A1	VDD	cmodel	5.98307e-19
C39	A2#1	VSS	cmodel	1.86147e-18
C40	ZN#2	VDD	cmodel	3.62062e-18
C41	ZN#1	VSS	cmodel	5.6272e-19
C42	A3#2	VSS	cmodel	2.6968e-18
C43	A3	VDD	cmodel	5.04642e-19
C44	A1#1	VSS	cmodel	2.25735e-18
C45	A2	VSS	cmodel	1.6443e-18
C46	ZN#3	VDD	cmodel	2.31559e-19
C47	VSS	VDD	cmodel	1.31264e-17
C48	A3#1	VDD	cmodel	2.93694e-19
C49	VSS	ZN#5	cmodel	2.47735e-18
C50	A3#1	VSS	cmodel	2.91268e-18
C51	A1	VSS	cmodel	1.43005e-18
*
*
.ENDS NOR3_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
