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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    round character varying(30) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (158, 2018, 154, 155, 4, 2, 'Final');
INSERT INTO public.games VALUES (159, 2018, 156, 157, 2, 0, 'Third Place');
INSERT INTO public.games VALUES (160, 2018, 155, 157, 2, 1, 'Semi-Final');
INSERT INTO public.games VALUES (161, 2018, 154, 156, 1, 0, 'Semi-Final');
INSERT INTO public.games VALUES (162, 2018, 155, 158, 3, 2, 'Quarter-Final');
INSERT INTO public.games VALUES (163, 2018, 157, 159, 2, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (164, 2018, 156, 160, 2, 1, 'Quarter-Final');
INSERT INTO public.games VALUES (165, 2018, 154, 161, 2, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (166, 2018, 157, 162, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (167, 2018, 159, 163, 1, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (168, 2018, 156, 164, 3, 2, 'Eighth-Final');
INSERT INTO public.games VALUES (169, 2018, 160, 165, 2, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (170, 2018, 155, 166, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (171, 2018, 158, 167, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (172, 2018, 161, 168, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (173, 2018, 154, 169, 4, 3, 'Eighth-Final');
INSERT INTO public.games VALUES (174, 2014, 170, 169, 1, 0, 'Final');
INSERT INTO public.games VALUES (175, 2014, 171, 160, 3, 0, 'Third Place');
INSERT INTO public.games VALUES (176, 2014, 169, 171, 1, 0, 'Semi-Final');
INSERT INTO public.games VALUES (177, 2014, 170, 160, 7, 1, 'Semi-Final');
INSERT INTO public.games VALUES (178, 2014, 171, 172, 1, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (179, 2014, 169, 156, 1, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (180, 2014, 160, 162, 2, 1, 'Quarter-Final');
INSERT INTO public.games VALUES (181, 2014, 170, 154, 1, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (182, 2014, 160, 173, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (183, 2014, 162, 161, 2, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (184, 2014, 154, 174, 2, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (185, 2014, 170, 175, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (186, 2014, 171, 165, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (187, 2014, 172, 176, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (188, 2014, 169, 163, 1, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (189, 2014, 156, 177, 2, 1, 'Eighth-Final');


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (154, 'France');
INSERT INTO public.teams VALUES (155, 'Croatia');
INSERT INTO public.teams VALUES (156, 'Belgium');
INSERT INTO public.teams VALUES (157, 'England');
INSERT INTO public.teams VALUES (158, 'Russia');
INSERT INTO public.teams VALUES (159, 'Sweden');
INSERT INTO public.teams VALUES (160, 'Brazil');
INSERT INTO public.teams VALUES (161, 'Uruguay');
INSERT INTO public.teams VALUES (162, 'Colombia');
INSERT INTO public.teams VALUES (163, 'Switzerland');
INSERT INTO public.teams VALUES (164, 'Japan');
INSERT INTO public.teams VALUES (165, 'Mexico');
INSERT INTO public.teams VALUES (166, 'Denmark');
INSERT INTO public.teams VALUES (167, 'Spain');
INSERT INTO public.teams VALUES (168, 'Portugal');
INSERT INTO public.teams VALUES (169, 'Argentina');
INSERT INTO public.teams VALUES (170, 'Germany');
INSERT INTO public.teams VALUES (171, 'Netherlands');
INSERT INTO public.teams VALUES (172, 'Costa Rica');
INSERT INTO public.teams VALUES (173, 'Chile');
INSERT INTO public.teams VALUES (174, 'Nigeria');
INSERT INTO public.teams VALUES (175, 'Algeria');
INSERT INTO public.teams VALUES (176, 'Greece');
INSERT INTO public.teams VALUES (177, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 189, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 177, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

