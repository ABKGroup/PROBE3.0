*
*
*
*                       LINUX           Fri Feb  3 22:30:02 2023
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
.SUBCKT AND2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 Z VSS A2 VDD A1
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	3#2	A1#1	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	A2#1	3#2	VDD	pmos_rvt	nfin=2
MM2	Z#3	3	VDD	VDD	pmos_rvt	nfin=2
MM3	7	A1#1	3#3	VSS	nmos_rvt	nfin=2
MM4	VSS	A2#1	7	VSS	nmos_rvt	nfin=2
MM5	Z#1	3	VSS	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	Z#1	Z#2	M0	    0.1189
Rj2	Z#3	Z#4	M0	    0.1189
Rj3	A1#1	A1#2	M0	    0.2379
Rj4	3	3#2	M0	    1.0704
Rj5	3	3#3	M0	    1.7839
Ri1	Z	Z#2	M1	    5.0422
Ri2	Z	Z#4	M1	    5.0422
Ri3	A2	A2#1	M1	    5.0211
Ri6	A1	A1#2	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A2	Z	cmodel	2.04988e-19
C2	A1	A2	cmodel	1.06104e-18
C3	A2	Z#2	cmodel	7.47312e-19
C4	A2	Z#4	cmodel	4.48261e-19
C5	A1	A1#2	cmodel	1.39053e-18
C6	A2	3#2	cmodel	4.93424e-19
C7	A2	A1#1	cmodel	2.70127e-19
C8	A2	A2#1	cmodel	1.40649e-18
C9	A1	3#3	cmodel	1.55181e-18
C10	A1#1	A2#1	cmodel	4.7965e-19
C11	Z#2	Z#4	cmodel	2.5992e-19
C12	A1	A2#1	cmodel	1.78959e-19
C13	A1#2	3#3	cmodel	2.16844e-18
C14	A2#1	Z#2	cmodel	1.13652e-18
C15	3#3	3#2	cmodel	1.00676e-18
C16	A1#1	3#3	cmodel	2.21367e-18
C17	3	3#2	cmodel	4.92847e-19
C18	Z#2	3	cmodel	3.09595e-18
C19	3#2	VDD	cmodel	4.51762e-18
C20	Z	VSS	cmodel	1.92955e-19
C21	Z#4	3	cmodel	7.86398e-18
C22	3#2	VSS	cmodel	1.60439e-18
C23	A2	VSS	cmodel	1.8337e-18
C24	A2#1	3	cmodel	4.42651e-18
C25	Z	3	cmodel	1.22091e-18
C26	VDD	VSS	cmodel	1.27156e-17
C27	3#3	VDD	cmodel	1.08762e-18
C28	3#3	VSS	cmodel	3.25847e-18
C29	A1	VSS	cmodel	1.76791e-18
C30	A2	VDD	cmodel	3.2239e-19
C31	3	VSS	cmodel	3.75675e-18
C32	Z#4	VDD	cmodel	1.63604e-18
C33	A1#2	VSS	cmodel	2.82552e-18
C34	A2	3	cmodel	1.4505e-18
C35	VSS	A1#1	cmodel	2.42212e-18
C36	A1	VDD	cmodel	5.98307e-19
C37	A2#1	VSS	cmodel	5.41375e-18
C38	Z#2	VSS	cmodel	5.90502e-18
C39	3	VDD	cmodel	4.36248e-18
C40	Z#4	VSS	cmodel	2.634e-18
*
*
.ENDS AND2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
