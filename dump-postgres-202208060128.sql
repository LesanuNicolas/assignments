--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-08-06 01:28:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 17003)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    country_id integer,
    name character varying(100),
    population integer,
    density double precision
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17002)
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cities ALTER COLUMN city_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16997)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying(100),
    population integer,
    area double precision
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16996)
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.countries ALTER COLUMN country_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.countries_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16389)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16384)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- TOC entry 3331 (class 0 OID 17003)
-- Dependencies: 214
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (city_id, country_id, name, population, density) FROM stdin;
325	1001	Tokyo	37468000	6169
326	993	Delhi	28514000	11289
327	992	Shanghai	25582000	3922
328	996	São Paulo	21650000	8055
329	1002	Mexico City	21581000	6202
330	1007	Cairo	20076000	3079
331	993	Mumbai	19980000	20694
332	992	Beijing	19618000	1334
333	999	Dhaka	19578000	26349
334	1001	Osaka	19281000	12111
335	994	New York	18819000	11316
336	997	Karachi	15400000	4224
337	1024	Buenos Aires	14967000	15046
338	992	Chongqing	14838000	389
339	1009	Istanbul	14751000	2987
340	993	Kolkata	14681000	21935
341	1003	Manila	13482000	41399
342	998	Lagos	13463000	\N
343	996	Rio de Janeiro	13293000	5340
344	992	Tianjin	13215000	1163
345	\N	Kinshasa	13171000	1150
346	992	Guangzhou	12638000	1950
347	994	Los Angeles	12458000	3287
348	1000	Moscow	12410000	5257
349	992	Shenzhen	11908000	6111
350	997	Lahore	11738000	6279
351	993	Bangalore	11440000	11909
352	1012	Paris	10901000	20460
353	1020	Bogotá	10574000	5018
354	995	Jakarta	10517000	15292
355	993	Chennai	10456000	15791
356	1031	Lima	10391000	3329
357	1011	Bangkok	10156000	5293
358	1017	Seoul	9963000	16552
359	1001	Nagoya	9507000	7118
360	993	Hyderabad	9482000	10759
361	1013	London	9046000	5614
362	1008	Tehran	8896000	12028
363	994	Chicago	8864000	4663
364	992	Chengdu	8813000	1116
365	992	Nanjing	8245000	1103
366	992	Wuhan	8176000	1282
367	1004	Ho Chi Minh City	8145000	3606
368	1050	Luanda	7774000	18671
369	993	Ahmedabad	7681000	12006
370	1033	Kuala Lumpur	7564000	7276
371	992	Xi'an	7444000	887
372	992	Hong Kong	7429000	6611
373	992	Dongguan	7360000	3384
374	992	Hangzhou	7236000	570
375	992	Foshan	7236000	1870
376	992	Shenyang	6921000	639
377	1036	Riyadh	6907000	3499
378	1028	Baghdad	6812000	1563
379	1051	Santiago	6680000	10748
380	993	Surat	6564000	13660
381	1018	Madrid	6497000	5390
382	992	Suzhou	6339000	1263
383	993	Pune	6276000	11321
384	992	Harbin	6115000	200
385	994	Houston	6115000	1497
386	994	Dallas	6099000	1525
387	1027	Toronto	6082000	4336
388	1021	Dar es Salaam	6048000	3133
389	994	Miami	6036000	5069
390	996	Belo Horizonte	5972000	7563
391	1107	Singapore	5792000	7770
392	994	Philadelphia	5695000	4129
393	994	Atlanta	5572000	1186
394	1001	Fukuoka	5551000	4627
395	1022	Khartoum	5534000	29
396	1018	Barcelona	5494000	15980
397	1016	Johannesburg	5486000	\N
398	1000	Saint Petersburg	5383000	\N
399	992	Qingdao	5381000	\N
400	992	Dalian	5300000	\N
401	994	Washington	5207000	3969
402	1015	Yangon	5157000	\N
403	1007	Alexandria	5086000	\N
404	992	Jinan	5052000	849
405	1002	Guadalajara	5023000	9176
\.


