--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Product_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product_infos" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "productId" integer
);


ALTER TABLE public."Product_infos" OWNER TO postgres;

--
-- Name: Product_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Product_infos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_infos_id_seq" OWNER TO postgres;

--
-- Name: Product_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Product_infos_id_seq" OWNED BY public."Product_infos".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: basket_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_products (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "basketId" integer,
    "productId" integer
);


ALTER TABLE public.basket_products OWNER TO postgres;

--
-- Name: basket_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_products_id_seq OWNER TO postgres;

--
-- Name: basket_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_products_id_seq OWNED BY public.basket_products.id;


--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    img character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer,
    gender character varying(255) DEFAULT 'unknown'::character varying NOT NULL,
    size integer[] DEFAULT ARRAY[0] NOT NULL,
    color character varying(255) DEFAULT 'black'::character varying NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    rate integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "productId" integer
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: type_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_brands (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);


ALTER TABLE public.type_brands OWNER TO postgres;

--
-- Name: type_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_brands_id_seq OWNER TO postgres;

--
-- Name: type_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_brands_id_seq OWNED BY public.type_brands.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO postgres;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: Product_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_infos" ALTER COLUMN id SET DEFAULT nextval('public."Product_infos_id_seq"'::regclass);


--
-- Name: basket_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products ALTER COLUMN id SET DEFAULT nextval('public.basket_products_id_seq'::regclass);


