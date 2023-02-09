*
*
*
*                       LINUX           Fri Feb  3 22:37:40 2023
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
.SUBCKT BUF_X4_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 VSS I VDD Z
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	3#6	I#3	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	I#1	3#6	VDD	pmos_rvt	nfin=2
MM2	Z#3	3	VDD	VDD	pmos_rvt	nfin=2
MM3	VDD	3#5	Z#3	VDD	pmos_rvt	nfin=2
MM4	Z#1	3#4	VDD	VDD	pmos_rvt	nfin=2
MM5	VDD	3#3	Z#1	VDD	pmos_rvt	nfin=2
MM6	3#2	I#3	VSS	VSS	nmos_rvt	nfin=2
MM7	VSS	I#1	3#2	VSS	nmos_rvt	nfin=2
MM8	Z#6	3	VSS	VSS	nmos_rvt	nfin=2
MM9	VSS	3#5	Z#6	VSS	nmos_rvt	nfin=2
MM10	Z#4	3#4	VSS	VSS	nmos_rvt	nfin=2
MM11	VSS	3#3	Z#4	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj2	I#1	I#3	M0	    0.7136
Rj3	Z#1	Z#2	M0	    1.0704
Rj4	Z#2	Z#3	M0	    0.3568
Rj5	Z#4	Z#5	M0	    1.0704
Rj6	Z#5	Z#6	M0	    0.3568
Rj9	3	3#2	M0	    1.0704
Rj10	3#3	3#4	M0	    0.7136
Rj11	3#4	3#5	M0	    0.7136
Rj12	3#5	3	M0	    0.7136
Rj13	3	3#6	M0	    1.0704
Ri1	I	I#1	M1	    5.0211
Ri2	Z	Z#5	M1	    5.0422
Ri3	Z	Z#2	M1	    5.0422
*
*       CAPACITOR CARDS
*
*
C1	I	Z	cmodel	1.85202e-20
C2	Z#6	3#5	cmodel	9.5955e-19
C3	I	I#1	cmodel	1.41786e-18
C4	I	Z#5	cmodel	3.22576e-19
C5	I	Z#2	cmodel	3.12542e-19
C6	I	3#6	cmodel	1.73094e-18
C7	I	3#2	cmodel	5.38999e-19
C8	I	Z#6	cmodel	2.87901e-19
C9	Z#5	I#1	cmodel	1.71244e-19
C10	Z#4	3#4	cmodel	2.87887e-18
C11	Z#4	3#3	cmodel	1.54421e-18
C12	I#1	3#6	cmodel	2.7746e-18
C13	Z	3#5	cmodel	1.43827e-18
C14	3#2	I#1	cmodel	2.73911e-18
C15	I#1	Z#6	cmodel	2.54272e-19
C16	Z#5	3#5	cmodel	2.88617e-18
C17	Z#5	3#4	cmodel	9.5955e-19
C18	3#5	Z#2	cmodel	2.88617e-18
C19	3#4	Z#2	cmodel	9.5955e-19
C20	3#2	3#6	cmodel	4.332e-20
C21	I#3	3#6	cmodel	1.58884e-18
C22	3#5	Z#3	cmodel	9.5955e-19
C23	3#2	I#3	cmodel	1.58884e-18
C24	3#4	Z#1	cmodel	2.87887e-18
C25	3#3	Z#1	cmodel	1.54421e-18
C26	Z#4	VSS	cmodel	3.52743e-18
C27	I#3	VSS	cmodel	2.7862e-18
C28	I#3	VDD	cmodel	8.50456e-19
C29	I	VSS	cmodel	1.87745e-18
C30	VDD	VSS	cmodel	2.00316e-17
C31	3#5	VSS	cmodel	3.82592e-19
C32	3	Z#3	cmodel	1.58884e-18
C33	Z	VSS	cmodel	1.2475e-19
C34	3#4	VSS	cmodel	6.2252e-19
C35	I	VDD	cmodel	7.20036e-19
C36	3	VSS	cmodel	7.01715e-18
C37	3#3	VSS	cmodel	2.43913e-18
C38	I#1	VSS	cmodel	3.14743e-19
C39	3#6	VDD	cmodel	1.62681e-18
C40	Z#5	VSS	cmodel	2.98747e-18
C41	Z#2	VSS	cmodel	9.11097e-19
C42	Z#3	VDD	cmodel	2.54582e-18
C43	Z#1	VDD	cmodel	4.4738e-18
C44	3	VDD	cmodel	1.82683e-18
C45	3#3	VDD	cmodel	1.2099e-18
C46	3#6	VSS	cmodel	1.28777e-18
C47	Z#3	VSS	cmodel	9.95835e-19
C48	Z#1	VSS	cmodel	1.51405e-18
C49	Z#6	3	cmodel	1.58884e-18
C50	3#2	VSS	cmodel	5.65749e-18
C51	Z#2	VDD	cmodel	4.59555e-18
C52	Z#6	VSS	cmodel	1.44089e-18
*
*
.ENDS BUF_X4_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
