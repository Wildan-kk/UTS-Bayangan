--
-- PostgreSQL database dump
--

\restrict Li8YliPJ48ZlixxYBLURXOoWec24E3dkZViBaX32nqds7yFg84laY8fgDKDcOhq

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-02 09:04:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17320)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    branchno character varying(5) NOT NULL,
    street character varying(50) NOT NULL,
    city character varying(30) NOT NULL,
    postcode character varying(10) NOT NULL
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17329)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    clientno character varying(5) NOT NULL,
    fname character varying(30) NOT NULL,
    lname character varying(30) NOT NULL,
    telno character varying(20),
    preftype character varying(10),
    maxrent integer
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17337)
-- Name: privateowner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privateowner (
    ownerno character varying(5) NOT NULL,
    fname character varying(30) NOT NULL,
    lname character varying(30) NOT NULL,
    address text NOT NULL,
    telno character varying(20) NOT NULL
);


ALTER TABLE public.privateowner OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17366)
-- Name: propertyforrent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propertyforrent (
    propertyno character varying(5) NOT NULL,
    street character varying(50) NOT NULL,
    city character varying(30) NOT NULL,
    postcode character varying(10) NOT NULL,
    type character varying(10) NOT NULL,
    rooms integer NOT NULL,
    rent integer NOT NULL,
    ownerno character varying(5),
    staffno character varying(5),
    branchno character varying(5)
);


ALTER TABLE public.propertyforrent OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17413)
-- Name: registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration (
    clientno character varying(5) NOT NULL,
    branchno character varying(5) NOT NULL,
    staffno character varying(5),
    datejoined date NOT NULL
);


ALTER TABLE public.registration OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17349)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staffno character varying(5) NOT NULL,
    fname character varying(30) NOT NULL,
    lname character varying(30) NOT NULL,
    "position" character varying(30) NOT NULL,
    sex character(1),
    dob date NOT NULL,
    salary integer NOT NULL,
    branchno character varying(5),
    CONSTRAINT staff_sex_check CHECK ((sex = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17393)
-- Name: viewing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viewing (
    clientno character varying(5) NOT NULL,
    propertyno character varying(5) NOT NULL,
    viewdate date NOT NULL,
    comment text
);


ALTER TABLE public.viewing OWNER TO postgres;

--
-- TOC entry 5050 (class 0 OID 17320)
-- Dependencies: 219
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (branchno, street, city, postcode) FROM stdin;
B005	22 Deer Rd	London	SW1 4EH
B007	16 Argyll St	Aberdeen	AB2 3SU
B003	163 Main St	Glasgow	G11 9QX
B004	32 Manse Rd	Bristol	BS99 1NZ
B002	56 Clover Dr	London	NW10 6EU
\.


--
-- TOC entry 5051 (class 0 OID 17329)
-- Dependencies: 220
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (clientno, fname, lname, telno, preftype, maxrent) FROM stdin;
CR76	John	Kay	0207-774-5632	Flat	425
CR56	Aline	Stewart	0141-848-1825	Flat	350
CR74	Mike	Ritchie	01475-392178	House	750
CR62	Mary	Tregear	01224-196720	Flat	600
\.


--
-- TOC entry 5052 (class 0 OID 17337)
-- Dependencies: 221
-- Data for Name: privateowner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privateowner (ownerno, fname, lname, address, telno) FROM stdin;
CO46	Joe	Keogh	2 Fergus Dr, Aberdeen AB2 7SX	01224-861212
CO87	Carol	Farrel	6 Achray St, Glasgow G32 9DX	0141-357-7419
CO40	Tina	Murphy	63 Well St, Glasgow G42	0141-943-1728
CO93	Tony	Shaw	12 Park Pl, Glasgow G4 0QR	0141-225-7025
\.


--
-- TOC entry 5054 (class 0 OID 17366)
-- Dependencies: 223
-- Data for Name: propertyforrent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.propertyforrent (propertyno, street, city, postcode, type, rooms, rent, ownerno, staffno, branchno) FROM stdin;
PA14	16 Holhead	Aberdeen	AB7 5SU	House	6	650	CO46	SA9	B007
PL94	6 Argyll St	London	NW2	Flat	4	400	CO87	SL41	B005
PG4	6 Lawrence St	Glasgow	G11 9QX	Flat	3	350	CO40	\N	B003
PG36	2 Manor Rd	Glasgow	G32 4QX	Flat	3	373	CO93	SG37	B003
PG21	18 Dale Rd	Glasgow	G12	House	5	600	CO87	SG37	B003
PG16	5 Novar Dr	Glasgow	G12 9AX	Flat	4	450	CO93	SG14	B003
\.


--
-- TOC entry 5056 (class 0 OID 17413)
-- Dependencies: 225
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registration (clientno, branchno, staffno, datejoined) FROM stdin;
CR76	B005	SL41	2004-01-02
CR56	B003	SG37	2003-04-11
CR74	B003	SG37	2002-11-16
CR62	B007	SA9	2003-03-07
\.


--
-- TOC entry 5053 (class 0 OID 17349)
-- Dependencies: 222
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staffno, fname, lname, "position", sex, dob, salary, branchno) FROM stdin;
SL21	John	White	Manager	M	1945-10-01	30000	B005
SG37	Ann	Beech	Assistant	F	1960-11-10	12000	B003
SG14	David	Ford	Supervisor	M	1958-03-24	18000	B003
SA9	Mary	Howe	Assistant	F	1970-02-19	9000	B007
SG5	Susan	Brand	Manager	F	1940-06-03	24000	B003
SL41	Julie	Lee	Assistant	F	1965-06-13	9000	B005
\.


