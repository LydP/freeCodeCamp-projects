--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    description text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(60),
    galaxy_id integer NOT NULL,
    distance_from_earth_ly numeric,
    has_black_hole boolean NOT NULL,
    constellation character varying(60),
    jet_count integer
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
    name character varying(60),
    moon_id integer NOT NULL,
    planet_id integer,
    mass_kg numeric NOT NULL,
    composition character varying(60)
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
    name character varying(60),
    planet_id integer NOT NULL,
    star_id integer,
    mass_kg numeric NOT NULL,
    is_exoplanet boolean
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
    name character varying(60),
    star_id integer NOT NULL,
    galaxy_id integer,
    number_of_planets integer NOT NULL,
    spectral_type character varying(60)
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 7, 'A supermassive black hole at the center of our galaxy, 26,000 light-years away, with a mass of 4.3 million suns. Though typically quiet, recent research confirmed it erupted violently within the last few hundred years, shining 10,000 times brighter in X-rays than today.');
INSERT INTO public.black_hole VALUES (2, 'Gaia BH3', 7, 'Discovered in late 2024 by ESA''s Gaia mission, this is the most massive stellar-mass black hole in our galaxy at 33 solar masses. Located 1,900 light-years away in Aquila, this dormant black hole was detected only by its companion star''s wobbling motion.');
INSERT INTO public.black_hole VALUES (3, 'M87*', 8, 'The first black hole ever directly imaged by the Event Horizon Telescope, with a mass of 6.5 billion suns. Recent January 2026 reports show its magnetic field is strong enough to resist gravity in some regions, preventing it from consuming all nearby matter at once.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Alcyoneus', 1, 3500000000, true, 'Lynx', 2);
INSERT INTO public.galaxy VALUES ('Andromeda I', 2, 2540000, false, 'Andromeda', 0);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 3, 2540000, true, 'Andromeda', 0);
INSERT INTO public.galaxy VALUES ('Ambartsumian''s Knot', 4, 400000000, false, 'Ursa Major', 0);
INSERT INTO public.galaxy VALUES ('Antennae Galaxies', 5, 45000000, true, 'Corvus', 0);
INSERT INTO public.galaxy VALUES ('Backward Galaxy', 6, 111000000, true, 'Centaurus', 0);
INSERT INTO public.galaxy VALUES ('Milky Way', 7, 26000, true, NULL, 0);
INSERT INTO public.galaxy VALUES ('Messier 87', 8, 53500000, true, 'Virgo', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon', 1, 1, 73500000000000000000000, 'Silicate/Metallic');
INSERT INTO public.moon VALUES ('Phobos', 2, 3, 10700000000000000, 'Porous Carbonaceous');
INSERT INTO public.moon VALUES ('Deimos', 3, 3, 1480000000000000, 'Porous Carbonaceous');
INSERT INTO public.moon VALUES ('Io', 4, 2, 89300000000000000000000, 'Volcanic/Silicate');
INSERT INTO public.moon VALUES ('Europa', 5, 2, 48000000000000000000000, 'Subsurface Ocean/Rocky Core');
INSERT INTO public.moon VALUES ('Ganymede', 6, 2, 148000000000000000000000, 'Water-Ice/Silicate/Iron');
INSERT INTO public.moon VALUES ('Callisto', 7, 2, 108000000000000000000000, 'Mixed Ice and Rock');
INSERT INTO public.moon VALUES ('Titan', 8, 13, 135000000000000000000000, 'Ice/Rock/Liquid Hyddrocarbons');
INSERT INTO public.moon VALUES ('Enceladus', 9, 13, 108000000000000000000, 'Ocean/Active Geysers');
INSERT INTO public.moon VALUES ('Mimas', 10, 13, 37500000000000000000, 'Predominantly Water-Ice');
INSERT INTO public.moon VALUES ('Rhea', 11, 13, 2310000000000000000000, 'Mixed Ice and Rock');
INSERT INTO public.moon VALUES ('Iapetus', 12, 13, 1810000000000000000000, 'Low density/Mostly Water-Ice');
INSERT INTO public.moon VALUES ('Dione', 13, 13, 1100000000000000000000, 'Ice with Silicate Core');
INSERT INTO public.moon VALUES ('Tethys', 14, 13, 617000000000000000000, 'Pure Water-Ice');
INSERT INTO public.moon VALUES ('Miranda', 15, 14, 65900000000000000000, 'Mixed Ice and Silicate');
INSERT INTO public.moon VALUES ('Ariel', 16, 14, 1250000000000000000000, 'Roughly equal Ice/Rock');
INSERT INTO public.moon VALUES ('Titania', 17, 14, 3400000000000000000000, 'Ice/Rock Mix');
INSERT INTO public.moon VALUES ('Umbriel', 18, 14, 1220000000000000000000, 'Darker Water-Ice');
INSERT INTO public.moon VALUES ('Triton', 19, 4, 21400000000000000000000, 'Nitrogen Ice/Rocky Core');
INSERT INTO public.moon VALUES ('Nereid', 20, 4, 31000000000000000000, 'Icy and Rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, 5970000000000000000000000, false);
INSERT INTO public.planet VALUES ('Jupiter', 2, 1, 1900000000000000000000000000, false);
INSERT INTO public.planet VALUES ('Mars', 3, 1, 639000000000000000000000, false);
INSERT INTO public.planet VALUES ('Neptune', 4, 1, 102000000000000000000000000, false);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 5, 2, 6400000000000000000000000, true);
INSERT INTO public.planet VALUES ('55 Cancri e', 6, 5, 48000000000000000000000000, true);
INSERT INTO public.planet VALUES ('Kepler-22b', 7, 7, 54000000000000000000000000, true);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 8, 8, 4100000000000000000000000, true);
INSERT INTO public.planet VALUES ('WASP-12b', 9, 9, 2800000000000000000000000000, true);
INSERT INTO public.planet VALUES ('HD 209458 b', 10, 9, 2800000000000000000000000000, true);
INSERT INTO public.planet VALUES ('LHS 1140 b', 11, 11, 34000000000000000000000000, true);
INSERT INTO public.planet VALUES ('GJ 1214 b', 12, 12, 49000000000000000000000000, true);
INSERT INTO public.planet VALUES ('Saturn', 13, 1, 568000000000000000000000000, false);
INSERT INTO public.planet VALUES ('Uranus', 14, 1, 86800000000000000000000000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sol', 1, 7, 8, 'G2V');
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 7, 3, 'M5.5Ve');
INSERT INTO public.star VALUES ('HD 110067', 3, 7, 6, 'G-type');
INSERT INTO public.star VALUES ('Barnard''s Star', 4, 7, 4, 'M4V');
INSERT INTO public.star VALUES ('55 Cancri A', 5, 7, 5, 'G8V');
INSERT INTO public.star VALUES ('Kepler-62', 6, 7, 5, 'K2V');
INSERT INTO public.star VALUES ('Kepler-22', 7, 7, 1, 'G5V');
INSERT INTO public.star VALUES ('TRAPPIST-1', 8, 7, 7, 'M8V');
INSERT INTO public.star VALUES ('WASP-12', 9, 7, 1, 'G0V');
INSERT INTO public.star VALUES ('HD 209458', 10, 7, 1, 'G0V');
INSERT INTO public.star VALUES ('LHS 1140', 11, 7, 2, 'M4.5V');
INSERT INTO public.star VALUES ('GJ 1214', 12, 7, 1, 'M4.5V');


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

