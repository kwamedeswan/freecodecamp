--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: guessing_game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guessing_game (
    game_id integer NOT NULL,
    username character varying(22) NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.guessing_game OWNER TO freecodecamp;

--
-- Name: guessing_game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guessing_game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guessing_game_game_id_seq OWNER TO freecodecamp;

--
-- Name: guessing_game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guessing_game_game_id_seq OWNED BY public.guessing_game.game_id;


--
-- Name: guessing_game game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guessing_game ALTER COLUMN game_id SET DEFAULT nextval('public.guessing_game_game_id_seq'::regclass);


--
-- Data for Name: guessing_game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guessing_game VALUES (1, 'Test1', 15);
INSERT INTO public.guessing_game VALUES (2, 'Test2', 6);
INSERT INTO public.guessing_game VALUES (3, 'Test1', 12);
INSERT INTO public.guessing_game VALUES (4, 'Test2', 19);


--
-- Name: guessing_game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guessing_game_game_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

