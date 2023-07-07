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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age integer,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    diameter_km integer,
    is_satellite boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    diameter_km numeric(9,1),
    star_id integer,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: plantes_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.plantes_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plantes_planet_id_seq OWNER TO freecodecamp;

--
-- Name: plantes_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.plantes_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    is_active boolean NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellites_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    temperature integer,
    is_visible boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.plantes_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellites_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing earth', 13500, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A neighboring spiral galaxy', 15000, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'A galaxy with a prominent dust lane', 20000, true);
INSERT INTO public.galaxy VALUES (4, 'Snickers', 'Another galaxy', 7500, true);
INSERT INTO public.galaxy VALUES (5, 'Baby Ruth', 'Yet another galaxy', 8100, true);
INSERT INTO public.galaxy VALUES (6, 'Now and Later', 'A great galaxy', 11000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1700, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4, 2600, true);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 1560, true);
INSERT INTO public.moon VALUES (6, 'Titan', 5, 2575, true);
INSERT INTO public.moon VALUES (7, 'Triton', 6, 1353, true);
INSERT INTO public.moon VALUES (8, 'Callisto', 4, 2410, true);
INSERT INTO public.moon VALUES (9, 'Io', 4, 1821, true);
INSERT INTO public.moon VALUES (10, 'Europa2', 4, 1530, true);
INSERT INTO public.moon VALUES (11, 'Enceladus', 5, 250, true);
INSERT INTO public.moon VALUES (12, 'Miranda', 7, 240, true);
INSERT INTO public.moon VALUES (13, 'Charon', 12, 610, true);
INSERT INTO public.moon VALUES (14, 'Nereid', 6, 170, true);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 760, true);
INSERT INTO public.moon VALUES (16, 'Triton2', 6, 1350, true);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 790, true);
INSERT INTO public.moon VALUES (18, 'Rhea', 5, 760, true);
INSERT INTO public.moon VALUES (19, 'Tethys', 5, 530, true);
INSERT INTO public.moon VALUES (20, 'Dione', 5, 560, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the sun', 4000.0, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the sun', 3000.0, 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', 'The second planet from the sun', 3000.0, 1, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'the largest planet in the solar system', 9000.0, 1, false);
INSERT INTO public.planet VALUES (5, 'Saturn', 'The second-largest planet in the solar system', 8000.0, 1, false);
INSERT INTO public.planet VALUES (6, 'Neptune', 'The eighth and farthest planet from the sun', 3500.0, 1, false);
INSERT INTO public.planet VALUES (7, 'Kepler-186f', 'An exoplanet orbiting the star Kepler-186', 4100.0, 2, true);
INSERT INTO public.planet VALUES (8, 'HD 209458b', 'An exoplanet known for its atmosphere', 3800.0, 2, false);
INSERT INTO public.planet VALUES (9, 'TrES-3b', 'An exoplanet with a highly inflated atmosphere', 4300.0, 2, false);
INSERT INTO public.planet VALUES (10, 'Gliese 876d', 'An exoplanet orbiting the star Gliese 876', 2700.0, 2, false);
INSERT INTO public.planet VALUES (11, 'Kepler-62e', 'An exoplanet orbiting the star Kepler-62', 3300.0, 2, true);
INSERT INTO public.planet VALUES (12, 'Kepler-62f', 'An exoplanet orbiting the star Kepler-62', 4000.0, 2, true);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Cool Ranch', 1, true);
INSERT INTO public.satellite VALUES (2, 'Jalapeno Cheddar', 1, true);
INSERT INTO public.satellite VALUES (3, 'Kettle Cooked', 1, true);
INSERT INTO public.satellite VALUES (4, 'sour cream and onion', 1, true);
INSERT INTO public.satellite VALUES (5, 'Nacho cheese', 1, true);
INSERT INTO public.satellite VALUES (6, 'Dill pickle', 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3600, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 3042, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 5790, true);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 1, 5260, true);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 6, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 20, true);


--
-- Name: plantes_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.plantes_planet_id_seq', 12, true);


--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellites_satellite_id_seq', 6, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 33, true);


--
-- Name: galaxy galaxies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet plantes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT plantes_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: satellite satellites_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: moon moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet plantes_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT plantes_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite satellites_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellites_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

