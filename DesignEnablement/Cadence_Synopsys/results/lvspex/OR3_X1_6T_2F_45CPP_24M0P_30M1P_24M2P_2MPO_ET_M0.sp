*
*
*
*                       LINUX           Fri Feb  3 22:31:25 2023
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
.SUBCKT OR3_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A1 VSS Z A3 VDD A2
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
MM4	VSS	A1#1	3#4	VSS	nmos_rvt	nfin=2
MM5	3#3	A2#1	VSS	VSS	nmos_rvt	nfin=2
MM6	VSS	A3#1	3#3	VSS	nmos_rvt	nfin=2
MM7	Z#3	3	VSS	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A1#1	A1#2	M0	    0.2379
Rj2	Z#1	Z#2	M0	    0.3568
Rj3	Z#3	Z#4	M0	    0.3568
Rj5	A3#1	A3#2	M0	    0.2379
Rj11	3	3#2	M0	    2.4975
Rj12	3	3#3	M0	    1.0704
Rj13	3#3	3#4	M0	    1.4271
Ri1	A1	A1#2	M1	    5.0211
Ri2	Z	Z#4	M1	    5.0422
Ri3	Z	Z#2	M1	    5.0422
Ri5	A3	A3#2	M1	    5.0211
Ri10	A2	A2#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A1	A3	cmodel	2.33405e-19
C2	A1	A2	cmodel	9.29284e-19
C3	A1	A1#2	cmodel	1.39452e-18
C4	A3	Z	cmodel	9.19676e-20
C5	A1	A3#2	cmodel	1.63814e-19
C6	A1	3#2	cmodel	4.93424e-19
C7	3#3	A2#1	cmodel	4.95962e-18
C8	A1	3#4	cmodel	1.45541e-18
C9	A2	A3	cmodel	3.02285e-18
C10	A3#1	3#3	cmodel	1.51743e-18
C11	A3	A3#2	cmodel	1.34889e-18
C12	A3#1	Z#4	cmodel	7.89033e-19
C13	A3	Z#4	cmodel	7.67191e-19
C14	A3	Z#2	cmodel	4.03435e-19
C15	3#4	3#2	cmodel	1.66342e-18
C16	A2#1	Z#2	cmodel	5.14079e-19
C17	A2	Z#2	cmodel	3.74967e-19
C18	3#3	3#2	cmodel	4.15872e-19
C19	A3	3#3	cmodel	1.18166e-18
C20	A2	3#2	cmodel	5.38999e-19
C21	A3	A1#1	cmodel	1.78532e-19
C22	A3	A2#1	cmodel	4.30418e-19
C23	A2	3#3	cmodel	1.24878e-18
C24	A2#1	3#2	cmodel	2.4758e-18
C25	A2	A2#1	cmodel	1.48083e-18
C26	Z#4	Z#2	cmodel	4.332e-20
C27	Z#3	Z#1	cmodel	7.19112e-19
C28	A1#2	3#4	cmodel	2.16844e-18
C29	A1#1	3#4	cmodel	2.21367e-18
C30	A3#2	3#3	cmodel	2.16844e-18
C31	A1#1	A3#2	cmodel	1.0072e-19
C32	3#3	VSS	cmodel	2.37108e-18
C33	A3#2	VSS	cmodel	2.31721e-18
C34	3#3	3	cmodel	6.47504e-19
C35	Z#3	VSS	cmodel	3.67226e-18
C36	A2	VDD	cmodel	5.0036e-19
C37	Z#4	VSS	cmodel	3.89696e-18
C38	A1	VSS	cmodel	2.15868e-18
C39	A1#1	VSS	cmodel	2.46709e-18
C40	A3	3	cmodel	3.49553e-19
C41	Z#2	VSS	cmodel	1.19338e-18
C42	A2#1	VSS	cmodel	1.10063e-18
C43	A1	VDD	cmodel	3.2239e-19
C44	Z	VSS	cmodel	1.92955e-19
C45	VSS	A3#1	cmodel	2.38907e-18
C46	Z#4	3	cmodel	2.39971e-18
C47	A3	VSS	cmodel	1.80332e-18
C48	Z#2	VDD	cmodel	5.30756e-19
C49	3	VDD	cmodel	8.10389e-18
C50	3#2	VSS	cmodel	2.18067e-18
C51	VDD	VSS	cmodel	1.45563e-17
C52	Z#1	VDD	cmodel	1.14002e-18
C53	A2	VSS	cmodel	1.87699e-18
C54	Z#2	3	cmodel	5.32904e-18
C55	VSS	3	cmodel	4.12471e-18
C56	Z#1	VSS	cmodel	1.27023e-18
C57	A2#1	3	cmodel	2.3115e-18
C58	A3	VDD	cmodel	3.2239e-19
C59	3#4	VSS	cmodel	2.48987e-18
C60	A1#2	VSS	cmodel	2.82552e-18
C61	3#2	VDD	cmodel	8.14256e-18
C62	Z	3	cmodel	1.22091e-18
*
*
.ENDS OR3_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
