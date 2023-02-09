*
*
*
*                       LINUX           Fri Feb  3 22:35:13 2023
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
.SUBCKT OAI21_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 B VSS ZN A1 VDD A2
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	8	A2#1	VDD	VDD	pmos_rvt	nfin=2
MM1	ZN#3	A1#2	8	VDD	pmos_rvt	nfin=2
MM2	VDD	B#2	ZN#3	VDD	pmos_rvt	nfin=2
MM3	ZN#2	A2#1	6#2	VSS	nmos_rvt	nfin=2
MM4	6	A1#2	ZN#2	VSS	nmos_rvt	nfin=2
MM5	VSS	B#2	6	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	B#1	B#2	M0	    0.2379
Rj2	ZN#1	ZN#2	M0	    0.3568
Rj3	ZN#3	ZN#4	M0	    0.3568
Rj5	A1#1	A1#2	M0	    0.4757
Rj10	A2#1	A2#2	M0	    0.2379
Rj11	6	6#2	M0	    1.4271
Ri1	B	B#1	M1	    5.0211
Ri2	ZN	ZN#1	M1	    5.0634
Ri3	ZN	ZN#4	M1	    5.0634
Ri5	A1	A1#1	M1	    5.0211
Ri10	A2	A2#2	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A1	B	cmodel	3.24461e-18
C2	B	ZN#1	cmodel	7.7384e-19
C3	ZN	A1	cmodel	1.893e-18
C4	B	B#1	cmodel	1.13874e-18
C5	ZN#2	6#2	cmodel	1.58884e-18
C6	A2	ZN	cmodel	5.7979e-19
C7	B#2	B	cmodel	5.77755e-19
C8	ZN#1	A1	cmodel	1.34213e-18
C9	ZN#4	A1	cmodel	1.33151e-18
C10	A1#1	A1	cmodel	1.28958e-18
C11	A2#2	A2	cmodel	1.4681e-18
C12	A2	ZN#1	cmodel	4.12833e-19
C13	A2	ZN#4	cmodel	4.2874e-19
C14	ZN	A2#1	cmodel	1.53315e-19
C15	A1#2	ZN#3	cmodel	2.90097e-19
C16	ZN	A1#2	cmodel	5.24307e-19
C17	A1	ZN#3	cmodel	4.30418e-19
C18	6#2	A2#1	cmodel	2.21367e-18
C19	A1	B#2	cmodel	4.90367e-19
C20	A2	6#2	cmodel	1.44702e-18
C21	A2	A1#2	cmodel	1.85743e-19
C22	6#2	A2#2	cmodel	2.16844e-18
C23	A2#1	A1#2	cmodel	4.91421e-19
C24	A1#1	ZN#3	cmodel	2.06898e-18
C25	ZN#1	B#2	cmodel	7.85818e-19
C26	ZN#4	A2#1	cmodel	1.12249e-19
C27	ZN#4	A1#2	cmodel	2.03968e-18
C28	B#2	A1#1	cmodel	5.9072e-19
C29	A1#2	VSS	cmodel	2.63221e-19
C30	A1#1	VSS	cmodel	9.33544e-19
C31	ZN#3	VDD	cmodel	2.31958e-18
C32	6	A1#2	cmodel	2.84601e-18
C33	A1#1	VDD	cmodel	5.17533e-19
C34	ZN#2	6	cmodel	9.5955e-19
C35	B#2	VSS	cmodel	2.48139e-18
C36	A2	VDD	cmodel	7.20036e-19
C37	B#1	VSS	cmodel	2.91268e-18
C38	6	A1#1	cmodel	2.10552e-18
C39	B	VSS	cmodel	1.77812e-18
C40	A1	6	cmodel	7.64196e-19
C41	B#2	VDD	cmodel	2.46114e-19
C42	6#2	VDD	cmodel	7.45202e-19
C43	B#1	VDD	cmodel	2.93694e-19
C44	B	VDD	cmodel	5.04642e-19
C45	ZN	VSS	cmodel	3.103e-20
C46	A1	VSS	cmodel	1.90778e-18
C47	6	VDD	cmodel	3.03132e-19
C48	VDD	VSS	cmodel	1.29881e-17
C49	B	6	cmodel	7.38171e-19
C50	ZN#3	VSS	cmodel	1.15508e-18
C51	A2	VSS	cmodel	1.7337e-18
C52	A2#2	VDD	cmodel	7.43168e-19
C53	6#2	VSS	cmodel	3.33287e-18
C54	ZN#1	6	cmodel	2.82938e-18
C55	ZN#2	VSS	cmodel	3.67585e-18
C56	6	VSS	cmodel	1.9622e-18
C57	A1	VDD	cmodel	5.94279e-19
C58	A2#2	VSS	cmodel	8.42809e-19
C59	ZN#1	VSS	cmodel	3.85749e-18
C60	A2#1	VDD	cmodel	8.91256e-19
C61	ZN#4	VDD	cmodel	3.27096e-18
C62	A2#1	VSS	cmodel	3.32377e-19
C63	ZN	6	cmodel	5.79255e-19
C64	ZN#4	VSS	cmodel	1.33598e-18
*
*
.ENDS OAI21_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
