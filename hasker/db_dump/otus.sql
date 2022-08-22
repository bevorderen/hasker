--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO otus_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO otus_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO otus_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO otus_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO otus_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO otus_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO otus_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO otus_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO otus_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO otus_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO otus_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO otus_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO otus_user;

--
-- Name: questions_answer; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.questions_answer (
    id bigint NOT NULL,
    text text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    author_id bigint NOT NULL,
    question_id bigint NOT NULL
);


ALTER TABLE public.questions_answer OWNER TO otus_user;

--
-- Name: questions_answer_dislikers; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.questions_answer_dislikers (
    id bigint NOT NULL,
    answer_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.questions_answer_dislikers OWNER TO otus_user;

--
-- Name: questions_answer_dislikers_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.questions_answer_dislikers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_answer_dislikers_id_seq OWNER TO otus_user;

--
-- Name: questions_answer_dislikers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.questions_answer_dislikers_id_seq OWNED BY public.questions_answer_dislikers.id;


--
-- Name: questions_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.questions_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_answer_id_seq OWNER TO otus_user;

--
-- Name: questions_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.questions_answer_id_seq OWNED BY public.questions_answer.id;


--
-- Name: questions_answer_likers; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.questions_answer_likers (
    id bigint NOT NULL,
    answer_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.questions_answer_likers OWNER TO otus_user;

--
-- Name: questions_answer_likers_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.questions_answer_likers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_answer_likers_id_seq OWNER TO otus_user;

--
-- Name: questions_answer_likers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.questions_answer_likers_id_seq OWNED BY public.questions_answer_likers.id;


--
-- Name: questions_question; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.questions_question (
    id bigint NOT NULL,
    text text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title text NOT NULL,
    author_id bigint NOT NULL,
    right_answer_id bigint
);


ALTER TABLE public.questions_question OWNER TO otus_user;

--
-- Name: questions_question_dislikers; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.questions_question_dislikers (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.questions_question_dislikers OWNER TO otus_user;

--
-- Name: questions_question_dislikers_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.questions_question_dislikers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_dislikers_id_seq OWNER TO otus_user;

--
-- Name: questions_question_dislikers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.questions_question_dislikers_id_seq OWNED BY public.questions_question_dislikers.id;


--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.questions_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_id_seq OWNER TO otus_user;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions_question.id;


--
-- Name: questions_question_likers; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.questions_question_likers (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.questions_question_likers OWNER TO otus_user;

--
-- Name: questions_question_likers_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.questions_question_likers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_likers_id_seq OWNER TO otus_user;

--
-- Name: questions_question_likers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.questions_question_likers_id_seq OWNED BY public.questions_question_likers.id;


--
-- Name: questions_question_tags; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.questions_question_tags (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    tag_id character varying(100) NOT NULL
);


ALTER TABLE public.questions_question_tags OWNER TO otus_user;

--
-- Name: questions_question_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.questions_question_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_tags_id_seq OWNER TO otus_user;

--
-- Name: questions_question_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.questions_question_tags_id_seq OWNED BY public.questions_question_tags.id;


--
-- Name: questions_tag; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.questions_tag (
    name character varying(100) NOT NULL
);


ALTER TABLE public.questions_tag OWNER TO otus_user;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    avatar character varying(100)
);


ALTER TABLE public.users_user OWNER TO otus_user;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO otus_user;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO otus_user;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO otus_user;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: otus_user
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO otus_user;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: otus_user
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO otus_user;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: otus_user
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: questions_answer id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer ALTER COLUMN id SET DEFAULT nextval('public.questions_answer_id_seq'::regclass);


--
-- Name: questions_answer_dislikers id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_dislikers ALTER COLUMN id SET DEFAULT nextval('public.questions_answer_dislikers_id_seq'::regclass);


--
-- Name: questions_answer_likers id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_likers ALTER COLUMN id SET DEFAULT nextval('public.questions_answer_likers_id_seq'::regclass);


--
-- Name: questions_question id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question ALTER COLUMN id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: questions_question_dislikers id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_dislikers ALTER COLUMN id SET DEFAULT nextval('public.questions_question_dislikers_id_seq'::regclass);


--
-- Name: questions_question_likers id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_likers ALTER COLUMN id SET DEFAULT nextval('public.questions_question_likers_id_seq'::regclass);


--
-- Name: questions_question_tags id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_tags ALTER COLUMN id SET DEFAULT nextval('public.questions_question_tags_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: otus_user
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add answer	7	add_answer
26	Can change answer	7	change_answer
27	Can delete answer	7	delete_answer
28	Can view answer	7	view_answer
29	Can add tag	8	add_tag
30	Can change tag	8	change_tag
31	Can delete tag	8	delete_tag
32	Can view tag	8	view_tag
33	Can add question	9	add_question
34	Can change question	9	change_question
35	Can delete question	9	delete_question
36	Can view question	9	view_question
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	questions	answer
8	questions	tag
9	questions	question
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-08-10 01:43:06.897737+07
2	contenttypes	0002_remove_content_type_name	2022-08-10 01:43:06.902629+07
3	auth	0001_initial	2022-08-10 01:43:06.971263+07
4	auth	0002_alter_permission_name_max_length	2022-08-10 01:43:06.975353+07
5	auth	0003_alter_user_email_max_length	2022-08-10 01:43:06.979787+07
6	auth	0004_alter_user_username_opts	2022-08-10 01:43:06.984272+07
7	auth	0005_alter_user_last_login_null	2022-08-10 01:43:06.989449+07
8	auth	0006_require_contenttypes_0002	2022-08-10 01:43:06.991189+07
9	auth	0007_alter_validators_add_error_messages	2022-08-10 01:43:06.995024+07
10	auth	0008_alter_user_username_max_length	2022-08-10 01:43:06.999112+07
11	auth	0009_alter_user_last_name_max_length	2022-08-10 01:43:07.003388+07
12	auth	0010_alter_group_name_max_length	2022-08-10 01:43:07.009225+07
13	auth	0011_update_proxy_permissions	2022-08-10 01:43:07.014316+07
14	auth	0012_alter_user_first_name_max_length	2022-08-10 01:43:07.019141+07
15	users	0001_initial	2022-08-10 01:43:07.051686+07
16	admin	0001_initial	2022-08-10 01:43:07.065671+07
17	admin	0002_logentry_remove_auto_add	2022-08-10 01:43:07.071894+07
18	admin	0003_logentry_add_action_flag_choices	2022-08-10 01:43:07.079333+07
19	questions	0001_initial	2022-08-10 01:43:07.158746+07
20	sessions	0001_initial	2022-08-10 01:43:07.166811+07
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
go3ct4qspc7el9wa5z2t370ngr3jybbw	.eJxVjEsOAiEQBe_C2pBGGhpcuvcMhK-MGkiGmZXx7oZkFrp9VfXezPl9q24feXVLYhcmBDv9jsHHZ26TpIdv985jb9u6BD4VftDBbz3l1_Vw_w6qH3XWSkQsRJYKGAiQCEpAJZBi0ZQRtVYJAI2UYEI8kyIywZK2Egi9Z58v5c42xw:1oLUMZ:bA3P4nA0ZU3W0pFZpQzFBMixUgYwufEeXnpF6NRcSQM	2022-08-24 01:53:59.461079+07
dlrcczfrv1hvtsqhhta3pb22bleiyjup	.eJxVjEEOgjAQRe_StWlmqBTq0j1nIDOdqUVNSSisjHdXEha6_e-9_zIjbWset6rLOIm5mNacfjem-NCyA7lTuc02zmVdJra7Yg9a7TCLPq-H-3eQqeZvjZG8jylxQywdAHNQDAmpk158j0zsEFShCYKhBaUETsMZFL135Mz7AxHiOHg:1oLUur:SsQyYaasRbcBwJdXj7XkrB03qHpXW_3hcbWzDq2qvN4	2022-08-24 02:29:25.015409+07
\.


--
-- Data for Name: questions_answer; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.questions_answer (id, text, created, updated, author_id, question_id) FROM stdin;
1	Maecenas ante metus, consequat eu risus at, luctus laoreet velit. Nunc orci mi, dictum non posuere vitae, varius eu magna. Cras venenatis erat velit, eu convallis ipsum posuere a. Donec interdum ullamcorper sem, a tincidunt tellus porta a. Suspendisse tristique ante nibh, eget posuere lorem facilisis eget. Quisque arcu metus, tempor eu velit et, feugiat finibus odio. Pellentesque imperdiet ullamcorper nulla, nec congue lorem tristique ut. Fusce id viverra nulla, sit amet iaculis mi. Maecenas iaculis metus eu interdum malesuada. Nulla vitae lorem vitae odio tincidunt fringilla. Suspendisse porta augue nec nibh dapibus, auctor scelerisque risus interdum. Vivamus vitae ipsum porttitor, consequat felis vel, pretium neque. Aliquam ac nisl ac sem maximus sodales scelerisque efficitur felis.	2022-08-10 02:29:51.075058+07	2022-08-10 02:29:51.075071+07	5	1
2	Nunc laoreet laoreet risus sed tincidunt. Nam augue sapien, aliquam ut imperdiet ac, ullamcorper eget tortor. Nunc feugiat fringilla lorem ut rhoncus. Praesent facilisis porta odio, at auctor ipsum viverra non. Donec commodo ornare turpis, sed cursus est. Etiam aliquam, lorem quis auctor semper, nisl nibh venenatis orci, sit amet fringilla tortor massa ut tortor. Sed eu lorem quis lorem tincidunt efficitur quis sed neque. Proin placerat semper rhoncus. Maecenas id elit sed est tincidunt pretium. Nullam mattis lacus id ultrices ullamcorper. Sed eleifend urna vitae ligula rutrum, at lacinia erat congue. Duis pretium libero et pellentesque maximus. Nam id cursus augue. Ut nec massa est.	2022-08-10 02:30:29.041379+07	2022-08-10 02:30:29.041391+07	5	1
3	Suspendisse eget velit sem. Pellentesque vitae finibus justo. Proin neque risus, pulvinar sit amet finibus sit amet, tempor eget nibh. In laoreet, arcu non egestas pellentesque, sem libero luctus elit, in dignissim nunc velit non dui. Nam mauris augue, malesuada ut ante sit amet, sodales tincidunt enim. Nunc felis augue, consectetur non augue ut, eleifend cursus ligula. Morbi hendrerit justo nec odio maximus viverra. Ut mollis sollicitudin enim eget ultricies.	2022-08-10 02:33:11.920207+07	2022-08-10 02:33:11.920217+07	5	1
4	Suspendisse eget velit sem. Pellentesque vitae finibus justo. Proin neque risus, pulvinar sit amet finibus sit amet, tempor eget nibh. In laoreet, arcu non egestas pellentesque, sem libero luctus elit, in dignissim nunc velit non dui. Nam mauris augue, malesuada ut ante sit amet, sodales tincidunt enim. Nunc felis augue, consectetur non augue ut, eleifend cursus ligula. Morbi hendrerit justo nec odio maximus viverra. Ut mollis sollicitudin enim eget ultricies.	2022-08-10 02:33:20.74893+07	2022-08-10 02:33:20.748941+07	5	1
5	Proin facilisis ultricies nulla, bibendum auctor eros molestie sed. Fusce accumsan dolor sed sapien ornare tristique. Phasellus ac massa ac quam vehicula cursus id ac eros. In suscipit elit ac pellentesque pharetra. Phasellus mattis, tellus sed tincidunt pellentesque, dolor lacus sodales est, vehicula semper nunc tellus vitae lacus. Donec porta dolor tortor, ac sagittis ante laoreet a. Vivamus vestibulum eu orci luctus porta. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas dolor magna, eleifend eget vestibulum at, laoreet et felis. Sed vulputate fringilla risus. Aliquam sit amet tristique sem. In nec blandit sem. Aenean nunc magna, rhoncus at ornare sed, gravida eu lectus.	2022-08-10 02:34:39.799986+07	2022-08-10 02:34:39.799998+07	11	2
\.


--
-- Data for Name: questions_answer_dislikers; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.questions_answer_dislikers (id, answer_id, user_id) FROM stdin;
\.


--
-- Data for Name: questions_answer_likers; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.questions_answer_likers (id, answer_id, user_id) FROM stdin;
1	1	5
\.


--
-- Data for Name: questions_question; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.questions_question (id, text, created, updated, title, author_id, right_answer_id) FROM stdin;
1	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc faucibus, felis sed eleifend sodales, ipsum turpis fringilla felis, venenatis tempor massa arcu at erat. Nullam tincidunt volutpat suscipit. Integer gravida neque tincidunt, ultrices tellus eu, accumsan ante. Proin pretium, lacus quis feugiat hendrerit, purus tellus dignissim elit, vitae consectetur neque nisi eget felis. Pellentesque rhoncus turpis at magna molestie commodo. Curabitur at turpis nec ipsum viverra pharetra non id lorem. In hac habitasse platea dictumst. Proin ut lorem mauris. Suspendisse a magna et tellus elementum bibendum a in purus. Maecenas lectus ante, facilisis ac erat et, facilisis imperdiet tortor. Cras arcu nisi, tempus et viverra ac, suscipit eu nulla. Mauris ut lectus nulla. Vestibulum lectus tellus, sollicitudin id egestas ac, tristique et nulla. Praesent a placerat lectus, non pellentesque dolor. Morbi urna purus, finibus posuere ullamcorper ac, aliquam vitae ligula. Sed auctor mi porttitor libero laoreet blandit.	2022-08-10 02:27:04.87058+07	2022-08-10 02:30:16.190135+07	How to python?	11	1
2	Donec consectetur purus et aliquam porttitor. Morbi lectus ex, ornare ac leo ac, tristique tempor odio. Nunc gravida ut velit eget venenatis. Morbi tortor lacus, viverra a blandit eu, maximus et libero. Cras quis malesuada nulla. Proin a molestie sem. Maecenas sit amet magna nisl. Sed imperdiet dolor nunc, vel condimentum mauris pharetra vel. Nullam ex orci, vestibulum id justo fringilla, porttitor lacinia enim. Phasellus porta, elit a aliquet mollis, leo nisl faucibus est, sed dapibus ex magna eget odio. In tempor lacinia turpis nec placerat. Praesent in sem eu enim finibus hendrerit. Ut sagittis libero in lectus luctus, vulputate pretium ex pellentesque. Cras eu nisi libero.	2022-08-10 02:34:27.718833+07	2022-08-10 02:34:27.718843+07	Difficult question?	5	\N
3	Sed egestas imperdiet risus ut euismod. Aenean non ipsum eu nibh congue tempus. Aenean justo velit, facilisis vitae quam iaculis, facilisis rutrum arcu. Suspendisse purus sem, lacinia in tortor quis, vehicula commodo risus. Mauris facilisis nibh in eleifend venenatis. Mauris orci justo, vulputate non ligula sed, blandit hendrerit lacus. Donec sollicitudin volutpat congue. Vestibulum urna nunc, fringilla sit amet metus non, hendrerit scelerisque tortor. Aenean vulputate nisl aliquet velit congue convallis. Nulla maximus rhoncus ultricies. Etiam elementum lacus non dolor efficitur commodo. Sed et ante consectetur, pretium mauris eu, consectetur tortor.	2022-08-10 02:35:24.988794+07	2022-08-10 02:35:24.988805+07	Another question	11	\N
\.


--
-- Data for Name: questions_question_dislikers; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.questions_question_dislikers (id, question_id, user_id) FROM stdin;
\.


--
-- Data for Name: questions_question_likers; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.questions_question_likers (id, question_id, user_id) FROM stdin;
1	1	5
\.


--
-- Data for Name: questions_question_tags; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.questions_question_tags (id, question_id, tag_id) FROM stdin;
1	1	programming
2	1	python
\.


--
-- Data for Name: questions_tag; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.questions_tag (name) FROM stdin;
python
programming
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email, avatar) FROM stdin;
1	pbkdf2_sha256$320000$yAIaOsXV8dZrocnXRS8rTj$3nwjZZEJ8n90TZj3wV50ahPeNXu4VNHEurfiZSfzr/E=	\N	f	admin1			f	t	2022-08-10 01:43:27.538341+07	a@mail.ru	avatars/default/avatar.png
2	pbkdf2_sha256$320000$q9n6fb73anaQhdfaGnp88i$4kUCa9MS48CTFHnjO0h60FJhwLgush1nb2eKHh2ckAw=	\N	f	admin2			f	t	2022-08-10 01:44:16.628508+07	b@mail.ru	avatars/default/avatar.png
3	pbkdf2_sha256$320000$9oJBFxJA4XKuLTZcsusBRK$y4Uwozd6+02kNpBVjbyKynKwCdCFWLiDNxegwiEBs9I=	\N	f	admin3			f	t	2022-08-10 01:44:43.570418+07	c@mail.ru	avatars/default/avatar.png
4	pbkdf2_sha256$320000$oXEEKv9sY7xXowoFUB2Mkh$9EBDmPaRIQ/XneP8f7fUnRw7eOJtVNJpBnSat3G+PiI=	\N	f	admin4			f	t	2022-08-10 01:45:04.070179+07	d@mail.ru	avatars/default/avatar.png
6	pbkdf2_sha256$320000$uIgbhyP2MU4Iqvge36RMV5$IX31l/Py//sNHyM1gBTzXdKDnBHXNlj+4GZiTXLBxtM=	\N	f	admin6			f	t	2022-08-10 01:46:27.896132+07	f@mail.ru	avatars/default/avatar.png
7	pbkdf2_sha256$320000$mvrKVwmNDrhKk4lVpjyGcW$BWo9ivOYYhc10b7x4WETuhlPrYa0mppsSXcv8d0atwE=	\N	f	admin7			f	t	2022-08-10 01:47:11.124987+07	g@mail.ru	avatars/default/avatar.png
8	pbkdf2_sha256$320000$r4E0aYS8UksS7WwOVtmqRI$oDS7gxbJ0x6kfSmthA6jQVQwl60C6LO8noAlvSbPxeQ=	\N	f	admin9			f	t	2022-08-10 01:50:21.437721+07	h@mail.ru	avatars/default/avatar.png
9	pbkdf2_sha256$320000$eisgyz5tR06WigaKyZIA1X$SFu23f6NJD4pIDyLOl2kbBUalqnbkIEGxwmI9KLOQWY=	\N	f	admin10			f	t	2022-08-10 01:52:31.990454+07	i@mail.ru	avatars/default/avatar.png
10	pbkdf2_sha256$320000$7Pe1EerkJ31WTreDxBShro$U4zmPAsn9row6o/OQecP6gQdGEEEadW7fl2ma3Xm/ec=	\N	f	admin11			f	t	2022-08-10 01:53:21.223009+07	dfd@mail.ru	avatars/default/avatar.png
11	pbkdf2_sha256$320000$DHaSfKDhPvqAIRZsIZEC7f$FktZrRdmzNYgwhTeLUha/Cs8PrhIVquHV8mhGBTeVLQ=	2022-08-10 02:27:54.227341+07	f	admin12			f	t	2022-08-10 01:53:59.163195+07	asda@mail.ru	avatars/default/avatar.png
5	pbkdf2_sha256$320000$8CZ8OIGAT67T8x3jV43QBz$m6Z8+sIUMGipG9lGHHEqeqGX7iYpBhEKEyPVbkLJnko=	2022-08-10 02:29:25.013391+07	f	admin5			f	t	2022-08-10 01:45:36.324812+07	e@mail.ru	avatars/default/avatar.png
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: otus_user
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: questions_answer_dislikers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.questions_answer_dislikers_id_seq', 1, false);


--
-- Name: questions_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.questions_answer_id_seq', 5, true);


--
-- Name: questions_answer_likers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.questions_answer_likers_id_seq', 1, true);


--
-- Name: questions_question_dislikers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.questions_question_dislikers_id_seq', 1, false);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 3, true);


--
-- Name: questions_question_likers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.questions_question_likers_id_seq', 1, true);


--
-- Name: questions_question_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.questions_question_tags_id_seq', 2, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: otus_user
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: questions_answer_dislikers questions_answer_dislikers_answer_id_user_id_d284885d_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_dislikers
    ADD CONSTRAINT questions_answer_dislikers_answer_id_user_id_d284885d_uniq UNIQUE (answer_id, user_id);


--
-- Name: questions_answer_dislikers questions_answer_dislikers_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_dislikers
    ADD CONSTRAINT questions_answer_dislikers_pkey PRIMARY KEY (id);


--
-- Name: questions_answer_likers questions_answer_likers_answer_id_user_id_9f4abba5_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_likers
    ADD CONSTRAINT questions_answer_likers_answer_id_user_id_9f4abba5_uniq UNIQUE (answer_id, user_id);


--
-- Name: questions_answer_likers questions_answer_likers_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_likers
    ADD CONSTRAINT questions_answer_likers_pkey PRIMARY KEY (id);


--
-- Name: questions_answer questions_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer
    ADD CONSTRAINT questions_answer_pkey PRIMARY KEY (id);


--
-- Name: questions_question_dislikers questions_question_dislikers_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_dislikers
    ADD CONSTRAINT questions_question_dislikers_pkey PRIMARY KEY (id);


--
-- Name: questions_question_dislikers questions_question_dislikers_question_id_user_id_28547e7a_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_dislikers
    ADD CONSTRAINT questions_question_dislikers_question_id_user_id_28547e7a_uniq UNIQUE (question_id, user_id);


--
-- Name: questions_question_likers questions_question_likers_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_likers
    ADD CONSTRAINT questions_question_likers_pkey PRIMARY KEY (id);


--
-- Name: questions_question_likers questions_question_likers_question_id_user_id_cc008634_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_likers
    ADD CONSTRAINT questions_question_likers_question_id_user_id_cc008634_uniq UNIQUE (question_id, user_id);


--
-- Name: questions_question questions_question_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT questions_question_pkey PRIMARY KEY (id);


--
-- Name: questions_question questions_question_right_answer_id_key; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT questions_question_right_answer_id_key UNIQUE (right_answer_id);


--
-- Name: questions_question_tags questions_question_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_tags
    ADD CONSTRAINT questions_question_tags_pkey PRIMARY KEY (id);


--
-- Name: questions_question_tags questions_question_tags_question_id_tag_id_bb41947a_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_tags
    ADD CONSTRAINT questions_question_tags_question_id_tag_id_bb41947a_uniq UNIQUE (question_id, tag_id);


--
-- Name: questions_tag questions_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_tag
    ADD CONSTRAINT questions_tag_pkey PRIMARY KEY (name);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: questions_answer_author_id_ceb2e333; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_answer_author_id_ceb2e333 ON public.questions_answer USING btree (author_id);


--
-- Name: questions_answer_dislikers_answer_id_ea3f2c00; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_answer_dislikers_answer_id_ea3f2c00 ON public.questions_answer_dislikers USING btree (answer_id);


--
-- Name: questions_answer_dislikers_user_id_97bd54e3; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_answer_dislikers_user_id_97bd54e3 ON public.questions_answer_dislikers USING btree (user_id);


--
-- Name: questions_answer_likers_answer_id_03c89bb1; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_answer_likers_answer_id_03c89bb1 ON public.questions_answer_likers USING btree (answer_id);


--
-- Name: questions_answer_likers_user_id_2f2e430f; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_answer_likers_user_id_2f2e430f ON public.questions_answer_likers USING btree (user_id);


--
-- Name: questions_answer_question_id_45884d67; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_answer_question_id_45884d67 ON public.questions_answer USING btree (question_id);


--
-- Name: questions_question_author_id_f53392d1; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_question_author_id_f53392d1 ON public.questions_question USING btree (author_id);


--
-- Name: questions_question_dislikers_question_id_823ecd96; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_question_dislikers_question_id_823ecd96 ON public.questions_question_dislikers USING btree (question_id);


--
-- Name: questions_question_dislikers_user_id_19583999; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_question_dislikers_user_id_19583999 ON public.questions_question_dislikers USING btree (user_id);


--
-- Name: questions_question_likers_question_id_4c3bba61; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_question_likers_question_id_4c3bba61 ON public.questions_question_likers USING btree (question_id);


--
-- Name: questions_question_likers_user_id_3de1b90e; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_question_likers_user_id_3de1b90e ON public.questions_question_likers USING btree (user_id);


--
-- Name: questions_question_tags_question_id_1fab941d; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_question_tags_question_id_1fab941d ON public.questions_question_tags USING btree (question_id);


--
-- Name: questions_question_tags_tag_id_72ee1cba; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_question_tags_tag_id_72ee1cba ON public.questions_question_tags USING btree (tag_id);


--
-- Name: questions_question_tags_tag_id_72ee1cba_like; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_question_tags_tag_id_72ee1cba_like ON public.questions_question_tags USING btree (tag_id varchar_pattern_ops);


--
-- Name: questions_tag_name_58a9871c_like; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX questions_tag_name_58a9871c_like ON public.questions_tag USING btree (name varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: otus_user
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_answer questions_answer_author_id_ceb2e333_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer
    ADD CONSTRAINT questions_answer_author_id_ceb2e333_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_answer_dislikers questions_answer_dis_answer_id_ea3f2c00_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_dislikers
    ADD CONSTRAINT questions_answer_dis_answer_id_ea3f2c00_fk_questions FOREIGN KEY (answer_id) REFERENCES public.questions_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_answer_dislikers questions_answer_dislikers_user_id_97bd54e3_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_dislikers
    ADD CONSTRAINT questions_answer_dislikers_user_id_97bd54e3_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_answer_likers questions_answer_lik_answer_id_03c89bb1_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_likers
    ADD CONSTRAINT questions_answer_lik_answer_id_03c89bb1_fk_questions FOREIGN KEY (answer_id) REFERENCES public.questions_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_answer_likers questions_answer_likers_user_id_2f2e430f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer_likers
    ADD CONSTRAINT questions_answer_likers_user_id_2f2e430f_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_answer questions_answer_question_id_45884d67_fk_questions_question_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_answer
    ADD CONSTRAINT questions_answer_question_id_45884d67_fk_questions_question_id FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question questions_question_author_id_f53392d1_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT questions_question_author_id_f53392d1_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question_dislikers questions_question_d_question_id_823ecd96_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_dislikers
    ADD CONSTRAINT questions_question_d_question_id_823ecd96_fk_questions FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question_dislikers questions_question_dislikers_user_id_19583999_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_dislikers
    ADD CONSTRAINT questions_question_dislikers_user_id_19583999_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question_likers questions_question_l_question_id_4c3bba61_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_likers
    ADD CONSTRAINT questions_question_l_question_id_4c3bba61_fk_questions FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question_likers questions_question_likers_user_id_3de1b90e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_likers
    ADD CONSTRAINT questions_question_likers_user_id_3de1b90e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question questions_question_right_answer_id_1a27956f_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT questions_question_right_answer_id_1a27956f_fk_questions FOREIGN KEY (right_answer_id) REFERENCES public.questions_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question_tags questions_question_t_question_id_1fab941d_fk_questions; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_tags
    ADD CONSTRAINT questions_question_t_question_id_1fab941d_fk_questions FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question_tags questions_question_tags_tag_id_72ee1cba_fk_questions_tag_name; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.questions_question_tags
    ADD CONSTRAINT questions_question_tags_tag_id_72ee1cba_fk_questions_tag_name FOREIGN KEY (tag_id) REFERENCES public.questions_tag(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: otus_user
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