--
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: type_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands ALTER COLUMN id SET DEFAULT nextval('public.type_brands_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: Product_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product_infos" (id, title, description, "createdAt", "updatedAt", "productId") FROM stdin;
152	description	gfdsgsssgfdsgfdsgdsfgsdfggfhgfhjghgj	2024-04-23 00:49:01.528+03	2024-04-23 00:49:01.528+03	\N
8	jhgh	jh	2023-09-08 09:04:03.504+03	2023-09-08 09:04:03.504+03	\N
9			2023-09-08 09:04:03.504+03	2023-09-08 09:04:03.504+03	\N
10			2023-09-08 09:04:03.504+03	2023-09-08 09:04:03.504+03	\N
7	12312	312312rds	2023-09-08 08:23:45.34+03	2023-09-08 08:23:45.34+03	\N
6	123	123123	2023-09-08 08:23:22.204+03	2023-09-08 08:23:22.204+03	\N
5	123	213	2023-09-08 07:34:07.167+03	2023-09-08 07:34:07.167+03	\N
3	sdfsa	fdsfdsf	2023-09-08 07:33:23.177+03	2023-09-08 07:33:23.177+03	\N
4	asdf	sdfdsf	2023-09-08 07:33:23.177+03	2023-09-08 07:33:23.177+03	\N
153	SKU	#34544	2024-04-23 00:49:01.528+03	2024-04-23 00:49:01.528+03	\N
154	stockQuantity	3	2024-04-23 00:49:01.528+03	2024-04-23 00:49:01.528+03	\N
125	description	sdffffffffffffffffffffffffffffffasdfsdfsd53454	2024-04-23 00:34:10.85+03	2024-04-23 00:34:10.85+03	\N
126	SKU	#43544	2024-04-23 00:34:10.85+03	2024-04-23 00:34:10.85+03	\N
127	stockQuantity	66	2024-04-23 00:34:10.85+03	2024-04-23 00:34:10.85+03	\N
170	description	sdaffffffffffffffffffffffffffff	2024-04-25 00:13:45.412+03	2024-04-25 00:13:45.412+03	\N
171	SKU	#34544	2024-04-25 00:13:45.412+03	2024-04-25 00:13:45.412+03	\N
172	stockQuantity	5	2024-04-25 00:13:45.412+03	2024-04-25 00:13:45.412+03	\N
272	description	adsgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgf	2024-04-25 23:12:53.625+03	2024-04-25 23:12:53.625+03	\N
273	SKU	#34544	2024-04-25 23:12:53.625+03	2024-04-25 23:12:53.625+03	\N
274	stockQuantity	4	2024-04-25 23:12:53.625+03	2024-04-25 23:12:53.625+03	\N
275	description	sdfsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2024-04-25 23:13:42.033+03	2024-04-25 23:13:42.033+03	\N
185	description	asdgggggggggggggggggggggggggg	2024-04-25 00:17:00.526+03	2024-04-25 00:17:00.526+03	\N
186	SKU	#34544	2024-04-25 00:17:00.526+03	2024-04-25 00:17:00.526+03	\N
187	stockQuantity	3	2024-04-25 00:17:00.526+03	2024-04-25 00:17:00.526+03	\N
276	SKU	#43555	2024-04-25 23:13:42.033+03	2024-04-25 23:13:42.033+03	\N
277	stockQuantity	4	2024-04-25 23:13:42.033+03	2024-04-25 23:13:42.033+03	\N
188	description	sadfffffffffffffffffffffffffffffffffffffffffffffffffffff	2024-04-25 12:42:07.812+03	2024-04-25 12:42:07.812+03	\N
189	SKU	#34544	2024-04-25 12:42:07.813+03	2024-04-25 12:42:07.813+03	\N
190	stockQuantity	6	2024-04-25 12:42:07.813+03	2024-04-25 12:42:07.813+03	\N
200	description	dsffffffffffffffffffffffdgfdg	2024-04-25 16:32:03.308+03	2024-04-25 16:32:03.308+03	\N
134	description	sdgdfgdfgdsfgafdsfffffffffffffffffffffffffff	2024-04-23 00:35:01.53+03	2024-04-23 00:35:01.53+03	\N
201	SKU	#34544	2024-04-25 16:32:03.308+03	2024-04-25 16:32:03.308+03	\N
202	stockQuantity	34	2024-04-25 16:32:03.308+03	2024-04-25 16:32:03.308+03	\N
197	description	dsfsdfdsfdsfsdffffffffffffffffffffffffffffff	2024-04-25 16:31:30.248+03	2024-04-25 16:31:30.248+03	\N
198	SKU	#34544	2024-04-25 16:31:30.248+03	2024-04-25 16:31:30.248+03	\N
199	stockQuantity	8	2024-04-25 16:31:30.248+03	2024-04-25 16:31:30.248+03	\N
194	description	sdagggggggggggggggggggggggggggggggggggg	2024-04-25 16:30:54.307+03	2024-04-25 16:30:54.307+03	\N
195	SKU	#43555	2024-04-25 16:30:54.307+03	2024-04-25 16:30:54.307+03	\N
196	stockQuantity	4	2024-04-25 16:30:54.307+03	2024-04-25 16:30:54.307+03	\N
191	description	sadffffffffffffffffffffff	2024-04-25 13:00:59.5+03	2024-04-25 13:00:59.5+03	\N
192	SKU	#43555	2024-04-25 13:00:59.5+03	2024-04-25 13:00:59.5+03	\N
193	stockQuantity	4	2024-04-25 13:00:59.5+03	2024-04-25 13:00:59.5+03	\N
182	description	dsafffffadfsssssssssdfsdfsadfdsaf	2024-04-25 00:16:41.399+03	2024-04-25 00:16:41.399+03	\N
183	SKU	#43555	2024-04-25 00:16:41.399+03	2024-04-25 00:16:41.399+03	\N
184	stockQuantity	5	2024-04-25 00:16:41.399+03	2024-04-25 00:16:41.399+03	\N
176	description	dsffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2024-04-25 00:15:29.347+03	2024-04-25 00:15:29.347+03	\N
177	SKU	#43555	2024-04-25 00:15:29.347+03	2024-04-25 00:15:29.347+03	\N
178	stockQuantity	4	2024-04-25 00:15:29.348+03	2024-04-25 00:15:29.348+03	\N
173	description	dfgggggggggggggggggggggggggggggggggggggggggggggh	2024-04-25 00:15:04.448+03	2024-04-25 00:15:04.448+03	\N
174	SKU	#34544	2024-04-25 00:15:04.448+03	2024-04-25 00:15:04.448+03	\N
175	stockQuantity	4	2024-04-25 00:15:04.448+03	2024-04-25 00:15:04.448+03	\N
167	description	sdaffffffffffffffffffff	2024-04-25 00:11:13.163+03	2024-04-25 00:11:13.163+03	\N
168	SKU	#43555	2024-04-25 00:11:13.163+03	2024-04-25 00:11:13.163+03	\N
169	stockQuantity	6	2024-04-25 00:11:13.163+03	2024-04-25 00:11:13.163+03	\N
146	description	4erterergfggfdfdhfgssssssssssss	2024-04-23 00:45:33.029+03	2024-04-23 00:45:33.029+03	\N
147	SKU	#56348	2024-04-23 00:45:33.029+03	2024-04-23 00:45:33.029+03	\N
148	stockQuantity	10	2024-04-23 00:45:33.029+03	2024-04-23 00:45:33.029+03	\N
135	SKU	#34544	2024-04-23 00:35:01.53+03	2024-04-23 00:35:01.53+03	\N
136	stockQuantity	7	2024-04-23 00:35:01.53+03	2024-04-23 00:35:01.53+03	\N
131	description	sdafaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2024-04-23 00:34:48.883+03	2024-04-23 00:34:48.883+03	\N
206	description	sssffffffffffffffffffff	2024-04-25 16:37:07.681+03	2024-04-25 16:37:07.681+03	\N
207	SKU	#34544	2024-04-25 16:37:07.681+03	2024-04-25 16:37:07.681+03	\N
208	stockQuantity	65	2024-04-25 16:37:07.681+03	2024-04-25 16:37:07.681+03	\N
132	SKU	#34544	2024-04-23 00:34:48.883+03	2024-04-23 00:34:48.883+03	\N
133	stockQuantity	76	2024-04-23 00:34:48.883+03	2024-04-23 00:34:48.883+03	\N
263	description	sagdddddddddddddddddddddd	2024-04-25 23:07:53.256+03	2024-04-25 23:07:53.256+03	\N
264	SKU	#43555	2024-04-25 23:07:53.256+03	2024-04-25 23:07:53.256+03	\N
265	stockQuantity	6	2024-04-25 23:07:53.256+03	2024-04-25 23:07:53.256+03	\N
161	description	sadfffffffffffffffffffffffffffffffffffffffffffffff	2024-04-24 23:25:20.595+03	2024-04-24 23:25:20.595+03	\N
162	SKU	#34544	2024-04-24 23:25:20.595+03	2024-04-24 23:25:20.595+03	\N
163	stockQuantity	6	2024-04-24 23:25:20.595+03	2024-04-24 23:25:20.595+03	\N
260	description	asdgggggggggggggggggggggggggggggg	2024-04-25 22:50:08.762+03	2024-04-25 22:50:08.762+03	\N
261	SKU	#34544	2024-04-25 22:50:08.762+03	2024-04-25 22:50:08.762+03	\N
262	stockQuantity	5	2024-04-25 22:50:08.762+03	2024-04-25 22:50:08.762+03	\N
254	description	gadsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsds	2024-04-25 22:48:54.13+03	2024-04-25 22:48:54.13+03	\N
255	SKU	#34544	2024-04-25 22:48:54.13+03	2024-04-25 22:48:54.13+03	\N
256	stockQuantity	5	2024-04-25 22:48:54.13+03	2024-04-25 22:48:54.13+03	\N
248	description	fdsgaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2024-04-25 17:42:08.888+03	2024-04-25 17:42:08.888+03	\N
249	SKU	#34544	2024-04-25 17:42:08.888+03	2024-04-25 17:42:08.888+03	\N
250	stockQuantity	6	2024-04-25 17:42:08.888+03	2024-04-25 17:42:08.888+03	\N
242	description	gsfddddddddddddddfsdfdsf	2024-04-25 17:40:22.35+03	2024-04-25 17:40:22.35+03	\N
243	SKU	#34544	2024-04-25 17:40:22.35+03	2024-04-25 17:40:22.35+03	\N
244	stockQuantity	3	2024-04-25 17:40:22.35+03	2024-04-25 17:40:22.35+03	\N
287	description	╤Д╨┐╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░╨░	2024-04-26 01:03:37.584+03	2024-04-26 01:03:37.584+03	\N
288	SKU	#34544	2024-04-26 01:03:37.584+03	2024-04-26 01:03:37.584+03	\N
289	stockQuantity	56	2024-04-26 01:03:37.584+03	2024-04-26 01:03:37.584+03	\N
284	description	dsaggggggggggggggggsadggggggggggggggggg	2024-04-26 00:53:17.272+03	2024-04-26 00:53:17.272+03	\N
285	SKU	#34544	2024-04-26 00:53:17.272+03	2024-04-26 00:53:17.272+03	\N
286	stockQuantity	2	2024-04-26 00:53:17.272+03	2024-04-26 00:53:17.272+03	\N
290	description	Long distance running requires a lot from athletes.	2024-04-26 15:48:17.036+03	2024-04-26 15:48:17.036+03	63
291	SKU	#32B58	2024-04-26 15:48:17.037+03	2024-04-26 15:48:17.037+03	63
292	stockQuantity	21	2024-04-26 15:48:17.037+03	2024-04-26 15:48:17.037+03	63
293	description	Long distance running requires a lot from athletes.	2024-04-26 17:05:45.853+03	2024-04-26 17:05:45.853+03	64
294	SKU	#72A56	2024-04-26 17:05:45.853+03	2024-04-26 17:05:45.853+03	64
295	stockQuantity	103	2024-04-26 17:05:45.853+03	2024-04-26 17:05:45.853+03	64
296	description	Engaging in marathon running places significant demands on athletes.	2024-04-26 17:17:32.595+03	2024-04-26 17:17:32.595+03	65
297	SKU	#32B58	2024-04-26 17:17:32.596+03	2024-04-26 17:17:32.596+03	65
298	stockQuantity	47	2024-04-26 17:17:32.596+03	2024-04-26 17:17:32.596+03	65
251	description	dafgadfgaddddddddddddddddd	2024-04-25 17:43:17.172+03	2024-04-25 17:43:17.172+03	\N
252	SKU	#34544	2024-04-25 17:43:17.173+03	2024-04-25 17:43:17.173+03	\N
253	stockQuantity	4	2024-04-25 17:43:17.173+03	2024-04-25 17:43:17.173+03	\N
302	description	Long distance running requires a lot from athletes.	2024-04-26 17:27:55.886+03	2024-04-26 17:27:55.886+03	66
303	SKU	#52540	2024-04-26 17:27:55.886+03	2024-04-26 17:27:55.886+03	66
304	stockQuantity	79	2024-04-26 17:27:55.886+03	2024-04-26 17:27:55.886+03	66
305	description	Engaging in marathon running places significant demands on athletes.	2024-04-26 17:44:57.823+03	2024-04-26 17:44:57.823+03	67
306	SKU	#33A18	2024-04-26 17:44:57.823+03	2024-04-26 17:44:57.823+03	67
307	stockQuantity	100	2024-04-26 17:44:57.823+03	2024-04-26 17:44:57.823+03	67
317	description	They fit comfortably on your feet and looks stylish.	2024-04-27 12:56:40.067+03	2024-04-27 12:56:40.067+03	68
318	SKU	#67V51	2024-04-27 12:56:40.067+03	2024-04-27 12:56:40.067+03	68
319	stockQuantity	56	2024-04-27 12:56:40.067+03	2024-04-27 12:56:40.067+03	68
320	description	Long distance running requires a lot from athletes.	2024-04-27 13:02:42.836+03	2024-04-27 13:02:42.836+03	69
321	SKU	#A6B56	2024-04-27 13:02:42.837+03	2024-04-27 13:02:42.837+03	69
322	stockQuantity	301	2024-04-27 13:02:42.837+03	2024-04-27 13:02:42.837+03	69
326	description	Long distance running requires a lot from athletes.	2024-04-27 13:08:38.757+03	2024-04-27 13:08:38.757+03	71
327	SKU	#12576	2024-04-27 13:08:38.757+03	2024-04-27 13:08:38.757+03	71
328	stockQuantity	60	2024-04-27 13:08:38.757+03	2024-04-27 13:08:38.757+03	71
329	description	Engaging in marathon running places significant demands on athletes.	2024-04-27 13:11:07.275+03	2024-04-27 13:11:07.275+03	72
330	SKU	#78A18	2024-04-27 13:11:07.275+03	2024-04-27 13:11:07.275+03	72
331	stockQuantity	549	2024-04-27 13:11:07.275+03	2024-04-27 13:11:07.275+03	72
332	description	They fit comfortably on your feet and looks stylish.	2024-04-27 13:13:29.315+03	2024-04-27 13:13:29.315+03	73
333	SKU	#5A7B8	2024-04-27 13:13:29.315+03	2024-04-27 13:13:29.315+03	73
334	stockQuantity	32	2024-04-27 13:13:29.315+03	2024-04-27 13:13:29.315+03	73
335	description	These sneakers will become an integral part of your workouts.	2024-04-27 13:17:14.97+03	2024-04-27 13:17:14.97+03	74
336	SKU	#86V71	2024-04-27 13:17:14.97+03	2024-04-27 13:17:14.97+03	74
337	stockQuantity	91	2024-04-27 13:17:14.97+03	2024-04-27 13:17:14.97+03	74
338	description	These sneakers will become an integral part of your workouts.	2024-04-27 13:19:49.473+03	2024-04-27 13:19:49.473+03	75
339	SKU	#78348	2024-04-27 13:19:49.473+03	2024-04-27 13:19:49.473+03	75
340	stockQuantity	45	2024-04-27 13:19:49.473+03	2024-04-27 13:19:49.473+03	75
341	description	Long distance running requires a lot from athletes.	2024-04-27 13:21:36.92+03	2024-04-27 13:21:36.92+03	76
342	SKU	#AB465	2024-04-27 13:21:36.92+03	2024-04-27 13:21:36.92+03	76
343	stockQuantity	573	2024-04-27 13:21:36.92+03	2024-04-27 13:21:36.92+03	76
344	description	These sneakers will become an integral part of your workouts.	2024-04-27 13:23:29.424+03	2024-04-27 13:23:29.424+03	77
345	SKU	#56349	2024-04-27 13:23:29.424+03	2024-04-27 13:23:29.424+03	77
346	stockQuantity	69	2024-04-27 13:23:29.424+03	2024-04-27 13:23:29.424+03	77
356	description	Laid-back look inspired by a California beach town.	2024-04-27 13:34:19.723+03	2024-04-27 13:34:19.723+03	78
357	SKU	#56A58	2024-04-27 13:34:19.723+03	2024-04-27 13:34:19.723+03	78
358	stockQuantity	140	2024-04-27 13:34:19.723+03	2024-04-27 13:34:19.723+03	78
359	description	Long distance running requires a lot from athletes.	2024-04-27 13:36:16.654+03	2024-04-27 13:36:16.654+03	79
360	SKU	#72A59	2024-04-27 13:36:16.654+03	2024-04-27 13:36:16.654+03	79
361	stockQuantity	46	2024-04-27 13:36:16.654+03	2024-04-27 13:36:16.654+03	79
365	description	They fit comfortably on your feet and looks stylish.	2024-04-27 13:42:43.026+03	2024-04-27 13:42:43.026+03	81
366	SKU	#71A96	2024-04-27 13:42:43.027+03	2024-04-27 13:42:43.027+03	81
367	stockQuantity	12	2024-04-27 13:42:43.027+03	2024-04-27 13:42:43.027+03	81
368	description	They fit comfortably on your feet and looks stylish.	2024-04-27 13:44:19.391+03	2024-04-27 13:44:19.391+03	82
369	SKU	#32B51	2024-04-27 13:44:19.391+03	2024-04-27 13:44:19.391+03	82
370	stockQuantity	39	2024-04-27 13:44:19.391+03	2024-04-27 13:44:19.391+03	82
371	description	Long distance running requires a lot from athletes.	2024-04-27 13:46:34.806+03	2024-04-27 13:46:34.806+03	83
372	SKU	#52B1A	2024-04-27 13:46:34.806+03	2024-04-27 13:46:34.806+03	83
373	stockQuantity	100	2024-04-27 13:46:34.806+03	2024-04-27 13:46:34.806+03	83
374	description	Long distance running requires a lot from athletes.	2024-04-27 13:48:42.021+03	2024-04-27 13:48:42.021+03	84
375	SKU	#19A56	2024-04-27 13:48:42.022+03	2024-04-27 13:48:42.022+03	84
376	stockQuantity	39	2024-04-27 13:48:42.022+03	2024-04-27 13:48:42.022+03	84
377	description	Engaging in marathon running places significant demands on athletes.	2024-04-27 13:50:22.63+03	2024-04-27 13:50:22.63+03	85
378	SKU	#72T50	2024-04-27 13:50:22.63+03	2024-04-27 13:50:22.63+03	85
379	stockQuantity	30	2024-04-27 13:50:22.63+03	2024-04-27 13:50:22.63+03	85
380	description	Engaging in marathon running places significant demands on athletes.	2024-04-27 13:51:43.368+03	2024-04-27 13:51:43.368+03	86
381	SKU	#56A49	2024-04-27 13:51:43.368+03	2024-04-27 13:51:43.368+03	86
382	stockQuantity	594	2024-04-27 13:51:43.368+03	2024-04-27 13:51:43.368+03	86
392	description	Long distance running requires a lot from athletes.	2024-04-27 13:58:34.69+03	2024-04-27 13:58:34.69+03	90
393	SKU	#25B56	2024-04-27 13:58:34.69+03	2024-04-27 13:58:34.69+03	90
394	stockQuantity	35	2024-04-27 13:58:34.69+03	2024-04-27 13:58:34.69+03	90
395	description	Long distance running requires a lot from athletes.	2024-04-27 14:17:54.874+03	2024-04-27 14:17:54.874+03	91
396	SKU	#12A57	2024-04-27 14:17:54.874+03	2024-04-27 14:17:54.874+03	91
397	stockQuantity	100	2024-04-27 14:17:54.874+03	2024-04-27 14:17:54.874+03	91
407	description	Long distance running requires a lot from athletes.	2024-04-28 12:48:26.445+03	2024-04-28 12:48:26.445+03	80
408	SKU	#42558	2024-04-28 12:48:26.446+03	2024-04-28 12:48:26.446+03	80
409	stockQuantity	852	2024-04-28 12:48:26.446+03	2024-04-28 12:48:26.446+03	80
422	description	321431253╨░╤Д╨┐╤Л╨▓╨▓╨▓╨▓╨▓╨▓╨▓╨▓╨▓╨▓╨▓╨▓	2024-04-29 23:47:34.223+03	2024-04-29 23:47:34.223+03	\N
423	SKU	#32B58	2024-04-29 23:47:34.223+03	2024-04-29 23:47:34.223+03	\N
424	stockQuantity	546	2024-04-29 23:47:34.223+03	2024-04-29 23:47:34.223+03	\N
425	description	fdaggggggggggggggggggggg	2024-04-29 23:48:35.662+03	2024-04-29 23:48:35.662+03	\N
426	SKU	#72A56	2024-04-29 23:48:35.662+03	2024-04-29 23:48:35.662+03	\N
427	stockQuantity	433	2024-04-29 23:48:35.662+03	2024-04-29 23:48:35.662+03	\N
428	description	Long distance running requires a lot from athletes.	2024-05-04 16:49:25.542+03	2024-05-04 16:49:25.542+03	92
430	stockQuantity	25	2024-05-04 16:49:25.542+03	2024-05-04 16:49:25.542+03	92
429	SKU	#32B11	2024-05-04 16:49:25.542+03	2024-05-04 16:49:25.542+03	92
431	SKU	#56AB7	2024-05-08 21:44:29.537+03	2024-05-08 21:44:29.537+03	88
433	stockQuantity	150	2024-05-08 21:44:29.537+03	2024-05-08 21:44:29.537+03	88
432	description	Laid-back look inspired by a California beach town.	2024-05-08 21:44:29.537+03	2024-05-08 21:44:29.537+03	88
434	description	Long distance running requires a lot from athletes.	2024-05-08 21:44:48.666+03	2024-05-08 21:44:48.666+03	89
435	SKU	#70A10	2024-05-08 21:44:48.666+03	2024-05-08 21:44:48.666+03	89
436	stockQuantity	305	2024-05-08 21:44:48.666+03	2024-05-08 21:44:48.666+03	89
437	description	Engaging in marathon running places significant demands on athletes.	2024-05-08 21:45:10.397+03	2024-05-08 21:45:10.397+03	70
438	SKU	#19T57	2024-05-08 21:45:10.397+03	2024-05-08 21:45:10.397+03	70
439	stockQuantity	368	2024-05-08 21:45:10.397+03	2024-05-08 21:45:10.397+03	70
440	description	They fit comfortably on your feet and looks stylish.	2024-05-08 21:46:30.007+03	2024-05-08 21:46:30.007+03	87
441	SKU	#435A8	2024-05-08 21:46:30.007+03	2024-05-08 21:46:30.007+03	87
442	stockQuantity	100	2024-05-08 21:46:30.007+03	2024-05-08 21:46:30.007+03	87
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20240407134737-add-columns-to-products.js
20240424210322-update_table.js
20240425092643-add_products_table.js
\.


--
-- Data for Name: basket_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_products (id, "createdAt", "updatedAt", "basketId", "productId") FROM stdin;
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, "createdAt", "updatedAt", "userId") FROM stdin;
1	2023-08-11 04:36:31.221+03	2023-08-11 04:36:31.221+03	1
2	2023-08-25 23:11:47.675+03	2023-08-25 23:11:47.675+03	2
3	2023-08-25 23:13:08.88+03	2023-08-25 23:13:08.88+03	3
4	2023-08-25 23:13:59.893+03	2023-08-25 23:13:59.893+03	4
5	2023-08-25 23:14:02.239+03	2023-08-25 23:14:02.239+03	5
6	2023-08-25 23:14:04.198+03	2023-08-25 23:14:04.198+03	6
7	2023-08-25 23:17:11.362+03	2023-08-25 23:17:11.362+03	7
8	2023-08-25 23:24:20.201+03	2023-08-25 23:24:20.201+03	8
9	2023-08-25 23:30:47.513+03	2023-08-25 23:30:47.513+03	9
10	2023-08-25 23:47:42.888+03	2023-08-25 23:47:42.888+03	10
11	2023-08-25 23:50:34.601+03	2023-08-25 23:50:34.601+03	11
12	2023-08-25 23:53:51.251+03	2023-08-25 23:53:51.251+03	12
13	2023-08-26 00:00:35.86+03	2023-08-26 00:00:35.86+03	13
14	2023-09-02 05:16:26.044+03	2023-09-02 05:16:26.044+03	14
15	2023-09-02 05:37:30.016+03	2023-09-02 05:37:30.016+03	15
16	2023-09-06 03:03:57.784+03	2023-09-06 03:03:57.784+03	16
17	2024-02-14 00:50:36.936+02	2024-02-14 00:50:36.936+02	17
18	2024-03-08 16:38:45.113+02	2024-03-08 16:38:45.113+02	18
19	2024-04-16 00:59:32.191+03	2024-04-16 00:59:32.191+03	19
20	2024-04-16 01:02:26.755+03	2024-04-16 01:02:26.755+03	20
21	2024-04-29 23:09:54.609+03	2024-04-29 23:09:54.609+03	21
22	2024-04-29 23:11:49.572+03	2024-04-29 23:11:49.572+03	22
23	2024-04-29 23:12:34.695+03	2024-04-29 23:12:34.695+03	23
24	2024-04-29 23:13:25.932+03	2024-04-29 23:13:25.932+03	24
25	2024-04-29 23:16:43.844+03	2024-04-29 23:16:43.844+03	25
26	2024-04-29 23:20:25.234+03	2024-04-29 23:20:25.234+03	26
27	2024-04-29 23:20:45.65+03	2024-04-29 23:20:45.65+03	27
28	2024-04-29 23:22:45.693+03	2024-04-29 23:22:45.693+03	28
29	2024-04-29 23:25:15.667+03	2024-04-29 23:25:15.667+03	29
30	2024-04-29 23:36:02.64+03	2024-04-29 23:36:02.64+03	30
31	2024-06-03 08:05:39.951+03	2024-06-03 08:05:39.951+03	31
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, "createdAt", "updatedAt") FROM stdin;
1	Puma	2023-08-11 04:47:07.946+03	2023-08-11 04:47:07.946+03
2	Adidas	2023-08-11 04:47:17.792+03	2023-08-11 04:47:17.792+03
3	Nike	2023-08-11 04:47:49.993+03	2023-08-11 04:47:49.993+03
30	New Balance	2024-04-26 13:39:46.194+03	2024-04-26 13:39:46.194+03
31	ASICS	2024-04-26 13:41:34.246+03	2024-04-26 13:41:34.246+03
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "brandId", gender, size, color) FROM stdin;
63	Velophasis Always On Sneakers	125	0	7e8f96e6-030b-46e8-9ff9-6876b4865329.jpg	2024-04-26 15:48:16.979+03	2024-04-26 15:48:16.979+03	4	2	men	{38,39,40,41,42,43,44,45,46,47}	slateGray
64	RS-X Efekt Expeditions Sneakers	125	0	42b77e04-fe8b-45b0-abba-30bc37d91ad3.jpg	2024-04-26 17:05:45.809+03	2024-04-26 17:05:45.809+03	1	2	men	{38,40,41,42,44,45}	darkGreen
65	Puma Caven 2.0 Retro Club	125	0	425c0e8c-5ed3-42d4-93ff-30e4612356cb.jpg	2024-04-26 17:17:32.56+03	2024-04-26 17:17:32.56+03	2	1	women	{40,41,43,44,45}	darkGreen
66	Legacy Trinity Shoe Motorsport	100	0	b6930faa-0fbd-4dcf-af38-177459e25451.jpg	2024-04-26 17:27:11.469+03	2024-04-26 17:27:55.881+03	7	3	men	{38,39,40,47}	orange
67	RBD Game Low Retro Club Sneakers	150	0	276dafbf-b248-4b04-a637-fe7656d43a3c.jpg	2024-04-26 17:44:57.786+03	2024-04-26 17:44:57.786+03	5	30	women	{42,43,44,45,46,47}	silver
78	Carina Street VTG Sneakers	145	0	6cc3171b-a3b9-4253-91c2-26c75e9174a5.jpg	2024-04-27 13:33:14.059+03	2024-04-27 13:34:19.719+03	4	2	men	{38,39,40,41,42,43,44,45,46,47}	cornflowerblue
79	Court Classic Vulcanised Formstrip	120	0	6f98316b-659b-48ae-aa80-5c5a54915150.jpg	2024-04-27 13:36:16.617+03	2024-04-27 13:36:16.617+03	3	31	women	{38,39,43,44,45,46}	tan
81	Adidas Milenio Tech Sneakers	100	0	8a0988f1-a77f-4049-9eba-2a679a4f3c31.jpg	2024-04-27 13:42:42.984+03	2024-04-27 13:42:42.984+03	1	2	men	{38,39,43,44,45,46,47}	cornflowerblue
82	Blktop Rider Preppy Sneakers	185	0	a56aab06-0172-4b7c-be14-27a1e5d5210f.jpg	2024-04-27 13:44:19.355+03	2024-04-27 13:44:19.355+03	4	30	women	{38,39,40,41,42,44,45,46,47}	saddleBrown
83	Carina Street Blossom Women's	115	0	d5a2ba36-92d2-4c0d-b722-82dd8b822cd8.jpg	2024-04-27 13:46:34.765+03	2024-04-27 13:46:34.765+03	7	31	men	{41,42,43,44,45,46,47}	orange
84	Cilia Wedge Sneakers Women	135	0	d42b7c7b-a6c9-4716-b92b-e82d3afd2a4b.jpg	2024-04-27 13:48:41.981+03	2024-04-27 13:48:41.981+03	4	3	women	{38,39,40,41,42,47}	silver
68	Sneakers MB.01 Inverse Toxic	115	0	b693edde-3b17-4a3a-a4dc-02f32262f8b1.jpg	2024-04-26 18:09:27.437+03	2024-04-27 12:56:40.019+03	6	30	women	{41,42,43,44,45}	orange
69	Adidas Ozelia Shoes Blue	125	0	082bf18a-1998-49bf-9926-0bd2ac46fb3d.jpg	2024-04-27 13:02:42.796+03	2024-04-27 13:02:42.796+03	3	2	men	{38,39,40,41,44}	cornflowerblue
71	Fast-Trac Nitro 2 Men's	150	0	a8a6fcf0-0efb-40d5-b2da-54ca65b9edfc.jpg	2024-04-27 13:08:38.715+03	2024-04-27 13:08:38.715+03	2	31	men	{38,39,40,41,42,43,44,45,46}	cornflowerblue
72	Obstruct Profoam Shoes	125	0	a3c7a871-048b-45c9-a924-a5cd950e285b.jpg	2024-04-27 13:11:07.239+03	2024-04-27 13:11:07.239+03	4	3	women	{42,43,44,45,46}	slateGray
73	Reflect Lite Running Shoes	110	0	7fe934ce-2b0c-4f2e-89de-0312d104e6b9.jpg	2024-04-27 13:13:29.272+03	2024-04-27 13:13:29.272+03	6	3	women	{38,39,42,43,46,47}	saddleBrown
74	Fast-R Elite Elektrocharged Women	105	0	07f20edc-501d-4e44-949a-bb0e708c179a.jpg	2024-04-27 13:17:14.934+03	2024-04-27 13:17:14.934+03	2	1	men	{41,42,45,46,47}	darkSlateGray
75	Slipstream Hi Evolution	180	0	17224d38-1608-4a7d-bbb7-2c0b0f00c415.jpg	2024-04-27 13:19:49.433+03	2024-04-27 13:19:49.433+03	5	31	men	{42,43,44,45,46,47}	tan
76	PWRFrame TR 3 Training Shoes	120	0	a8d17855-d123-467e-9b83-b893045660a2.jpg	2024-04-27 13:21:36.884+03	2024-04-27 13:21:36.884+03	1	1	women	{44,45,46,47}	pink
77	RBD Tech Classic Unisex	200	0	ed4ff820-da5c-48cd-bdb2-46945f4a440f.jpg	2024-04-27 13:23:29.388+03	2024-04-27 13:23:29.388+03	1	30	men	{39,40,41,42,43,44}	silver
85	ForeverRun Nitro WTR	110	0	5cadc67e-4306-4f27-a8a3-eecb080975fc.jpg	2024-04-27 13:50:22.586+03	2024-04-27 13:50:22.586+03	3	2	men	{43,44,45,46,47}	black
86	RBD Tech Classic Sneaker	190	0	a195dade-9e7c-467a-9306-a4f3069c250f.jpg	2024-04-27 13:51:43.328+03	2024-04-27 13:51:43.328+03	1	30	men	{38,39,40,45,46,47}	saddleBrown
90	Scoot Zeros PRED Unisex	150	0	f8cd6cd8-29fa-4986-a609-b042461a6c4a.jpg	2024-04-27 13:58:34.646+03	2024-04-27 13:58:34.646+03	1	31	women	{42,43,44,45,46,47}	slateGray
91	Trinity Desert Road Sneakers	210	0	4331dfe1-1d39-4223-8120-1459c278d55f.jpg	2024-04-27 14:17:54.839+03	2024-04-27 14:17:54.839+03	4	30	men	{42,43,44,45,46,47}	cornflowerblue
92	Puma Caven 2.0 Lux	125	0	99d963ef-9bb3-4102-8237-5444e8490a45.jpg	2024-04-27 14:19:14.151+03	2024-05-04 16:49:25.53+03	7	1	women	{38,39,40,41,42,43,44,45,46,47}	darkGreen
88	Fuse 3.0 Men's Training Shoes	125	0	e0b96eef-d8a9-4c31-9950-b2187a3e239d.jpg	2024-04-27 13:55:30.459+03	2024-05-08 21:44:29.484+03	2	2	women	{38,39}	pink
80	Puma Palermo Classics Sneakers	135	0	c6e1eeba-c573-43d7-95d6-e87546987989.jpg	2024-04-27 13:41:01.276+03	2024-04-28 12:48:26.389+03	6	1	men	{38,39,40,41,44,45}	pink
89	Adidas CA Pro Ripple Earth	120	0	4cba91fd-3b3a-49af-8e43-3c018b9a72e7.jpg	2024-04-27 13:57:17.316+03	2024-05-08 21:44:48.661+03	7	2	men	{47}	cornflowerblue
70	Ultraboost 1.0 Miami Black	135	0	c5c41743-daf0-4976-839a-32eba34e1c68.jpg	2024-04-27 13:05:07.046+03	2024-05-08 21:45:10.394+03	7	2	women	{43}	black
87	Blktop Rider Multicolor Sneakers	115	0	2fe131b3-bd73-45a7-b58f-23c6d259b952.jpg	2024-04-27 13:53:17.49+03	2024-05-08 21:46:30.003+03	5	1	women	{38,46}	darkSlateGray
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, rate, "createdAt", "updatedAt", "userId", "productId") FROM stdin;
\.


