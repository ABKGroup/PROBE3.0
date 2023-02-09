*
*
*
*                       LINUX           Fri Feb  3 22:34:44 2023
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
.SUBCKT AOI21_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 ZN B VSS A1 VDD A2
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#2	A2#1	7#2	VDD	pmos_rvt	nfin=2
MM1	7	A1#2	ZN#2	VDD	pmos_rvt	nfin=2
MM2	VDD	B#2	7	VDD	pmos_rvt	nfin=2
MM3	8	A2#1	VSS	VSS	nmos_rvt	nfin=2
MM4	ZN#3	A1#2	8	VSS	nmos_rvt	nfin=2
MM5	VSS	B#2	ZN#3	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	ZN#1	ZN#2	M0	    0.3568
Rj2	ZN#3	ZN#4	M0	    0.3568
Rj3	B#1	B#2	M0	    0.2379
Rj6	A1#1	A1#2	M0	    0.4757
Rj12	A2#1	A2#2	M0	    0.2379
Rj13	7	7#2	M0	    1.4271
Ri1	ZN	ZN#4	M1	    5.0211
Ri2	ZN	ZN#1	M1	    5.0211
Ri3	B	B#1	M1	    5.0211
Ri6	A1	A1#1	M1	    5.0211
Ri12	A2	A2#2	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	ZN	B	cmodel	7.00733e-20
C2	ZN	A1	cmodel	2.27705e-18
C3	A2#1	7#2	cmodel	5.40336e-19
C4	A2	ZN	cmodel	8.27356e-19
C5	A1	B	cmodel	3.26586e-18
C6	ZN	ZN#4	cmodel	1.00115e-18
C7	B	ZN#1	cmodel	6.86249e-19
C8	ZN	A1#2	cmodel	5.59273e-19
C9	A2	A1	cmodel	2.33726e-19
C10	B	B#1	cmodel	1.2023e-18
C11	B	ZN#3	cmodel	4.08546e-19
C12	A1	A1#1	cmodel	1.52459e-18
C13	B#2	B	cmodel	5.77755e-19
C14	A2	A2#2	cmodel	1.96961e-18
C15	A2	ZN#4	cmodel	4.11175e-19
C16	A1	ZN#3	cmodel	7.05804e-19
C17	A1	A2#1	cmodel	1.41769e-19
C18	A2	7#2	cmodel	6.24991e-19
C19	A1	B#2	cmodel	4.90367e-19
C20	ZN#4	ZN#1	cmodel	1.70347e-18
C21	A2#2	7#2	cmodel	3.97741e-19
C22	A2	A1#2	cmodel	2.42545e-19
C23	A1#2	ZN#3	cmodel	2.90097e-19
C24	A2#1	A1#2	cmodel	7.20401e-19
C25	A1#2	ZN#4	cmodel	1.77956e-18
C26	A1#1	ZN#3	cmodel	2.10552e-18
C27	ZN#2	7#2	cmodel	1.58884e-18
C28	ZN#1	B#2	cmodel	7.85818e-19
C29	A1#1	B#2	cmodel	5.9072e-19
C30	A1	7	cmodel	3.94024e-19
C31	A2#2	VSS	cmodel	2.90715e-18
C32	A1#1	VDD	cmodel	2.37266e-20
C33	A2	VDD	cmodel	3.2239e-19
C34	ZN#4	VSS	cmodel	4.9548e-19
C35	B#2	VDD	cmodel	9.39459e-19
C36	ZN	VSS	cmodel	1.26034e-18
C37	B#1	VDD	cmodel	7.83849e-19
C38	7	VDD	cmodel	5.14104e-18
C39	ZN#1	VSS	cmodel	1.05858e-18
C40	B	VSS	cmodel	1.86193e-18
C41	ZN#4	7	cmodel	3.8988e-20
C42	A1#1	VSS	cmodel	3.53495e-18
C43	ZN#3	VSS	cmodel	6.3651e-19
C44	B	VDD	cmodel	5.06111e-19
C45	B#1	VSS	cmodel	1.37892e-18
C46	A1	VSS	cmodel	2.00357e-18
C47	ZN#1	7	cmodel	2.99044e-18
C48	A2#1	VSS	cmodel	2.56411e-18
C49	VSS	VDD	cmodel	1.26821e-17
C50	A1#2	VSS	cmodel	2.87371e-18
C51	7#2	VDD	cmodel	5.50352e-18
C52	A2	VSS	cmodel	2.07267e-18
C53	A1	VDD	cmodel	3.91517e-19
C54	B#2	VSS	cmodel	7.92488e-19
C55	7#2	VSS	cmodel	2.23328e-18
C56	7	VSS	cmodel	1.68069e-18
C57	ZN#2	7	cmodel	9.5955e-19
C58	ZN#1	VDD	cmodel	4.53611e-19
C59	ZN#2	VSS	cmodel	2.03899e-18
C60	ZN#3	7	cmodel	5.4005e-19
*
*
.ENDS AOI21_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
