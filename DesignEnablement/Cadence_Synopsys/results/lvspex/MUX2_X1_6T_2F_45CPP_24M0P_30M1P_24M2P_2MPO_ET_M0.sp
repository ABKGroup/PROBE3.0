*
*
*
*                       LINUX           Fri Feb  3 22:36:58 2023
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
.SUBCKT MUX2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 S Z I1 VSS VDD I0
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	7#3	Z#4	VDD	pmos_rvt	nfin=2
MM1	12	I1#1	VDD	VDD	pmos_rvt	nfin=2
MM2	7#2	4#6	12	VDD	pmos_rvt	nfin=2
MM3	11	S#3	7#2	VDD	pmos_rvt	nfin=2
MM4	VDD	I0#1	11	VDD	pmos_rvt	nfin=2
MM5	4#3	S#1	VDD	VDD	pmos_rvt	nfin=2
MM6	VSS	7#3	Z#2	VSS	nmos_rvt	nfin=2
MM7	8#2	I1#1	VSS	VSS	nmos_rvt	nfin=2
MM8	VSS	S#3	4	VSS	nmos_rvt	nfin=2
MM9	10	I0#1	VSS	VSS	nmos_rvt	nfin=2
MM10	7#4	4#4	10	VSS	nmos_rvt	nfin=2
MM11	8#3	S#1	7#4	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj3	S#1	S#2	M0	    0.2379
Rj4	S#2	S#3	M0	    1.9029
Rj1	Z#1	Z#2	M0	    0.1189
Rj2	Z#3	Z#4	M0	    0.1189
Rj6	I0#1	I0#2	M0	    0.2379
Rj12	7	7#2	M0	    1.7839
Rj13	7#2	7#3	M0	    1.7839
Rj14	7#4	7#5	M0	    0.3568
Rj11	4	4#2	M0	    0.1189
Rj15	4#3	4#4	M0	    1.0704
Rj16	4#4	4#5	M0	    1.9029
Rj17	4#5	4#6	M0	    0.2379
Rj28	8	8#2	M0	    0.1189
Rj29	8#3	8#4	M0	    0.1189
Ri3	S	S#2	M1	    5.0211
Ri1	Z	Z#1	M1	    5.0422
Ri2	Z	Z#3	M1	    5.0422
Ri4	I1	I1#1	M1	    5.0422
Ri5	I0	I0#2	M1	    5.0422
Ri10	7	7#5	M1	   10.1267
Ri9	4#5	4#2	M1	   10.0845
Ri19	8	8#6	M1	    5.0422
Ri20	8#4	8#8	M1	    5.0000
Rh1	8#8	8#6	M2	    0.5219
*
*       CAPACITOR CARDS
*
*
C1	Z#4	7#3	cmodel	3.09735e-18
C2	I1	Z	cmodel	3.68325e-19
C3	8#6	I0#1	cmodel	1.50192e-20
C4	8#8	S	cmodel	1.26506e-18
C5	7#5	S	cmodel	2.27705e-18
C6	S	S#2	cmodel	9.85865e-19
C7	8#6	4#4	cmodel	3.52964e-20
C8	S	8#4	cmodel	2.99962e-18
C9	8#4	S#1	cmodel	3.70005e-18
C10	S	4#3	cmodel	7.48703e-19
C11	S	7#4	cmodel	3.83956e-19
C12	8#8	S#3	cmodel	4.11829e-20
C13	S	4#4	cmodel	6.55672e-19
C14	4#5	7#2	cmodel	6.16181e-18
C15	Z#3	I1	cmodel	7.06633e-19
C16	Z#4	4#6	cmodel	2.86656e-19
C17	I1	4#5	cmodel	6.79673e-19
C18	8#8	4#4	cmodel	1.8243e-19
C19	Z	8#2	cmodel	2.35965e-19
C20	Z#3	7#3	cmodel	3.28422e-19
C21	I1	Z#4	cmodel	4.97793e-19
C22	8#8	S#1	cmodel	1.17645e-19
C23	I1	8#2	cmodel	6.037e-19
C24	4#2	8#2	cmodel	1.46714e-19
C25	4#2	I0	cmodel	4.95419e-20
C26	Z#3	4#6	cmodel	1.9313e-19
C27	I0	4#5	cmodel	1.47999e-18
C28	I1	7#3	cmodel	1.00071e-18
C29	I1	4#6	cmodel	7.98086e-19
C30	I0	7#5	cmodel	2.23551e-19
C31	4#5	8#2	cmodel	1.41758e-19
C32	4#6	7#2	cmodel	3.07548e-18
C33	I0	7#2	cmodel	3.36279e-19
C34	8#6	Z#1	cmodel	2.59177e-19
C35	S#2	4#3	cmodel	2.68867e-19
C36	4#2	4#6	cmodel	3.44886e-19
C37	8#6	4#2	cmodel	2.89082e-18
C38	8#4	4#3	cmodel	7.96575e-19
C39	I0#1	S#3	cmodel	2.10029e-18
C40	8#6	4#5	cmodel	1.70599e-19
C41	4#2	S#3	cmodel	3.37544e-18
C42	I0	S#3	cmodel	1.15932e-18
C43	8#6	I0#2	cmodel	6.89639e-19
C44	I0	4#4	cmodel	6.53906e-19
C45	4#4	7#2	cmodel	2.62938e-19
C46	4#6	4#5	cmodel	4.82016e-19
C47	S#3	4#4	cmodel	2.3956e-18
C48	4#5	S#3	cmodel	6.03694e-18
C49	8#8	7#5	cmodel	9.36612e-19
C50	8#8	S#2	cmodel	1.69518e-19
C51	8#8	8#4	cmodel	1.2532e-18
C52	I0#2	S#3	cmodel	2.12584e-18
C53	7#4	S#2	cmodel	2.35628e-18
C54	Z#2	Z#4	cmodel	9.26111e-19
C55	4#2	4#5	cmodel	1.22691e-19
C56	4#2	I0#2	cmodel	1.06616e-18
C57	8#2	4#6	cmodel	2.9363e-18
C58	7#4	8#4	cmodel	1.07455e-18
C59	8#6	7#2	cmodel	5.18944e-19
C60	4#3	S#1	cmodel	3.27045e-18
C61	I0#1	7#5	cmodel	7.14357e-19
C62	8#2	S#3	cmodel	7.69661e-19
C63	8#6	Z#2	cmodel	3.14819e-19
C64	Z#3	Z#4	cmodel	1.29015e-18
C65	8#8	4#3	cmodel	2.3892e-19
C66	I0#2	7#5	cmodel	5.18583e-19
C67	8#6	8#2	cmodel	1.6218e-19
C68	Z#1	Z#2	cmodel	1.25702e-18
C69	7#5	S#2	cmodel	3.26869e-18
C70	4#4	S#2	cmodel	5.15315e-18
C71	8#2	7#2	cmodel	2.07815e-19
C72	8#8	7#4	cmodel	1.10031e-20
C73	7#5	8#4	cmodel	3.77889e-19
C74	8#6	4#6	cmodel	2.37838e-19
C75	4#5	Z#4	cmodel	1.26557e-19
C76	8#6	S#3	cmodel	2.08922e-19
C77	VSS	8#2	cmodel	1.20952e-18
C78	S#2	VSS	cmodel	1.49004e-18
C79	4#5	VDD	cmodel	4.81422e-19
C80	I1#1	8#2	cmodel	3.054e-18
C81	4#2	I1#1	cmodel	8.98512e-19
C82	8	4#5	cmodel	1.52457e-18
C83	8#4	VSS	cmodel	6.32534e-18
C84	VDD	7#3	cmodel	6.0647e-18
C85	7#2	VDD	cmodel	9.31102e-18
C86	8#6	VSS	cmodel	3.25404e-18
C87	7	4#4	cmodel	7.25327e-18
C88	S	VSS	cmodel	1.07009e-18
C89	8	VDD	cmodel	2.85756e-19
C90	S	VDD	cmodel	7.096e-19
C91	8#8	VSS	cmodel	2.76396e-18
C92	Z	VSS	cmodel	5.10135e-19
C93	7	S	cmodel	2.22172e-18
C94	7#4	VSS	cmodel	2.44622e-18
C95	8	8#2	cmodel	8.98768e-19
C96	Z#1	I1#1	cmodel	6.14585e-19
C97	8	7#2	cmodel	2.42106e-19
C98	Z#1	VSS	cmodel	1.22607e-18
C99	I1	VSS	cmodel	9.66738e-19
C100	4#3	VDD	cmodel	1.73648e-18
C101	8#6	VDD	cmodel	3.86358e-19
C102	Z#4	VSS	cmodel	2.12454e-18
C103	I1	VDD	cmodel	4.81422e-19
C104	Z#3	VSS	cmodel	6.07183e-19
C105	7#3	VSS	cmodel	2.47515e-18
C106	I1#1	8	cmodel	2.29473e-19
C107	8#8	VDD	cmodel	7.23105e-19
C108	VDD	VSS	cmodel	2.0052e-17
C109	I1#1	VSS	cmodel	6.43234e-18
C110	I1#1	7#2	cmodel	1.63408e-20
C111	8#4	VDD	cmodel	4.36348e-19
C112	I0	VSS	cmodel	7.02744e-19
C113	4#6	VSS	cmodel	8.68289e-19
C114	I1#1	7#3	cmodel	4.30813e-19
C115	4#4	VDD	cmodel	7.17104e-19
C116	7#2	VSS	cmodel	1.24562e-18
C117	4#2	VSS	cmodel	4.69334e-18
C118	8	4#6	cmodel	5.59273e-19
C119	7	VSS	cmodel	1.71791e-18
C120	Z#3	VDD	cmodel	6.08773e-19
C121	I1#1	Z#2	cmodel	4.79461e-19
C122	S#3	VSS	cmodel	2.36811e-18
C123	I0	VDD	cmodel	4.74445e-19
C124	4#5	VSS	cmodel	1.46039e-18
C125	I0#1	VSS	cmodel	2.23995e-18
C126	4#3	VSS	cmodel	1.36568e-18
C127	7	VDD	cmodel	7.09832e-18
C128	I1	8	cmodel	2.06249e-18
C129	I0#2	VSS	cmodel	3.02211e-18
C130	8#6	7	cmodel	6.61848e-20
C131	Z#4	VDD	cmodel	1.02726e-18
C132	8	S#3	cmodel	3.53744e-19
C133	4#4	VSS	cmodel	9.03033e-19
C134	8#6	I1#1	cmodel	2.53544e-18
C135	VSS	Z#2	cmodel	4.60346e-18
C136	7#5	VSS	cmodel	3.38062e-18
C137	I0	7	cmodel	8.49103e-19
C138	8	4#2	cmodel	7.74508e-19
C139	S#1	VSS	cmodel	1.37471e-18
C140	8#8	7	cmodel	1.19926e-19
C141	8	VSS	cmodel	5.86578e-19
*
*
.ENDS MUX2_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