--
-- Data for Name: type_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_brands (id, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (id, name, "createdAt", "updatedAt") FROM stdin;
1	Casual shoes	2023-08-11 04:40:00.078+03	2023-08-11 04:40:00.078+03
2	Runners	2023-08-11 04:41:47.039+03	2023-08-11 04:41:47.039+03
3	Hiking	2023-08-11 04:42:07.707+03	2023-08-11 04:42:07.707+03
4	Sneaker	2023-08-11 04:42:23.471+03	2023-08-11 04:42:23.471+03
5	Basketball	2023-08-11 04:42:37.903+03	2023-08-11 04:42:37.903+03
6	Golf	2023-08-11 04:42:56.242+03	2023-08-11 04:42:56.242+03
7	Outdoor	2023-08-11 04:43:11.507+03	2023-08-11 04:43:11.507+03
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, "createdAt", "updatedAt") FROM stdin;
1	user@gmail.com	$2b$05$tE2gHdvjimoaO.mPrHvyLeKM3wdvHzVQLfCUKFCwjNqiO/p/HTJfi	ADMIN	2023-08-11 04:36:31.111+03	2023-08-11 04:36:31.111+03
2	adsf@sf.com	$2b$05$x.7nEpJ6.RFdjTY77hdk1uuN6aCj6iTZevnub2OwFyViqqNEU8Z36	ADMIN	2023-08-25 23:11:47.666+03	2023-08-25 23:11:47.666+03
3	sdfsd@cds.com	$2b$05$iZBX7DxUnR1mYYxZJkb4i.p6DZiLf1sJB7zvGONLS4HGUypJAWxDK	ADMIN	2023-08-25 23:13:08.878+03	2023-08-25 23:13:08.878+03
4	dfsfsd@	$2b$05$wRZnkgOlobA0yxgVV20Rrek5Il.gGVOIu.H9jwi/NsQN0aioEQ4Wy	ADMIN	2023-08-25 23:13:59.891+03	2023-08-25 23:13:59.891+03
5	dfsfsd@23	$2b$05$3dEyMASuO8a6ldS.buM4jOfqKcGj3czrxX/PJqFhvdeWhdxqZznX2	ADMIN	2023-08-25 23:14:02.238+03	2023-08-25 23:14:02.238+03
6	dfsfsd@23213123	$2b$05$o5ZcH6yE23kOVrglf.HugeqHROq8Oasj/rwop8ux3f9mXaPaJoqKW	ADMIN	2023-08-25 23:14:04.196+03	2023-08-25 23:14:04.196+03
7	fsadf	$2b$05$WqKLu8APxzv7g05zaz8qUuscnUSvGztELmRWGOleK943PNcKhAfUy	ADMIN	2023-08-25 23:17:11.354+03	2023-08-25 23:17:11.354+03
8	32432	$2b$05$J1X9rMZvf72gT6SxLaK7iOaMygXCftydPJioEu/bu/nscxbmKVN2.	ADMIN	2023-08-25 23:24:20.194+03	2023-08-25 23:24:20.194+03
9	1231	$2b$05$VLhaByWTrkOt8lsy1xj8P.pq.9.CVz0UehNJgRRiwY5KRVoUoekC.	ADMIN	2023-08-25 23:30:47.511+03	2023-08-25 23:30:47.511+03
10	userrr@gmail.com	$2b$05$wMzGNmxW.zaY6T4.ZZhDIeniu8MDFJUJcO4NT7BHj6tm0TjxMizsy	ADMIN	2023-08-25 23:47:42.885+03	2023-08-25 23:47:42.885+03
11	1234	$2b$05$rqOdmRYlaNB1IxCsrza13.2uuyTQxhGv1VKTaC2g2rOKlWLI/KNiK	ADMIN	2023-08-25 23:50:34.594+03	2023-08-25 23:50:34.594+03
12	12345	$2b$05$R4HLnc16w9KaE3Cc7dCBDemBoCr7lhhnqg17M.3q5WcunE3FXaMFq	ADMIN	2023-08-25 23:53:51.243+03	2023-08-25 23:53:51.243+03
13	userrr1@gmail.com	$2b$05$l0pT4N5jghKA4xNNAEwQGuZl8LDDd.2ZWFMdQmwrwiAFAccdaLARu	ADMIN	2023-08-26 00:00:35.853+03	2023-08-26 00:00:35.853+03
14	userrrr	$2b$05$aY.92d8kYBOvmPCmXue7xuKHPHSfh/reXRwGrkg//XDWIVjZULYsy	ADMIN	2023-09-02 05:16:26.032+03	2023-09-02 05:16:26.032+03
15	usser	$2b$05$zk1BGX4zfBOz/aqQLDHWt.ED.Z5dJge9Wc2gqmO.8FIVtJOKZ8TZK	ADMIN	2023-09-02 05:37:30.012+03	2023-09-02 05:37:30.012+03
16	retrdff	$2b$05$XIn9XSi/4Zbju5VicmW/I..ExAhj1Tu1FfVPTjA1k5RG2Le1qKpCa	ADMIN	2023-09-06 03:03:57.777+03	2023-09-06 03:03:57.777+03
17	user@123	$2b$05$qDYdWa44Pnwt5JX4OAB84OeqfzUls4dYZF9kFCFAR953GySJvv3Q6	ADMIN	2024-02-14 00:50:36.881+02	2024-02-14 00:50:36.881+02
18	asdf	$2b$05$It5Ht4Xw/5TgpE0ikUjpkOzmZ6aQ.ANp4uSbaWrriYl/51Wz.p2m.	ADMIN	2024-03-08 16:38:45.015+02	2024-03-08 16:38:45.015+02
19	userrrrt	$2b$05$qkfOdVqgoIZegpT1IQ7wd.isgN0cPeWmNFAxOXLPjZWrNtE51fJFa	USER	2024-04-16 00:59:32.106+03	2024-04-16 00:59:32.106+03
20	userrrrt546	$2b$05$uvAYonXpmbhHJzlRwRdR5u8cXo.5uAf9Ge1jEPHNGRvwihWX5EEyu	ADMIN	2024-04-16 01:02:26.752+03	2024-04-16 01:02:26.752+03
21	user@com.com	$2b$05$ZEKWfG4aYCP14t1lWyJzb.6euy15SORjFKko0HQhHzsEE08o1eGMC	ADMIN	2024-04-29 23:09:54.526+03	2024-04-29 23:09:54.526+03
22	userr@com.com	$2b$05$rhN7a/5yF5Qf8DWv/iMqcu9Og1uLisC42tubFIwqtnAmZtjFkZfoe	ADMIN	2024-04-29 23:11:49.569+03	2024-04-29 23:11:49.569+03
23	userrr@com.com	$2b$05$fnnT9rRqKWXPGmUFWedH3uqRguiNoEdCemEMnvypFYmMkevUxFPl.	ADMIN	2024-04-29 23:12:34.692+03	2024-04-29 23:12:34.692+03
24	userrrr@com.com	$2b$05$sQx/qX.mshh0tbhpNYBkq.lf01Z82cHg7k9gteB2fttsZbHqKjJCm	ADMIN	2024-04-29 23:13:25.929+03	2024-04-29 23:13:25.929+03
25	userrrsdgr@com.com	$2b$05$ua5i//4rIbPXY4JLxkX7gOyfFZR7vpdT7hCFBQfbbWS52sjCCwJya	ADMIN	2024-04-29 23:16:43.842+03	2024-04-29 23:16:43.842+03
26	userrrssdgfdsgdgr@com.com	$2b$05$fetvkMGyqv7MlJm3V4.H..3x03HL7E0mfdp388CxdOwomi0.sqJvi	ADMIN	2024-04-29 23:20:25.231+03	2024-04-29 23:20:25.231+03
27	userrfasdgrssdgfdsgdgr@com.com	$2b$05$I.Shemhgk7Xo.4y2n4QzJuGLwB2I1A61dD28jBkRyjPjFPERB6F5C	ADMIN	2024-04-29 23:20:45.647+03	2024-04-29 23:20:45.647+03
28	userrfasfasdfdgrssdgfdsgdgr@com.com	$2b$05$Yo1MiEmQ1R8sfSbeYIJnmu0lG.eN0UJ7QF36miTBj0EjJbQHZvHpW	ADMIN	2024-04-29 23:22:45.691+03	2024-04-29 23:22:45.691+03
29	userrfasfasdffdsgdgrssdgfdsgdgr@com.com	$2b$05$XTU.hG2s31Ro912aVwbiiOuK3Ym.9i9U4gai2IPSj143eP9VctaU6	ADMIN	2024-04-29 23:25:15.665+03	2024-04-29 23:25:15.665+03
30	silent.sbc@gmail.com	$2b$05$SOPWQa1W0s8cOKVEKfteoOEBkU/nhwSmcaJ1zUbi1qHmTKgLDHn0i	ADMIN	2024-04-29 23:36:02.638+03	2024-04-29 23:36:02.638+03
31	userr@gmail.com	$2b$05$mH6n4q0Y4o3ILT2B1rFTmug.dn76BMOJYJU1Xj8b65wlxjsDN8mqS	ADMIN	2024-06-03 08:05:39.891+03	2024-06-03 08:05:39.891+03
\.


--
-- Name: Product_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_infos_id_seq"', 442, true);


--
-- Name: basket_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_products_id_seq', 1, false);


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 31, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 33, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 94, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- Name: type_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_brands_id_seq', 1, false);


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 24, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 31, true);


--
-- Name: Product_infos Product_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_infos"
    ADD CONSTRAINT "Product_infos_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: basket_products basket_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_pkey PRIMARY KEY (id);


--
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- Name: brands brands_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: type_brands type_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT type_brands_pkey PRIMARY KEY (id);


--
-- Name: type_brands type_brands_typeId_brandId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_brandId_key" UNIQUE ("typeId", "brandId");


--
-- Name: types types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: Product_infos Product_infos_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product_infos"
    ADD CONSTRAINT "Product_infos_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_products basket_products_basketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT "basket_products_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_products basket_products_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT "basket_products_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: baskets baskets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: products products_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON DELETE RESTRICT;


--
-- Name: products products_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON DELETE RESTRICT;


--
-- Name: ratings ratings_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ratings ratings_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: type_brands type_brands_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: type_brands type_brands_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

