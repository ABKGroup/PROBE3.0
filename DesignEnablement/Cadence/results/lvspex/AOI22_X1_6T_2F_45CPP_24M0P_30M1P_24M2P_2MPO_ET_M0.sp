*
*
*
*                       LINUX           Fri Feb  3 22:35:44 2023
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
.SUBCKT AOI22_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 B2 A2 VSS A1 VDD ZN B1
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	B2#1	7#3	VDD	pmos_rvt	nfin=2
MM1	7#2	B1#1	VDD	VDD	pmos_rvt	nfin=2
MM2	ZN#3	A1#2	7#2	VDD	pmos_rvt	nfin=2
MM3	7	A2#1	ZN#3	VDD	pmos_rvt	nfin=2
MM4	10	B2#1	VSS	VSS	nmos_rvt	nfin=2
MM5	ZN#2	B1#1	10	VSS	nmos_rvt	nfin=2
MM6	9	A1#2	ZN#2	VSS	nmos_rvt	nfin=2
MM7	VSS	A2#1	9	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	B2#1	B2#2	M0	    0.2379
Rj2	A1#1	A1#2	M0	    0.2379
Rj4	ZN#1	ZN#2	M0	    0.1189
Rj5	ZN#3	ZN#4	M0	    0.5946
Rj10	7	7#2	M0	    1.4271
Rj11	7#2	7#3	M0	    1.4271
Ri1	B2	B2#2	M1	    5.0211
Ri2	A2	A2#1	M1	    5.0211
Ri3	A1	A1#1	M1	    5.0211
Ri6	ZN	ZN#1	M1	    5.0422
Ri7	ZN	ZN#4	M1	    5.0422
Ri13	B1	B1#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	B2	B1	cmodel	1.10469e-18
C2	A1	A2	cmodel	3.23905e-18
C3	B2	B2#2	cmodel	1.96961e-18
C4	B2	ZN#1	cmodel	2.02306e-19
C5	B2	7#3	cmodel	6.24991e-19
C6	ZN#2	B1#1	cmodel	3.06046e-18
C7	ZN	A1	cmodel	1.01019e-18
C8	ZN#2	A1#1	cmodel	8.10743e-19
C9	B2	ZN#2	cmodel	2.66287e-19
C10	B2	B1#1	cmodel	8.27706e-19
C11	A2	A1#1	cmodel	5.0614e-19
C12	B1	ZN	cmodel	1.01358e-18
C13	ZN#2	A1#2	cmodel	2.19914e-18
C14	A2	ZN#2	cmodel	2.17251e-19
C15	ZN#1	A1	cmodel	1.79898e-18
C16	A1#2	ZN#4	cmodel	1.86441e-18
C17	ZN#4	A1	cmodel	1.01351e-18
C18	A1	A1#1	cmodel	7.97977e-19
C19	A2#1	A2	cmodel	1.87584e-18
C20	ZN#2	A2#1	cmodel	5.90035e-19
C21	A1	7#2	cmodel	2.42106e-19
C22	A1	ZN#3	cmodel	3.78861e-19
C23	B1	ZN#1	cmodel	1.01351e-18
C24	7#2	ZN#3	cmodel	1.2152e-18
C25	B1	ZN#4	cmodel	2.53081e-18
C26	A1	ZN#2	cmodel	5.27153e-19
C27	A1#2	A1	cmodel	1.81447e-19
C28	A1	A2#1	cmodel	3.85392e-19
C29	B1#1	A1#2	cmodel	5.72338e-19
C30	B1	7#2	cmodel	8.43771e-19
C31	B2#1	7#3	cmodel	5.40336e-19
C32	ZN	B1#1	cmodel	3.85392e-19
C33	ZN	A1#2	cmodel	4.2502e-19
C34	ZN#2	7#2	cmodel	2.17877e-19
C35	B1	ZN#2	cmodel	5.38999e-19
C36	B1#1	7#3	cmodel	6.16879e-19
C37	B1	B1#1	cmodel	1.72488e-18
C38	B2#2	7#3	cmodel	3.97741e-19
C39	B1	A1#2	cmodel	1.4024e-19
C40	B1#1	7#2	cmodel	1.17456e-18
C41	ZN#4	7#2	cmodel	3.71036e-18
C42	A1#2	ZN#3	cmodel	2.90097e-19
C43	A1#1	ZN#3	cmodel	2.09656e-18
C44	ZN#1	ZN#2	cmodel	1.61154e-18
C45	B2#1	ZN#2	cmodel	7.31251e-19
C46	ZN#1	B2#1	cmodel	1.34955e-19
C47	ZN#2	ZN#4	cmodel	5.31606e-19
C48	B2#1	VSS	cmodel	2.55934e-18
C49	7#3	VSS	cmodel	2.3015e-18
C50	B2	VSS	cmodel	2.15421e-18
C51	B1#1	VSS	cmodel	2.29952e-18
C52	7#3	VDD	cmodel	5.50352e-18
C53	B1	VDD	cmodel	5.0036e-19
C54	B2#2	VSS	cmodel	2.90715e-18
C55	B2	VDD	cmodel	3.2239e-19
C56	A2	VSS	cmodel	2.0155e-18
C57	A1#2	VSS	cmodel	2.29436e-19
C58	7#2	VSS	cmodel	9.95874e-19
C59	ZN#4	VDD	cmodel	4.80843e-19
C60	7	VDD	cmodel	5.4597e-18
C61	VSS	A2#1	cmodel	6.46704e-18
C62	ZN#3	VSS	cmodel	1.73621e-18
C63	A2	VDD	cmodel	3.2239e-19
C64	ZN#1	VSS	cmodel	1.04621e-18
C65	A1	VSS	cmodel	1.86549e-18
C66	VDD	7#2	cmodel	7.21121e-18
C67	ZN#3	7	cmodel	1.54421e-18
C68	ZN#4	VSS	cmodel	1.44539e-18
C69	VDD	VSS	cmodel	1.44459e-17
C70	A2	7	cmodel	6.24991e-19
C71	A1#1	VSS	cmodel	1.19241e-18
C72	A2#1	7	cmodel	8.66792e-19
C73	A1	VDD	cmodel	3.2239e-19
C74	B1	VSS	cmodel	2.76724e-18
C75	ZN#2	VSS	cmodel	7.30323e-18
C76	7	VSS	cmodel	1.86271e-18
*
*
.ENDS AOI22_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
