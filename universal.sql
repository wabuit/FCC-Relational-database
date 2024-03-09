--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_from_earth_in_lightyears numeric,
    rotates_clockwise boolean NOT NULL,
    formation_known boolean,
    mass_in_million_of_solar_mass integer,
    radius_in_km integer,
    description text
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    blackhole_id integer,
    distance_from_earth_in_lightyears numeric,
    rotates_clockwise boolean NOT NULL,
    part_of_observable_universe boolean,
    mass_in_million_of_solarmass integer,
    number_of_stars_in_billions integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    distance_from_earth_in_km numeric,
    has_water boolean NOT NULL,
    has_life boolean,
    mass_in_thousands_of_kg integer,
    radius_in_km integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    distance_from_earth_in_km numeric,
    is_part_of_solar_system boolean NOT NULL,
    has_life boolean,
    mass_10_to_power_24_kg integer,
    radius_in_km integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    distance_from_earth_in_lightyears numeric,
    has_earth_like_planet boolean NOT NULL,
    part_of_solar_system boolean,
    mass_in_solarmass integer,
    radius_in_thousands_of_km integer,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'ultra', 2000000, false, false, 2450000, 1000000, 'ultrablackhole');
INSERT INTO public.blackhole VALUES (2, 'super', 1000000, false, true, 1050000, 90000, 'superblackhole');
INSERT INTO public.blackhole VALUES (3, 'inter', 900000, true, true, 1000000, 50000, 'intermediate blackhole');
INSERT INTO public.blackhole VALUES (4, 'stellar', 700000, true, true, 900000, 30000, 'stellar blackhole');
INSERT INTO public.blackhole VALUES (5, 'micro', 100000, true, true, 130000, 10000, 'micro blackhole');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky-way', 2, 26000, true, true, 130000, 100, 'milky way galaxy');
INSERT INTO public.galaxy VALUES (2, 'galaxy 1', 1, 56000, true, true, 430000, 400, 'galaxy one');
INSERT INTO public.galaxy VALUES (3, 'galaxy 2', 1, 46000, true, true, 330000, 300, 'galaxy two');
INSERT INTO public.galaxy VALUES (4, 'galaxy 3', 3, 36000, true, true, 320000, 200, 'galaxy three');
INSERT INTO public.galaxy VALUES (5, 'galaxy 4', 4, 21000, true, true, 120000, 150, 'galaxy four');
INSERT INTO public.galaxy VALUES (6, 'galaxy 5', 5, 18000, true, true, 12000, 10, 'galaxy five');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 384, false, false, 1, 1600, 'the luna moon');
INSERT INTO public.moon VALUES (2, 'moon 1', 3, 345, false, false, 12, 1300, ' mars moon1 ');
INSERT INTO public.moon VALUES (3, 'moon 1', 6, 365, false, false, 2, 1950, ' jupiter moon1 ');
INSERT INTO public.moon VALUES (4, 'moon 2', 6, 395, false, false, 2, 1750, ' jupiter moon2 ');
INSERT INTO public.moon VALUES (5, 'moon 3', 6, 495, false, false, 2, 1340, ' jupiter moon3 ');
INSERT INTO public.moon VALUES (6, 'moon 4', 6, 578, false, false, 6, 1140, ' jupiter moon4 ');
INSERT INTO public.moon VALUES (7, 'moon 5', 6, 539, false, false, 4, 1470, ' jupiter moon5 ');
INSERT INTO public.moon VALUES (8, 'moon 1', 7, 987, false, false, 3, 1471, ' saturn moon1 ');
INSERT INTO public.moon VALUES (9, 'moon 2', 7, 986, false, false, 3, 1571, ' saturn moon2 ');
INSERT INTO public.moon VALUES (10, 'moon 3', 7, 906, false, false, 5, 1071, ' saturn moon3 ');
INSERT INTO public.moon VALUES (11, 'moon 4', 7, 936, false, false, 5, 1771, ' saturn moon4 ');
INSERT INTO public.moon VALUES (13, 'moon 5', 7, 96, false, false, 4, 1791, ' saturn moon5');
INSERT INTO public.moon VALUES (14, 'moon 1', 8, 286, false, false, 4, 171, ' uranus moon1');
INSERT INTO public.moon VALUES (15, 'moon 2', 8, 276, false, false, 8, 131, ' uranus moon2');
INSERT INTO public.moon VALUES (16, 'moon 3', 8, 278, false, false, 8, 11, ' uranus moon3');
INSERT INTO public.moon VALUES (18, 'moon 4', 8, 209, false, false, 8, 11, ' uranus moon4');
INSERT INTO public.moon VALUES (19, 'moon 5', 8, 206, false, false, 8, 161, ' uranus moon5');
INSERT INTO public.moon VALUES (20, 'moon 1', 9, 106, false, false, 4, 165, ' neptune moon1');
INSERT INTO public.moon VALUES (22, 'moon 2', 9, 100, false, false, 4, 15, ' neptune moon2');
INSERT INTO public.moon VALUES (23, 'moon 3', 9, 111, false, false, 4, 515, ' neptune moon3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 1, 0, true, true, 1, 70000000, 'the earth');
INSERT INTO public.planet VALUES (3, 'mars', 1, 55, false, false, 1, 1, 'mars');
INSERT INTO public.planet VALUES (4, 'venus', 1, 40, false, false, 4, 6000, 'venus');
INSERT INTO public.planet VALUES (5, 'mercury', 1, 82, false, false, 1, 2400, 'mercury');
INSERT INTO public.planet VALUES (6, 'jupiter', 1, 500, false, false, 1900, 70000, 'jupiter');
INSERT INTO public.planet VALUES (7, 'saturn', 1, 1204, false, false, 568, 60000, 'saturn');
INSERT INTO public.planet VALUES (8, 'uranus', 1, 2600, false, false, 87, 35000, 'uranus');
INSERT INTO public.planet VALUES (9, 'Neptune', 1, 4311, false, false, 102, 24000, 'neptune');
INSERT INTO public.planet VALUES (10, 'pluto', 1, 4300, false, false, 0, 1200, 'pluto');
INSERT INTO public.planet VALUES (11, 'planet 1', 2, 4320, false, false, 2, 120, 'plant one');
INSERT INTO public.planet VALUES (13, 'planet 2', 4, 432, false, false, 45, 123, 'plant two');
INSERT INTO public.planet VALUES (14, 'planet 3', 5, 732, false, false, 60, 183, 'plant three');
INSERT INTO public.planet VALUES (15, 'planet 4', 6, 872, false, false, 45, 356, 'plant four');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'the sun', 1, 0, true, true, 1, 700000, 'THE SUN');
INSERT INTO public.star VALUES (2, 'star 1', 1, 1, true, false, 5, 2000000, 'star one');
INSERT INTO public.star VALUES (4, 'star 2', 2, 3, true, false, 3, 200000, 'star two');
INSERT INTO public.star VALUES (5, 'star 3', 3, 4, true, false, 3, 100000, 'star three');
INSERT INTO public.star VALUES (6, 'star 4', 4, 5, true, false, 2, 120000, 'star four');
INSERT INTO public.star VALUES (7, 'star 5', 5, 6, true, false, 3, 160000, 'star five');
INSERT INTO public.star VALUES (8, 'star 6', 6, 7, true, false, 1, 190000, 'star six');


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: blackhole blackhole_distance_from_earth_in_lightyears_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_distance_from_earth_in_lightyears_key UNIQUE (distance_from_earth_in_lightyears);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_distance_from_earth_in_lightyears_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_from_earth_in_lightyears_key UNIQUE (distance_from_earth_in_lightyears);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_distance_from_earth_in_km_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_distance_from_earth_in_km_key UNIQUE (distance_from_earth_in_km);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_distance_from_earth_in_km_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_distance_from_earth_in_km_key UNIQUE (distance_from_earth_in_km);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_distance_from_earth_in_lightyears_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_from_earth_in_lightyears_key UNIQUE (distance_from_earth_in_lightyears);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy fk_blackhole; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_blackhole FOREIGN KEY (blackhole_id) REFERENCES public.blackhole(blackhole_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