--
-- TOC entry 5055 (class 0 OID 17393)
-- Dependencies: 224
-- Data for Name: viewing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viewing (clientno, propertyno, viewdate, comment) FROM stdin;
CR56	PA14	2004-05-24	too small
CR76	PG4	2004-04-20	too remote
CR56	PG4	2004-05-26	\N
CR62	PA14	2004-05-14	no dining room
CR56	PG36	2004-04-28	\N
\.


--
-- TOC entry 4881 (class 2606 OID 17328)
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (branchno);


--
-- TOC entry 4883 (class 2606 OID 17336)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (clientno);


--
-- TOC entry 4885 (class 2606 OID 17348)
-- Name: privateowner privateowner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privateowner
    ADD CONSTRAINT privateowner_pkey PRIMARY KEY (ownerno);


--
-- TOC entry 4889 (class 2606 OID 17377)
-- Name: propertyforrent propertyforrent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_pkey PRIMARY KEY (propertyno);


--
-- TOC entry 4893 (class 2606 OID 17420)
-- Name: registration registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (clientno, branchno);


--
-- TOC entry 4887 (class 2606 OID 17360)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staffno);


--
-- TOC entry 4891 (class 2606 OID 17402)
-- Name: viewing viewing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_pkey PRIMARY KEY (clientno, propertyno, viewdate);


--
-- TOC entry 4895 (class 2606 OID 17388)
-- Name: propertyforrent propertyforrent_branchno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_branchno_fkey FOREIGN KEY (branchno) REFERENCES public.branch(branchno) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4896 (class 2606 OID 17378)
-- Name: propertyforrent propertyforrent_ownerno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_ownerno_fkey FOREIGN KEY (ownerno) REFERENCES public.privateowner(ownerno) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4897 (class 2606 OID 17383)
-- Name: propertyforrent propertyforrent_staffno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_staffno_fkey FOREIGN KEY (staffno) REFERENCES public.staff(staffno) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4900 (class 2606 OID 17426)
-- Name: registration registration_branchno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_branchno_fkey FOREIGN KEY (branchno) REFERENCES public.branch(branchno) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4901 (class 2606 OID 17421)
-- Name: registration registration_clientno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_clientno_fkey FOREIGN KEY (clientno) REFERENCES public.client(clientno) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4902 (class 2606 OID 17431)
-- Name: registration registration_staffno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_staffno_fkey FOREIGN KEY (staffno) REFERENCES public.staff(staffno) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4894 (class 2606 OID 17361)
-- Name: staff staff_branchno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_branchno_fkey FOREIGN KEY (branchno) REFERENCES public.branch(branchno) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4898 (class 2606 OID 17403)
-- Name: viewing viewing_clientno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_clientno_fkey FOREIGN KEY (clientno) REFERENCES public.client(clientno) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4899 (class 2606 OID 17408)
-- Name: viewing viewing_propertyno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_propertyno_fkey FOREIGN KEY (propertyno) REFERENCES public.propertyforrent(propertyno) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-10-02 09:04:43

--
-- PostgreSQL database dump complete
--

\unrestrict Li8YliPJ48ZlixxYBLURXOoWec24E3dkZViBaX32nqds7yFg84laY8fgDKDcOhq

