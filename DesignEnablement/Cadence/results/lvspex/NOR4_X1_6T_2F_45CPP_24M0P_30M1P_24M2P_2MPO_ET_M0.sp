*
*
*
*                       LINUX           Fri Feb  3 22:33:48 2023
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
.SUBCKT NOR4_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A4 A1 VSS ZN A3 VDD A2
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	10	A1#1	ZN#2	VDD	pmos_rvt	nfin=2
MM1	9	A2#1	10	VDD	pmos_rvt	nfin=2
MM2	8	A3#2	9	VDD	pmos_rvt	nfin=2
MM3	VDD	A4#1	8	VDD	pmos_rvt	nfin=2
MM4	ZN#4	A1#1	VSS	VSS	nmos_rvt	nfin=2
MM5	VSS	A2#1	ZN#4	VSS	nmos_rvt	nfin=2
MM6	ZN#3	A3#2	VSS	VSS	nmos_rvt	nfin=2
MM7	VSS	A4#1	ZN#3	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A1#1	A1#2	M0	    0.2379
Rj2	ZN#1	ZN#2	M0	    0.5946
Rj3	ZN#3	ZN#4	M0	    1.4271
Rj4	ZN#4	ZN#5	M0	    0.1189
Rj6	A3#1	A3#2	M0	    0.2379
Ri2	A4	A4#1	M1	    5.0211
Ri1	A1	A1#2	M1	    5.0211
Ri3	ZN	ZN#5	M1	    5.0211
Ri4	ZN	ZN#1	M1	    5.0211
Ri7	A3	A3#1	M1	    5.0211
Ri14	A2	A2#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A2	A4	cmodel	6.19885e-19
C2	A1	ZN	cmodel	2.25966e-18
C3	A1	A2	cmodel	4.92888e-19
C4	ZN	A3	cmodel	2.77161e-19
C5	A1	A1#2	cmodel	1.61888e-18
C6	A1	ZN#5	cmodel	1.02921e-18
C7	ZN#3	A3#2	cmodel	8.768e-19
C8	ZN#3	A3#1	cmodel	7.05037e-19
C9	A4	ZN#3	cmodel	1.41495e-18
C10	A1#1	A2#1	cmodel	4.7965e-19
C11	A4	A2#1	cmodel	1.97278e-19
C12	ZN	A2	cmodel	2.27705e-18
C13	A4	A4#1	cmodel	2.14793e-18
C14	A1	ZN#2	cmodel	7.35555e-19
C15	ZN	ZN#5	cmodel	1.03756e-18
C16	A4#1	ZN#3	cmodel	2.84724e-18
C17	A1	A2#1	cmodel	1.78959e-19
C18	A3	ZN#1	cmodel	8.64467e-19
C19	A3	A3#1	cmodel	1.24464e-18
C20	A2	ZN#5	cmodel	1.66225e-18
C21	ZN	A1#1	cmodel	3.25028e-19
C22	A2#1	A4#1	cmodel	7.22752e-19
C23	A3	ZN#3	cmodel	5.93085e-19
C24	A1#2	ZN#5	cmodel	8.52107e-19
C25	A3#2	A3	cmodel	5.77755e-19
C26	A3	A4#1	cmodel	1.93334e-19
C27	ZN#5	ZN#1	cmodel	3.13611e-18
C28	A2	A1#1	cmodel	2.70127e-19
C29	A2	A2#1	cmodel	1.41375e-18
C30	A1#2	ZN#2	cmodel	6.506e-19
C31	A2	A4#1	cmodel	2.32615e-19
C32	ZN#5	ZN#2	cmodel	1.1721e-18
C33	A1#1	ZN#5	cmodel	2.13165e-18
C34	A2#1	ZN#5	cmodel	3.51547e-18
C35	A2#1	ZN#3	cmodel	1.54421e-18
C36	A2#1	VSS	cmodel	5.45759e-18
C37	A2	VSS	cmodel	1.40994e-18
C38	ZN#5	VDD	cmodel	8.40067e-19
C39	A3#2	VSS	cmodel	1.166e-18
C40	A3#1	VSS	cmodel	8.12395e-19
C41	A3#2	VDD	cmodel	2.21719e-18
C42	A4#1	VSS	cmodel	6.12154e-18
C43	A4	VSS	cmodel	1.71649e-18
C44	ZN#1	VDD	cmodel	1.73455e-18
C45	A1	VSS	cmodel	1.7994e-18
C46	A3	VDD	cmodel	6.04859e-19
C47	A4#1	VDD	cmodel	3.50166e-19
C48	A4	VDD	cmodel	7.17945e-19
C49	ZN#3	VDD	cmodel	6.89628e-19
C50	A1#2	VSS	cmodel	2.87033e-18
C51	ZN	VSS	cmodel	1.06945e-18
C52	ZN#3	VSS	cmodel	2.17652e-18
C53	A1	VDD	cmodel	4.36348e-19
C54	ZN#2	VSS	cmodel	1.92838e-18
C55	ZN#5	VSS	cmodel	2.13248e-18
C56	ZN#2	VDD	cmodel	1.2601e-18
C57	A3	VSS	cmodel	1.83714e-18
C58	A3#1	VDD	cmodel	2.01831e-18
C59	A1#1	VSS	cmodel	2.32633e-18
C60	A2	VDD	cmodel	5.98307e-19
C61	ZN#1	VSS	cmodel	1.26539e-18
C62	VDD	VSS	cmodel	1.54565e-17
*
*
.ENDS NOR4_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
