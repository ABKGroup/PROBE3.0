*
*
*
*                       LINUX           Fri Feb  3 22:33:03 2023
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
.SUBCKT NAND4_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A4 A1 VSS A2 VDD ZN A3
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	A4#3	ZN#9	VDD	pmos_rvt	nfin=2
MM1	ZN#8	A4#1	VDD	VDD	pmos_rvt	nfin=2
MM2	VDD	A3#3	ZN#8	VDD	pmos_rvt	nfin=2
MM3	ZN#7	A3#1	VDD	VDD	pmos_rvt	nfin=2
MM4	VDD	A2#2	ZN#6	VDD	pmos_rvt	nfin=2
MM5	ZN#5	A2#1	VDD	VDD	pmos_rvt	nfin=2
MM6	VDD	A1#2	ZN#5	VDD	pmos_rvt	nfin=2
MM7	ZN#3	A1#1	VDD	VDD	pmos_rvt	nfin=2
MM8	VSS	A4#3	10#3	VSS	nmos_rvt	nfin=2
MM9	10#2	A4#1	VSS	VSS	nmos_rvt	nfin=2
MM10	9#2	A3#3	10#2	VSS	nmos_rvt	nfin=2
MM11	10	A3#1	9#2	VSS	nmos_rvt	nfin=2
MM12	9	A2#2	7#3	VSS	nmos_rvt	nfin=2
MM13	7#2	A2#1	9	VSS	nmos_rvt	nfin=2
MM14	ZN#2	A1#2	7#2	VSS	nmos_rvt	nfin=2
MM15	7	A1#1	ZN#2	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj2	A4#1	A4#3	M0	    0.7136
Rj3	A1#1	A1#2	M0	    0.7136
Rj4	A2#1	A2#2	M0	    0.7136
Rj10	ZN#1	ZN#2	M0	    0.1189
Rj11	ZN#3	ZN#4	M0	    0.5946
Rj12	ZN#4	ZN#5	M0	    0.8325
Rj13	ZN#5	ZN#6	M0	    1.4271
Rj14	ZN#6	ZN#7	M0	    0.7136
Rj15	ZN#7	ZN#8	M0	    1.4271
Rj16	ZN#8	ZN#9	M0	    1.4271
Rj9	A3#1	A3#3	M0	    0.7136
Rj24	10	10#2	M0	    1.4271
Rj25	10#2	10#3	M0	    1.4271
Rj26	9	9#2	M0	    2.1407
Rj27	7	7#2	M0	    1.4271
Rj28	7#2	7#3	M0	    1.4271
Ri1	A4	A4#1	M1	    5.0211
Ri2	A1	A1#2	M1	    5.0211
Ri3	A2	A2#2	M1	    5.0211
Ri7	ZN	ZN#1	M1	    5.0422
Ri8	ZN	ZN#4	M1	    5.0422
Ri6	A3	A3#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	ZN#2	A1#1	cmodel	2.12707e-18
C2	A4	A3	cmodel	6.48335e-19
C3	A2	A1	cmodel	6.05688e-19
C4	A1	ZN	cmodel	1.00342e-18
C5	A3#1	ZN#7	cmodel	3.43535e-18
C6	A4	A4#1	cmodel	2.10394e-18
C7	A4	ZN#8	cmodel	5.38999e-19
C8	A3	A2	cmodel	5.72773e-19
C9	A4	10#2	cmodel	8.43771e-19
C10	A4	9#2	cmodel	7.10695e-19
C11	A1	ZN#1	cmodel	1.8823e-18
C12	A1	ZN#4	cmodel	1.20868e-18
C13	A4	A3#3	cmodel	4.16e-19
C14	10#2	ZN#8	cmodel	5.44692e-19
C15	A1	ZN#5	cmodel	3.28086e-19
C16	A2	A3#1	cmodel	1.94023e-19
C17	10#2	A4#1	cmodel	1.05134e-18
C18	A1	7#2	cmodel	8.43771e-19
C19	A1	ZN#2	cmodel	5.79021e-19
C20	A2#2	ZN#6	cmodel	3.47998e-18
C21	A1	A2#1	cmodel	3.75642e-19
C22	A1	A1#2	cmodel	1.39974e-18
C23	A3	A4#1	cmodel	1.5275e-19
C24	10#3	A4#3	cmodel	1.25698e-18
C25	9#2	ZN#7	cmodel	1.21296e-18
C26	A3	A3#1	cmodel	1.39337e-18
C27	A2	ZN#6	cmodel	5.38999e-19
C28	9#2	A3#1	cmodel	3.47084e-18
C29	A2	7#3	cmodel	5.38999e-19
C30	A2	ZN#2	cmodel	1.47906e-19
C31	A1#2	ZN#4	cmodel	1.60591e-18
C32	A2#1	ZN#5	cmodel	3.446e-18
C33	A4#3	ZN#9	cmodel	3.48929e-18
C34	A1#1	ZN#4	cmodel	2.21186e-18
C35	A2	A2#2	cmodel	1.52678e-18
C36	A3	ZN#7	cmodel	5.38999e-19
C37	A1#2	ZN#5	cmodel	1.83362e-18
C38	A2	A1#2	cmodel	1.5275e-19
C39	A4#1	A3#3	cmodel	5.7903e-19
C40	7#2	A2#1	cmodel	9.45072e-19
C41	A3	9#2	cmodel	1.50896e-18
C42	10#2	A3#3	cmodel	9.45072e-19
C43	A1#1	ZN#3	cmodel	1.20949e-18
C44	7#2	A1#2	cmodel	7.55032e-19
C45	7#2	ZN#5	cmodel	5.44692e-19
C46	A1#2	ZN	cmodel	5.60437e-20
C47	A3#1	A2#2	cmodel	6.89491e-20
C48	10#3	ZN#9	cmodel	4.90223e-19
C49	9#2	A3#3	cmodel	1.58884e-18
C50	ZN	A1#1	cmodel	8.5238e-19
C51	A3#3	ZN#8	cmodel	3.48929e-18
C52	A2#1	A1#2	cmodel	5.85281e-19
C53	10#2	9#2	cmodel	1.58884e-18
C54	ZN#1	ZN#2	cmodel	9.31642e-19
C55	7#2	ZN#2	cmodel	1.58884e-18
C56	ZN#2	A1#2	cmodel	1.58884e-18
C57	A3	A2#2	cmodel	1.94023e-19
C58	A4#1	ZN#8	cmodel	3.43535e-18
C59	A1#1	VSS	cmodel	1.0989e-18
C60	10	7#3	cmodel	9.27593e-19
C61	10#2	VSS	cmodel	8.72615e-18
C62	9	A2#2	cmodel	3.51547e-18
C63	7	ZN#3	cmodel	4.90223e-19
C64	9	ZN#2	cmodel	2.13364e-19
C65	9#2	VSS	cmodel	1.74648e-18
C66	A4	VSS	cmodel	2.10893e-18
C67	ZN#9	VDD	cmodel	5.50352e-18
C68	A3	10	cmodel	5.38999e-19
C69	ZN#1	VSS	cmodel	1.19412e-18
C70	A4	VDD	cmodel	5.0036e-19
C71	A1	VSS	cmodel	1.96089e-18
C72	9	A2#1	cmodel	1.54421e-18
C73	7#3	VSS	cmodel	5.88253e-18
C74	ZN#1	7	cmodel	3.97217e-19
C75	ZN#4	VSS	cmodel	7.61123e-19
C76	9	ZN#6	cmodel	1.19563e-18
C77	7	A1#1	cmodel	7.11143e-19
C78	A1	VDD	cmodel	4.93108e-19
C79	A2	VSS	cmodel	1.81919e-18
C80	VDD	ZN#8	cmodel	7.52472e-18
C81	VSS	7#2	cmodel	8.69414e-18
C82	VDD	VSS	cmodel	2.45575e-17
C83	ZN#2	VSS	cmodel	1.00126e-18
C84	ZN#9	VSS	cmodel	1.78444e-18
C85	VDD	ZN#7	cmodel	5.55292e-18
C86	ZN	VSS	cmodel	1.95482e-19
C87	A2	VDD	cmodel	5.0036e-19
C88	A1	9	cmodel	4.23784e-19
C89	A3	VSS	cmodel	1.82818e-18
C90	VDD	ZN#6	cmodel	5.55292e-18
C91	A4#3	VSS	cmodel	1.53958e-18
C92	7#3	9	cmodel	5.49756e-18
C93	ZN#8	VSS	cmodel	1.14507e-18
C94	10	VSS	cmodel	5.83364e-18
C95	ZN#7	VSS	cmodel	8.08258e-19
C96	ZN#5	VDD	cmodel	6.00625e-18
C97	VSS	9	cmodel	1.64776e-18
C98	7	ZN#2	cmodel	2.09656e-18
C99	A3#3	VSS	cmodel	5.98572e-19
C100	ZN#6	VSS	cmodel	8.06574e-19
C101	VSS	7	cmodel	6.98036e-18
C102	10	9#2	cmodel	5.45293e-18
C103	ZN#3	VDD	cmodel	3.15927e-18
C104	ZN#5	VSS	cmodel	9.51295e-19
C105	A3	VDD	cmodel	5.0036e-19
C106	A2	9	cmodel	1.50543e-18
C107	A2#2	VSS	cmodel	3.85814e-19
C108	ZN#3	VSS	cmodel	1.36458e-18
C109	ZN#4	VDD	cmodel	4.46793e-18
C110	A2#1	VSS	cmodel	5.98561e-19
C111	7#2	9	cmodel	1.54421e-18
C112	10#3	VSS	cmodel	7.31044e-18
C113	A4#1	VSS	cmodel	4.05775e-19
C114	A1#2	VSS	cmodel	3.98229e-19
C115	A3#1	VSS	cmodel	3.81956e-19
*
*
.ENDS NAND4_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
