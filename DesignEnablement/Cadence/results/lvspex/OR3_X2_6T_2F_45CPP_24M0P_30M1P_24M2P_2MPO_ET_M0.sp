*
*
*
*                       LINUX           Fri Feb  3 22:31:39 2023
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
.SUBCKT OR3_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A1 VSS Z A3 VDD A2
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	9	A1#1	3#2	VDD	pmos_rvt	nfin=2
MM1	8	A2#1	9	VDD	pmos_rvt	nfin=2
MM2	VDD	A3#1	8	VDD	pmos_rvt	nfin=2
MM3	Z#1	3	VDD	VDD	pmos_rvt	nfin=2
MM4	VDD	3#3	Z#1	VDD	pmos_rvt	nfin=2
MM5	VSS	A1#1	3#5	VSS	nmos_rvt	nfin=2
MM6	3#4	A2#1	VSS	VSS	nmos_rvt	nfin=2
MM7	VSS	A3#1	3#4	VSS	nmos_rvt	nfin=2
MM8	Z#3	3	VSS	VSS	nmos_rvt	nfin=2
MM9	VSS	3#3	Z#3	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A1#1	A1#2	M0	    0.2379
Rj2	Z#1	Z#2	M0	    0.3568
Rj3	Z#3	Z#4	M0	    0.3568
Rj5	A3#1	A3#2	M0	    0.2379
Rj11	3	3#2	M0	    2.4975
Rj12	3#3	3	M0	    0.7136
Rj13	3	3#4	M0	    1.0704
Rj14	3#4	3#5	M0	    1.4271
Ri1	A1	A1#2	M1	    5.0211
Ri2	Z	Z#4	M1	    5.0422
Ri3	Z	Z#2	M1	    5.0422
Ri5	A3	A3#2	M1	    5.0211
Ri10	A2	A2#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A1	A2	cmodel	1.06104e-18
C2	3#5	3#2	cmodel	6.9312e-19
C3	A1	A1#2	cmodel	1.37786e-18
C4	A3	Z	cmodel	2.00776e-19
C5	A1	3#2	cmodel	5.38999e-19
C6	3#3	Z#3	cmodel	1.54421e-18
C7	A1	3#5	cmodel	1.37151e-18
C8	A1	A2#1	cmodel	1.78959e-19
C9	Z#2	A3#1	cmodel	7.85818e-19
C10	3#4	3#2	cmodel	4.15872e-19
C11	A3	A3#2	cmodel	1.39053e-18
C12	A3	Z#4	cmodel	4.64238e-19
C13	A3	Z#2	cmodel	8.06534e-19
C14	A1#1	3#2	cmodel	2.21367e-18
C15	A2	Z#4	cmodel	5.80524e-19
C16	A2#1	3#2	cmodel	2.4758e-18
C17	A3	3#4	cmodel	3.49553e-19
C18	A2	3#2	cmodel	5.38999e-19
C19	A3	A2#1	cmodel	4.30418e-19
C20	A2	3#4	cmodel	1.74018e-18
C21	A2	A1#1	cmodel	2.8616e-19
C22	Z#3	Z#1	cmodel	6.47201e-19
C23	A2	A2#1	cmodel	1.40107e-18
C24	A1#2	3#2	cmodel	2.13701e-18
C25	Z#4	Z#2	cmodel	3.8988e-20
C26	3#5	A1#1	cmodel	2.21367e-18
C27	3#5	A1#2	cmodel	2.16844e-18
C28	3#4	A2#1	cmodel	4.88586e-18
C29	A1#1	A2#1	cmodel	4.73994e-19
C30	A2#1	Z#4	cmodel	4.38355e-19
C31	3#3	VDD	cmodel	5.96582e-19
C32	3#4	VSS	cmodel	7.56156e-18
C33	3	A3#1	cmodel	2.21367e-18
C34	A3#2	VSS	cmodel	7.68883e-19
C35	3#4	3	cmodel	6.47504e-19
C36	A3#2	VDD	cmodel	2.05664e-18
C37	Z#3	VSS	cmodel	1.17249e-18
C38	A2	VDD	cmodel	4.36348e-19
C39	Z#4	VSS	cmodel	1.69348e-18
C40	3	A3#2	cmodel	2.16844e-18
C41	A1	VSS	cmodel	2.0371e-18
C42	A1#1	VSS	cmodel	2.49635e-19
C43	A3	3	cmodel	1.69555e-18
C44	Z#2	VSS	cmodel	6.45114e-19
C45	A2#1	VSS	cmodel	5.53956e-19
C46	3	Z#3	cmodel	9.5955e-19
C47	A1	VDD	cmodel	4.36348e-19
C48	Z	VSS	cmodel	1.90835e-19
C49	A3#1	VSS	cmodel	2.42121e-19
C50	Z#4	3	cmodel	5.44062e-18
C51	A3	VSS	cmodel	1.53172e-18
C52	Z#2	VDD	cmodel	3.23236e-18
C53	3	VDD	cmodel	1.29475e-18
C54	3#2	VSS	cmodel	2.42108e-18
C55	VDD	VSS	cmodel	1.72387e-17
C56	3#3	VSS	cmodel	5.04034e-18
C57	Z#1	VDD	cmodel	2.502e-18
C58	A2	VSS	cmodel	1.75999e-18
C59	3	Z#2	cmodel	2.39971e-18
C60	A3#1	VDD	cmodel	2.17337e-18
C61	3	VSS	cmodel	6.82992e-18
C62	Z#1	VSS	cmodel	1.17026e-18
C63	A3	VDD	cmodel	8.60523e-19
C64	A2#1	3	cmodel	2.40371e-18
C65	3#5	VSS	cmodel	6.56377e-18
C66	A1#2	VSS	cmodel	7.64935e-19
C67	VDD	3#2	cmodel	3.45657e-18
C68	Z	3	cmodel	1.21892e-18
*
*
.ENDS OR3_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
