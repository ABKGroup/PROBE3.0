*
*
*
*                       LINUX           Fri Feb  3 22:37:26 2023
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
.SUBCKT BUF_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 VSS I VDD Z
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	I#1	3#4	VDD	pmos_rvt	nfin=2
MM1	Z#1	3	VDD	VDD	pmos_rvt	nfin=2
MM2	VDD	3#3	Z#1	VDD	pmos_rvt	nfin=2
MM3	VSS	I#1	3#2	VSS	nmos_rvt	nfin=2
MM4	Z#3	3	VSS	VSS	nmos_rvt	nfin=2
MM5	VSS	3#3	Z#3	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	I#1	I#2	M0	    0.2379
Rj2	Z#1	Z#2	M0	    0.3568
Rj3	Z#3	Z#4	M0	    0.3568
Rj5	3	3#2	M0	    1.0704
Rj6	3#3	3	M0	    0.7136
Rj7	3	3#4	M0	    1.0704
Ri1	I	I#2	M1	    5.0211
Ri2	Z	Z#4	M1	    5.0422
Ri3	Z	Z#2	M1	    5.0422
*
*       CAPACITOR CARDS
*
*
C1	I	Z	cmodel	2.00776e-19
C2	I	I#2	cmodel	1.39053e-18
C3	I	Z#4	cmodel	8.06534e-19
C4	I	Z#2	cmodel	4.64238e-19
C5	I	3#4	cmodel	4.93424e-19
C6	I	3#2	cmodel	1.45342e-18
C7	I#1	3#2	cmodel	1.51743e-18
C8	Z#1	3#3	cmodel	1.54421e-18
C9	Z#4	Z#2	cmodel	3.8988e-20
C10	I#2	3#2	cmodel	2.16844e-18
C11	I#1	Z#4	cmodel	7.85818e-19
C12	3#2	3#4	cmodel	1.3031e-18
C13	Z#3	Z#1	cmodel	6.47201e-19
C14	3#3	VSS	cmodel	2.14902e-18
C15	3#3	VDD	cmodel	3.4879e-18
C16	I	VSS	cmodel	2.17802e-18
C17	VDD	VSS	cmodel	1.3139e-17
C18	Z#1	3	cmodel	9.5955e-19
C19	Z	VSS	cmodel	1.90835e-19
C20	3#4	VDD	cmodel	4.51762e-18
C21	Z#4	3	cmodel	2.39971e-18
C22	I	VDD	cmodel	3.2239e-19
C23	3	VSS	cmodel	2.69676e-18
C24	I#2	VSS	cmodel	2.82552e-18
C25	Z#4	VSS	cmodel	3.87748e-18
C26	3	Z#2	cmodel	5.44062e-18
C27	Z#2	VSS	cmodel	1.84538e-18
C28	3#4	VSS	cmodel	1.56544e-18
C29	VDD	3	cmodel	4.57218e-18
C30	Z#1	VSS	cmodel	1.17249e-18
C31	Z	3	cmodel	1.21892e-18
C32	VSS	3#2	cmodel	1.87702e-18
C33	Z#3	VSS	cmodel	3.67226e-18
C34	Z#2	VDD	cmodel	4.80843e-19
C35	I#1	VSS	cmodel	2.38907e-18
*
*
.ENDS BUF_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
