*
*
*
*                       LINUX           Fri Feb  3 22:37:12 2023
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
.SUBCKT BUF_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 VSS I VDD Z
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	I#1	3#2	VDD	pmos_rvt	nfin=2
MM1	Z#1	3	VDD	VDD	pmos_rvt	nfin=2
MM2	VSS	I#1	3#3	VSS	nmos_rvt	nfin=2
MM3	Z#3	3	VSS	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	I#1	I#2	M0	    0.2379
Rj2	Z#1	Z#2	M0	    0.3568
Rj3	Z#3	Z#4	M0	    0.3568
Rj5	3	3#2	M0	    1.0704
Rj6	3	3#3	M0	    1.0704
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
C5	I	3#2	cmodel	4.93424e-19
C6	I	3#3	cmodel	1.45342e-18
C7	Z#4	Z#2	cmodel	4.332e-20
C8	I#2	3#3	cmodel	2.16844e-18
C9	I#1	Z#4	cmodel	7.85818e-19
C10	3#3	3#2	cmodel	1.3031e-18
C11	Z#3	Z#1	cmodel	7.19112e-19
C12	I#1	3#3	cmodel	1.51743e-18
C13	I	VSS	cmodel	2.17802e-18
C14	VDD	VSS	cmodel	1.04403e-17
C15	Z	VSS	cmodel	1.90835e-19
C16	3#2	VDD	cmodel	4.51762e-18
C17	Z#4	3	cmodel	2.39971e-18
C18	I	VDD	cmodel	3.2239e-19
C19	VSS	3	cmodel	3.54442e-18
C20	I#2	VSS	cmodel	2.82552e-18
C21	Z#4	VSS	cmodel	3.87748e-18
C22	Z#2	3	cmodel	5.32904e-18
C23	Z#2	VSS	cmodel	1.851e-18
C24	Z#1	VDD	cmodel	1.14002e-18
C25	3	VDD	cmodel	4.16029e-18
C26	3#2	VSS	cmodel	1.55506e-18
C27	Z#1	VSS	cmodel	1.27023e-18
C28	Z	3	cmodel	1.21892e-18
C29	3#3	VSS	cmodel	1.87702e-18
C30	Z#3	VSS	cmodel	3.67226e-18
C31	Z#2	VDD	cmodel	5.30756e-19
C32	I#1	VSS	cmodel	2.38907e-18
*
*
.ENDS BUF_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
