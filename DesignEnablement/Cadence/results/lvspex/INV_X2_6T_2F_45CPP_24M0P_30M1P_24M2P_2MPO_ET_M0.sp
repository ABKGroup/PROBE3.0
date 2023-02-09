*
*
*
*                       LINUX           Fri Feb  3 22:29:21 2023
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
.SUBCKT INV_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 I VSS ZN VDD
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#1	I#3	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	I#1	ZN#1	VDD	pmos_rvt	nfin=2
MM2	ZN#3	I#3	VSS	VSS	nmos_rvt	nfin=2
MM3	VSS	I#1	ZN#3	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj2	I#1	I#3	M0	    0.7136
Rj3	ZN#1	ZN#2	M0	    0.1189
Rj4	ZN#3	ZN#4	M0	    0.1189
Ri1	I	I#1	M1	    5.0211
Ri2	ZN	ZN#4	M1	    5.0422
Ri3	ZN	ZN#2	M1	    5.0422
*
*       CAPACITOR CARDS
*
*
C1	ZN	I	cmodel	9.37547e-19
C2	ZN#4	I	cmodel	2.77691e-18
C3	ZN#2	I	cmodel	1.06544e-18
C4	I	I#1	cmodel	1.63343e-18
C5	ZN#4	I#1	cmodel	1.54421e-18
C6	ZN	I#3	cmodel	1.0603e-18
C7	I#1	ZN#2	cmodel	1.54421e-18
C8	ZN#4	I#3	cmodel	2.16844e-18
C9	I#3	ZN#2	cmodel	2.16844e-18
C10	ZN#2	VDD	cmodel	2.01458e-18
C11	I	VSS	cmodel	2.03581e-18
C12	I	VDD	cmodel	5.98307e-19
C13	I#1	VDD	cmodel	5.74828e-19
C14	ZN	VSS	cmodel	1.75969e-19
C15	VDD	VSS	cmodel	1.17492e-17
C16	I#3	VSS	cmodel	2.16033e-18
C17	I#3	VDD	cmodel	6.39948e-19
C18	ZN#4	VSS	cmodel	6.19842e-18
C19	ZN#2	VSS	cmodel	2.29893e-18
C20	I#1	VSS	cmodel	2.03903e-18
*
*
.ENDS INV_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
