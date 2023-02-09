*
*
*
*                       LINUX           Fri Feb  3 22:29:34 2023
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
.SUBCKT INV_X4_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 I VSS ZN VDD
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#3	I#5	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	I#4	ZN#3	VDD	pmos_rvt	nfin=2
MM2	ZN#1	I#3	VDD	VDD	pmos_rvt	nfin=2
MM3	VDD	I#1	ZN#1	VDD	pmos_rvt	nfin=2
MM4	ZN#6	I#5	VSS	VSS	nmos_rvt	nfin=2
MM5	VSS	I#4	ZN#6	VSS	nmos_rvt	nfin=2
MM6	ZN#4	I#3	VSS	VSS	nmos_rvt	nfin=2
MM7	VSS	I#1	ZN#4	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj2	I#1	I#3	M0	    0.7136
Rj3	I#3	I#4	M0	    0.7136
Rj4	I#4	I#5	M0	    0.7136
Rj5	ZN#1	ZN#2	M0	    0.1189
Rj6	ZN#2	ZN#3	M0	    1.3082
Rj7	ZN#4	ZN#5	M0	    0.1189
Rj8	ZN#5	ZN#6	M0	    1.3082
Ri1	I	I#1	M1	    5.0211
Ri2	ZN	ZN#5	M1	    5.0422
Ri3	ZN	ZN#2	M1	    5.0422
*
*       CAPACITOR CARDS
*
*
C1	ZN#2	I	cmodel	3.43972e-18
C2	I	I#1	cmodel	2.65362e-18
C3	ZN#5	ZN#2	cmodel	1.39465e-18
C4	ZN#2	I#1	cmodel	1.54421e-18
C5	ZN#2	I#4	cmodel	2.90097e-19
C6	ZN#2	I#3	cmodel	4.34866e-18
C7	ZN#6	ZN#3	cmodel	1.59851e-18
C8	ZN#3	I#5	cmodel	1.58884e-18
C9	ZN#3	I#4	cmodel	3.52824e-18
C10	I#4	VDD	cmodel	3.89978e-18
C11	ZN#2	VDD	cmodel	4.80843e-19
C12	I	VSS	cmodel	1.55912e-18
C13	ZN#3	VSS	cmodel	1.78397e-18
C14	I#3	VDD	cmodel	3.58628e-18
C15	I	VDD	cmodel	8.60523e-19
C16	I#1	VDD	cmodel	3.33142e-18
C17	ZN	VSS	cmodel	7.84e-19
C18	VDD	VSS	cmodel	1.58386e-17
C19	ZN#6	VSS	cmodel	6.8433e-18
C20	ZN#5	VSS	cmodel	8.19743e-18
C21	ZN#2	VSS	cmodel	1.86291e-18
C22	I#5	VSS	cmodel	2.14233e-18
C23	I#1	VSS	cmodel	1.40739e-18
C24	I#4	VSS	cmodel	5.49136e-19
C25	I#5	VDD	cmodel	3.53172e-18
C26	I#3	VSS	cmodel	5.19169e-19
*
*
.ENDS INV_X4_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
