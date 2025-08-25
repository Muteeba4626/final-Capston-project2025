--
-- PostgreSQL database dump
--

\restrict k07MW86C3GtuExU9ZxBvW7RuFC3XkibqmHnhdfgDVt1qnCgT7ODNZFMUmTnhbXs

-- Dumped from database version 15.13 (Debian 15.13-1.pgdg120+1)
-- Dumped by pg_dump version 17.6

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: Muteeba4626
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO "Muteeba4626";

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: Muteeba4626
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying,
    "time" character varying,
    user_id integer NOT NULL
);


ALTER TABLE public.tasks OWNER TO "Muteeba4626";

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: Muteeba4626
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tasks_id_seq OWNER TO "Muteeba4626";

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Muteeba4626
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Muteeba4626
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO "Muteeba4626";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Muteeba4626
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "Muteeba4626";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Muteeba4626
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: Muteeba4626
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Muteeba4626
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: Muteeba4626
--

COPY public.alembic_version (version_num) FROM stdin;
804cfe768777
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: Muteeba4626
--

COPY public.tasks (id, title, description, "time", user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Muteeba4626
--

COPY public.users (id, first_name, last_name, email, password) FROM stdin;
1	Muteeba	Shahzad	muteeba@example.com	$2b$12$DjdEzREY0rUuBVH97IinH.6XvFQayHpxKDRF.t./gWd8TUPBKiNG6
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Muteeba4626
--

SELECT pg_catalog.setval('public.tasks_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Muteeba4626
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: Muteeba4626
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: Muteeba4626
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Muteeba4626
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_tasks_id; Type: INDEX; Schema: public; Owner: Muteeba4626
--

CREATE INDEX ix_tasks_id ON public.tasks USING btree (id);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: Muteeba4626
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: Muteeba4626
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: tasks tasks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Muteeba4626
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict k07MW86C3GtuExU9ZxBvW7RuFC3XkibqmHnhdfgDVt1qnCgT7ODNZFMUmTnhbXs

