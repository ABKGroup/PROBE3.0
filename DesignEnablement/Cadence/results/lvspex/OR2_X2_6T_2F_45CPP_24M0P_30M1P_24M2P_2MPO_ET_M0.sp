*
*
*
*                       LINUX           Fri Feb  3 22:31:10 2023
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
.SUBCKT OR2_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 Z VSS A2 VDD A1
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	7	A1#1	3#4	VDD	pmos_rvt	nfin=2
MM1	VDD	A2#1	7	VDD	pmos_rvt	nfin=2
MM2	Z#2	3	VDD	VDD	pmos_rvt	nfin=2
MM3	VDD	3#3	Z#2	VDD	pmos_rvt	nfin=2
MM4	3#2	A1#1	VSS	VSS	nmos_rvt	nfin=2
MM5	VSS	A2#1	3#2	VSS	nmos_rvt	nfin=2
MM6	Z#4	3	VSS	VSS	nmos_rvt	nfin=2
MM7	VSS	3#3	Z#4	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	Z#1	Z#2	M0	    0.3568
Rj2	Z#3	Z#4	M0	    0.3568
Rj3	A1#1	A1#2	M0	    0.2379
Rj4	3	3#2	M0	    1.0704
Rj5	3#3	3	M0	    0.7136
Rj6	3	3#4	M0	    1.7839
Ri1	Z	Z#3	M1	    5.0422
Ri2	Z	Z#1	M1	    5.0422
Ri3	A2	A2#1	M1	    5.0211
Ri6	A1	A1#2	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A2	Z	cmodel	1.32574e-19
C2	Z#3	A2#1	cmodel	1.97278e-19
C3	A1	A2	cmodel	1.14408e-18
C4	A2#1	Z#4	cmodel	7.26848e-19
C5	A2	Z#3	cmodel	3.12896e-19
C6	A2	Z#1	cmodel	3.10286e-19
C7	A1#1	A2#1	cmodel	4.7965e-19
C8	A1	A1#2	cmodel	1.96562e-18
C9	Z#1	3#3	cmodel	2.30004e-18
C10	3#2	3#4	cmodel	1.00676e-18
C11	A2	3#2	cmodel	1.67182e-18
C12	A2	Z#4	cmodel	1.71196e-19
C13	A2	A1#1	cmodel	2.70127e-19
C14	A2#1	A2	cmodel	1.41375e-18
C15	A1	3#4	cmodel	6.24991e-19
C16	A1#1	3#4	cmodel	5.40336e-19
C17	A1	3#2	cmodel	8.99704e-19
C18	A1	A2#1	cmodel	1.78959e-19
C19	Z#3	Z#1	cmodel	3.27384e-19
C20	A1#2	3#4	cmodel	3.97741e-19
C21	Z#4	Z#2	cmodel	6.62796e-19
C22	Z#2	3#3	cmodel	9.5955e-19
C23	A2#1	3#2	cmodel	2.51129e-18
C24	3#3	VSS	cmodel	1.30202e-18
C25	3#4	VDD	cmodel	6.48942e-18
C26	3	VDD	cmodel	6.85748e-18
C27	Z	VSS	cmodel	4.50011e-19
C28	3#4	VSS	cmodel	2.45107e-18
C29	3#2	3	cmodel	4.92847e-19
C30	A2	VSS	cmodel	1.88298e-18
C31	3#3	VDD	cmodel	3.17439e-18
C32	VDD	VSS	cmodel	1.51704e-17
C33	Z	3	cmodel	8.66078e-19
C34	Z#2	VSS	cmodel	1.17921e-18
C35	A1	VSS	cmodel	2.0101e-18
C36	A2	VDD	cmodel	3.2239e-19
C37	Z#1	VDD	cmodel	4.80843e-19
C38	3#2	VSS	cmodel	2.24889e-18
C39	3	VSS	cmodel	3.35274e-18
C40	Z#4	VSS	cmodel	2.88491e-18
C41	A1#2	VSS	cmodel	2.90715e-18
C42	A1#1	VSS	cmodel	2.56534e-18
C43	A1	VDD	cmodel	3.2239e-19
C44	A2	3	cmodel	4.93424e-19
C45	A2#1	VSS	cmodel	5.45345e-18
C46	Z#2	3	cmodel	1.58884e-18
C47	Z#3	VSS	cmodel	4.39161e-18
C48	A2#1	3	cmodel	2.54839e-18
C49	Z#1	VSS	cmodel	1.81906e-18
*
*
.ENDS OR2_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
