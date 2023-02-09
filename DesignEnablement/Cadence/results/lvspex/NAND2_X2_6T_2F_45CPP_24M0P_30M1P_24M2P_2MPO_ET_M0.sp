*
*
*
*                       LINUX           Fri Feb  3 22:32:07 2023
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
.SUBCKT NAND2_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 ZN A1 VSS A2 VDD
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	A2#3	ZN#6	VDD	pmos_rvt	nfin=2
MM1	ZN#5	A2#1	VDD	VDD	pmos_rvt	nfin=2
MM2	VDD	A1#3	ZN#5	VDD	pmos_rvt	nfin=2
MM3	ZN#3	A1#1	VDD	VDD	pmos_rvt	nfin=2
MM4	VSS	A2#3	5#3	VSS	nmos_rvt	nfin=2
MM5	5#2	A2#1	VSS	VSS	nmos_rvt	nfin=2
MM6	ZN#2	A1#3	5#2	VSS	nmos_rvt	nfin=2
MM7	5	A1#1	ZN#2	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	ZN#1	ZN#2	M0	    0.3568
Rj2	ZN#3	ZN#4	M0	    0.3568
Rj3	ZN#4	ZN#5	M0	    1.0704
Rj4	ZN#5	ZN#6	M0	    1.4271
Rj5	A1#1	A1#2	M0	    0.4757
Rj6	A1#2	A1#3	M0	    0.2379
Rj11	A2#1	A2#2	M0	    0.4757
Rj12	A2#2	A2#3	M0	    0.2379
Rj13	5	5#2	M0	    1.4271
Rj14	5#2	5#3	M0	    1.4271
Ri1	ZN	ZN#1	M1	    5.0634
Ri2	ZN	ZN#4	M1	    5.0634
Ri3	A1	A1#2	M1	    5.0211
Ri6	A2	A2#2	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A1	ZN	cmodel	1.87985e-18
C2	A2	A1	cmodel	5.85019e-19
C3	A1	A1#2	cmodel	8.50566e-19
C4	A1	ZN#1	cmodel	1.33151e-18
C5	A1	ZN#4	cmodel	1.72354e-18
C6	ZN	A1#1	cmodel	5.95174e-19
C7	A2	A2#2	cmodel	1.25024e-18
C8	A1	ZN#5	cmodel	5.07751e-20
C9	A2	ZN#1	cmodel	9.95381e-20
C10	A1	5#2	cmodel	1.32567e-18
C11	A1	ZN#2	cmodel	4.30418e-19
C12	A1#3	ZN#5	cmodel	2.2583e-18
C13	A1#3	A1	cmodel	3.58949e-19
C14	A2	ZN#6	cmodel	4.93424e-19
C15	A2#3	5#3	cmodel	2.2583e-18
C16	ZN#2	5#2	cmodel	1.4401e-18
C17	A2	5#3	cmodel	1.73013e-18
C18	A1#2	ZN#4	cmodel	1.54323e-18
C19	A2	ZN#2	cmodel	1.66517e-19
C20	A2#3	A2	cmodel	3.58949e-19
C21	A2#2	5#3	cmodel	1.19956e-18
C22	A1#2	ZN#5	cmodel	2.62938e-19
C23	A2#1	5#2	cmodel	2.88312e-18
C24	A2#2	5#2	cmodel	6.24823e-19
C25	5#2	A1#3	cmodel	2.2583e-18
C26	A2#1	ZN#2	cmodel	3.77624e-19
C27	5#2	A1#2	cmodel	1.19956e-18
C28	ZN#1	A2#1	cmodel	1.92021e-19
C29	5#3	ZN#6	cmodel	1.70416e-18
C30	A1#1	ZN#4	cmodel	2.354e-18
C31	5#2	ZN#5	cmodel	1.97539e-18
C32	5	ZN#4	cmodel	4.332e-20
C33	ZN#1	VSS	cmodel	4.51948e-18
C34	VSS	5#2	cmodel	3.00517e-18
C35	ZN#4	VSS	cmodel	8.98061e-19
C36	5	ZN#3	cmodel	7.19112e-19
C37	ZN	VSS	cmodel	2.78024e-19
C38	ZN#6	VDD	cmodel	5.50352e-18
C39	VSS	ZN#2	cmodel	2.70025e-18
C40	A1	VSS	cmodel	1.92056e-18
C41	ZN	5	cmodel	6.50212e-19
C42	A2#3	VSS	cmodel	3.12509e-18
C43	A1	VDD	cmodel	4.93108e-19
C44	ZN#6	VSS	cmodel	1.7447e-18
C45	A2	VSS	cmodel	2.02528e-18
C46	VDD	ZN#5	cmodel	6.73279e-18
C47	A2#1	VSS	cmodel	3.16931e-18
C48	VDD	VSS	cmodel	1.46447e-17
C49	5	A1#2	cmodel	6.24823e-19
C50	A1#3	VSS	cmodel	9.11384e-19
C51	ZN#5	VSS	cmodel	9.72553e-19
C52	ZN#3	VDD	cmodel	2.502e-18
C53	5	VSS	cmodel	2.65598e-18
C54	ZN#4	VDD	cmodel	4.4448e-18
C55	A1#1	VSS	cmodel	8.05448e-19
C56	A2	VDD	cmodel	3.2239e-19
C57	ZN#3	VSS	cmodel	1.03606e-18
C58	A2#2	VSS	cmodel	1.97133e-18
C59	ZN#1	5	cmodel	2.76031e-18
C60	5	A1#1	cmodel	2.80138e-18
C61	5#3	VSS	cmodel	2.78298e-18
C62	ZN#2	5	cmodel	9.5955e-19
C63	A1#2	VSS	cmodel	1.92969e-19
*
*
.ENDS NAND2_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
