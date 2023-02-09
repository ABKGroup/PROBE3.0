*
*
*
*                       LINUX           Fri Feb  3 22:34:03 2023
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
.SUBCKT NOR2_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A2 VSS A1 VDD ZN
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#2	A1#3	6#3	VDD	pmos_rvt	nfin=2
MM1	6#2	A1#1	ZN#2	VDD	pmos_rvt	nfin=2
MM2	VDD	A2#3	6#2	VDD	pmos_rvt	nfin=2
MM3	6	A2#1	VDD	VDD	pmos_rvt	nfin=2
MM4	VSS	A1#3	ZN#6	VSS	nmos_rvt	nfin=2
MM5	ZN#4	A1#1	VSS	VSS	nmos_rvt	nfin=2
MM6	VSS	A2#3	ZN#4	VSS	nmos_rvt	nfin=2
MM7	ZN#3	A2#1	VSS	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A2#1	A2#2	M0	    0.4757
Rj2	A2#2	A2#3	M0	    0.2379
Rj3	A1#1	A1#2	M0	    0.4757
Rj4	A1#2	A1#3	M0	    0.2379
Rj7	ZN#1	ZN#2	M0	    0.3568
Rj10	ZN#3	ZN#4	M0	    1.4271
Rj11	ZN#4	ZN#5	M0	    0.3568
Rj12	ZN#5	ZN#6	M0	    1.0704
Rj8	6	6#2	M0	    1.4271
Rj9	6#2	6#3	M0	    1.4271
Ri1	A2	A2#2	M1	    5.0211
Ri2	A1	A1#2	M1	    5.0211
Ri4	ZN	ZN#5	M1	    5.0211
Ri5	ZN	ZN#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	ZN	A2	cmodel	3.96445e-19
C2	ZN#1	A2	cmodel	6.86249e-19
C3	A2	A2#2	cmodel	9.26451e-19
C4	A2	6#2	cmodel	3.78861e-19
C5	A1	ZN	cmodel	2.25966e-18
C6	A2	ZN#4	cmodel	1.66577e-18
C7	A1#2	A1	cmodel	1.16616e-18
C8	A1	ZN#5	cmodel	5.75587e-19
C9	A2#3	A2	cmodel	3.58949e-19
C10	A1	6#3	cmodel	3.42402e-19
C11	ZN	ZN#5	cmodel	1.15926e-18
C12	A1	ZN#2	cmodel	4.30418e-19
C13	A2#3	6#2	cmodel	2.2583e-18
C14	A1	ZN#6	cmodel	7.59716e-19
C15	A1#2	ZN#5	cmodel	1.56691e-18
C16	A1#3	A1	cmodel	3.58949e-19
C17	ZN#5	ZN#1	cmodel	1.77042e-18
C18	A1#3	ZN#6	cmodel	2.2583e-18
C19	ZN#5	6#3	cmodel	2.0249e-20
C20	ZN#5	ZN#2	cmodel	2.44834e-18
C21	ZN	A1#1	cmodel	5.59273e-19
C22	ZN#5	6#2	cmodel	4.332e-20
C23	A1#2	ZN#6	cmodel	2.68867e-19
C24	ZN#1	6#2	cmodel	2.99044e-18
C25	A2#2	6#2	cmodel	1.17311e-18
C26	ZN#4	A2#3	cmodel	2.2583e-18
C27	ZN#2	6#3	cmodel	1.35195e-18
C28	A1#1	ZN#5	cmodel	2.06966e-18
C29	ZN#4	A2#2	cmodel	1.19956e-18
C30	ZN#2	6#2	cmodel	9.5955e-19
C31	ZN#3	A2#2	cmodel	6.24823e-19
C32	ZN#3	A2#1	cmodel	2.88312e-18
C33	ZN#1	A2#3	cmodel	7.9491e-19
C34	ZN#6	6#3	cmodel	1.40043e-18
C35	ZN#4	6#2	cmodel	8.05752e-19
C36	A2#3	VSS	cmodel	2.51941e-19
C37	A2#2	6	cmodel	6.24823e-19
C38	A2#1	VSS	cmodel	1.17458e-18
C39	6#3	VSS	cmodel	1.69389e-18
C40	6#2	VDD	cmodel	7.20606e-18
C41	ZN#3	6	cmodel	7.7976e-19
C42	A2	VSS	cmodel	1.96689e-18
C43	ZN#2	VSS	cmodel	1.16404e-18
C44	A2	VDD	cmodel	5.0036e-19
C45	6#2	VSS	cmodel	1.01558e-18
C46	A1	VSS	cmodel	2.03993e-18
C47	ZN#1	VDD	cmodel	4.53611e-19
C48	VDD	VSS	cmodel	1.46238e-17
C49	ZN	VSS	cmodel	1.16848e-18
C50	A1	VDD	cmodel	3.2239e-19
C51	VSS	ZN#6	cmodel	2.64247e-18
C52	6	VSS	cmodel	1.63615e-18
C53	A1#2	VSS	cmodel	1.96248e-18
C54	ZN#4	VSS	cmodel	2.79612e-18
C55	ZN#5	VSS	cmodel	4.35923e-19
C56	ZN#3	VSS	cmodel	4.16131e-18
C57	ZN#1	VSS	cmodel	1.0343e-18
C58	A1#3	VSS	cmodel	3.12509e-18
C59	6#3	VDD	cmodel	5.50352e-18
C60	A2#2	VSS	cmodel	2.01145e-19
C61	A2#1	6	cmodel	2.88312e-18
C62	6	VDD	cmodel	5.4597e-18
C63	A1#1	VSS	cmodel	3.68097e-18
*
*
.ENDS NOR2_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
