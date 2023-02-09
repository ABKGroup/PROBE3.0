*
*
*
*                       LINUX           Fri Feb  3 22:30:29 2023
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
.SUBCKT AND3_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A1 VSS Z A2 VDD A3
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	6#6	Z#2	VDD	pmos_rvt	nfin=2
MM1	6#5	A3#1	VDD	VDD	pmos_rvt	nfin=2
MM2	VDD	A2#1	6#5	VDD	pmos_rvt	nfin=2
MM3	6#3	A1#2	VDD	VDD	pmos_rvt	nfin=2
MM4	VSS	6#6	Z#4	VSS	nmos_rvt	nfin=2
MM5	9	A3#1	VSS	VSS	nmos_rvt	nfin=2
MM6	8	A2#1	9	VSS	nmos_rvt	nfin=2
MM7	6	A1#2	8	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A1#1	A1#2	M0	    0.4757
Rj2	Z#1	Z#2	M0	    0.1189
Rj3	Z#3	Z#4	M0	    0.1189
Rj5	A2#1	A2#2	M0	    0.2379
Rj11	6	6#2	M0	    0.3568
Rj12	6#3	6#4	M0	    0.3568
Rj13	6#4	6#5	M0	    1.0704
Rj14	6#5	6#6	M0	    1.0704
Ri1	A1	A1#1	M1	    5.0211
Ri2	Z	Z#3	M1	    5.0422
Ri3	Z	Z#1	M1	    5.0422
Ri5	A2	A2#2	M1	    5.0211
Ri10	A3	A3#1	M1	    5.0211
Ri11	6#4	6#2	M1	   10.0845
*
*       CAPACITOR CARDS
*
*
C1	A2	A1	cmodel	3.20921e-19
C2	6#2	A1	cmodel	2.99962e-18
C3	A1	A1#1	cmodel	1.5459e-18
C4	A1	6#3	cmodel	3.94024e-19
C5	Z	A2#2	cmodel	2.12201e-19
C6	A2	A2#2	cmodel	1.79693e-18
C7	6#2	A2#1	cmodel	7.52992e-19
C8	A2	6#2	cmodel	9.58991e-19
C9	A1#2	6#2	cmodel	2.34549e-18
C10	Z#4	Z#2	cmodel	6.55791e-19
C11	A2	6#5	cmodel	4.93424e-19
C12	A2	A1#2	cmodel	3.35351e-19
C13	Z#1	6#2	cmodel	8.16436e-20
C14	Z#1	6#4	cmodel	2.16638e-19
C15	Z#2	6#6	cmodel	3.06046e-18
C16	Z#1	Z#2	cmodel	8.95768e-19
C17	6#2	6#4	cmodel	5.86267e-19
C18	Z#3	Z#4	cmodel	1.38661e-18
C19	A2#1	6#5	cmodel	5.89152e-19
C20	6#2	Z#2	cmodel	1.42091e-19
C21	A2#2	6#5	cmodel	7.15344e-19
C22	6#4	Z#2	cmodel	1.37291e-19
C23	Z#1	6#6	cmodel	5.65113e-19
C24	A3#1	A1#2	cmodel	2.13301e-19
C25	A1	VSS	cmodel	1.76459e-18
C26	Z#2	VSS	cmodel	1.52579e-18
C27	A1	A3#1	cmodel	1.78199e-19
C28	Z#3	A3#1	cmodel	8.8877e-19
C29	A1	VDD	cmodel	4.91504e-19
C30	Z	VSS	cmodel	5.11675e-19
C31	6#5	VSS	cmodel	1.19884e-18
C32	A3#1	Z	cmodel	3.30017e-19
C33	Z#2	VDD	cmodel	6.10943e-19
C34	6#6	VDD	cmodel	5.51864e-18
C35	A2	VSS	cmodel	2.17765e-18
C36	6#3	VSS	cmodel	1.09273e-18
C37	A1	6	cmodel	1.10225e-18
C38	VDD	VSS	cmodel	1.43518e-17
C39	Z#1	VDD	cmodel	4.80843e-19
C40	Z#4	VSS	cmodel	4.64297e-18
C41	A3#1	VDD	cmodel	3.2239e-19
C42	A3#1	6#6	cmodel	6.32933e-19
C43	A3#1	6#5	cmodel	1.04491e-18
C44	6	VSS	cmodel	6.62364e-19
C45	6	6#3	cmodel	5.4005e-19
C46	6#5	VDD	cmodel	5.87158e-18
C47	A2	VDD	cmodel	3.2239e-19
C48	A1#1	6	cmodel	2.10552e-18
C49	A3#1	Z#4	cmodel	9.27143e-19
C50	6#3	VDD	cmodel	2.502e-18
C51	Z#3	VSS	cmodel	1.22607e-18
C52	6#6	VSS	cmodel	2.21361e-18
C53	Z#1	VSS	cmodel	1.10961e-18
C54	A3#1	VSS	cmodel	7.82466e-18
C55	A2#1	VSS	cmodel	1.35673e-18
C56	Z#1	A3#1	cmodel	4.03435e-19
C57	A2#2	VSS	cmodel	1.40153e-18
C58	6#4	VDD	cmodel	4.59647e-18
C59	VSS	A1#2	cmodel	3.0999e-18
C60	A1#2	6	cmodel	2.90097e-19
C61	A3#1	A2	cmodel	3.70612e-18
C62	6#2	VSS	cmodel	1.86919e-18
C63	6#4	VSS	cmodel	1.61737e-18
C64	A1#1	VDD	cmodel	2.03533e-19
C65	A3#1	A2#2	cmodel	4.5544e-19
C66	VSS	A1#1	cmodel	3.58721e-18
*
*
.ENDS AND3_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
