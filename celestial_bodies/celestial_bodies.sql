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
-- Name: celestial_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_event (
    celestial_event_id integer NOT NULL,
    name character varying(255) NOT NULL,
    event_type character varying(100),
    event_date_time timestamp with time zone NOT NULL,
    description text,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.celestial_event OWNER TO freecodecamp;

--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_event_celestial_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_event_celestial_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_event_celestial_event_id_seq OWNED BY public.celestial_event.celestial_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(100),
    mass_solar_masses bigint,
    diameter_light_years integer,
    distance_from_earth_light_years integer,
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
    planet_id integer NOT NULL,
    mass_earth_masses double precision,
    radius_earth_radius double precision,
    orbital_period_earth_days double precision,
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
    star_id integer NOT NULL,
    type character varying(100),
    mass_earth_masses double precision,
    radius_earth_radius double precision,
    orbital_period_earth_days double precision,
    orbital_distance_au double precision,
    number_of_moons integer,
    has_rings boolean DEFAULT false,
    habitable boolean DEFAULT false,
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
    galaxy_id integer NOT NULL,
    type character varying(100),
    spectral_class character varying(10),
    luminosity_solar_lum double precision,
    mass_solar_masses double precision,
    radius_solar_radii double precision,
    temperature_in_kelvin integer,
    age_billion_years numeric(5,2),
    distance_from_earth_light_years bigint,
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
-- Name: celestial_event celestial_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event ALTER COLUMN celestial_event_id SET DEFAULT nextval('public.celestial_event_celestial_event_id_seq'::regclass);


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
-- Data for Name: celestial_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_event VALUES (1, 'Perseid Meteor Shower', 'Meteor Shower', '2025-08-12 04:00:00+00', 'Annual meteor shower associated with the comet Swift-Tuttle.', 1, NULL, 3, NULL);
INSERT INTO public.celestial_event VALUES (3, 'Quadrantids Meteor Shower', 'Meteor Shower', '2025-01-03 08:00:00+00', 'Annual meteor shower, known for bright fireballs, but with a short peak.', 1, 1, 3, NULL);
INSERT INTO public.celestial_event VALUES (2, 'Total Solar Eclipse 2024', 'Eclipse', '2024-04-08 18:18:00+00', 'A total solar eclipse visible across North America.', 1, 1, 3, 1);
INSERT INTO public.celestial_event VALUES (4, 'Mars at Opposition', 'Planetary Opposition', '2025-01-15 20:17:00+00', 'Mars is directly opposite the Sun as seen from Earth, making it appear brightest and visible all night.', 1, 1, 4, NULL);
INSERT INTO public.celestial_event VALUES (5, 'Venus at Greatest Eastern Elongation', 'Planetary Alignment', '2025-01-10 00:00:00+00', 'Venus appears farthest from the Sun in the evening sky, making it the best time to view it after sunset.', 1, 1, 2, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1500000000000, 100000, 0, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1200000000000, 220000, 2500000, 'The closest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 50000000000, 60000, 2730000, 'A member of the Local Group; smaller and less massive than the Milky Way or Andromeda');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 10000000000, 14000, 163000, 'A satellite galaxy of the Milky Way; visible from the Southern Hemisphere.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 7000000000, 7000, 200000, 'Another satellite of the Milky Way; often observed near the LMC.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 2700000000000, 120000, 53000000, 'A supergiant elliptical galaxy in the Virgo Cluster; home to a supermassive black hole.');
INSERT INTO public.galaxy VALUES (7, 'IC 1101', 'Elliptical', 100000000000000, 400000, 1000000000, 'One of the largest known galaxies in the universe by diameter and mass.');
INSERT INTO public.galaxy VALUES (8, 'Sombrero', 'Spiral', 800000000000, 50000, 31000000, 'Known for its bright nucleus and large central bulge giving it a sombrero-like appearance.');
INSERT INTO public.galaxy VALUES (9, 'Whirlpool', 'Spiral', 160000000000, 76000, 31000000, 'Famous for its well-defined spiral structure and interaction with its companion galaxy.');
INSERT INTO public.galaxy VALUES (10, 'Centaurus A', 'Elliptical', 100000000000, 60000, 12000000, 'A peculiar galaxy with a prominent dust lane and strong radio emissions; possibly the result of a merger.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.0123, 0.273, 27.32, 'Earth`s only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1e-09, 0.0019, 0.319, 'One of Mars` small irregular shaped moon.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1e-10, 0.0011, 1.262, 'The outermost moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 0.015, 0.286, 1.77, 'The most volcanically active body in the Solar System.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0.008, 0.245, 3.55, 'Has a subsurface ocean; a top candidate in the search for extraterrestrial life.');
INSERT INTO public.moon VALUES (6, 'Ganymedes', 5, 0.025, 0.413, 7.15, 'The largest moon in the Solar System; even bigger than Mercury.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 0.018, 0.378, 16.69, 'Heavily cratered and ancient surface; possibly an underground ocean.');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 0.0226, 0.404, 15.95, 'Saturn`s largest moon, and the only mooon in the solar system with a dense atmosphere and stable bodies of liquid on its surface.');
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 0.00039, 0.121, 4.52, 'Saturn`s second-largest moon, with a heavily cratered, icy surface.');
INSERT INTO public.moon VALUES (10, 'Lapetus', 6, 0.00031, 0.115, 79.32, 'Notable for its dramatic two-toned coloration, with one hemisphere significantly darker than the other.');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 0.00018, 0.088, 2.74, 'An icy moon of Saturn with bright wispy fractures on its trailing hemisphere.');
INSERT INTO public.moon VALUES (12, 'Miranda', 7, 1.1e-06, 0.038, 1.41, 'Uranus` innermost large moon, with a bizarre and varied surface suggesting past geological activity.');
INSERT INTO public.moon VALUES (14, 'Titania', 7, 0.00059, 0.125, 8.71, 'The largest moon of Uranus, with a surface characterized by large fault systems and canyons.');
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, 2e-06, 0.046, 4.14, 'A dark and heavily cratered moon of Uranus, appearing geologically inactive.');
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 0.0005, 0.12, 13.46, 'The outermost large moon of Uranus, heavily cratered with some bright ray systems.');
INSERT INTO public.moon VALUES (16, 'Triton', 8, 0.00358, 0.212, 5.88, 'Neptune`s largest moon, notable for its retrograde orbit and active cryovolcanism.');
INSERT INTO public.moon VALUES (17, 'Proteus', 8, 6.7e-08, 0.0034, 1.12, 'Neptune`s second largest moon, irregularly shaped and heavily cratered.');
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 4.8e-09, 0.0028, 360.13, 'Neptune`s third-largest moon, with a highly eccentric orbit.');
INSERT INTO public.moon VALUES (19, 'Charon', 10, 0.000266, 0.0095, 6.39, 'The largest moon of dwarf planet Pluto, so large in comparison to Pluto that they are often considered a binary system.');
INSERT INTO public.moon VALUES (20, 'Namaka', 11, 1e-06, 0.001, 18.27, 'The smaller and inner moon of Haumea, with a more eccentric orbit than Hi`iaka.');
INSERT INTO public.moon VALUES (21, 'Hi`iaka', 11, 6e-06, 0.004, 49.12, 'The largest of Haumea`s two known moons, with a nearly circular orbit.');
INSERT INTO public.moon VALUES (22, 'MK2', 12, 7.2e-10, 0.013, 12, 'Makemake`s only known moon. It is very dark and much fainter than Makemake, making it difficult to observe.');
INSERT INTO public.moon VALUES (23, 'Dysnomia', 13, 8e-06, 0.0096, 15.79, 'The only known moon of the dwarf planet Eris.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.055, 0.38, 88, 0.39, 0, false, false, 'The smallest planet, closest to the Sun, with extreme temperature variations.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.815, 0.95, 225, 0.72, 0, false, false, 'The hottest planet due to a runaway greenhouse effect, thick toxic atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1, 1, 365.25, 1, 1, false, true, 'Our home planet.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 0.107, 0.53, 687, 1.52, 2, false, false, 'Known as the "Red Planet", with a think atmosphere and evidence of past liquid water.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 317.8, 11.2, 4333, 5.2, 95, true, false, 'The largest planet in our solar system, famous for its Great Red Spot and many moons.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 95.2, 9.45, 10759, 9.58, 274, true, false, 'Known for its prominent and extensive ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 14.5, 4.01, 30687, 19.23, 28, true, false, 'An ice giant with a distinct blue-green color, tilted on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 17.1, 3.88, 60190, 30.1, 16, true, false, 'The outermost known planet, known for its strong winds, and dynamic storms.');
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 'Dwarf Planet', 0.00015, 0.075, 1682, 2.77, 0, false, false, 'The largest object in the asteroid belt, considered a dwarf planet and possibly holding a subsurface ocean.');
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 'Dwarf Planet', 0.0022, 0.18, 90560, 39.5, 5, false, false, 'Once considered the ninth planet, now classified as a dwarf planet, now classified as a dwarf planet in the Kuiper Belt with five moons.');
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 'Dwarf Planet', 0.00067, 0.13, 103000, 43.1, 2, true, false, 'An unusually fast-rotating dwarf planet in the Kuiper Belt, giving it an elongated shape and possibly a ring system.');
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 'Dwarf Planet', 0.00067, 0.11, 112000, 45.8, 1, false, false, 'A dwarf planet in the Kuiper Belt, one of the brightest objects there after Pluto.');
INSERT INTO public.planet VALUES (13, 'Eris', 1, 'Dwarf Planet', 0.0028, 0.19, 203000, 67.8, 1, false, false, 'The most massive known dwarf planet, located in the scattered disk beyond the Kuiper Belt.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Main Sequence', 'G2V', 1, 1, 1, 5778, 4.60, 0, 'The star at the center of our solar system.');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'Main Sequence', 'G2V', 1.5, 1.1, 1.2, 5790, 6.00, 4, 'Part of the closest star system to the Solar System.');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'Main Sequence', 'A1V', 25.4, 2.02, 1.71, 9940, 0.24, 9, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red Supergiant', 'M2lab', 126000, 11.6, 764, 3500, 9.00, 643, 'A massive, evolved star in Orion; nearing end of life.');
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'Blue Supergiant', 'B8la', 120000, 21, 78, 11000, 8.00, 860, 'Very luminous blue supergiant in Orion.');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'Red Dwarf', 'M5.5Ve', 0.0017, 0.12, 0.14, 3042, 4.85, 4, 'Closest known star to the Sun.');
INSERT INTO public.star VALUES (7, 'Vega', 1, 'Main Sequence', 'A0V', 40.12, 2.1, 2.36, 9602, 0.46, 25, 'Bright star in Lyra, once North Star.');
INSERT INTO public.star VALUES (8, 'Aldebaran', 1, 'Red Giant', 'K5lll', 518, 1.16, 44.2, 3910, 6.60, 65, 'Brightest star in Taurus constellation.');
INSERT INTO public.star VALUES (9, 'Antares', 1, 'Red Supergiant', 'M1.5lab-lb', 75900, 12, 680, 3400, 11.00, 550, 'A prominent star in Scorpius, nearing end of life.');


--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_event_celestial_event_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: celestial_event celestial_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_name_key UNIQUE (name);


--
-- Name: celestial_event celestial_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_pkey PRIMARY KEY (celestial_event_id);


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
-- Name: celestial_event celestial_event_associated_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_associated_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: celestial_event celestial_event_associated_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_associated_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: celestial_event celestial_event_associated_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_associated_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: celestial_event celestial_event_associated_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_associated_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

