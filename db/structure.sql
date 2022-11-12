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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    hall_id bigint NOT NULL,
    sport_id bigint NOT NULL,
    started_at timestamp(6) without time zone,
    ended_at timestamp(6) without time zone,
    "limit" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: halls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.halls (
    id bigint NOT NULL,
    address character varying,
    capacity integer,
    name character varying,
    phone character varying,
    email character varying,
    website character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: halls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.halls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: halls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.halls_id_seq OWNED BY public.halls.id;


--
-- Name: organizer_games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizer_games (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    organizer_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: organizer_games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizer_games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizer_games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizer_games_id_seq OWNED BY public.organizer_games.id;


--
-- Name: organizers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizers (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    phone character varying,
    website character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: organizers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizers_id_seq OWNED BY public.organizers.id;


--
-- Name: player_games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_games (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    profile_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: player_games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_games_id_seq OWNED BY public.player_games.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiles (
    id bigint NOT NULL,
    player_id bigint NOT NULL,
    sport_id bigint NOT NULL,
    nickname character varying,
    avatar character varying,
    level integer,
    rank integer,
    score integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sports (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: sports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sports_id_seq OWNED BY public.sports.id;


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: halls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.halls ALTER COLUMN id SET DEFAULT nextval('public.halls_id_seq'::regclass);


--
-- Name: organizer_games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizer_games ALTER COLUMN id SET DEFAULT nextval('public.organizer_games_id_seq'::regclass);


--
-- Name: organizers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizers ALTER COLUMN id SET DEFAULT nextval('public.organizers_id_seq'::regclass);


--
-- Name: player_games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_games ALTER COLUMN id SET DEFAULT nextval('public.player_games_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: sports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sports ALTER COLUMN id SET DEFAULT nextval('public.sports_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: halls halls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.halls
    ADD CONSTRAINT halls_pkey PRIMARY KEY (id);


--
-- Name: organizer_games organizer_games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizer_games
    ADD CONSTRAINT organizer_games_pkey PRIMARY KEY (id);


--
-- Name: organizers organizers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_pkey PRIMARY KEY (id);


--
-- Name: player_games player_games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_games
    ADD CONSTRAINT player_games_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sports sports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sports
    ADD CONSTRAINT sports_pkey PRIMARY KEY (id);


--
-- Name: index_games_on_hall_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_hall_id ON public.games USING btree (hall_id);


--
-- Name: index_games_on_sport_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_sport_id ON public.games USING btree (sport_id);


--
-- Name: index_organizer_games_on_game_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_organizer_games_on_game_id ON public.organizer_games USING btree (game_id);


--
-- Name: index_organizer_games_on_organizer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_organizer_games_on_organizer_id ON public.organizer_games USING btree (organizer_id);


--
-- Name: index_player_games_on_game_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_player_games_on_game_id ON public.player_games USING btree (game_id);


--
-- Name: index_player_games_on_profile_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_player_games_on_profile_id ON public.player_games USING btree (profile_id);


--
-- Name: index_profiles_on_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiles_on_player_id ON public.profiles USING btree (player_id);


--
-- Name: index_profiles_on_sport_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiles_on_sport_id ON public.profiles USING btree (sport_id);


--
-- Name: games fk_rails_0a5c0aaa56; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_0a5c0aaa56 FOREIGN KEY (sport_id) REFERENCES public.sports(id);


--
-- Name: games fk_rails_2240d06b7b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_rails_2240d06b7b FOREIGN KEY (hall_id) REFERENCES public.halls(id);


--
-- Name: organizer_games fk_rails_915bce0e37; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizer_games
    ADD CONSTRAINT fk_rails_915bce0e37 FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: player_games fk_rails_9645cca1f4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_games
    ADD CONSTRAINT fk_rails_9645cca1f4 FOREIGN KEY (profile_id) REFERENCES public.profiles(id);


--
-- Name: organizer_games fk_rails_9659bc2c6e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizer_games
    ADD CONSTRAINT fk_rails_9659bc2c6e FOREIGN KEY (organizer_id) REFERENCES public.organizers(id);


--
-- Name: profiles fk_rails_a2a1c6d77d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT fk_rails_a2a1c6d77d FOREIGN KEY (sport_id) REFERENCES public.sports(id);


--
-- Name: player_games fk_rails_ca29b77afd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_games
    ADD CONSTRAINT fk_rails_ca29b77afd FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: profiles fk_rails_e50bbf8fe0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT fk_rails_e50bbf8fe0 FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20221112183746'),
('20221112184435'),
('20221112184558'),
('20221112184651'),
('20221112184856'),
('20221112185047'),
('20221112185137'),
('20221112185200');


