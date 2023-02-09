*
*
*
*                       LINUX           Fri Feb  3 22:29:07 2023
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
.SUBCKT INV_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 I VSS ZN VDD
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	I#2	ZN#2	VDD	pmos_rvt	nfin=2
MM1	VSS	I#2	ZN#4	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	I#1	I#2	M0	    0.2379
Rj2	ZN#1	ZN#2	M0	    0.1189
Rj3	ZN#3	ZN#4	M0	    0.1189
Ri1	I	I#1	M1	    5.0211
Ri2	ZN	ZN#3	M1	    5.0422
Ri3	ZN	ZN#1	M1	    5.0422
*
*       CAPACITOR CARDS
*
*
C1	ZN#3	I	cmodel	2.4487e-18
C2	I#1	I	cmodel	1.38611e-18
C3	I	ZN#4	cmodel	5.79422e-19
C4	I#2	I	cmodel	7.45576e-19
C5	ZN#1	ZN#2	cmodel	9.28616e-19
C6	ZN#3	ZN#4	cmodel	1.26583e-18
C7	ZN#3	I#2	cmodel	5.65113e-19
C8	ZN#4	ZN#2	cmodel	6.55791e-19
C9	I#2	ZN#4	cmodel	3.06046e-18
C10	ZN#2	VSS	cmodel	1.52096e-18
C11	ZN#1	VDD	cmodel	8.43027e-19
C12	I	VSS	cmodel	1.71994e-18
C13	ZN#4	VSS	cmodel	2.06597e-18
C14	I	VDD	cmodel	5.04642e-19
C15	I#1	VDD	cmodel	2.93694e-19
C16	ZN	VSS	cmodel	7.84e-19
C17	VDD	VSS	cmodel	8.63056e-18
C18	I#2	VSS	cmodel	4.57142e-18
C19	I#2	VDD	cmodel	2.46114e-19
C20	ZN#3	VSS	cmodel	1.40609e-18
C21	ZN#1	VSS	cmodel	5.37928e-19
C22	I#1	VSS	cmodel	2.91268e-18
C23	ZN#2	VDD	cmodel	3.62062e-18
*
*
.ENDS INV_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
