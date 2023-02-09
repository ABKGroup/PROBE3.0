*
*
*
*                       LINUX           Fri Feb  3 22:37:54 2023
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
.SUBCKT BUF_X8_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0 VSS I VDD Z
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	3#3	I#5	VDD	VDD	pmos_rvt	nfin=2
MM1	VDD	I#4	3#3	VDD	pmos_rvt	nfin=2
MM2	3	I#3	VDD	VDD	pmos_rvt	nfin=2
MM3	VDD	I#1	3	VDD	pmos_rvt	nfin=2
MM4	Z#5	3#17	VDD	VDD	pmos_rvt	nfin=2
MM5	VDD	3#15	Z#5	VDD	pmos_rvt	nfin=2
MM6	Z#3	3#14	VDD	VDD	pmos_rvt	nfin=2
MM7	VDD	3#13	Z#3	VDD	pmos_rvt	nfin=2
MM8	Z#2	3#12	VDD	VDD	pmos_rvt	nfin=2
MM9	VDD	3#11	Z#2	VDD	pmos_rvt	nfin=2
MM10	Z#1	3#10	VDD	VDD	pmos_rvt	nfin=2
MM11	VDD	3#9	Z#1	VDD	pmos_rvt	nfin=2
MM12	3#6	I#5	VSS	VSS	nmos_rvt	nfin=2
MM13	VSS	I#4	3#6	VSS	nmos_rvt	nfin=2
MM14	3#4	I#3	VSS	VSS	nmos_rvt	nfin=2
MM15	VSS	I#1	3#4	VSS	nmos_rvt	nfin=2
MM16	Z#10	3#17	VSS	VSS	nmos_rvt	nfin=2
MM17	VSS	3#15	Z#10	VSS	nmos_rvt	nfin=2
MM18	Z#8	3#14	VSS	VSS	nmos_rvt	nfin=2
MM19	VSS	3#13	Z#8	VSS	nmos_rvt	nfin=2
MM20	Z#7	3#12	VSS	VSS	nmos_rvt	nfin=2
MM21	VSS	3#11	Z#7	VSS	nmos_rvt	nfin=2
MM22	Z#6	3#10	VSS	VSS	nmos_rvt	nfin=2
MM23	VSS	3#9	Z#6	VSS	nmos_rvt	nfin=2
*
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rj2	I#1	I#3	M0	    0.7136
Rj3	I#3	I#4	M0	    0.7136
Rj4	I#4	I#5	M0	    0.7136
Rj5	Z#1	Z#2	M0	    1.4271
Rj6	Z#2	Z#3	M0	    1.4271
Rj7	Z#3	Z#4	M0	    1.0704
Rj8	Z#4	Z#5	M0	    0.3568
Rj9	Z#6	Z#7	M0	    1.4271
Rj10	Z#7	Z#8	M0	    1.4271
Rj11	Z#8	Z#9	M0	    1.0704
Rj12	Z#9	Z#10	M0	    0.3568
Rj17	3	3#2	M0	    0.1189
Rj18	3#2	3#3	M0	    1.3082
Rj19	3#4	3#5	M0	    0.1189
Rj20	3#5	3#6	M0	    1.3082
Rj21	3#7	3#8	M0	    6.4271
Rj22	3#9	3#10	M0	    0.7136
Rj23	3#10	3#11	M0	    0.7136
Rj24	3#11	3#12	M0	    0.7136
Rj25	3#12	3#13	M0	    0.7136
Rj26	3#13	3#14	M0	    0.7136
Rj27	3#14	3#15	M0	    0.7136
Rj28	3#15	3#16	M0	    0.4757
Rj29	3#16	3#17	M0	    0.2379
Ri1	I	I#1	M1	    5.0211
Ri2	Z	Z#9	M1	    5.0422
Ri3	Z	Z#4	M1	    5.0422
Ri5	3#2	3#8	M1	    5.0422
Ri6	3#8	3#5	M1	    5.0422
Ri7	3#7	3#16	M1	   10.0845
*
*       CAPACITOR CARDS
*
*
C1	3#11	Z#7	cmodel	3.85293e-18
C2	3#5	I	cmodel	3.03052e-18
C3	I	3#8	cmodel	8.43771e-19
C4	3#7	Z#10	cmodel	2.58492e-18
C5	I#1	I	cmodel	2.44601e-18
C6	I	3#16	cmodel	9.22568e-19
C7	I	3#7	cmodel	4.6338e-19
C8	I#1	3#17	cmodel	4.9525e-19
C9	3#5	3#8	cmodel	3.7654e-18
C10	3#7	Z	cmodel	2.01913e-18
C11	Z#7	Z#2	cmodel	2.79154e-18
C12	3#5	3#2	cmodel	9.59105e-19
C13	I	Z#10	cmodel	2.74786e-19
C14	I#1	3#5	cmodel	1.54421e-18
C15	3#8	3#2	cmodel	3.7654e-18
C16	3#16	3#5	cmodel	1.27112e-19
C17	I#1	3#8	cmodel	8.45332e-19
C18	3#7	3#5	cmodel	1.04357e-19
C19	I	3#17	cmodel	2.93436e-19
C20	3#17	3#16	cmodel	3.79924e-19
C21	3#10	Z#6	cmodel	3.85293e-18
C22	3#8	3#7	cmodel	1.63498e-19
C23	3#16	I#1	cmodel	1.96095e-19
C24	Z#6	Z#1	cmodel	1.69988e-18
C25	3#15	Z#10	cmodel	2.90097e-19
C26	3#17	3#7	cmodel	8.768e-19
C27	3#2	Z#4	cmodel	4.21326e-19
C28	3#9	Z#6	cmodel	1.54421e-18
C29	3#16	3#7	cmodel	1.22691e-19
C30	3#16	Z#9	cmodel	1.49981e-18
C31	3#7	Z#9	cmodel	9.91816e-19
C32	3#6	3#3	cmodel	1.59851e-18
C33	3#7	Z#4	cmodel	1.00558e-18
C34	3#15	Z#9	cmodel	3.4158e-18
C35	3#2	Z#5	cmodel	5.77224e-19
C36	3#5	Z#10	cmodel	2.27087e-19
C37	Z#9	Z#4	cmodel	1.03702e-18
C38	3#14	Z#8	cmodel	2.87887e-18
C39	3#14	Z#9	cmodel	9.5955e-19
C40	I#5	3#6	cmodel	1.58884e-18
C41	I#4	3#5	cmodel	2.90097e-19
C42	3#13	Z#8	cmodel	3.85293e-18
C43	I#3	3#5	cmodel	4.34866e-18
C44	I#4	3#6	cmodel	3.52824e-18
C45	3#7	Z#5	cmodel	2.78869e-18
C46	Z#10	Z#5	cmodel	3.8988e-20
C47	3#12	Z#7	cmodel	3.85293e-18
C48	3#16	Z#10	cmodel	2.56515e-18
C49	Z#8	Z#3	cmodel	2.44065e-18
C50	Z#7	VSS	cmodel	1.43889e-18
C51	Z#2	VDD	cmodel	7.84338e-18
C52	Z#6	VSS	cmodel	1.87171e-18
C53	3#8	VDD	cmodel	8.98725e-19
C54	I#5	VSS	cmodel	5.07747e-18
C55	Z#1	VDD	cmodel	5.4597e-18
C56	I#4	VSS	cmodel	4.44892e-18
C57	I	VSS	cmodel	1.86824e-18
C58	3#2	VDD	cmodel	6.49491e-18
C59	3#3	VSS	cmodel	1.66841e-18
C60	I#5	VDD	cmodel	5.96582e-19
C61	I#3	VSS	cmodel	4.10544e-18
C62	VDD	VSS	cmodel	3.21586e-17
C63	Z	VSS	cmodel	4.45287e-19
C64	Z#5	VSS	cmodel	2.88216e-19
C65	3#17	VSS	cmodel	2.53941e-18
C66	I	VDD	cmodel	4.36348e-19
C67	Z#3	VSS	cmodel	1.04037e-18
C68	3#15	VSS	cmodel	3.29304e-18
C69	3#5	VSS	cmodel	2.1568e-18
C70	3#3	VDD	cmodel	5.17488e-18
C71	Z#2	VSS	cmodel	1.18994e-18
C72	VSS	3#14	cmodel	4.42883e-18
C73	3#8	VSS	cmodel	1.68486e-18
C74	Z#1	VSS	cmodel	1.74566e-18
C75	3#13	VSS	cmodel	4.46065e-18
C76	3#2	VSS	cmodel	1.02854e-18
C77	3#7	VDD	cmodel	2.12141e-18
C78	3#12	VSS	cmodel	4.46065e-18
C79	I#1	VSS	cmodel	3.73564e-18
C80	3#6	VSS	cmodel	1.78397e-18
C81	3#11	VSS	cmodel	4.46065e-18
C82	Z#5	VDD	cmodel	2.36641e-18
C83	3#16	VSS	cmodel	2.96485e-18
C84	3#9	VDD	cmodel	5.96582e-19
C85	3#10	VSS	cmodel	4.46065e-18
C86	3#7	VSS	cmodel	2.37838e-18
C87	Z#10	VSS	cmodel	3.2327e-19
C88	Z#3	VDD	cmodel	6.85748e-18
C89	3#9	VSS	cmodel	5.02808e-18
C90	Z#9	VSS	cmodel	1.64297e-18
C91	Z#4	VDD	cmodel	4.59555e-18
C92	Z#8	VSS	cmodel	1.25764e-18
C93	Z#4	VSS	cmodel	7.16551e-19
*
*
.ENDS BUF_X8_6T_2F_45CPP_24M0P_30M1P_24M2P_2MPO_ET_M0
*
