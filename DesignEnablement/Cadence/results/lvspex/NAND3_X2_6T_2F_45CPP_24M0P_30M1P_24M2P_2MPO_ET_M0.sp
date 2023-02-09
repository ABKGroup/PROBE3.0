*
*
*
*                       LINUX           Fri Feb  3 22:32:35 2023
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
.SUBCKT NAND3_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 A1 VSS ZN A2 VDD A3
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	A3#3	ZN#7	VDD	pmos_rvt	nfin=2
MM1	ZN#6	A3#1	VDD	VDD	pmos_rvt	nfin=2
MM2	VDD	A2#3	ZN#6	VDD	pmos_rvt	nfin=2
MM3	ZN#5	A2#1	VDD	VDD	pmos_rvt	nfin=2
MM4	VDD	A1#4	ZN#5	VDD	pmos_rvt	nfin=2
MM5	ZN#3	A1#2	VDD	VDD	pmos_rvt	nfin=2
MM6	VSS	A3#3	8#3	VSS	nmos_rvt	nfin=2
MM7	8#2	A3#1	VSS	VSS	nmos_rvt	nfin=2
MM8	6#3	A2#3	8#2	VSS	nmos_rvt	nfin=2
MM9	8	A2#1	6#3	VSS	nmos_rvt	nfin=2
MM10	ZN#1	A1#2	6#2	VSS	nmos_rvt	nfin=2
MM11	6	A1#1	ZN#1	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	A1#1	A1#2	M0	    0.7136
Rj2	A1#2	A1#3	M0	    0.4757
Rj3	A1#3	A1#4	M0	    0.2379
Rj4	ZN#1	ZN#2	M0	    0.3568
Rj5	ZN#3	ZN#4	M0	    0.3568
Rj6	ZN#4	ZN#5	M0	    1.0704
Rj7	ZN#5	ZN#6	M0	    1.4271
Rj8	ZN#6	ZN#7	M0	    1.4271
Rj13	A2#1	A2#3	M0	    0.7136
Rj26	A3#1	A3#3	M0	    0.7136
Rj27	8	8#2	M0	    1.4271
Rj28	8#2	8#3	M0	    1.4271
Rj29	6	6#2	M0	    1.4271
Rj30	6#2	6#3	M0	    1.4271
Ri1	A1	A1#3	M1	    5.0211
Ri2	ZN	ZN#2	M1	    5.0422
Ri3	ZN	ZN#4	M1	    5.0422
Ri5	A2	A2#1	M1	    5.0211
Ri10	A3	A3#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	A1	ZN	cmodel	9.12566e-19
C2	A2	A1	cmodel	1.0291e-18
C3	A1	A2#1	cmodel	1.906e-19
C4	A1	A1#3	cmodel	8.71558e-19
C5	A1	ZN#2	cmodel	2.31904e-18
C6	A1	ZN#4	cmodel	1.32585e-18
C7	A1	ZN#5	cmodel	5.07751e-20
C8	A3	A2	cmodel	5.48737e-19
C9	A1	6#2	cmodel	5.93085e-19
C10	A1#4	A1	cmodel	5.77755e-19
C11	A2	A3#1	cmodel	1.5275e-19
C12	A2	A2#1	cmodel	1.35526e-18
C13	ZN#2	A1#2	cmodel	2.51129e-18
C14	8#2	ZN#6	cmodel	8.66401e-19
C15	A2	ZN#2	cmodel	8.52648e-20
C16	A3	A3#1	cmodel	1.41786e-18
C17	A1#2	ZN#4	cmodel	2.21672e-18
C18	A2	ZN#5	cmodel	5.38999e-19
C19	A2	6#3	cmodel	5.38999e-19
C20	A3#3	ZN#7	cmodel	3.48929e-18
C21	A1#2	ZN	cmodel	1.04707e-18
C22	A3	ZN#6	cmodel	5.38999e-19
C23	6#2	A1#4	cmodel	7.89119e-19
C24	6#2	ZN#5	cmodel	5.44692e-20
C25	A2	A1#4	cmodel	2.78359e-19
C26	A3	8#2	cmodel	1.84737e-18
C27	A1#3	ZN#4	cmodel	1.54323e-18
C28	6#2	A1#2	cmodel	1.40357e-19
C29	A3#1	ZN#6	cmodel	3.43535e-18
C30	ZN#1	A1#2	cmodel	9.5955e-19
C31	6#3	8#2	cmodel	1.58884e-18
C32	A3	A2#3	cmodel	4.16e-19
C33	A2#1	ZN#5	cmodel	3.43535e-18
C34	A2#3	ZN#6	cmodel	3.48929e-18
C35	8#2	A3#1	cmodel	3.47084e-18
C36	A1#3	ZN#5	cmodel	2.62938e-19
C37	ZN#1	A1#1	cmodel	1.54421e-18
C38	8#3	A3#3	cmodel	3.48929e-18
C39	A1#4	ZN#5	cmodel	2.2583e-18
C40	A3#1	A2#3	cmodel	5.7903e-19
C41	6#2	A1#3	cmodel	5.63368e-19
C42	ZN#2	6#2	cmodel	3.04091e-18
C43	A1#2	ZN#3	cmodel	9.5955e-19
C44	A2#1	A1#4	cmodel	4.98713e-19
C45	A1#1	ZN#3	cmodel	1.54421e-18
C46	6#2	ZN#1	cmodel	9.5955e-19
C47	8#3	ZN#7	cmodel	7.7976e-19
C48	8#2	A2#3	cmodel	3.48929e-18
C49	6	VDD	cmodel	5.96582e-19
C50	8	ZN#5	cmodel	9.45072e-19
C51	A1#1	VSS	cmodel	1.5021e-18
C52	6#2	8	cmodel	1.54421e-18
C53	A1#1	VDD	cmodel	1.2099e-18
C54	ZN#6	VSS	cmodel	1.08493e-18
C55	6	A1#1	cmodel	1.05008e-18
C56	A1	VSS	cmodel	1.89993e-18
C57	ZN#5	VSS	cmodel	8.96031e-19
C58	ZN#6	VDD	cmodel	7.52472e-18
C59	ZN#3	VSS	cmodel	9.90872e-19
C60	A1	VDD	cmodel	4.93108e-19
C61	ZN	VSS	cmodel	1.5728e-19
C62	8#3	VSS	cmodel	4.29747e-18
C63	ZN#5	VDD	cmodel	6.41412e-18
C64	A2	VSS	cmodel	1.81586e-18
C65	A1	8	cmodel	6.78558e-19
C66	VSS	VDD	cmodel	2.06901e-17
C67	8#2	VSS	cmodel	4.16493e-18
C68	ZN#3	VDD	cmodel	2.502e-18
C69	A3	VSS	cmodel	1.95228e-18
C70	6#3	VSS	cmodel	6.80235e-18
C71	8	VSS	cmodel	8.50529e-19
C72	6	VSS	cmodel	7.36137e-18
C73	6#2	VSS	cmodel	8.24121e-18
C74	A2	VDD	cmodel	5.0036e-19
C75	A3#1	VSS	cmodel	3.2294e-19
C76	ZN#4	VDD	cmodel	4.4062e-18
C77	ZN#1	VSS	cmodel	1.12731e-18
C78	A2#1	VSS	cmodel	3.30646e-19
C79	8	A2#1	cmodel	3.47084e-18
C80	A1#3	VSS	cmodel	2.27099e-19
C81	A3#3	VSS	cmodel	1.51171e-18
C82	ZN#2	VSS	cmodel	1.65584e-18
C83	A2	8	cmodel	1.55332e-18
C84	6	ZN#1	cmodel	1.54421e-18
C85	6#3	8	cmodel	3.85487e-18
C86	A3	VDD	cmodel	5.0036e-19
C87	ZN#4	VSS	cmodel	8.16195e-19
C88	A2#3	VSS	cmodel	6.04395e-19
C89	ZN#7	VDD	cmodel	5.50352e-18
C90	A1#4	VSS	cmodel	3.32576e-19
C91	8	ZN#2	cmodel	3.3811e-19
C92	ZN#7	VSS	cmodel	1.73032e-18
C93	A1#2	VSS	cmodel	3.46057e-19
*
*
.ENDS NAND3_X2_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
