*
*
*
*                       LINUX           Fri Feb  3 22:30:43 2023
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
.SUBCKT AND3_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A1 VSS Z A3 VDD A2
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	A1#2	3#7	VDD	pmos_rvt	nfin=2
MM1	3#5	A2#1	VDD	VDD	pmos_rvt	nfin=2
MM2	VDD	A3#2	3#5	VDD	pmos_rvt	nfin=2
MM3	Z#2	3#4	VDD	VDD	pmos_rvt	nfin=2
MM4	VDD	3#3	Z#2	VDD	pmos_rvt	nfin=2
MM5	9	A1#2	3#2	VSS	nmos_rvt	nfin=2
MM6	8	A2#1	9	VSS	nmos_rvt	nfin=2
MM7	VSS	A3#2	8	VSS	nmos_rvt	nfin=2
MM8	Z#4	3#4	VSS	VSS	nmos_rvt	nfin=2
MM9	VSS	3#3	Z#4	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A1#1	A1#2	M0	    0.2379
Rj2	Z#1	Z#2	M0	    0.1189
Rj3	Z#3	Z#4	M0	    0.1189
Rj5	A3#1	A3#2	M0	    0.2379
Rj10	3	3#2	M0	    0.1189
Rj12	3#3	3#4	M0	    0.7136
Rj13	3#4	3#5	M0	    1.0704
Rj14	3#5	3#6	M0	    1.3082
Rj15	3#6	3#7	M0	    0.1189
Ri1	A1	A1#1	M1	    5.0211
Ri2	Z	Z#3	M1	    5.0422
Ri3	Z	Z#1	M1	    5.0422
Ri5	A3	A3#1	M1	    5.0211
Ri11	A2	A2#1	M1	    5.0211
Ri10	3#6	3	M1	   10.0845
*
*       CAPACITOR CARDS
*
*
C1	A1	A3	cmodel	1.85448e-19
C2	3#6	A1	cmodel	2.35947e-18
C3	A1	A1#1	cmodel	6.97703e-19
C4	A3	Z	cmodel	2.9751e-19
C5	A3#1	Z#4	cmodel	3.05513e-19
C6	A1	3#7	cmodel	1.3867e-18
C7	A1#2	A1	cmodel	1.81447e-19
C8	Z#3	Z#4	cmodel	8.14506e-19
C9	A3	A1#1	cmodel	1.05073e-19
C10	A3	A3#1	cmodel	7.68598e-19
C11	A3	Z#3	cmodel	6.14866e-19
C12	A3	Z#1	cmodel	4.48261e-19
C13	A3#1	3#4	cmodel	1.81684e-18
C14	3#2	3#7	cmodel	2.5992e-19
C15	A3	3#5	cmodel	7.51713e-19
C16	3#4	Z	cmodel	1.13991e-19
C17	3#3	Z	cmodel	8.5238e-19
C18	Z#4	3#4	cmodel	1.58884e-18
C19	A3	Z#4	cmodel	2.82962e-19
C20	A3#2	A3	cmodel	3.58949e-19
C21	3#4	A3	cmodel	8.15918e-19
C22	Z#4	3#3	cmodel	2.12707e-18
C23	A1#2	3#7	cmodel	3.51547e-18
C24	3#6	3#7	cmodel	7.97712e-19
C25	Z#3	A3#1	cmodel	2.03162e-19
C26	A1#1	3#7	cmodel	1.43083e-18
C27	A3#2	3#5	cmodel	2.2583e-18
C28	3#2	A1#2	cmodel	3.09595e-18
C29	A3#1	3#5	cmodel	2.68867e-19
C30	3#6	A1#2	cmodel	3.43911e-19
C31	3#4	Z#2	cmodel	1.58884e-18
C32	3#3	Z#2	cmodel	2.12707e-18
C33	Z#1	Z#2	cmodel	7.55249e-19
C34	A1#1	A3#2	cmodel	2.75227e-19
C35	A1	VSS	cmodel	1.19793e-18
C36	3#7	VSS	cmodel	1.39531e-18
C37	A1	A2#1	cmodel	3.11709e-18
C38	A1	VDD	cmodel	7.20035e-19
C39	Z	VSS	cmodel	1.95453e-19
C40	3#5	VSS	cmodel	1.48898e-18
C41	3#7	VDD	cmodel	2.16478e-18
C42	A3	VSS	cmodel	1.36323e-18
C43	Z#2	VSS	cmodel	1.52925e-18
C44	3	A1	cmodel	1.54524e-18
C45	VDD	VSS	cmodel	1.72629e-17
C46	3#6	VDD	cmodel	6.79774e-19
C47	A2#1	A1#1	cmodel	4.61974e-19
C48	3#2	VSS	cmodel	4.56182e-18
C49	3	A1#2	cmodel	5.08183e-19
C50	A2#1	VDD	cmodel	4.36348e-19
C51	A2#1	3#5	cmodel	2.64142e-18
C52	3	VSS	cmodel	1.34414e-18
C53	3#5	VDD	cmodel	2.65005e-18
C54	3	A2#1	cmodel	7.9374e-19
C55	A2#1	A3#2	cmodel	4.1041e-19
C56	A3	VDD	cmodel	7.096e-19
C57	A2#1	3#2	cmodel	5.36322e-19
C58	Z#4	VSS	cmodel	2.37101e-18
C59	Z#2	VDD	cmodel	3.62062e-18
C60	3#4	VDD	cmodel	1.63804e-18
C61	3	3#2	cmodel	1.10349e-18
C62	A1#2	VSS	cmodel	1.38999e-18
C63	3#6	VSS	cmodel	5.68065e-19
C64	VSS	A2#1	cmodel	8.30147e-18
C65	3#3	VDD	cmodel	9.10423e-19
C66	A1#1	VSS	cmodel	1.09249e-18
C67	VSS	A3#2	cmodel	1.42635e-18
C68	3#4	VSS	cmodel	1.72738e-18
C69	A2#1	A3	cmodel	1.26064e-18
C70	A3#1	VSS	cmodel	1.05105e-18
C71	3#3	VSS	cmodel	1.8854e-18
C72	Z#3	VSS	cmodel	1.17315e-18
C73	Z#1	VDD	cmodel	8.43027e-19
C74	Z#1	VSS	cmodel	6.00252e-19
*
*
.ENDS AND3_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
