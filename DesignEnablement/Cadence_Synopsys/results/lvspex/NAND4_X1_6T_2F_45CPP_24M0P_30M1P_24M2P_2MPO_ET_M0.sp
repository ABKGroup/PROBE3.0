*
*
*
*                       LINUX           Fri Feb  3 22:32:49 2023
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
.SUBCKT NAND4_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A4 A1 VSS ZN A2 VDD A3
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#3	A4#1	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	A3#1	ZN#3	VDD	pmos_rvt	nfin=2
MM2	ZN#2	A2#1	VDD	VDD	pmos_rvt	nfin=2
MM3	VDD	A1#2	ZN#2	VDD	pmos_rvt	nfin=2
MM4	10	A4#1	VSS	VSS	nmos_rvt	nfin=2
MM5	9	A3#1	10	VSS	nmos_rvt	nfin=2
MM6	8	A2#1	9	VSS	nmos_rvt	nfin=2
MM7	ZN#4	A1#2	8	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A4#1	A4#2	M0	    0.2379
Rj2	A1#1	A1#2	M0	    0.4757
Rj3	ZN#1	ZN#2	M0	    0.3568
Rj4	ZN#2	ZN#3	M0	    1.4271
Rj5	ZN#4	ZN#5	M0	    0.3568
Rj8	A2#1	A2#2	M0	    0.2379
Ri1	A4	A4#2	M1	    5.0211
Ri2	A1	A1#1	M1	    5.0211
Ri3	ZN	ZN#5	M1	    5.0211
Ri4	ZN	ZN#1	M1	    5.0211
Ri7	A2	A2#2	M1	    5.0211
Ri14	A3	A3#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A4	A2	cmodel	2.33405e-19
C2	A4	A3	cmodel	1.10469e-18
C3	ZN	A1	cmodel	2.25966e-18
C4	A2	A1	cmodel	2.32023e-19
C5	A4	A4#2	cmodel	1.99472e-18
C6	A4	A2#2	cmodel	1.63814e-19
C7	A2	ZN	cmodel	7.27304e-19
C8	A4	A3#1	cmodel	8.68818e-19
C9	A3	ZN	cmodel	4.7176e-20
C10	A1	A1#1	cmodel	1.5459e-18
C11	A3	A2	cmodel	3.11709e-18
C12	A4#1	A2#2	cmodel	1.0072e-19
C13	A1	ZN#4	cmodel	1.27682e-18
C14	ZN	ZN#5	cmodel	1.01095e-18
C15	A1	A2#1	cmodel	1.41769e-19
C16	A2	A2#2	cmodel	1.81815e-18
C17	A2	ZN#5	cmodel	2.66592e-19
C18	A3#1	ZN#5	cmodel	2.10395e-19
C19	A1#1	ZN#4	cmodel	2.10552e-18
C20	A2	ZN#2	cmodel	5.93085e-19
C21	A3	ZN#1	cmodel	1.48254e-19
C22	A1#2	ZN#5	cmodel	1.77956e-18
C23	ZN	A3#1	cmodel	1.65495e-19
C24	ZN	A1#2	cmodel	5.59273e-19
C25	A2	A4#1	cmodel	1.78532e-19
C26	A2	A3#1	cmodel	5.20309e-19
C27	A3	ZN#3	cmodel	1.73094e-18
C28	A2	A1#2	cmodel	2.17425e-19
C29	A1#2	ZN#4	cmodel	2.90097e-19
C30	A3	A3#1	cmodel	1.29762e-18
C31	ZN#5	ZN#1	cmodel	1.70347e-18
C32	A2#1	A1#2	cmodel	7.2147e-19
C33	A3#1	ZN#3	cmodel	4.42651e-18
C34	A2#2	ZN#3	cmodel	3.56959e-19
C35	A2#2	ZN#2	cmodel	3.94673e-19
C36	A2#1	ZN#2	cmodel	8.59472e-19
C37	A3#1	VSS	cmodel	2.84828e-18
C38	ZN#2	VSS	cmodel	1.6451e-18
C39	ZN#3	VDD	cmodel	2.25261e-18
C40	ZN#5	VSS	cmodel	4.19999e-19
C41	A1#1	VDD	cmodel	2.03533e-19
C42	A3	VSS	cmodel	1.51925e-18
C43	VSS	A2#1	cmodel	2.50445e-18
C44	VSS	ZN#1	cmodel	1.34603e-18
C45	VSS	A1#2	cmodel	2.87935e-18
C46	A4	VSS	cmodel	1.81052e-18
C47	ZN#2	VDD	cmodel	2.086e-18
C48	VSS	A1#1	cmodel	3.58721e-18
C49	A1	VSS	cmodel	1.52813e-18
C50	A2	VDD	cmodel	3.06708e-19
C51	A4	VDD	cmodel	7.17945e-19
C52	ZN#4	VDD	cmodel	5.11752e-19
C53	ZN#5	VDD	cmodel	3.15763e-20
C54	A4#2	VSS	cmodel	2.95769e-18
C55	ZN	VSS	cmodel	1.20916e-18
C56	ZN#4	VSS	cmodel	7.41224e-19
C57	A1	VDD	cmodel	6.49457e-19
C58	A4#1	VDD	cmodel	4.88292e-19
C59	A2	VSS	cmodel	1.7367e-18
C60	ZN#1	VDD	cmodel	1.46502e-18
C61	A4#1	VSS	cmodel	2.6614e-18
C62	A4#2	VDD	cmodel	2.98439e-19
C63	ZN#3	VSS	cmodel	1.71978e-18
C64	A3	VDD	cmodel	7.20036e-19
C65	A2#2	VSS	cmodel	2.38713e-18
C66	VDD	VSS	cmodel	1.50549e-17
*
*
.ENDS NAND4_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
