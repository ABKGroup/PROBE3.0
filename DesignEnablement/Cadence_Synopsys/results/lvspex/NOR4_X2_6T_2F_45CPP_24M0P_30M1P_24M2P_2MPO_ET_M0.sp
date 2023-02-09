*
*
*
*                       LINUX           Fri Feb  3 22:34:31 2023
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
.SUBCKT NOR4_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A4 A1 VSS ZN A3 VDD A2
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#1	A1#3	10#3	VDD	pmos_rvt	nfin=2
MM1	10#2	A1#1	ZN#1	VDD	pmos_rvt	nfin=2
MM2	9#3	A2#3	10#2	VDD	pmos_rvt	nfin=2
MM3	10	A2#2	9#3	VDD	pmos_rvt	nfin=2
MM4	8#3	A3#3	9#2	VDD	pmos_rvt	nfin=2
MM5	9	A3#2	8#3	VDD	pmos_rvt	nfin=2
MM6	VDD	A4#3	8#2	VDD	pmos_rvt	nfin=2
MM7	8	A4#1	VDD	VDD	pmos_rvt	nfin=2
MM8	VSS	A1#3	ZN#9	VSS	nmos_rvt	nfin=2
MM9	ZN#7	A1#1	VSS	VSS	nmos_rvt	nfin=2
MM10	VSS	A2#3	ZN#7	VSS	nmos_rvt	nfin=2
MM11	ZN#6	A2#2	VSS	VSS	nmos_rvt	nfin=2
MM12	VSS	A3#2	ZN#5	VSS	nmos_rvt	nfin=2
MM13	ZN#4	A3#1	VSS	VSS	nmos_rvt	nfin=2
MM14	VSS	A4#3	ZN#4	VSS	nmos_rvt	nfin=2
MM15	ZN#3	A4#1	VSS	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj4	A4#1	A4#3	M0	    0.7136
Rj2	A1#1	A1#3	M0	    0.7136
Rj5	ZN#1	ZN#2	M0	    0.1189
Rj6	ZN#3	ZN#4	M0	    1.4271
Rj7	ZN#4	ZN#5	M0	    1.4271
Rj8	ZN#5	ZN#6	M0	    1.4271
Rj9	ZN#6	ZN#7	M0	    1.4271
Rj10	ZN#7	ZN#8	M0	    0.8325
Rj11	ZN#8	ZN#9	M0	    0.5946
Rj18	A3#1	A3#2	M0	    0.7136
Rj19	A3#2	A3#3	M0	    0.7136
Rj16	A2#1	A2#2	M0	    0.4757
Rj17	A2#2	A2#3	M0	    0.7136
Rj35	10	10#2	M0	    1.4271
Rj36	10#2	10#3	M0	    1.4271
Rj37	9	9#2	M0	    1.4271
Rj38	9#2	9#3	M0	    1.4271
Rj39	8	8#2	M0	    1.4271
Rj40	8#2	8#3	M0	    1.4271
Ri2	A4	A4#1	M1	    5.0211
Ri1	A1	A1#1	M1	    5.0211
Ri3	ZN	ZN#8	M1	    5.0211
Ri4	ZN	ZN#2	M1	    5.0211
Ri8	A3	A3#3	M1	    5.0211
Ri7	A2	A2#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	9#3	10#2	cmodel	1.58884e-18
C2	A3	A4	cmodel	8.62933e-20
C3	ZN	A1	cmodel	2.25966e-18
C4	A2#1	ZN#6	cmodel	2.80138e-18
C5	A1	A2	cmodel	2.68568e-19
C6	A4	A4#1	cmodel	1.45302e-18
C7	ZN#6	9#3	cmodel	3.85293e-18
C8	ZN#2	10#3	cmodel	2.69628e-18
C9	A3#1	ZN#4	cmodel	3.446e-18
C10	A2#3	ZN#7	cmodel	3.48929e-18
C11	ZN#8	10#2	cmodel	1.91964e-19
C12	A1	ZN#8	cmodel	4.2824e-19
C13	A2	A3#3	cmodel	2.5491e-19
C14	A1	A1#1	cmodel	1.4464e-18
C15	A2	A3	cmodel	1.08998e-18
C16	ZN#3	A4	cmodel	1.84923e-18
C17	A4	A3#1	cmodel	2.33339e-19
C18	A1	10#2	cmodel	4.86273e-19
C19	ZN#2	10#2	cmodel	1.54421e-18
C20	ZN	ZN#8	cmodel	1.3188e-18
C21	A4#3	ZN#4	cmodel	3.48929e-18
C22	ZN#2	9#3	cmodel	5.19258e-19
C23	A2#3	A1#1	cmodel	6.17394e-19
C24	A1	ZN#7	cmodel	1.00362e-18
C25	A3	A2#1	cmodel	2.49278e-19
C26	A1	A2#3	cmodel	4.27514e-19
C27	ZN#6	9#2	cmodel	3.78972e-18
C28	A2#2	ZN#6	cmodel	3.20356e-18
C29	A2	A1#1	cmodel	1.33454e-19
C30	A2	A2#1	cmodel	1.39305e-18
C31	ZN#5	9#2	cmodel	3.85487e-18
C32	ZN#9	10#3	cmodel	9.96361e-19
C33	A3	9#2	cmodel	5.38999e-19
C34	A4#1	ZN#3	cmodel	3.47084e-18
C35	A2#1	A3#3	cmodel	2.34438e-19
C36	A1#3	ZN#9	cmodel	1.25412e-18
C37	A3#1	A4#3	cmodel	8.42176e-19
C38	9#2	8#3	cmodel	1.58884e-18
C39	ZN	A1#3	cmodel	5.59273e-19
C40	A3#3	ZN#5	cmodel	3.51547e-18
C41	A3	ZN#5	cmodel	1.60747e-18
C42	ZN#8	ZN#2	cmodel	3.7654e-18
C43	A2	9#2	cmodel	3.78861e-19
C44	A1#1	ZN#8	cmodel	1.61263e-18
C45	A3#2	ZN#5	cmodel	3.85293e-18
C46	A3	A3#3	cmodel	1.66357e-18
C47	A3	A4#3	cmodel	1.55033e-19
C48	A1#3	ZN#8	cmodel	2.17717e-18
C49	ZN#7	10#2	cmodel	1.92818e-18
C50	A1#1	ZN#7	cmodel	1.81684e-18
C51	A2	ZN#6	cmodel	1.53096e-18
C52	ZN#4	8#2	cmodel	2.77248e-18
C53	ZN#7	9#3	cmodel	1.58884e-18
C54	ZN#8	10#3	cmodel	2.57321e-19
C55	VSS	A3#1	cmodel	3.96099e-18
C56	10	VDD	cmodel	5.4597e-18
C57	ZN#3	8	cmodel	1.66958e-18
C58	A1#1	VSS	cmodel	3.64919e-18
C59	ZN#5	9	cmodel	3.85293e-18
C60	A4#3	VSS	cmodel	4.01467e-18
C61	VDD	9#2	cmodel	2.23103e-18
C62	A2#1	VSS	cmodel	2.95613e-18
C63	10	8#3	cmodel	4.90418e-19
C64	A4	VSS	cmodel	2.20115e-18
C65	ZN#9	VSS	cmodel	2.65401e-18
C66	A2	10	cmodel	1.21404e-19
C67	A1	VSS	cmodel	1.94271e-18
C68	8#3	VDD	cmodel	5.50352e-18
C69	ZN#4	9	cmodel	1.54421e-18
C70	A4	VDD	cmodel	3.2239e-19
C71	VSS	A4#1	cmodel	4.21084e-18
C72	8	VDD	cmodel	5.4597e-18
C73	VSS	ZN#7	cmodel	2.0729e-18
C74	ZN	VSS	cmodel	1.34577e-18
C75	A1	VDD	cmodel	3.2239e-19
C76	VSS	ZN#6	cmodel	2.21407e-18
C77	A4	8	cmodel	4.93424e-19
C78	A3	VSS	cmodel	1.77635e-18
C79	VSS	ZN#5	cmodel	1.53515e-18
C80	10#3	VSS	cmodel	1.71574e-18
C81	8#2	VDD	cmodel	7.84338e-18
C82	VDD	VSS	cmodel	2.6607e-17
C83	ZN#4	VSS	cmodel	2.42534e-18
C84	VDD	10#3	cmodel	5.18486e-18
C85	A2	VSS	cmodel	1.69448e-18
C86	ZN#3	VSS	cmodel	2.68134e-18
C87	10#2	VSS	cmodel	1.12409e-18
C88	9	8#3	cmodel	3.85293e-18
C89	10	VSS	cmodel	8.38328e-19
C90	A1#3	VSS	cmodel	4.52697e-18
C91	9#3	VSS	cmodel	8.26518e-19
C92	9	VSS	cmodel	1.83197e-18
C93	A3	VDD	cmodel	4.36348e-19
C94	9#3	10	cmodel	3.85293e-18
C95	ZN#2	VDD	cmodel	4.53611e-19
C96	8	VSS	cmodel	1.74901e-18
C97	10#2	VDD	cmodel	7.84338e-18
C98	A2#3	VSS	cmodel	4.02084e-18
C99	9#2	VSS	cmodel	1.26455e-18
C100	VSS	A2#2	cmodel	3.70886e-18
C101	8#3	VSS	cmodel	8.63467e-19
C102	VSS	A3#3	cmodel	3.72402e-18
C103	9	8#2	cmodel	1.54421e-18
C104	A2	VDD	cmodel	3.71111e-19
C105	ZN#8	VSS	cmodel	4.26104e-19
C106	VSS	A3#2	cmodel	4.46065e-18
C107	8#2	VSS	cmodel	1.15793e-18
C108	9#2	10	cmodel	1.33671e-18
C109	ZN#2	VSS	cmodel	1.80183e-18
*
*
.ENDS NOR4_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
