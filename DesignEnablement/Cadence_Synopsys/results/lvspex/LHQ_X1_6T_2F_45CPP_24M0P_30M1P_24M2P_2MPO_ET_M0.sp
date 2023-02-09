*
*
*
*                       LINUX           Fri Feb  3 22:38:38 2023
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
.SUBCKT LHQ_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 D VSS Q E VDD
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	VDD	7#3	Q#2	VDD	pmos_rvt	nfin=2
MM1	3#2	E#1	VDD	VDD	pmos_rvt	nfin=2
MM2	VDD	7#2	6#2	VDD	pmos_rvt	nfin=2
MM3	10#2	6#3	VDD	VDD	pmos_rvt	nfin=2
MM4	7#7	5#2	10	VDD	pmos_rvt	nfin=1
MM5	14	3#4	7#7	VDD	pmos_rvt	nfin=1
MM6	VDD	D#1	14	VDD	pmos_rvt	nfin=1
MM7	5#3	3#3	VDD	VDD	pmos_rvt	nfin=2
MM8	VSS	7#3	Q#4	VSS	nmos_rvt	nfin=2
MM9	3#7	E#1	VSS	VSS	nmos_rvt	nfin=2
MM10	VSS	7#2	6#5	VSS	nmos_rvt	nfin=2
MM11	15	6#3	VSS	VSS	nmos_rvt	nfin=2
MM12	7#5	3#5	15	VSS	nmos_rvt	nfin=1
MM13	9#2	5#2	7#5	VSS	nmos_rvt	nfin=1
MM14	VSS	D#1	9	VSS	nmos_rvt	nfin=1
MM15	5#5	3#3	VSS	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj4	D#1	D#2	M0	    0.2379
Rj1	Q#1	Q#2	M0	    0.1189
Rj2	Q#3	Q#4	M0	    0.1189
Rj5	7	7#2	M0	    1.4271
Rj6	7#2	7#3	M0	    2.1407
Rj7	7#4	7#5	M0	    0.1189
Rj8	7#5	7#6	M0	    0.3568
Rj9	7#7	7#8	M0	    0.1189
Rj14	3	3#2	M0	    0.1189
Rj18	3#3	3#4	M0	    1.4271
Rj19	3#4	3#5	M0	    1.4271
Rj20	3#5	3#6	M0	    2.3786
Rj21	3#6	3#7	M0	    0.1189
Rj15	6	6#2	M0	    0.3568
Rj16	6#3	6#4	M0	    0.7136
Rj17	6#4	6#5	M0	    0.3568
Rj35	10	10#2	M0	    0.7136
Rj37	5	5#2	M0	    7.1407
Rj38	5#3	5#4	M0	    0.3568
Rj39	5#5	5#6	M0	    0.3568
Rj36	9	9#2	M0	    0.7136
Ri4	D	D#2	M1	    5.0211
Ri1	Q	Q#3	M1	    5.0422
Ri2	Q	Q#1	M1	    5.0422
Ri3	E	E#1	M1	    5.0211
Ri5	7	7#6	M1	   10.0845
Ri6	7#4	7#12	M1	    5.0000
Ri7	7#8	7#14	M1	    5.1267
Ri12	3	3#6	M1	   10.0845
Ri13	6	6#4	M1	   10.1267
Ri25	5#4	5	M1	    5.0422
Ri26	5	5#6	M1	    5.0845
Rh1	7#14	7#12	M2	    0.1825
*
*       CAPACITOR CARDS
*
*
C1	Q#4	7#3	cmodel	3.09595e-18
C2	7#8	D	cmodel	1.35351e-18
C3	D	D#2	cmodel	1.30873e-18
C4	D	5#4	cmodel	6.31868e-19
C5	9#2	3#4	cmodel	3.485e-18
C6	5#2	D	cmodel	2.14039e-19
C7	D	3#4	cmodel	3.78861e-19
C8	Q	3#6	cmodel	6.35122e-20
C9	7#12	E	cmodel	6.26446e-20
C10	Q#3	E	cmodel	8.27356e-19
C11	6#4	E#1	cmodel	2.32615e-19
C12	Q#1	Q#2	cmodel	7.15644e-19
C13	E	3#6	cmodel	3.11425e-18
C14	5#6	3#3	cmodel	2.89853e-18
C15	E	6#4	cmodel	2.30934e-19
C16	7#6	7#4	cmodel	2.16131e-18
C17	7#3	Q#2	cmodel	3.09595e-18
C18	3#7	7#3	cmodel	1.58884e-18
C19	Q#1	3#2	cmodel	2.14488e-19
C20	7#5	9#2	cmodel	7.94101e-19
C21	Q#2	3#2	cmodel	1.07104e-19
C22	6#4	3#5	cmodel	6.24823e-19
C23	E#1	3#7	cmodel	3.033e-18
C24	Q	7#3	cmodel	1.31317e-18
C25	7#4	7#5	cmodel	8.44632e-19
C26	D#1	5#4	cmodel	7.89033e-19
C27	E	Q#4	cmodel	2.79229e-19
C28	E	3#7	cmodel	8.07558e-19
C29	7#4	9#2	cmodel	1.36359e-19
C30	E	6#5	cmodel	2.16655e-19
C31	7#12	7#5	cmodel	9.16171e-20
C32	3#7	7#2	cmodel	7.1901e-18
C33	Q#3	Q#4	cmodel	1.19013e-18
C34	E#1	6#5	cmodel	7.36753e-19
C35	E	7#3	cmodel	8.43771e-19
C36	7#3	3#2	cmodel	1.58884e-18
C37	E	E#1	cmodel	1.98875e-18
C38	3#5	7#2	cmodel	2.55419e-18
C39	7#8	D#2	cmodel	4.69582e-19
C40	6#3	7#6	cmodel	8.95631e-19
C41	3#2	6#2	cmodel	7.95186e-19
C42	Q#3	3#7	cmodel	3.52505e-19
C43	7#14	7#5	cmodel	2.404e-19
C44	7#6	3#5	cmodel	2.94299e-18
C45	7#14	9#2	cmodel	1.1166e-18
C46	Q#4	3#7	cmodel	2.43336e-19
C47	7#12	E#1	cmodel	2.29916e-20
C48	6#3	3#5	cmodel	3.446e-18
C49	7#2	3#2	cmodel	2.12707e-18
C50	7#12	6#3	cmodel	2.00928e-19
C51	7#12	3#5	cmodel	1.02966e-19
C52	7#2	6#2	cmodel	2.59302e-18
C53	7#12	5#2	cmodel	5.74023e-20
C54	7#12	6#4	cmodel	1.17508e-19
C55	7#4	3#5	cmodel	6.73842e-19
C56	Q#4	Q#2	cmodel	2.5992e-19
C57	Q#3	3#6	cmodel	8.19619e-20
C58	5#6	5#4	cmodel	2.72346e-20
C59	3#6	3#7	cmodel	9.30095e-19
C60	5#2	3#5	cmodel	1.43408e-18
C61	7#12	7#6	cmodel	3.55463e-19
C62	7#4	5#2	cmodel	3.13245e-19
C63	7#14	5#2	cmodel	9.08297e-20
C64	6#5	3#7	cmodel	2.59302e-18
C65	7#14	3#4	cmodel	1.28863e-18
C66	7#12	7#4	cmodel	1.11229e-18
C67	7#4	7#14	cmodel	2.95333e-18
C68	5#2	7#8	cmodel	4.8088e-18
C69	7#5	3#5	cmodel	3.07798e-18
C70	7#14	7#8	cmodel	8.23533e-20
C71	6#4	3#7	cmodel	3.28365e-18
C72	3#6	6#4	cmodel	6.51411e-19
C73	5#5	5#3	cmodel	4.52094e-19
C74	7#14	5#6	cmodel	6.46507e-19
C75	3#4	5#2	cmodel	5.6708e-18
C76	5#2	D#2	cmodel	9.19389e-19
C77	E#1	7#3	cmodel	8.45332e-19
C78	3#6	E#1	cmodel	4.51926e-19
C79	3#6	7#2	cmodel	3.18771e-19
C80	6#4	7#6	cmodel	5.19786e-19
C81	7	7#4	cmodel	1.47756e-18
C82	5#4	VSS	cmodel	6.3096e-19
C83	3#3	5	cmodel	5.20143e-18
C84	5#4	VDD	cmodel	3.27096e-18
C85	7#14	5	cmodel	2.54625e-20
C86	3#6	6	cmodel	2.27458e-19
C87	7#12	VDD	cmodel	9.62999e-20
C88	D	VSS	cmodel	1.29705e-18
C89	7	7#8	cmodel	1.12198e-18
C90	Q#2	VSS	cmodel	1.02228e-18
C91	7#14	VDD	cmodel	1.8539e-19
C92	D	VDD	cmodel	8.60523e-19
C93	Q	VSS	cmodel	1.95263e-19
C94	3	3#2	cmodel	6.69095e-19
C95	7	D	cmodel	1.9295e-19
C96	E	VSS	cmodel	1.97108e-18
C97	3#2	VSS	cmodel	4.38294e-19
C98	3#5	7	cmodel	5.83535e-18
C99	VDD	VSS	cmodel	2.65436e-17
C100	7#2	6	cmodel	3.47943e-18
C101	6#2	VSS	cmodel	2.88321e-19
C102	3	6#2	cmodel	3.35085e-19
C103	7	VSS	cmodel	1.43203e-18
C104	Q#2	VDD	cmodel	3.62062e-18
C105	D	5	cmodel	1.62843e-18
C106	Q#1	VDD	cmodel	8.43027e-19
C107	10#2	VSS	cmodel	3.90502e-19
C108	3	VSS	cmodel	2.43381e-19
C109	7	5#2	cmodel	9.4163e-19
C110	6	VSS	cmodel	5.4732e-19
C111	D	9	cmodel	1.93334e-19
C112	E	VDD	cmodel	4.36348e-19
C113	10	VSS	cmodel	4.62106e-19
C114	Q	3	cmodel	5.71128e-20
C115	VDD	7#3	cmodel	2.2963e-18
C116	5	VSS	cmodel	1.86003e-18
C117	3#2	VDD	cmodel	3.62062e-18
C118	5#3	VSS	cmodel	1.22017e-18
C119	Q#4	VSS	cmodel	2.79367e-18
C120	5	D#2	cmodel	1.19956e-18
C121	6#2	VDD	cmodel	2.54582e-18
C122	7	VDD	cmodel	9.05697e-19
C123	9	VSS	cmodel	3.95335e-18
C124	3#7	VSS	cmodel	1.95415e-18
C125	7#2	VDD	cmodel	1.88673e-18
C126	5#6	9	cmodel	5.08714e-19
C127	10#2	VDD	cmodel	3.37502e-18
C128	6#5	VSS	cmodel	2.84467e-18
C129	3	VDD	cmodel	8.43948e-19
C130	6	3#2	cmodel	1.27425e-19
C131	7#12	VSS	cmodel	7.47628e-19
C132	7#5	VSS	cmodel	3.27324e-18
C133	6	VDD	cmodel	3.22796e-18
C134	7#14	VSS	cmodel	1.99271e-18
C135	9#2	VSS	cmodel	3.66793e-18
C136	3#5	VDD	cmodel	4.06553e-20
C137	Q#3	VSS	cmodel	1.24137e-18
C138	VDD	10	cmodel	3.33574e-18
C139	3	7#2	cmodel	3.00226e-19
C140	Q#1	VSS	cmodel	4.16513e-19
C141	VSS	5#5	cmodel	3.72217e-18
C142	Q#1	3	cmodel	3.1785e-19
C143	VDD	5#2	cmodel	1.91656e-18
C144	6	7	cmodel	4.51264e-19
C145	9	3#4	cmodel	3.11555e-18
C146	VSS	7#3	cmodel	3.14224e-18
C147	5	VDD	cmodel	8.98441e-19
C148	3#6	VSS	cmodel	1.15133e-18
C149	6	7#8	cmodel	2.00854e-19
C150	VSS	E#1	cmodel	5.84456e-18
C151	6	10#2	cmodel	6.11708e-19
C152	7	10	cmodel	1.76454e-18
C153	5#3	VDD	cmodel	2.502e-18
C154	7#4	VDD	cmodel	3.82847e-19
C155	7#2	VSS	cmodel	1.39573e-18
C156	6#4	7	cmodel	8.67862e-20
C157	3	6	cmodel	8.33064e-19
C158	5	5#4	cmodel	2.39971e-18
C159	6#4	VSS	cmodel	4.18394e-18
C160	7#12	10	cmodel	1.97386e-19
C161	6#3	VSS	cmodel	3.96656e-18
C162	D#1	VDD	cmodel	2.17337e-18
C163	7#8	VDD	cmodel	4.50306e-18
C164	3#5	VSS	cmodel	2.65135e-18
C165	3#4	5	cmodel	1.84662e-18
C166	7#6	VSS	cmodel	3.68251e-18
C167	5#2	VSS	cmodel	1.09876e-18
C168	D#2	VDD	cmodel	2.05664e-18
C169	3#4	VSS	cmodel	1.87366e-18
C170	7#4	VSS	cmodel	1.41364e-18
C171	7#4	10	cmodel	3.94024e-19
C172	7	10#2	cmodel	3.83078e-18
C173	D#1	VSS	cmodel	2.42121e-19
C174	7#8	VSS	cmodel	6.30795e-19
C175	3#3	VSS	cmodel	2.56143e-18
C176	5	D#1	cmodel	2.21367e-18
C177	D#2	VSS	cmodel	2.54534e-19
C178	5#6	VSS	cmodel	4.05975e-18
C179	3	Q#2	cmodel	1.67092e-19
C180	3#5	10	cmodel	7.7245e-19
C181	10	7#8	cmodel	1.32163e-18
*
*
.ENDS LHQ_X1_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
