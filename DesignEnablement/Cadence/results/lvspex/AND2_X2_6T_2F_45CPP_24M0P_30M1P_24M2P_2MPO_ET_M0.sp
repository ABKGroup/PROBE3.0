*
*
*
*                       LINUX           Fri Feb  3 22:30:15 2023
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
.SUBCKT AND2_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 Z VSS A2 VDD A1
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
MM2	Z#2	3	VDD	VDD	pmos_rvt	nfin=2
MM3	VDD	3#3	Z#2	VDD	pmos_rvt	nfin=2
MM4	7	A1#1	3#4	VSS	nmos_rvt	nfin=2
MM5	VSS	A2#1	7	VSS	nmos_rvt	nfin=2
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
C1	A2	Z	cmodel	2.80301e-20
C2	A1	A2	cmodel	1.06104e-18
C3	3#3	Z#2	cmodel	9.5955e-19
C4	Z	3#3	cmodel	1.32698e-18
C5	A2	Z#3	cmodel	3.12896e-19
C6	A2	Z#1	cmodel	3.10286e-19
C7	A1	A1#2	cmodel	1.39053e-18
C8	A2	3#2	cmodel	4.93424e-19
C9	A2	Z#4	cmodel	1.71196e-19
C10	A2	A1#1	cmodel	2.70127e-19
C11	A2	A2#1	cmodel	1.41375e-18
C12	A2#1	Z#4	cmodel	7.26848e-19
C13	3#4	A1	cmodel	1.55181e-18
C14	A1#1	A2#1	cmodel	4.7965e-19
C15	A1	A2#1	cmodel	1.78959e-19
C16	Z#4	3#3	cmodel	9.5955e-19
C17	A1#2	3#4	cmodel	2.16844e-18
C18	Z#3	A2#1	cmodel	1.97278e-19
C19	Z#3	3#3	cmodel	1.77042e-18
C20	3#4	3#2	cmodel	1.00676e-18
C21	3#3	Z#1	cmodel	1.77042e-18
C22	A1#1	3#4	cmodel	2.21367e-18
C23	3	3#2	cmodel	4.92847e-19
C24	3#3	VSS	cmodel	8.64901e-19
C25	3#2	VDD	cmodel	4.51762e-18
C26	Z	VSS	cmodel	1.9386e-19
C27	3	Z#2	cmodel	1.58884e-18
C28	Z#2	VDD	cmodel	1.04399e-18
C29	3#2	VSS	cmodel	1.60439e-18
C30	A2	VSS	cmodel	1.8767e-18
C31	A2#1	3	cmodel	4.42651e-18
C32	Z#2	VSS	cmodel	1.23176e-18
C33	VDD	VSS	cmodel	1.54314e-17
C34	3#4	VDD	cmodel	1.08762e-18
C35	3#4	VSS	cmodel	3.25847e-18
C36	A1	VSS	cmodel	1.76791e-18
C37	A2	VDD	cmodel	3.2239e-19
C38	3	VSS	cmodel	3.66953e-18
C39	Z#1	VDD	cmodel	1.49168e-18
C40	VSS	Z#4	cmodel	2.83804e-18
C41	A1#2	VSS	cmodel	2.82552e-18
C42	A2	3	cmodel	1.591e-18
C43	VSS	A1#1	cmodel	2.42212e-18
C44	A1	VDD	cmodel	5.98307e-19
C45	A2#1	VSS	cmodel	5.40281e-18
C46	Z#3	VSS	cmodel	4.3877e-18
C47	3	VDD	cmodel	4.54397e-18
C48	Z#4	3	cmodel	1.58884e-18
C49	Z#1	VSS	cmodel	1.52779e-18
*
*
.ENDS AND2_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
