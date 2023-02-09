*
*
*
*                       LINUX           Fri Feb  3 22:36:43 2023
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
.SUBCKT XOR2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A2 VSS A1 Z VDD
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	9	A1#3	5#5	VDD	pmos_rvt	nfin=2
MM1	VDD	A2#2	9	VDD	pmos_rvt	nfin=2
MM2	6#2	5#3	VDD	VDD	pmos_rvt	nfin=2
MM3	Z#3	A1#1	6#2	VDD	pmos_rvt	nfin=2
MM4	6	A2#4	Z#3	VDD	pmos_rvt	nfin=2
MM5	5#2	A1#3	VSS	VSS	nmos_rvt	nfin=2
MM6	VSS	A2#2	5#2	VSS	nmos_rvt	nfin=2
MM7	Z#2	5#3	VSS	VSS	nmos_rvt	nfin=2
MM8	8	A1#1	Z#2	VSS	nmos_rvt	nfin=2
MM9	VSS	A2#4	8	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A2#1	A2#2	M0	    0.4757
Rj2	A2#3	A2#4	M0	    0.2379
Rj3	A1#1	A1#2	M0	    0.4757
Rj4	A1#2	A1#3	M0	    1.6650
Rj7	Z#1	Z#2	M0	    0.3568
Rj8	Z#3	Z#4	M0	    0.3568
Rj15	5	5#2	M0	    0.3568
Rj16	5#3	5#4	M0	    0.7136
Rj17	5#4	5#5	M0	    1.0704
Rj18	6	6#2	M0	    1.4271
Ri1	A2#1	A2#6	M1	    5.1267
Ri2	A2#3	A2#8	M1	    5.0000
Ri3	A1	A1#2	M1	    5.0422
Ri6	Z	Z#1	M1	    5.0211
Ri7	Z	Z#4	M1	    5.0211
Ri13	5#4	5	M1	   10.0422
Rh1	A2#8	A2	M2	    0.1761
Rh2	A2	A2#6	M2	    0.1761
*
*       CAPACITOR CARDS
*
*
C1	A2	Z	cmodel	1.13965e-18
C2	A1#2	A2#4	cmodel	9.31022e-20
C3	A1	Z	cmodel	1.37828e-18
C4	A2	A1#2	cmodel	5.85498e-19
C5	A2	Z#1	cmodel	7.72166e-20
C6	A2	Z#4	cmodel	6.50219e-20
C7	A2	6#2	cmodel	1.44797e-19
C8	A2	Z#3	cmodel	5.73887e-20
C9	A1#1	Z#1	cmodel	1.71357e-18
C10	A2	Z#2	cmodel	5.04565e-20
C11	A2#6	A1	cmodel	1.30175e-18
C12	A2	A1#1	cmodel	6.62474e-20
C13	A2#1	A1	cmodel	2.23881e-18
C14	Z#4	5#3	cmodel	8.41065e-19
C15	A1	Z#4	cmodel	1.75532e-18
C16	A1#2	Z	cmodel	1.01351e-18
C17	Z	Z#1	cmodel	1.00115e-18
C18	A1	6#2	cmodel	6.80546e-19
C19	Z	A2#3	cmodel	8.27356e-19
C20	Z#3	6#2	cmodel	9.5955e-19
C21	A1	Z#2	cmodel	7.87386e-19
C22	A2#3	A1#1	cmodel	1.53975e-19
C23	5#3	A1	cmodel	7.56168e-19
C24	A2#4	A2#3	cmodel	3.41237e-19
C25	A2#6	5#4	cmodel	3.29825e-20
C26	A1#3	5#5	cmodel	1.00676e-18
C27	Z	A1#1	cmodel	5.01705e-19
C28	A2#6	A2#1	cmodel	5.6208e-20
C29	A2#6	A1#2	cmodel	4.02859e-18
C30	A1#1	A2#4	cmodel	6.73949e-19
C31	Z#2	6#2	cmodel	5.27871e-19
C32	5#4	A2#1	cmodel	3.01605e-18
C33	A1#2	5#4	cmodel	4.00201e-19
C34	A2#8	A2#3	cmodel	1.29471e-18
C35	A1#2	A2#3	cmodel	2.72214e-20
C36	Z#1	Z#4	cmodel	1.57932e-18
C37	A2#8	Z#3	cmodel	4.99284e-20
C38	A2#3	Z#1	cmodel	4.11175e-19
C39	A2#6	Z#2	cmodel	3.17495e-19
C40	A2#6	5#3	cmodel	9.65335e-20
C41	A2#1	6#2	cmodel	1.23361e-18
C42	A1#3	5#2	cmodel	2.59302e-18
C43	5#2	5#4	cmodel	1.89679e-18
C44	Z#1	6#2	cmodel	2.13944e-20
C45	A2#8	A2#4	cmodel	1.62419e-19
C46	A1#3	5#4	cmodel	2.5992e-20
C47	Z#4	6#2	cmodel	3.03507e-18
C48	5#4	A2#2	cmodel	3.3698e-18
C49	A1#2	Z#2	cmodel	2.12062e-18
C50	5#3	A2#1	cmodel	2.77035e-18
C51	A1#1	Z#2	cmodel	2.74933e-19
C52	A1#2	5#3	cmodel	1.06308e-18
C53	6	VDD	cmodel	5.4597e-18
C54	Z#4	VSS	cmodel	1.10409e-18
C55	Z#4	VDD	cmodel	4.53611e-19
C56	A2#8	6	cmodel	3.21759e-19
C57	A2#4	VSS	cmodel	2.44535e-18
C58	A2#3	VSS	cmodel	5.64651e-18
C59	A2#4	6	cmodel	5.59219e-19
C60	5	5#4	cmodel	2.46666e-18
C61	A2	VSS	cmodel	9.69041e-19
C62	A2#3	VDD	cmodel	3.2239e-19
C63	A2#3	6	cmodel	8.48159e-19
C64	A2	VDD	cmodel	1.61665e-19
C65	A1	VSS	cmodel	5.47142e-19
C66	A2#6	VDD	cmodel	2.91302e-19
C67	5#5	VSS	cmodel	2.72217e-18
C68	Z	VSS	cmodel	4.52741e-19
C69	VDD	VSS	cmodel	1.63227e-17
C70	A2	6	cmodel	5.69364e-21
C71	A2#8	VDD	cmodel	2.64795e-19
C72	A1#2	5	cmodel	8.74758e-19
C73	Z#3	6	cmodel	1.54421e-18
C74	6#2	VSS	cmodel	6.31704e-19
C75	A1	VDD	cmodel	5.82294e-19
C76	5	VSS	cmodel	1.61094e-18
C77	Z#3	VSS	cmodel	1.80588e-18
C78	5#5	VDD	cmodel	2.05843e-18
C79	6	VSS	cmodel	2.10296e-18
C80	5	Z#2	cmodel	3.22842e-19
C81	5#4	VDD	cmodel	1.28916e-18
C82	A1	5	cmodel	7.4505e-20
C83	A2#6	VSS	cmodel	2.3745e-18
C84	5#2	VSS	cmodel	1.1093e-18
C85	A2#6	5	cmodel	2.79337e-18
C86	A2#8	VSS	cmodel	1.62377e-18
C87	A2#1	VDD	cmodel	3.55659e-18
C88	Z#2	VSS	cmodel	3.48956e-19
C89	VDD	A2#2	cmodel	2.55579e-18
C90	5#4	VSS	cmodel	1.4592e-18
C91	A1#2	VDD	cmodel	2.28288e-20
C92	A1#3	VSS	cmodel	7.6167e-18
C93	A1#3	5	cmodel	2.06699e-18
C94	6#2	VDD	cmodel	5.00545e-18
C95	5#3	VDD	cmodel	7.53956e-19
C96	A2#1	VSS	cmodel	1.14136e-18
C97	A2#2	VSS	cmodel	1.20764e-18
C98	A1#2	VSS	cmodel	6.94199e-18
C99	5#3	VSS	cmodel	5.51461e-19
C100	Z#1	VSS	cmodel	5.728e-19
C101	A1#1	VSS	cmodel	2.66685e-18
*
*
.ENDS XOR2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
