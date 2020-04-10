--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animal; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.animal (
    idanimal integer NOT NULL,
    nom character varying(25),
    sexe character varying(1),
    description character varying(200),
    race character varying(25),
    age character varying(7),
    isanimalajoute boolean,
    idpersonne integer,
    type character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE public.animal OWNER TO mathu;

--
-- Name: animal_idanimal_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.animal_idanimal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animal_idanimal_seq OWNER TO mathu;

--
-- Name: animal_idanimal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.animal_idanimal_seq OWNED BY public.animal.idanimal;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO mathu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO mathu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO mathu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO mathu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO mathu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO mathu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO mathu;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO mathu;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO mathu;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO mathu;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO mathu;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO mathu;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: chat; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.chat (
    idanimal integer NOT NULL,
    racechat character varying(25)
);


ALTER TABLE public.chat OWNER TO mathu;

--
-- Name: chat_idanimal_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.chat_idanimal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_idanimal_seq OWNER TO mathu;

--
-- Name: chat_idanimal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.chat_idanimal_seq OWNED BY public.chat.idanimal;


--
-- Name: chien; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.chien (
    idanimal integer NOT NULL,
    racechien character varying(25)
);


ALTER TABLE public.chien OWNER TO mathu;

--
-- Name: chien_idanimal_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.chien_idanimal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chien_idanimal_seq OWNER TO mathu;

--
-- Name: chien_idanimal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.chien_idanimal_seq OWNED BY public.chien.idanimal;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO mathu;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO mathu;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO mathu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO mathu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO mathu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO mathu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO mathu;

--
-- Name: favoris; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.favoris (
    idpersonne integer NOT NULL,
    idanimal integer NOT NULL
);


ALTER TABLE public.favoris OWNER TO mathu;

--
-- Name: formulaire; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.formulaire (
    idform integer NOT NULL,
    libelle_form character varying
);


ALTER TABLE public.formulaire OWNER TO mathu;

--
-- Name: formulaire_idform_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.formulaire_idform_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formulaire_idform_seq OWNER TO mathu;

--
-- Name: formulaire_idform_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.formulaire_idform_seq OWNED BY public.formulaire.idform;


--
-- Name: image; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.image (
    idimage integer NOT NULL,
    url character varying(50),
    libelle character varying(50)
);


ALTER TABLE public.image OWNER TO mathu;

--
-- Name: image_idimage_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.image_idimage_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_idimage_seq OWNER TO mathu;

--
-- Name: image_idimage_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.image_idimage_seq OWNED BY public.image.idimage;


--
-- Name: personne; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.personne (
    idpersonne integer NOT NULL,
    nom character varying(25),
    prenom character varying(25),
    numero integer,
    mail character varying(50),
    mdp character varying(50),
    isadmin boolean,
    idimage integer
);


ALTER TABLE public.personne OWNER TO mathu;

--
-- Name: personne_idpersonne_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.personne_idpersonne_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personne_idpersonne_seq OWNER TO mathu;

--
-- Name: personne_idpersonne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.personne_idpersonne_seq OWNED BY public.personne.idpersonne;


--
-- Name: question; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.question (
    idquestion integer NOT NULL,
    libelle_question character varying
);


ALTER TABLE public.question OWNER TO mathu;

--
-- Name: question_idquestion_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.question_idquestion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_idquestion_seq OWNER TO mathu;

--
-- Name: question_idquestion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.question_idquestion_seq OWNED BY public.question.idquestion;


--
-- Name: questionform; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.questionform (
    idqf integer NOT NULL,
    idquestion integer,
    idform integer
);


ALTER TABLE public.questionform OWNER TO mathu;

--
-- Name: questionform_idqf_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.questionform_idqf_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionform_idqf_seq OWNER TO mathu;

--
-- Name: questionform_idqf_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.questionform_idqf_seq OWNED BY public.questionform.idqf;


--
-- Name: reponse; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.reponse (
    idreponse integer NOT NULL,
    idquestion integer,
    idpersonne integer,
    reponse character varying(200)
);


ALTER TABLE public.reponse OWNER TO mathu;

--
-- Name: reponse_idreponse_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.reponse_idreponse_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reponse_idreponse_seq OWNER TO mathu;

--
-- Name: reponse_idreponse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.reponse_idreponse_seq OWNED BY public.reponse.idreponse;


--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: mathu
--

CREATE TABLE public.utilisateur (
    idpersonne integer NOT NULL,
    isformaccepted boolean,
    isformfilled boolean
);


ALTER TABLE public.utilisateur OWNER TO mathu;

--
-- Name: utilisateur_idpersonne_seq; Type: SEQUENCE; Schema: public; Owner: mathu
--

CREATE SEQUENCE public.utilisateur_idpersonne_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateur_idpersonne_seq OWNER TO mathu;

--
-- Name: utilisateur_idpersonne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mathu
--

ALTER SEQUENCE public.utilisateur_idpersonne_seq OWNED BY public.utilisateur.idpersonne;


--
-- Name: animal idanimal; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.animal ALTER COLUMN idanimal SET DEFAULT nextval('public.animal_idanimal_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: chat idanimal; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.chat ALTER COLUMN idanimal SET DEFAULT nextval('public.chat_idanimal_seq'::regclass);


--
-- Name: chien idanimal; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.chien ALTER COLUMN idanimal SET DEFAULT nextval('public.chien_idanimal_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: formulaire idform; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.formulaire ALTER COLUMN idform SET DEFAULT nextval('public.formulaire_idform_seq'::regclass);


--
-- Name: image idimage; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.image ALTER COLUMN idimage SET DEFAULT nextval('public.image_idimage_seq'::regclass);


--
-- Name: personne idpersonne; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.personne ALTER COLUMN idpersonne SET DEFAULT nextval('public.personne_idpersonne_seq'::regclass);


--
-- Name: question idquestion; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.question ALTER COLUMN idquestion SET DEFAULT nextval('public.question_idquestion_seq'::regclass);


--
-- Name: questionform idqf; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.questionform ALTER COLUMN idqf SET DEFAULT nextval('public.questionform_idqf_seq'::regclass);


--
-- Name: reponse idreponse; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.reponse ALTER COLUMN idreponse SET DEFAULT nextval('public.reponse_idreponse_seq'::regclass);


--
-- Name: utilisateur idpersonne; Type: DEFAULT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN idpersonne SET DEFAULT nextval('public.utilisateur_idpersonne_seq'::regclass);


--
-- Data for Name: animal; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.animal (idanimal, nom, sexe, description, race, age, isanimalajoute, idpersonne, type) FROM stdin;
30	Doggy	F	Gentil et docile	Dalmatien	Adult	t	20	CHIEN
31	Kitty	M	Sournois et Habile	Siamois	Adult	t	20	CHAT
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add auth group	7	add_authgroup
26	Can change auth group	7	change_authgroup
27	Can delete auth group	7	delete_authgroup
28	Can view auth group	7	view_authgroup
29	Can add auth group permissions	8	add_authgrouppermissions
30	Can change auth group permissions	8	change_authgrouppermissions
31	Can delete auth group permissions	8	delete_authgrouppermissions
32	Can view auth group permissions	8	view_authgrouppermissions
33	Can add auth permission	9	add_authpermission
34	Can change auth permission	9	change_authpermission
35	Can delete auth permission	9	delete_authpermission
36	Can view auth permission	9	view_authpermission
37	Can add auth user	10	add_authuser
38	Can change auth user	10	change_authuser
39	Can delete auth user	10	delete_authuser
40	Can view auth user	10	view_authuser
41	Can add auth user groups	11	add_authusergroups
42	Can change auth user groups	11	change_authusergroups
43	Can delete auth user groups	11	delete_authusergroups
44	Can view auth user groups	11	view_authusergroups
45	Can add auth user user permissions	12	add_authuseruserpermissions
46	Can change auth user user permissions	12	change_authuseruserpermissions
47	Can delete auth user user permissions	12	delete_authuseruserpermissions
48	Can view auth user user permissions	12	view_authuseruserpermissions
49	Can add django admin log	13	add_djangoadminlog
50	Can change django admin log	13	change_djangoadminlog
51	Can delete django admin log	13	delete_djangoadminlog
52	Can view django admin log	13	view_djangoadminlog
53	Can add django content type	14	add_djangocontenttype
54	Can change django content type	14	change_djangocontenttype
55	Can delete django content type	14	delete_djangocontenttype
56	Can view django content type	14	view_djangocontenttype
57	Can add django migrations	15	add_djangomigrations
58	Can change django migrations	15	change_djangomigrations
59	Can delete django migrations	15	delete_djangomigrations
60	Can view django migrations	15	view_djangomigrations
61	Can add django session	16	add_djangosession
62	Can change django session	16	change_djangosession
63	Can delete django session	16	delete_djangosession
64	Can view django session	16	view_djangosession
65	Can add image	17	add_image
66	Can change image	17	change_image
67	Can delete image	17	delete_image
68	Can view image	17	view_image
69	Can add animal	18	add_animal
70	Can change animal	18	change_animal
71	Can delete animal	18	delete_animal
72	Can view animal	18	view_animal
73	Can add chien	19	add_chien
74	Can change chien	19	change_chien
75	Can delete chien	19	delete_chien
76	Can view chien	19	view_chien
77	Can add chat	20	add_chat
78	Can change chat	20	change_chat
79	Can delete chat	20	delete_chat
80	Can view chat	20	view_chat
81	Can add favoris	21	add_favoris
82	Can change favoris	21	change_favoris
83	Can delete favoris	21	delete_favoris
84	Can view favoris	21	view_favoris
85	Can add utilisateur	22	add_utilisateur
86	Can change utilisateur	22	change_utilisateur
87	Can delete utilisateur	22	delete_utilisateur
88	Can view utilisateur	22	view_utilisateur
89	Can add personne	23	add_personne
90	Can change personne	23	change_personne
91	Can delete personne	23	delete_personne
92	Can view personne	23	view_personne
93	Can add question	24	add_question
94	Can change question	24	change_question
95	Can delete question	24	delete_question
96	Can view question	24	view_question
97	Can add reponse	25	add_reponse
98	Can change reponse	25	change_reponse
99	Can delete reponse	25	delete_reponse
100	Can view reponse	25	view_reponse
101	Can add formulaire	26	add_formulaire
102	Can change formulaire	26	change_formulaire
103	Can delete formulaire	26	delete_formulaire
104	Can view formulaire	26	view_formulaire
105	Can add question form	27	add_questionform
106	Can change question form	27	change_questionform
107	Can delete question form	27	delete_questionform
108	Can view question form	27	view_questionform
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$dxJO0qBHsSr5$I4U8t6b9Bth2JcJDXND/g5EEb6wGlf6VFh5iuJAuxMk=	2020-04-09 13:21:51.087063+02	t	admin			mt.mathusha@outlook.fr	t	t	2020-03-06 14:02:20.991891+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.chat (idanimal, racechat) FROM stdin;
31	Siamois
\.


--
-- Data for Name: chien; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.chien (idanimal, racechien) FROM stdin;
30	Dalmatien
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-03-09 12:23:19.353127+01	1	Personne object (1)	1	[{"added": {}}]	23	1
2	2020-03-09 12:23:29.035893+01	1	Personne object (1)	2	[]	23	1
3	2020-03-09 12:23:59.432971+01	2	Personne object (2)	1	[{"added": {}}]	23	1
4	2020-03-09 12:25:30.584808+01	1	Utilisateur object (1)	1	[{"added": {}}]	22	1
5	2020-03-09 12:37:41.240159+01	1	Kitty	1	[{"added": {}}]	18	1
6	2020-03-09 14:47:11.174775+01	2	Snow	1	[{"added": {}}]	18	1
7	2020-03-09 14:47:30.8439+01	2	Chien object (2)	1	[{"added": {}}]	19	1
8	2020-03-09 16:02:34.276698+01	2	Snow	2	[{"changed": {"fields": ["Idpersonne"]}}]	18	1
9	2020-03-11 15:14:12.538663+01	3	mathu mathu	2	[]	23	1
10	2020-03-11 16:56:17.816192+01	4	azerty azerty	1	[{"added": {}}]	23	1
11	2020-03-17 17:10:19.595326+01	4	Favoris object (4)	2	[]	21	1
12	2020-03-17 17:10:29.299993+01	4	Favoris object (4)	3		21	1
13	2020-03-17 17:10:47.619709+01	4	Favoris object (4)	2	[]	21	1
14	2020-03-18 11:34:12.620579+01	4	Favoris object (4)	3		21	1
15	2020-03-18 11:34:12.653997+01	4	Favoris object (4)	3		21	1
16	2020-03-18 14:57:48.033497+01	1	Johnson Mark	3		23	1
17	2020-03-18 15:03:57.873667+01	1	Johnson Mark	3		23	1
18	2020-03-18 15:04:06.518659+01	2	Thiru Mathusha	2	[]	23	1
19	2020-03-18 15:04:14.987283+01	3	mathu mathu	3		23	1
20	2020-03-18 15:05:59.519453+01	5	diru diru	3		23	1
21	2020-03-18 15:08:40.256596+01	6	diru diru	3		23	1
22	2020-03-18 15:18:29.953503+01	7	diru diru	3		23	1
23	2020-03-20 15:05:12.753416+01	1	Question object (1)	1	[{"added": {}}]	24	1
24	2020-03-20 15:05:27.246044+01	2	Question object (2)	1	[{"added": {}}]	24	1
25	2020-03-20 15:05:47.219904+01	3	Question object (3)	1	[{"added": {}}]	24	1
26	2020-03-20 15:05:58.497608+01	4	Question object (4)	1	[{"added": {}}]	24	1
27	2020-03-20 15:06:09.573435+01	5	Question object (5)	1	[{"added": {}}]	24	1
28	2020-03-20 15:06:19.155961+01	6	Question object (6)	1	[{"added": {}}]	24	1
29	2020-03-20 15:06:26.967233+01	7	Question object (7)	1	[{"added": {}}]	24	1
30	2020-03-20 15:06:35.297626+01	8	Question object (8)	1	[{"added": {}}]	24	1
31	2020-03-20 15:06:45.033022+01	9	Question object (9)	1	[{"added": {}}]	24	1
32	2020-03-20 15:08:18.71873+01	9	Question object (9)	2	[]	24	1
33	2020-03-20 15:08:42.264831+01	1	Formulaire object (1)	1	[{"added": {}}]	26	1
34	2020-03-20 15:08:58.341496+01	1	QuestionForm object (1)	1	[{"added": {}}]	27	1
35	2020-03-20 15:52:38.385095+01	1	Question object (1)	1	[{"added": {}}]	24	1
36	2020-03-20 15:52:51.775775+01	2	Question object (2)	1	[{"added": {}}]	24	1
37	2020-03-20 15:54:50.525372+01	1	Formulaire object (1)	1	[{"added": {}}]	26	1
38	2020-03-20 15:55:00.04501+01	1	Questionform object (1)	1	[{"added": {}}]	27	1
39	2020-03-20 15:55:06.737997+01	2	Questionform object (2)	1	[{"added": {}}]	27	1
40	2020-03-20 15:55:34.890024+01	3	Question object (3)	1	[{"added": {}}]	24	1
41	2020-03-20 15:55:43.713854+01	4	Question object (4)	1	[{"added": {}}]	24	1
42	2020-03-20 15:55:56.601316+01	5	Question object (5)	1	[{"added": {}}]	24	1
43	2020-03-20 15:56:06.201305+01	6	Question object (6)	1	[{"added": {}}]	24	1
44	2020-03-20 15:56:15.893863+01	7	Question object (7)	1	[{"added": {}}]	24	1
45	2020-03-20 15:56:24.286143+01	8	Question object (8)	1	[{"added": {}}]	24	1
46	2020-03-20 15:56:32.00205+01	9	Question object (9)	1	[{"added": {}}]	24	1
47	2020-03-20 15:56:47.105272+01	3	Questionform object (3)	1	[{"added": {}}]	27	1
48	2020-03-20 15:56:52.605287+01	4	Questionform object (4)	1	[{"added": {}}]	27	1
49	2020-03-20 15:56:58.848988+01	5	Questionform object (5)	1	[{"added": {}}]	27	1
50	2020-03-20 15:57:06.374253+01	6	Questionform object (6)	1	[{"added": {}}]	27	1
51	2020-03-20 15:57:12.718126+01	7	Questionform object (7)	1	[{"added": {}}]	27	1
52	2020-03-20 15:57:19.399148+01	8	Questionform object (8)	1	[{"added": {}}]	27	1
53	2020-03-20 15:57:26.826371+01	9	Questionform object (9)	1	[{"added": {}}]	27	1
55	2020-03-20 16:15:35.313529+01	9	Personne object (9)	3		23	1
56	2020-03-20 16:15:40.522197+01	10	Personne object (10)	3		23	1
58	2020-03-20 16:19:21.827115+01	8	Favoris object (8)	3		21	1
59	2020-03-20 16:19:21.837339+01	4	Favoris object (4)	3		21	1
60	2020-03-20 16:19:41.652609+01	4	Personne object (4)	3		23	1
61	2020-03-20 16:20:15.282312+01	8	Favoris object (8)	1	[{"added": {}}]	21	1
63	2020-03-22 18:24:58.16337+01	8	Favoris object (8)	3		21	1
64	2020-03-22 18:25:15.506572+01	8	None None	3		23	1
65	2020-03-22 19:11:44.046626+01	11	None None	3		23	1
66	2020-03-22 19:13:02.10436+01	12	None None	3		23	1
67	2020-03-22 19:17:06.909976+01	13	None None	3		23	1
68	2020-03-22 19:18:00.792661+01	14	None None	3		23	1
69	2020-03-22 19:26:25.128664+01	15	None None	3		23	1
70	2020-03-23 13:49:02.333759+01	9	Reponse object (9)	3		25	1
71	2020-03-23 13:49:02.355485+01	8	Reponse object (8)	3		25	1
72	2020-03-23 13:49:02.357065+01	7	Reponse object (7)	3		25	1
73	2020-03-23 13:49:02.359548+01	6	Reponse object (6)	3		25	1
74	2020-03-23 13:49:02.362027+01	5	Reponse object (5)	3		25	1
75	2020-03-23 13:49:02.364012+01	4	Reponse object (4)	3		25	1
76	2020-03-23 13:49:02.366491+01	3	Reponse object (3)	3		25	1
77	2020-03-23 13:49:02.368475+01	2	Reponse object (2)	3		25	1
78	2020-03-23 13:49:02.37046+01	1	Reponse object (1)	3		25	1
79	2020-03-23 13:57:21.898417+01	18	Reponse object (18)	3		25	1
80	2020-03-23 13:57:21.902883+01	17	Reponse object (17)	3		25	1
81	2020-03-23 13:57:21.905366+01	16	Reponse object (16)	3		25	1
82	2020-03-23 13:57:21.908338+01	15	Reponse object (15)	3		25	1
83	2020-03-23 13:57:21.910819+01	14	Reponse object (14)	3		25	1
84	2020-03-23 13:57:21.913299+01	13	Reponse object (13)	3		25	1
85	2020-03-23 13:57:21.915779+01	12	Reponse object (12)	3		25	1
86	2020-03-23 13:57:21.918259+01	11	Reponse object (11)	3		25	1
87	2020-03-23 13:57:21.921234+01	10	Reponse object (10)	3		25	1
88	2020-03-23 14:01:08.134966+01	27	Reponse object (27)	3		25	1
89	2020-03-23 14:01:08.139274+01	26	Reponse object (26)	3		25	1
90	2020-03-23 14:01:08.141381+01	25	Reponse object (25)	3		25	1
91	2020-03-23 14:01:08.144389+01	24	Reponse object (24)	3		25	1
92	2020-03-23 14:01:08.146867+01	23	Reponse object (23)	3		25	1
93	2020-03-23 14:01:08.149844+01	22	Reponse object (22)	3		25	1
94	2020-03-23 14:01:08.152323+01	21	Reponse object (21)	3		25	1
95	2020-03-23 14:01:08.154806+01	20	Reponse object (20)	3		25	1
96	2020-03-23 14:01:08.163323+01	19	Reponse object (19)	3		25	1
97	2020-03-23 14:47:29.077781+01	16	Utilisateur object (16)	2	[{"changed": {"fields": ["Isformfilled"]}}]	22	1
98	2020-03-23 14:47:55.781761+01	16	Utilisateur object (16)	2	[{"changed": {"fields": ["Isformfilled"]}}]	22	1
99	2020-03-23 14:49:39.262915+01	36	Reponse object (36)	3		25	1
100	2020-03-23 14:49:39.266387+01	35	Reponse object (35)	3		25	1
101	2020-03-23 14:49:39.268371+01	34	Reponse object (34)	3		25	1
102	2020-03-23 14:49:39.270355+01	33	Reponse object (33)	3		25	1
103	2020-03-23 14:49:39.272339+01	32	Reponse object (32)	3		25	1
104	2020-03-23 14:49:39.274821+01	31	Reponse object (31)	3		25	1
105	2020-03-23 14:49:39.277797+01	30	Reponse object (30)	3		25	1
106	2020-03-23 14:49:39.279779+01	29	Reponse object (29)	3		25	1
107	2020-03-23 14:49:39.281763+01	28	Reponse object (28)	3		25	1
108	2020-03-23 16:07:49.33565+01	3	None	3		18	1
109	2020-03-23 16:10:56.782156+01	4	None	3		18	1
110	2020-03-23 16:12:39.891821+01	5	None	3		18	1
111	2020-03-23 16:16:06.095922+01	6	None	3		18	1
112	2020-03-23 16:22:10.491311+01	9	cutie	3		18	1
113	2020-03-23 16:22:10.501978+01	8	None	3		18	1
114	2020-03-23 16:22:24.808095+01	7	babh	3		18	1
115	2020-03-23 16:52:46.01843+01	12	None	3		18	1
116	2020-03-23 16:52:46.050949+01	11	Cutie	3		18	1
117	2020-03-23 16:52:46.0549+01	10	None	3		18	1
118	2020-03-23 16:52:53.313141+01	2	Snow	3		18	1
119	2020-03-23 16:52:53.322102+01	1	Kitty	3		18	1
120	2020-03-23 16:57:25.314323+01	13	Kitten	3		18	1
121	2020-03-23 17:00:18.027306+01	14	Chien object (14)	3		19	1
122	2020-03-23 17:00:30.355622+01	14	Kitten	3		18	1
123	2020-03-23 17:10:02.175866+01	15	Chat object (15)	3		20	1
124	2020-03-23 17:10:13.171501+01	15	kitty	3		18	1
127	2020-03-24 20:16:42.593083+01	17	Mathusha Thiru	2	[{"changed": {"fields": ["Isadmin"]}}]	23	1
128	2020-03-24 20:17:14.652327+01	18	Nelly	2	[{"changed": {"fields": ["Idpersonne"]}}]	18	1
129	2020-03-24 20:17:19.928916+01	18	Nelly	2	[{"changed": {"fields": ["Idpersonne"]}}]	18	1
130	2020-03-24 20:17:25.96917+01	2	Snow	2	[{"changed": {"fields": ["Idpersonne"]}}]	18	1
131	2020-03-24 20:17:30.657181+01	1	Kitty	2	[{"changed": {"fields": ["Idpersonne"]}}]	18	1
132	2020-03-24 20:17:45.116197+01	2	Thiru Mathusha	3		23	1
133	2020-03-25 12:53:43.352602+01	54	Reponse object (54)	3		25	1
134	2020-03-25 12:53:43.366886+01	53	Reponse object (53)	3		25	1
135	2020-03-25 12:53:43.369108+01	52	Reponse object (52)	3		25	1
136	2020-03-25 12:53:43.371144+01	51	Reponse object (51)	3		25	1
137	2020-03-25 12:53:43.373139+01	50	Reponse object (50)	3		25	1
138	2020-03-25 12:53:43.375135+01	49	Reponse object (49)	3		25	1
139	2020-03-25 12:53:43.37713+01	48	Reponse object (48)	3		25	1
140	2020-03-25 12:53:43.379979+01	47	Reponse object (47)	3		25	1
141	2020-03-25 12:53:43.381976+01	46	Reponse object (46)	3		25	1
142	2020-03-25 12:53:43.38301+01	45	Reponse object (45)	3		25	1
143	2020-03-25 12:53:43.385004+01	44	Reponse object (44)	3		25	1
144	2020-03-25 12:53:43.386999+01	43	Reponse object (43)	3		25	1
145	2020-03-25 12:53:43.388957+01	42	Reponse object (42)	3		25	1
146	2020-03-25 12:53:43.390952+01	41	Reponse object (41)	3		25	1
147	2020-03-25 12:53:43.392948+01	40	Reponse object (40)	3		25	1
148	2020-03-25 12:53:43.39594+01	39	Reponse object (39)	3		25	1
149	2020-03-25 12:53:43.397649+01	38	Reponse object (38)	3		25	1
150	2020-03-25 12:53:43.399649+01	37	Reponse object (37)	3		25	1
151	2020-03-25 14:38:49.541574+01	64	Reponse object (64)	3		25	1
152	2020-03-25 14:53:25.277034+01	16	Utilisateur object (16)	2	[{"changed": {"fields": ["Isformfilled"]}}]	22	1
154	2020-03-26 10:55:39.59493+01	17	Utilisateur object (17)	3		22	1
155	2020-03-26 11:30:51.845782+01	17	Utilisateur object (17)	1	[{"added": {}}]	22	1
156	2020-03-26 13:13:47.749031+01	115	Reponse object (115)	3		25	1
157	2020-03-26 13:13:47.764985+01	114	Reponse object (114)	3		25	1
158	2020-03-26 13:13:47.767976+01	113	Reponse object (113)	3		25	1
159	2020-03-26 13:13:47.770969+01	112	Reponse object (112)	3		25	1
160	2020-03-26 13:13:47.772963+01	111	Reponse object (111)	3		25	1
161	2020-03-26 13:13:47.775955+01	110	Reponse object (110)	3		25	1
162	2020-03-26 13:13:47.778947+01	109	Reponse object (109)	3		25	1
163	2020-03-26 13:13:47.781939+01	108	Reponse object (108)	3		25	1
164	2020-03-26 13:13:47.784931+01	107	Reponse object (107)	3		25	1
165	2020-03-26 13:22:38.031216+01	16	Utilisateur object (16)	2	[{"changed": {"fields": ["Isformfilled"]}}]	22	1
166	2020-03-26 13:34:21.790024+01	18	Utilisateur object (18)	2	[{"changed": {"fields": ["Isformfilled"]}}]	22	1
167	2020-04-01 15:54:53.248001+02	19	19	2	[{"changed": {"fields": ["Mail"]}}]	23	1
168	2020-04-01 15:55:01.013414+02	18	18	2	[{"changed": {"fields": ["Mail"]}}]	23	1
169	2020-04-01 15:55:12.045124+02	16	16	2	[{"changed": {"fields": ["Mail"]}}]	23	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	puppify	authgroup
8	puppify	authgrouppermissions
9	puppify	authpermission
10	puppify	authuser
11	puppify	authusergroups
12	puppify	authuseruserpermissions
13	puppify	djangoadminlog
14	puppify	djangocontenttype
15	puppify	djangomigrations
16	puppify	djangosession
17	puppify	image
18	puppify	animal
19	puppify	chien
20	puppify	chat
21	puppify	favoris
22	puppify	utilisateur
23	puppify	personne
24	puppify	question
25	puppify	reponse
26	puppify	formulaire
27	puppify	questionform
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-03-06 10:56:14.970895+01
2	auth	0001_initial	2020-03-06 10:56:15.039668+01
3	admin	0001_initial	2020-03-06 10:56:15.115123+01
4	admin	0002_logentry_remove_auto_add	2020-03-06 10:56:15.134867+01
5	admin	0003_logentry_add_action_flag_choices	2020-03-06 10:56:15.146148+01
6	contenttypes	0002_remove_content_type_name	2020-03-06 10:56:15.16941+01
7	auth	0002_alter_permission_name_max_length	2020-03-06 10:56:15.17665+01
8	auth	0003_alter_user_email_max_length	2020-03-06 10:56:15.18656+01
9	auth	0004_alter_user_username_opts	2020-03-06 10:56:15.197449+01
10	auth	0005_alter_user_last_login_null	2020-03-06 10:56:15.207381+01
11	auth	0006_require_contenttypes_0002	2020-03-06 10:56:15.211018+01
12	auth	0007_alter_validators_add_error_messages	2020-03-06 10:56:15.220809+01
13	auth	0008_alter_user_username_max_length	2020-03-06 10:56:15.240149+01
14	auth	0009_alter_user_last_name_max_length	2020-03-06 10:56:15.250941+01
15	auth	0010_alter_group_name_max_length	2020-03-06 10:56:15.262471+01
16	auth	0011_update_proxy_permissions	2020-03-06 10:56:15.273097+01
17	sessions	0001_initial	2020-03-06 10:56:15.287197+01
18	puppify	0001_initial	2020-03-09 10:29:26.111852+01
19	puppify	0002_formulaire_question_questionform_reponse	2020-03-20 12:58:31.642525+01
20	puppify	0003_auto_20200320_1214	2020-03-20 13:14:25.57467+01
21	puppify	0004_auto_20200320_1235	2020-03-20 13:53:21.789903+01
22	puppify	0005_questionform_reponse	2020-03-20 13:53:21.862152+01
23	puppify	0006_auto_20200320_1239	2020-03-20 13:53:22.002814+01
24	puppify	0007_formulaire_question_questionform_reponse	2020-03-20 13:53:22.081569+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7jt8xnlzzelpjixhnstp6e2lcqpkoj0z	ZjNkOWU1Mjg3NmU2OWI5ZWI3NGEwZjI3OTI0YjRlZDY0MWYwMjBlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3In0=	2020-03-20 14:04:40.359369+01
pe6xi0z95wb6o6xppwqx1t4onn3q06u2	ZjNkOWU1Mjg3NmU2OWI5ZWI3NGEwZjI3OTI0YjRlZDY0MWYwMjBlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3In0=	2020-03-23 11:36:21.574883+01
esm0wyt3g8wpvcahgh9wd3karw1lw68h	ZjNkOWU1Mjg3NmU2OWI5ZWI3NGEwZjI3OTI0YjRlZDY0MWYwMjBlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3In0=	2020-03-25 10:30:03.771525+01
ogk1zx38huez4js06n1d4b6nrenr2zwq	ZjNkOWU1Mjg3NmU2OWI5ZWI3NGEwZjI3OTI0YjRlZDY0MWYwMjBlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3In0=	2020-03-25 12:32:16.282988+01
lrm99d7mhlpuh509wr8472hfuvom20ig	ODFmYjM3NWY4MDJiZmZlOTI0YjBmNGRkNjgxOTRjOTcxMThmY2I2NTp7InV0aWxpc2F0ZXVyX2lkIjo0LCJ1dGlsaXNhdGV1cl9ub20iOiJhemVydHkiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJhemVydHkifQ==	2020-03-26 15:50:13.72448+01
76n4f25sb6vczwtpc61389hycjul5zco	MTgxYjgxYjE0NWJlMDc0NDRhZGFiNDJmNGNjZGY0NDQzNjAzN2FjNjp7fQ==	2020-03-27 14:33:00.795129+01
hdgjmk2qq6jcg5utwgpn04dgtn0pgs4s	ODFmYjM3NWY4MDJiZmZlOTI0YjBmNGRkNjgxOTRjOTcxMThmY2I2NTp7InV0aWxpc2F0ZXVyX2lkIjo0LCJ1dGlsaXNhdGV1cl9ub20iOiJhemVydHkiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJhemVydHkifQ==	2020-03-30 14:31:36.222202+02
nhzpzgp6rmg70sqdvslror5n1s6zygmn	MThjNjY0ZDNkYjQwMDliZTNmZTVkZWM0MmQ2ZTBhYzc2NDBlNzQ1NDp7InV0aWxpc2F0ZXVyX2lkIjo0LCJ1dGlsaXNhdGV1cl9ub20iOiJhemVydHkiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJhemVydHkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdiOTIwN2FiMDVjMjZhODVhZmU0YTU2ZWY0MDAxZDY2MThlMjNlNyJ9	2020-03-30 16:01:17.530299+02
9iuugxme52fn39laych83pmkvco69tci	MThjNjY0ZDNkYjQwMDliZTNmZTVkZWM0MmQ2ZTBhYzc2NDBlNzQ1NDp7InV0aWxpc2F0ZXVyX2lkIjo0LCJ1dGlsaXNhdGV1cl9ub20iOiJhemVydHkiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJhemVydHkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdiOTIwN2FiMDVjMjZhODVhZmU0YTU2ZWY0MDAxZDY2MThlMjNlNyJ9	2020-03-31 18:06:03.903528+02
y42w02m4qu9qqhfjmwzr1hyq5rhlkfa6	ODFmYjM3NWY4MDJiZmZlOTI0YjBmNGRkNjgxOTRjOTcxMThmY2I2NTp7InV0aWxpc2F0ZXVyX2lkIjo0LCJ1dGlsaXNhdGV1cl9ub20iOiJhemVydHkiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJhemVydHkifQ==	2020-03-31 18:45:17.634332+02
3byqjeonmx64rqqnkzj7eo6z2a63w879	MThjNjY0ZDNkYjQwMDliZTNmZTVkZWM0MmQ2ZTBhYzc2NDBlNzQ1NDp7InV0aWxpc2F0ZXVyX2lkIjo0LCJ1dGlsaXNhdGV1cl9ub20iOiJhemVydHkiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJhemVydHkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdiOTIwN2FiMDVjMjZhODVhZmU0YTU2ZWY0MDAxZDY2MThlMjNlNyJ9	2020-04-01 12:33:07.415066+02
xltpljjrvd68qhy4wsk4jc99vibydx84	OThiYTM5NjBjZWUxZDY1ODc2ODI0YzFlZDA4OTk5YzA5ZTllNTE0Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfaWQiOjgsInV0aWxpc2F0ZXVyX25vbSI6ImRpcnUiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJkaXJ1In0=	2020-04-01 16:23:06.959276+02
alw8st0d822co433hehgplwu4fh2pqte	ZjNkOWU1Mjg3NmU2OWI5ZWI3NGEwZjI3OTI0YjRlZDY0MWYwMjBlNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3In0=	2020-04-03 13:59:39.664213+02
mhnedw8as7cnn7togjlgnonyl67ecn8x	NmZiMmQzZjNmYjU0ZTIyZjQ2YTEzZGNjMzc5ZTIwM2U5ODFlYzE3Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfaWQiOjgsInV0aWxpc2F0ZXVyX25vbSI6bnVsbCwidXRpbGlzYXRldXJfcHJlbm9tIjpudWxsfQ==	2020-04-03 18:44:00.849234+02
b5sijcvjf56n494zgwki8pk1yh5ask7c	MzhmZjE0NTg3MTQ0MDk0ODdlNWFhNjIwZmM1ZGQyYjMxOWU3N2ZiYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfaWQiOjE2LCJ1dGlsaXNhdGV1cl9ub20iOiJhIiwidXRpbGlzYXRldXJfcHJlbm9tIjoiYSJ9	2020-04-05 20:24:58.757071+02
6eqtoin4qlac1gsyv46v86i9i1e38y78	YjhhMmRiNTNhMGM5ZWRlZGVjODcyODI1Zjg3NTBhMjFkNDRhNjNhMzp7InV0aWxpc2F0ZXVyX2lkIjoxNiwidXRpbGlzYXRldXJfbm9tIjoiYSIsInV0aWxpc2F0ZXVyX3ByZW5vbSI6ImEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdiOTIwN2FiMDVjMjZhODVhZmU0YTU2ZWY0MDAxZDY2MThlMjNlNyJ9	2020-04-06 11:03:59.048445+02
rs1u467j4e8qzlb74g7xtvojliok16q9	YjhhMmRiNTNhMGM5ZWRlZGVjODcyODI1Zjg3NTBhMjFkNDRhNjNhMzp7InV0aWxpc2F0ZXVyX2lkIjoxNiwidXRpbGlzYXRldXJfbm9tIjoiYSIsInV0aWxpc2F0ZXVyX3ByZW5vbSI6ImEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdiOTIwN2FiMDVjMjZhODVhZmU0YTU2ZWY0MDAxZDY2MThlMjNlNyJ9	2020-04-06 13:58:09.819211+02
xr9t3ossebfxw0tv128c61atyfzrb6kn	MzhmZjE0NTg3MTQ0MDk0ODdlNWFhNjIwZmM1ZGQyYjMxOWU3N2ZiYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfaWQiOjE2LCJ1dGlsaXNhdGV1cl9ub20iOiJhIiwidXRpbGlzYXRldXJfcHJlbm9tIjoiYSJ9	2020-04-06 16:41:41.179953+02
5c5swg537nyadc6c5eym4btiqyp6qibr	Y2QxY2MwOGUwMzMwY2E3NGJkZmNlMjcxMjYzYjc5YjVjNDJjMDExZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfYWRtaW4iOmZhbHNlLCJ1dGlsaXNhdGV1cl9pZCI6MTgsInV0aWxpc2F0ZXVyX25vbSI6InRlc3QiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJ0ZXN0In0=	2020-04-08 13:52:11.705217+02
cn0rlogrjo77djb3ddxuiag1b65br17b	OGQ1MTNkY2Q0NGM1ZTViMmRmNWU4NDM0YTk3ZDdlMzljZjg4YmRlMDp7InV0aWxpc2F0ZXVyX2FkbWluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdiOTIwN2FiMDVjMjZhODVhZmU0YTU2ZWY0MDAxZDY2MThlMjNlNyIsInV0aWxpc2F0ZXVyX2lkIjoxNywidXRpbGlzYXRldXJfbm9tIjoiTWF0aHVzaGEiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJUaGlydSJ9	2020-04-08 16:51:41.891964+02
plnaxl0fpb3olquk5nqd2qrv4f6a49kz	Njk0Y2Y0MDQ2NWM4NTM4ZTYwZTk1NTFlMmI1NDNjOTBjN2M1ZjBiODp7InV0aWxpc2F0ZXVyX2FkbWluIjp0cnVlLCJ1dGlsaXNhdGV1cl9pZCI6MTcsInV0aWxpc2F0ZXVyX25vbSI6Ik1hdGh1c2hhIiwidXRpbGlzYXRldXJfcHJlbm9tIjoiVGhpcnUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdiOTIwN2FiMDVjMjZhODVhZmU0YTU2ZWY0MDAxZDY2MThlMjNlNyJ9	2020-04-08 23:44:19.765854+02
sorq8uo93mbj21ajpn0rkx2c6egeow31	Y2QxY2MwOGUwMzMwY2E3NGJkZmNlMjcxMjYzYjc5YjVjNDJjMDExZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfYWRtaW4iOmZhbHNlLCJ1dGlsaXNhdGV1cl9pZCI6MTgsInV0aWxpc2F0ZXVyX25vbSI6InRlc3QiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJ0ZXN0In0=	2020-04-09 14:38:43.487677+02
rlrv9s3nabsftsxa0s6rdpua6r091qgr	ZTIxZmFkN2E5ZmE5MDAzOTkxYzdiMzViNWJmNDYwN2EyZGFhNzFhZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfYWRtaW4iOnRydWUsInV0aWxpc2F0ZXVyX2lkIjoxNywidXRpbGlzYXRldXJfbm9tIjoiTWF0aHVzaGEiLCJ1dGlsaXNhdGV1cl9wcmVub20iOiJUaGlydSJ9	2020-04-13 14:23:55.063994+02
e0sfcjm0t43xm95nr7zxl3r0ztq2pv9u	N2JiMzAwNzEyMjY5OTc3Y2RkY2Y0YmRjZjJkMmNhZmE1ODRhNDAzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfaWQiOjE3LCJ1dGlsaXNhdGV1cl9ub20iOiJNYXRodXNoYSIsInV0aWxpc2F0ZXVyX3ByZW5vbSI6IlRoaXJ1IiwidXRpbGlzYXRldXJfYWRtaW4iOnRydWV9	2020-04-15 15:55:18.730892+02
1430r0924oucmp9q66d04imp3pjihnq1	N2JiMzAwNzEyMjY5OTc3Y2RkY2Y0YmRjZjJkMmNhZmE1ODRhNDAzZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfaWQiOjE3LCJ1dGlsaXNhdGV1cl9ub20iOiJNYXRodXNoYSIsInV0aWxpc2F0ZXVyX3ByZW5vbSI6IlRoaXJ1IiwidXRpbGlzYXRldXJfYWRtaW4iOnRydWV9	2020-04-17 16:42:47.061548+02
1j96c30ux5tv1n8ylsetvsh1crgwihne	ZDIxMjZmZTAwOTEyYTIwZWNhMWM2MWU5YmIxNzhjZTU3MzY0OTU0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxN2I5MjA3YWIwNWMyNmE4NWFmZTRhNTZlZjQwMDFkNjYxOGUyM2U3IiwidXRpbGlzYXRldXJfaWQiOjIwLCJ1dGlsaXNhdGV1cl9ub20iOiJKZWFuIiwidXRpbGlzYXRldXJfcHJlbm9tIjoiTWFyaWUiLCJ1dGlsaXNhdGV1cl9hZG1pbiI6ZmFsc2V9	2020-04-22 18:08:57.855388+02
9jlrp5fji7cpdygga84080pver4jneh8	ZTIwYzlhNzE5ZGI2OTk1MmM0MTkwMzhhODAwNWRiMjczZDk2ZTZhZTp7InV0aWxpc2F0ZXVyX2lkIjoyMCwidXRpbGlzYXRldXJfbm9tIjoiSmVhbiIsInV0aWxpc2F0ZXVyX3ByZW5vbSI6Ik1hcmllIiwidXRpbGlzYXRldXJfYWRtaW4iOmZhbHNlLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdiOTIwN2FiMDVjMjZhODVhZmU0YTU2ZWY0MDAxZDY2MThlMjNlNyJ9	2020-04-23 13:21:51.100026+02
yf9y3sporo67q816plqq63x88g619kvx	NjFmZjgxZTNkYTE3YWJiOGQ0MGIyMzNkNjBjNmNhYjEzN2M4ODk2Njp7InV0aWxpc2F0ZXVyX2lkIjoyMCwidXRpbGlzYXRldXJfbm9tIjoiSmVhbiIsInV0aWxpc2F0ZXVyX3ByZW5vbSI6Ik1hcmllIiwidXRpbGlzYXRldXJfYWRtaW4iOmZhbHNlfQ==	2020-04-24 13:13:58.671026+02
\.


--
-- Data for Name: favoris; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.favoris (idpersonne, idanimal) FROM stdin;
\.


--
-- Data for Name: formulaire; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.formulaire (idform, libelle_form) FROM stdin;
1	Formulaire d'adoption
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.image (idimage, url, libelle) FROM stdin;
\.


--
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.personne (idpersonne, nom, prenom, numero, mail, mdp, isadmin, idimage) FROM stdin;
17	Mathusha	Thiru	0	mt.mathusha@outlook.fr	Mathusha	t	\N
19	diru	diru	0	diru@diru.fr	diru	\N	\N
18	test	test	0	test@test.fr	test	\N	\N
16	a	a	\N	a@a.fr	a	\N	\N
20	Jean	Marie	\N	mt.mathusha@gmail.com	Mathusha	\N	\N
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.question (idquestion, libelle_question) FROM stdin;
1	Vivez-vous dans une maison ou un appartement ?
2	Avez vous un jardin ou un parc à proximité ?
3	De combien de membres vous y compris est composé votre foyer ?  Précisez combien d’adultes, d’enfants et leur âge
4	A combien estimez vous les dépenses d’un animal de compagnie par année ?
5	Possédez-vous des animaux ? Si oui listez les (Race, âge, sexe)
6	Où se trouvera l’animal ? (En journée et la nuit)
7	Quelles difficultés pensez-vous rencontrer avec l’animal ?
8	En cas d’absence de votre part qui s’occuperait de votre animal ?
9	Quel est le temps d’adaptation à son nouveau refuge pour l’animal ?
\.


--
-- Data for Name: questionform; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.questionform (idqf, idquestion, idform) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
9	9	1
\.


--
-- Data for Name: reponse; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.reponse (idreponse, idquestion, idpersonne, reponse) FROM stdin;
152	1	16	\N
153	2	16	\N
154	3	16	\N
155	4	16	\N
156	5	16	\N
157	6	16	\N
158	7	16	\N
159	8	16	\N
160	9	16	\N
161	1	20	Maison
162	2	20	Un parc à 5 minutes de marche
163	3	20	Je vis seule, j'ai 45 ans
164	4	20	Je dirais 150 euros
165	5	20	Un chat: Ragdoll de 10 ans une femelle
166	6	20	Chez moi j'ai un espace clos reservé aux animaux mon chat saura s'y adapter
167	7	20	Le temps qu'il s'habitue à l'autre chat
168	8	20	Ma soeur qui habite à quelques kms
169	9	20	Je dirais une semaine
134	1	19	a
135	2	19	a
136	3	19	a
137	4	19	a
138	5	19	a
139	6	19	a
140	7	19	a
141	8	19	a
142	9	19	a
125	1	18	test
126	2	18	test
127	3	18	test
128	4	18	test
129	5	18	test
130	6	18	test
131	7	18	test
132	8	18	test
133	9	18	test
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: mathu
--

COPY public.utilisateur (idpersonne, isformaccepted, isformfilled) FROM stdin;
17	f	t
19	t	t
16	\N	f
18	t	t
20	t	t
\.


--
-- Name: animal_idanimal_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.animal_idanimal_seq', 31, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 108, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: chat_idanimal_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.chat_idanimal_seq', 1, false);


--
-- Name: chien_idanimal_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.chien_idanimal_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 169, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 27, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: formulaire_idform_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.formulaire_idform_seq', 1, true);


--
-- Name: image_idimage_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.image_idimage_seq', 1, false);


--
-- Name: personne_idpersonne_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.personne_idpersonne_seq', 20, true);


--
-- Name: question_idquestion_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.question_idquestion_seq', 9, true);


--
-- Name: questionform_idqf_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.questionform_idqf_seq', 9, true);


--
-- Name: reponse_idreponse_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.reponse_idreponse_seq', 169, true);


--
-- Name: utilisateur_idpersonne_seq; Type: SEQUENCE SET; Schema: public; Owner: mathu
--

SELECT pg_catalog.setval('public.utilisateur_idpersonne_seq', 1, false);


--
-- Name: animal animal_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (idanimal);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (idanimal);


--
-- Name: chien chien_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.chien
    ADD CONSTRAINT chien_pkey PRIMARY KEY (idanimal);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: favoris favoris_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_pkey PRIMARY KEY (idpersonne, idanimal);


--
-- Name: formulaire formulaire_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.formulaire
    ADD CONSTRAINT formulaire_pkey PRIMARY KEY (idform);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (idimage);


--
-- Name: personne personne_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT personne_pkey PRIMARY KEY (idpersonne);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (idquestion);


--
-- Name: questionform questionform_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.questionform
    ADD CONSTRAINT questionform_pkey PRIMARY KEY (idqf);


--
-- Name: reponse reponse_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.reponse
    ADD CONSTRAINT reponse_pkey PRIMARY KEY (idreponse);


--
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (idpersonne);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: mathu
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: animal animal_idpersonne_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT animal_idpersonne_fkey FOREIGN KEY (idpersonne) REFERENCES public.personne(idpersonne);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat chat_idanimal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_idanimal_fkey FOREIGN KEY (idanimal) REFERENCES public.animal(idanimal);


--
-- Name: chien chien_idanimal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.chien
    ADD CONSTRAINT chien_idanimal_fkey FOREIGN KEY (idanimal) REFERENCES public.animal(idanimal);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: favoris favoris_idanimal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_idanimal_fkey FOREIGN KEY (idanimal) REFERENCES public.animal(idanimal);


--
-- Name: favoris favoris_idpersonne_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_idpersonne_fkey FOREIGN KEY (idpersonne) REFERENCES public.personne(idpersonne);


--
-- Name: personne personne_idimage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.personne
    ADD CONSTRAINT personne_idimage_fkey FOREIGN KEY (idimage) REFERENCES public.image(idimage);


--
-- Name: questionform questionform_idform_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.questionform
    ADD CONSTRAINT questionform_idform_fkey FOREIGN KEY (idform) REFERENCES public.formulaire(idform);


--
-- Name: questionform questionform_idquestion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.questionform
    ADD CONSTRAINT questionform_idquestion_fkey FOREIGN KEY (idquestion) REFERENCES public.question(idquestion);


--
-- Name: reponse reponse_idpersonne_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.reponse
    ADD CONSTRAINT reponse_idpersonne_fkey FOREIGN KEY (idpersonne) REFERENCES public.utilisateur(idpersonne);


--
-- Name: reponse reponse_idquestion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.reponse
    ADD CONSTRAINT reponse_idquestion_fkey FOREIGN KEY (idquestion) REFERENCES public.question(idquestion);


--
-- Name: utilisateur utilisateur_idpersonne_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mathu
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_idpersonne_fkey FOREIGN KEY (idpersonne) REFERENCES public.personne(idpersonne);


--
-- PostgreSQL database dump complete
--

