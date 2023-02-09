*
*
*
*                       LINUX           Fri Feb  3 22:36:14 2023
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
.SUBCKT OAI22_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 B2 A2 VSS A1 VDD ZN B1
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	10	B2#1	VDD	VDD	pmos_rvt	nfin=2
MM1	ZN#2	B1#1	10	VDD	pmos_rvt	nfin=2
MM2	9	A1#1	ZN#2	VDD	pmos_rvt	nfin=2
MM3	VDD	A2#1	9	VDD	pmos_rvt	nfin=2
MM4	VSS	B2#1	7#3	VSS	nmos_rvt	nfin=2
MM5	7#2	B1#1	VSS	VSS	nmos_rvt	nfin=2
MM6	ZN#3	A1#1	7#2	VSS	nmos_rvt	nfin=2
MM7	7	A2#1	ZN#3	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj1	B2#1	B2#2	M0	    0.2379
Rj2	A1#1	A1#2	M0	    0.2379
Rj4	ZN#1	ZN#2	M0	    0.5946
Rj5	ZN#3	ZN#4	M0	    0.1189
Rj10	7	7#2	M0	    1.4271
Rj11	7#2	7#3	M0	    1.4271
Ri1	B2	B2#2	M1	    5.0211
Ri2	A2	A2#1	M1	    5.0211
Ri3	A1	A1#2	M1	    5.0211
Ri6	ZN	ZN#4	M1	    5.0634
Ri7	ZN	ZN#1	M1	    5.0634
Ri13	B1	B1#1	M1	    5.0211
*
*       CAPACITOR CARDS
*
*
C1	B2	B1	cmodel	1.06104e-18
C2	7#2	ZN#1	cmodel	3.40809e-19
C3	B2	B2#2	cmodel	1.39053e-18
C4	ZN	A2	cmodel	1.90832e-18
C5	7#2	A1#1	cmodel	2.15451e-18
C6	B2	7#3	cmodel	1.55181e-18
C7	A1	ZN	cmodel	1.893e-18
C8	B1	A1	cmodel	3.02285e-18
C9	ZN#4	A2	cmodel	1.33151e-18
C10	B2	B1#1	cmodel	1.78959e-19
C11	ZN#1	A2	cmodel	1.37982e-18
C12	B1#1	ZN#4	cmodel	1.13652e-18
C13	A1	A1#2	cmodel	1.0859e-18
C14	A1	ZN#4	cmodel	1.34213e-18
C15	A2	A1#1	cmodel	1.68079e-19
C16	A1	ZN#1	cmodel	1.33151e-18
C17	A2	A2#1	cmodel	1.33218e-18
C18	B2#1	B1#1	cmodel	4.7965e-19
C19	A1	ZN#2	cmodel	5.38999e-19
C20	ZN#1	A1#1	cmodel	1.95653e-18
C21	B1	ZN#4	cmodel	6.28904e-19
C22	ZN#1	A2#1	cmodel	1.60146e-19
C23	A1	7#2	cmodel	9.73296e-19
C24	A1	B1#1	cmodel	4.30418e-19
C25	ZN	7#2	cmodel	6.39497e-19
C26	7#2	ZN#2	cmodel	4.77215e-19
C27	B1	7#2	cmodel	1.34243e-18
C28	ZN	A1#1	cmodel	2.53216e-19
C29	ZN	A2#1	cmodel	2.18736e-19
C30	B1	B2#1	cmodel	2.70127e-19
C31	A1#1	A2#1	cmodel	4.94413e-19
C32	B1	B1#1	cmodel	1.40649e-18
C33	B2#2	7#3	cmodel	2.16844e-18
C34	A1#1	ZN#2	cmodel	2.90097e-19
C35	A1#2	ZN#2	cmodel	2.13701e-18
C36	B2#1	7#3	cmodel	2.21367e-18
C37	7#2	A1#2	cmodel	2.16844e-18
C38	ZN#4	7#2	cmodel	2.39405e-18
C39	B1#1	7#2	cmodel	4.95962e-18
C40	B2#1	VSS	cmodel	2.42212e-18
C41	A2#1	VDD	cmodel	1.8622e-18
C42	7	VSS	cmodel	3.09298e-18
C43	7#2	VDD	cmodel	6.37979e-19
C44	B2	VSS	cmodel	1.76791e-18
C45	B1#1	VSS	cmodel	5.2987e-18
C46	B1	VDD	cmodel	5.98307e-19
C47	B2#2	VSS	cmodel	2.82552e-18
C48	B2	VDD	cmodel	5.98307e-19
C49	A2	VSS	cmodel	1.70051e-18
C50	A1#1	VSS	cmodel	2.25777e-19
C51	ZN#2	VSS	cmodel	1.31367e-18
C52	A2#1	VSS	cmodel	1.49622e-18
C53	ZN#4	7	cmodel	1.54421e-18
C54	A2	VDD	cmodel	7.20035e-19
C55	7	A2#1	cmodel	4.42651e-18
C56	A1#2	VSS	cmodel	7.64935e-19
C57	A1	VSS	cmodel	1.94056e-18
C58	ZN#2	VDD	cmodel	2.88442e-18
C59	ZN#1	VDD	cmodel	3.88441e-18
C60	7#3	VSS	cmodel	2.61457e-18
C61	ZN#4	VSS	cmodel	5.92611e-18
C62	VDD	VSS	cmodel	1.4936e-17
C63	ZN#1	VSS	cmodel	1.44005e-18
C64	7	ZN#1	cmodel	3.05668e-19
C65	7	VDD	cmodel	2.5261e-19
C66	A1	VDD	cmodel	5.0036e-19
C67	7#2	VSS	cmodel	2.04938e-18
C68	B1	VSS	cmodel	1.40003e-18
C69	7#3	VDD	cmodel	1.31031e-18
C70	A2	7	cmodel	1.4055e-18
*
*
.ENDS OAI22_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
