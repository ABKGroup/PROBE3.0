*
*
*
*                       LINUX           Fri Feb  3 22:29:48 2023
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
.SUBCKT INV_X8_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 I VSS ZN VDD
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	ZN#5	I#9	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	I#8	ZN#5	VDD	pmos_rvt	nfin=2
MM2	ZN#3	I#6	VDD	VDD	pmos_rvt	nfin=2
MM3	VDD	I#5	ZN#3	VDD	pmos_rvt	nfin=2
MM4	ZN#2	I#4	VDD	VDD	pmos_rvt	nfin=2
MM5	VDD	I#3	ZN#2	VDD	pmos_rvt	nfin=2
MM6	ZN#1	I#2	VDD	VDD	pmos_rvt	nfin=2
MM7	VDD	I#1	ZN#1	VDD	pmos_rvt	nfin=2
MM8	ZN#10	I#9	VSS	VSS	nmos_rvt	nfin=2
MM9	VSS	I#8	ZN#10	VSS	nmos_rvt	nfin=2
MM10	ZN#8	I#6	VSS	VSS	nmos_rvt	nfin=2
MM11	VSS	I#5	ZN#8	VSS	nmos_rvt	nfin=2
MM12	ZN#7	I#4	VSS	VSS	nmos_rvt	nfin=2
MM13	VSS	I#3	ZN#7	VSS	nmos_rvt	nfin=2
MM14	ZN#6	I#2	VSS	VSS	nmos_rvt	nfin=2
MM15	VSS	I#1	ZN#6	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	I#1	I#2	M0	    0.7136
Rj2	I#2	I#3	M0	    0.7136
Rj3	I#3	I#4	M0	    0.7136
Rj4	I#4	I#5	M0	    0.7136
Rj5	I#5	I#6	M0	    0.7136
Rj6	I#6	I#7	M0	    0.2379
Rj7	I#7	I#8	M0	    0.4757
Rj8	I#8	I#9	M0	    0.7136
Rj9	ZN#1	ZN#2	M0	    1.4271
Rj10	ZN#2	ZN#3	M0	    1.4271
Rj11	ZN#3	ZN#4	M0	    0.1189
Rj12	ZN#4	ZN#5	M0	    1.3082
Rj13	ZN#6	ZN#7	M0	    1.4271
Rj14	ZN#7	ZN#8	M0	    1.4271
Rj15	ZN#8	ZN#9	M0	    0.1189
Rj16	ZN#9	ZN#10	M0	    1.3082
Ri1	I	I#7	M1	    5.0211
Ri2	ZN	ZN#9	M1	    5.0422
Ri3	ZN	ZN#4	M1	    5.0422
*
*       CAPACITOR CARDS
*
*
C1	I	I#7	cmodel	2.23728e-18
C2	I	ZN#9	cmodel	3.82563e-18
C3	I#9	ZN#10	cmodel	1.58884e-18
C4	I	ZN#4	cmodel	4.93424e-19
C5	I#8	ZN#10	cmodel	3.20356e-18
C6	I#7	ZN#9	cmodel	1.53914e-18
C7	ZN#9	ZN#4	cmodel	2.27114e-18
C8	I#7	ZN#10	cmodel	2.90097e-19
C9	I#4	ZN#7	cmodel	3.85293e-18
C10	I#6	ZN#9	cmodel	3.07701e-18
C11	I#3	ZN#7	cmodel	3.85293e-18
C12	I#5	ZN#9	cmodel	3.85293e-18
C13	ZN#10	ZN#5	cmodel	1.59851e-18
C14	I#2	ZN#6	cmodel	3.85293e-18
C15	I#1	ZN#6	cmodel	1.54421e-18
C16	ZN#7	ZN#2	cmodel	2.79154e-18
C17	ZN#6	ZN#1	cmodel	1.69988e-18
C18	ZN#5	VDD	cmodel	5.17488e-18
C19	ZN#6	VSS	cmodel	1.87171e-18
C20	I#9	VSS	cmodel	5.06743e-18
C21	I	VSS	cmodel	1.99797e-18
C22	ZN#5	VSS	cmodel	1.70294e-18
C23	VSS	I#8	cmodel	3.70886e-18
C24	I	VDD	cmodel	3.2239e-19
C25	ZN#4	VDD	cmodel	8.91848e-18
C26	VSS	I#6	cmodel	2.56303e-18
C27	ZN#2	VDD	cmodel	7.84338e-18
C28	ZN	VSS	cmodel	7.84e-19
C29	ZN#2	VSS	cmodel	1.18994e-18
C30	VSS	I#5	cmodel	4.46065e-18
C31	VDD	VSS	cmodel	2.40796e-17
C32	ZN#1	VSS	cmodel	1.74566e-18
C33	ZN#1	VDD	cmodel	5.4597e-18
C34	VSS	I#4	cmodel	4.46065e-18
C35	I#9	VDD	cmodel	5.96582e-19
C36	I#7	VSS	cmodel	1.96208e-18
C37	I#3	VSS	cmodel	4.46065e-18
C38	ZN#9	VSS	cmodel	2.48659e-18
C39	ZN#10	VSS	cmodel	1.62559e-18
C40	I#2	VSS	cmodel	4.46065e-18
C41	I#1	VDD	cmodel	5.96582e-19
C42	ZN#4	VSS	cmodel	1.47156e-18
C43	I#1	VSS	cmodel	5.02808e-18
C44	ZN#7	VSS	cmodel	1.43889e-18
*
*
.ENDS INV_X8_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
