*
*
*
*                       LINUX           Fri Feb  3 22:34:16 2023
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
.SUBCKT NOR3_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 ZN A3 VSS A2 VDD A1
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#1	A1#3	8#3	VDD	pmos_rvt	nfin=2
MM1	8#2	A1#1	ZN#1	VDD	pmos_rvt	nfin=2
MM2	7#3	A2#3	8#2	VDD	pmos_rvt	nfin=2
MM3	8	A2#1	7#3	VDD	pmos_rvt	nfin=2
MM4	VDD	A3#2	7#2	VDD	pmos_rvt	nfin=2
MM5	7	A3#1	VDD	VDD	pmos_rvt	nfin=2
MM6	VSS	A1#3	ZN#8	VSS	nmos_rvt	nfin=2
MM7	ZN#6	A1#1	VSS	VSS	nmos_rvt	nfin=2
MM8	VSS	A2#3	ZN#6	VSS	nmos_rvt	nfin=2
MM9	ZN#5	A2#1	VSS	VSS	nmos_rvt	nfin=2
MM10	VSS	A3#2	ZN#4	VSS	nmos_rvt	nfin=2
MM11	ZN#3	A3#1	VSS	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	ZN#1	ZN#2	M0	    0.1189
Rj2	ZN#3	ZN#4	M0	    1.4271
Rj3	ZN#4	ZN#5	M0	    0.7136
Rj4	ZN#5	ZN#6	M0	    1.4271
Rj5	ZN#6	ZN#7	M0	    0.8325
Rj6	ZN#7	ZN#8	M0	    0.5946
Rj7	A3#1	A3#2	M0	    0.7136
Rj15	A2#1	A2#3	M0	    0.7136
Rj30	A1#1	A1#3	M0	    0.7136
Rj31	8	8#2	M0	    1.4271
Rj32	8#2	8#3	M0	    1.4271
Rj33	7	7#2	M0	    1.4271
Rj34	7#2	7#3	M0	    1.4271
Ri1	ZN	ZN#7	M1	    5.0422
Ri2	ZN	ZN#2	M1	    5.0422
Ri3	A3	A3#2	M1	    5.0211
Ri6	A2	A2#1	M1	    5.0211
Ri12	A1	A1#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	ZN	A1	cmodel	9.12566e-19
C2	A2	A3	cmodel	5.52961e-19
C3	A1#3	ZN#2	cmodel	2.16844e-18
C4	A1	A2	cmodel	6.40869e-19
C5	A3	A2#1	cmodel	2.73097e-19
C6	ZN	A1#3	cmodel	1.08538e-18
C7	ZN#5	A2#1	cmodel	3.43535e-18
C8	ZN#3	A3#1	cmodel	3.446e-18
C9	A3	7#2	cmodel	1.84737e-18
C10	ZN#2	A2	cmodel	2.82072e-19
C11	7#3	8#2	cmodel	1.58884e-18
C12	A2	A1#1	cmodel	1.5275e-19
C13	A2	A2#1	cmodel	1.39337e-18
C14	A3	ZN#4	cmodel	5.38999e-19
C15	A1	ZN#7	cmodel	2.26513e-18
C16	A3	A3#2	cmodel	1.41786e-18
C17	ZN#2	A1	cmodel	1.00558e-18
C18	A1#1	A2#3	cmodel	5.85281e-19
C19	A1	A1#1	cmodel	1.1436e-18
C20	A2	7#3	cmodel	1.68245e-18
C21	A3#2	7#2	cmodel	3.51547e-18
C22	ZN#8	A1#3	cmodel	1.25412e-18
C23	ZN#8	8#3	cmodel	4.90223e-19
C24	A2	ZN#5	cmodel	5.38999e-19
C25	A1	8#2	cmodel	4.93424e-19
C26	A2#1	A3#2	cmodel	3.22896e-20
C27	ZN#7	A1#1	cmodel	1.61263e-18
C28	A2	A3#2	cmodel	1.98492e-19
C29	A1#1	ZN#2	cmodel	1.54421e-18
C30	ZN#6	A1	cmodel	1.36673e-18
C31	ZN#6	8#2	cmodel	5.44692e-19
C32	A1	A2#3	cmodel	3.75642e-19
C33	A1#3	8#3	cmodel	7.11143e-19
C34	ZN#6	A2#3	cmodel	3.48929e-18
C35	ZN#2	8#3	cmodel	2.70212e-18
C36	ZN#5	7#3	cmodel	3.8988e-19
C37	ZN#2	8#2	cmodel	1.54421e-18
C38	ZN#2	7#3	cmodel	7.27932e-19
C39	A1#1	8#2	cmodel	7.51729e-19
C40	A2#1	7#3	cmodel	3.47084e-18
C41	ZN#5	7#2	cmodel	7.62432e-19
C42	A2#3	8#2	cmodel	9.45072e-19
C43	ZN#4	7#2	cmodel	1.19563e-18
C44	ZN#4	A3#2	cmodel	3.47998e-18
C45	A2#3	7#3	cmodel	1.58884e-18
C46	ZN#7	A1#3	cmodel	2.2086e-18
C47	ZN#6	A1#1	cmodel	1.81684e-18
C48	7	VDD	cmodel	2.48769e-18
C49	ZN#8	VSS	cmodel	4.57329e-18
C50	A1#1	VSS	cmodel	4.20469e-19
C51	A2#1	VSS	cmodel	3.55838e-19
C52	8#3	VDD	cmodel	5.19001e-18
C53	ZN	VSS	cmodel	1.80273e-19
C54	VSS	ZN#6	cmodel	7.07413e-18
C55	A3	VSS	cmodel	1.73261e-18
C56	VSS	ZN#5	cmodel	6.3578e-18
C57	7#3	8	cmodel	3.85487e-18
C58	VSS	ZN#4	cmodel	6.35949e-18
C59	A3	VDD	cmodel	7.20036e-19
C60	8#2	VDD	cmodel	7.84338e-18
C61	A2	VSS	cmodel	1.9058e-18
C62	ZN#3	VSS	cmodel	7.15745e-18
C63	8#3	VSS	cmodel	1.74642e-18
C64	ZN#3	7	cmodel	7.7976e-19
C65	A3#1	7	cmodel	3.446e-18
C66	VDD	VSS	cmodel	2.07289e-17
C67	ZN#2	VDD	cmodel	4.80843e-19
C68	A1#3	VSS	cmodel	1.10397e-18
C69	A1	VSS	cmodel	1.80575e-18
C70	A2	VDD	cmodel	5.0036e-19
C71	8#2	VSS	cmodel	1.18772e-18
C72	8	VSS	cmodel	1.61205e-18
C73	7#2	8	cmodel	1.54421e-18
C74	A2#3	VSS	cmodel	6.04932e-19
C75	7#3	VSS	cmodel	5.95235e-19
C76	7	VSS	cmodel	1.78177e-18
C77	7#2	VDD	cmodel	2.91199e-18
C78	A2	8	cmodel	5.38999e-19
C79	A1	VDD	cmodel	3.2239e-19
C80	A3#2	VSS	cmodel	3.84338e-19
C81	7#2	VSS	cmodel	1.29027e-18
C82	A3#1	VSS	cmodel	1.504e-18
C83	8	VDD	cmodel	5.14104e-18
C84	ZN#7	VSS	cmodel	5.26472e-18
C85	ZN#2	VSS	cmodel	1.86762e-18
*
*
.ENDS NOR3_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
