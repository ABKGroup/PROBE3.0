*
*
*
*                       LINUX           Fri Feb  3 22:30:56 2023
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
.SUBCKT OR2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 Z VSS A2 VDD A1
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	7	A1#1	3#3	VDD	pmos_rvt	nfin=2
MM1	VDD	A2#1	7	VDD	pmos_rvt	nfin=2
MM2	Z#1	3	VDD	VDD	pmos_rvt	nfin=2
MM3	3#2	A1#1	VSS	VSS	nmos_rvt	nfin=2
MM4	VSS	A2#1	3#2	VSS	nmos_rvt	nfin=2
MM5	Z#3	3	VSS	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	Z#1	Z#2	M0	    0.1189
Rj2	Z#3	Z#4	M0	    0.1189
Rj3	A1#1	A1#2	M0	    0.2379
Rj4	3	3#2	M0	    1.0704
Rj5	3	3#3	M0	    1.7839
Ri1	Z	Z#4	M1	    5.0422
Ri2	Z	Z#2	M1	    5.0422
Ri3	A2	A2#1	M1	    5.0211
Ri6	A1	A1#2	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A2	Z	cmodel	2.04988e-19
C2	A1	A2	cmodel	1.14408e-18
C3	A2	Z#4	cmodel	7.47312e-19
C4	A2	Z#2	cmodel	4.48261e-19
C5	A1	A1#2	cmodel	1.96562e-18
C6	A2#1	3#2	cmodel	2.51129e-18
C7	A2	3#2	cmodel	1.51613e-18
C8	A2	A1#1	cmodel	2.70127e-19
C9	A2	A2#1	cmodel	1.40649e-18
C10	A1	3#3	cmodel	6.24991e-19
C11	A1	3#2	cmodel	9.37937e-19
C12	A1#1	A2#1	cmodel	4.7965e-19
C13	Z#4	Z#2	cmodel	2.5992e-19
C14	A1	A2#1	cmodel	1.78959e-19
C15	A1#2	3#3	cmodel	3.97741e-19
C16	A2#1	Z#4	cmodel	1.13652e-18
C17	3#2	3#3	cmodel	1.00676e-18
C18	A1#1	3#3	cmodel	5.40336e-19
C19	3#3	VDD	cmodel	6.48942e-18
C20	3	VDD	cmodel	7.44663e-18
C21	Z	VSS	cmodel	1.92955e-19
C22	3#3	VSS	cmodel	2.45343e-18
C23	3#2	3	cmodel	4.92847e-19
C24	A2	VSS	cmodel	1.83873e-18
C25	Z#4	3	cmodel	3.09595e-18
C26	VDD	VSS	cmodel	1.25119e-17
C27	Z	3	cmodel	1.22091e-18
C28	A1	VSS	cmodel	2.01356e-18
C29	A2	VDD	cmodel	3.2239e-19
C30	Z#2	3	cmodel	6.72152e-18
C31	Z#2	VDD	cmodel	1.09179e-18
C32	3#2	VSS	cmodel	2.25155e-18
C33	3	VSS	cmodel	4.10962e-18
C34	A1#2	VSS	cmodel	2.90715e-18
C35	VSS	A1#1	cmodel	2.56534e-18
C36	A1	VDD	cmodel	3.2239e-19
C37	A2	3	cmodel	4.93424e-19
C38	VSS	A2#1	cmodel	5.46439e-18
C39	Z#4	VSS	cmodel	5.90502e-18
C40	A2#1	3	cmodel	2.54839e-18
C41	Z#2	VSS	cmodel	2.66007e-18
*
*
.ENDS OR2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