--
-- TOC entry 3329 (class 0 OID 16997)
-- Dependencies: 212
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, population, area) FROM stdin;
992	China	1339724852	9596961
993	India	1182105564	3287263
994	United States	309349689	9833520
995	Indonesia	237641326	1904569
996	Brazil	193252604	8515767
997	Pakistan	173510000	881913
998	Nigeria	158258917	923768
999	Bangladesh	148600000	147570
1000	Russia	142849472	17075200
1001	Japan	128056000	377972
1002	Mexico	112336538	1972550
1003	Philippines	92337852	343448
1004	Vietnam	86932500	331230.8
1005	Ethiopia	83483000	1104300
1006	Germany	81802257	357168
1007	Egypt	78728000	1010408
1008	Iran	74733230	1648195
1009	Turkey	73722988	783356
1010	Democratic Republic of the Congo	67827496	2345409
1011	Thailand	63878267	513120
1012	France	62791013	640679
1013	United Kingdom	62026962	242495
1014	Italy	60340328	301338
1015	Myanmar	59780000	676578
1016	South Africa	49991300	1221037
1017	South Korea	49410366	100210
1018	Spain	45989016	505990
1019	Ukraine	45782592	603628
1020	Colombia	45508205	1141748
1021	Tanzania	43187823	947303
1022	Sudan	42338426	1886068
1023	Kenya	40862900	580367
1024	Argentina	40518951	2780400
1025	Poland	38167329	312679
1026	Algeria	35978000	2381741
1027	Canada	34108752	9984670
1028	Iraq	32481000	437072
1029	Morocco	31894000	710850
1030	Uganda	31784600	241038
1031	Peru	29461933	1285216
1032	Venezuela	28833845	716445
1033	Malaysia	28334135	330803
1034	Nepal	28043744	147181
1035	Uzbekistan	28001400	448978
1036	Saudi Arabia	27136977	2149690
1037	Afghanistan	24485600	652864
1038	North Korea	24325701	120540
1039	Ghana	24223431	239567
1040	Taiwan	23162120	36197
1041	Yemen	23153982	527968
1042	Mozambique	22416881	801590
1043	Australia	22299800	7692024
1044	Cote d'Ivoire	21570746	322463
1045	Romania	21462186	238397
1046	Sri Lanka	20653000	65610
1047	Syria	20619000	185180
1048	Madagascar	20146442	587041
1049	Cameroon	19958352	475442
1050	Angola	18992708	1246700
1051	Chile	17094270	756096
1052	Netherlands	16574989	41543
1053	Kazakhstan	16442000	2724900
1054	Burkina Faso	15730977	274200
1055	Mali	15370000	1240192
1056	Niger	15203822	1267000
1057	Ecuador	14483499	283561
1058	Guatemala	14361666	108889
1059	Cambodia	14302779	181035
1060	Malawi	13947592	118484
1061	Zambia	13257269	752618
1062	Zimbabwe	12644041	390757
1063	Senegal	12509434	196712
1064	Chad	11714904	1284000
1065	Greece	11305118	131957
1066	Cuba	11241161	109884
1067	Belgium	10839905	30528
1068	Portugal	10637713	92212
1069	Tunisia	10547100	163610
1070	Czechia	10506813	78866
1071	Bolivia	10426154	1098581
1072	Rwanda	10412820	26338
1073	Guinea	10323755	245836
1074	Hungary	10014324	93030
1075	Dominican Republic	9884371	48315
1076	Haiti	9855000	27750
1077	Belarus	9480178	207595
1078	Somalia	9358602	637657
1079	Sweden	9340682	450295
1080	Benin	9211741	114763
1081	Azerbaijan	8997586	86600
1082	Burundi	8518862	27834
1083	Austria	8375290	83879
1084	United Arab Emirates	8264070	83600
1085	Honduras	8045990	112492
1086	Switzerland	7785806	41285
1087	Israel	7623600	22072
1088	Tajikistan	7616400	143100
1089	Bulgaria	7563710	110993.6
1090	Serbia	7291436	77474
1091	Hong Kong	7024200	2755
1092	Papua New Guinea	6744955	462840
1093	Libya	6545619	1759541
1094	Paraguay	6459727	406752
1095	Laos	6230200	237955
1096	El Salvador	6194126	21041
1097	Togo	6191155	56785
1098	Jordan	6113000	89341
1099	Sierra Leone	5835664	71740
1100	Nicaragua	5822265	130375
1101	Denmark	5534738	42931
1102	Turkmenistan	5479800	491210
1103	Slovakia	5424925	49035
1104	Kyrgyzstan	5418300	199951
1105	Finland	5351427	338424
1106	Eritrea	5223994	117600
1107	Singapore	5076700	721.5
1108	Norway	4858199	385203
1109	Costa Rica	4563539	51100
1110	Central African Republic	4505945	622984
1111	Ireland	4467854	70273
1112	Georgia	4436391	69700
1113	Croatia	4425747	56594
1114	New Zealand	4367800	268021
1115	Liberia	4101767	111369
1116	Palestine	4048403	6020
1117	Bosnia and Herzegovina	3844046	51129
1118	Lebanon	3785655	10452
1119	Republic of the Congo	3758678	342000
1120	Puerto Rico	3721978	9104
1121	Kuwait	3566437	17818
1122	Moldova	3563695	33846
1123	Panama	3504483	75417
1124	Uruguay	3356584	176215
1125	Lithuania	3329039	65300
1126	Armenia	3249482	29743
1127	Mauritania	3217383	1030000
1128	Albania	3195000	28748
1129	Mongolia	2780800	1566000
1130	Oman	2773479	309500
1131	Jamaica	2701200	10991
1132	Latvia	2248374	64589
1133	Namibia	2212037	825615
1134	Kosovo	2208107	10908
1135	Macedonia	2052722	25713
1136	Slovenia	2046976	20273
1137	Botswana	2029307	581730
1138	Lesotho	1891830	30355
1139	Gambia	1750732	10689
1140	Qatar	1699435	11581
1141	Guinea-Bissau	1647380	36125
1142	Gabon	1501266	267667
1143	Estonia	1340127	45227
1144	Trinidad and Tobago	1317714	5131
1145	Equatorial Guinea	1313000	28050
1146	Mauritius	1283415	2040
1147	Bahrain	1234571	765.3
1148	Timor-Leste	1149028	\N
1149	Cyprus	1102677	\N
1150	Swaziland	1055506	\N
1151	Djibouti	879053	\N
1152	Fiji	850700	\N
1153	Réunion	828054	\N
1154	Guyana	761442	\N
1155	Bhutan	695822	\N
1156	Comoros	675000	\N
1157	Montenegro	616411	\N
1158	Macau	552300	\N
1159	Suriname	531170	\N
1160	Solomon Islands	530669	\N
1161	Western Sahara	530000	\N
1162	Cape Verde	512582	\N
1163	Luxembourg	502066	\N
1164	Brunei	414400	\N
1165	Malta	414372	\N
1166	Guadeloupe	404394	\N
1167	Martinique	399637	\N
1168	Bahamas	353658	\N
1169	Maldives	319738	\N
1170	Iceland	317630	\N
1171	Belize	312971	\N
1172	Barbados	276300	\N
1173	French Polynesia	267000	\N
1174	New Caledonia	248000	\N
1175	Vanuatu	245036	\N
1176	French Guiana	232223	\N
1177	Mayotte	202000	\N
1178	Samoa	183123	\N
1179	Guam	180865	\N
1180	Saint Lucia	174000	\N
1181	São Tomé and Príncipe	165397	\N
1182	Curacao	142180	\N
1183	Grenada	109553	\N
1184	Saint Vincent and the Grenadines	109284	\N
1185	U.S. Virgin Islands	106267	\N
1186	Tonga	103365	\N
1187	Micronesia	102624	\N
1188	Aruba	101484	\N
1189	Kiribati	100835	\N
\.


--
-- TOC entry 3327 (class 0 OID 16389)
-- Dependencies: 210
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
add script	Alexandru Nicolas Lesanu	liquibase/scripts/script.xml	2022-08-06 01:08:21.935957	1	EXECUTED	8:0d14f53ab53ba35e691d936fb42857d6	sqlFile		\N	4.14.0	dev	\N	9737301856
\.


--
-- TOC entry 3326 (class 0 OID 16384)
-- Dependencies: 209
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 213
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 405, true);


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 211
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 1189, true);


--
-- TOC entry 3185 (class 2606 OID 17007)
-- Name: cities cities_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (city_id);


--
-- TOC entry 3183 (class 2606 OID 17001)
-- Name: countries countries_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (country_id);


--
-- TOC entry 3181 (class 2606 OID 16388)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 17008)
-- Name: cities cities_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_fk FOREIGN KEY (country_id) REFERENCES public.countries(country_id);


-- Completed on 2022-08-06 01:28:19

--
-- PostgreSQL database dump complete
--

