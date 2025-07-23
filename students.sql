--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: lavie
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE students OWNER TO lavie;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: lavie
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO lavie;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: lavie
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_course_id_seq OWNER TO lavie;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lavie
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: lavie
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO lavie;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: lavie
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO lavie;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: lavie
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.majors_major_id_seq OWNER TO lavie;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lavie
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: lavie
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO lavie;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: lavie
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO lavie;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lavie
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: lavie
--

INSERT INTO public.courses VALUES (42, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (43, 'Web Programming');
INSERT INTO public.courses VALUES (44, 'Database Systems');
INSERT INTO public.courses VALUES (45, 'Computer Networks');
INSERT INTO public.courses VALUES (46, 'SQL');
INSERT INTO public.courses VALUES (47, 'Machine Learning');
INSERT INTO public.courses VALUES (48, 'Computer Systems');
INSERT INTO public.courses VALUES (49, 'Web Applications');
INSERT INTO public.courses VALUES (50, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (51, 'Python');
INSERT INTO public.courses VALUES (52, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (53, 'Calculus');
INSERT INTO public.courses VALUES (54, 'Game Architecture');
INSERT INTO public.courses VALUES (55, 'Algorithms');
INSERT INTO public.courses VALUES (56, 'UNIX');
INSERT INTO public.courses VALUES (57, 'Server Administration');
INSERT INTO public.courses VALUES (58, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: lavie
--

INSERT INTO public.majors VALUES (98, 'Database Administration');
INSERT INTO public.majors VALUES (99, 'Web Development');
INSERT INTO public.majors VALUES (100, 'Data Science');
INSERT INTO public.majors VALUES (101, 'Network Engineering');
INSERT INTO public.majors VALUES (102, 'Computer Programming');
INSERT INTO public.majors VALUES (103, 'Game Design');
INSERT INTO public.majors VALUES (104, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: lavie
--

INSERT INTO public.majors_courses VALUES (98, 42);
INSERT INTO public.majors_courses VALUES (99, 43);
INSERT INTO public.majors_courses VALUES (98, 44);
INSERT INTO public.majors_courses VALUES (100, 42);
INSERT INTO public.majors_courses VALUES (101, 45);
INSERT INTO public.majors_courses VALUES (98, 46);
INSERT INTO public.majors_courses VALUES (100, 47);
INSERT INTO public.majors_courses VALUES (101, 48);
INSERT INTO public.majors_courses VALUES (102, 45);
INSERT INTO public.majors_courses VALUES (98, 49);
INSERT INTO public.majors_courses VALUES (103, 50);
INSERT INTO public.majors_courses VALUES (100, 51);
INSERT INTO public.majors_courses VALUES (102, 52);
INSERT INTO public.majors_courses VALUES (104, 48);
INSERT INTO public.majors_courses VALUES (103, 53);
INSERT INTO public.majors_courses VALUES (99, 42);
INSERT INTO public.majors_courses VALUES (100, 53);
INSERT INTO public.majors_courses VALUES (99, 52);
INSERT INTO public.majors_courses VALUES (103, 54);
INSERT INTO public.majors_courses VALUES (104, 45);
INSERT INTO public.majors_courses VALUES (103, 55);
INSERT INTO public.majors_courses VALUES (104, 56);
INSERT INTO public.majors_courses VALUES (104, 57);
INSERT INTO public.majors_courses VALUES (102, 48);
INSERT INTO public.majors_courses VALUES (102, 51);
INSERT INTO public.majors_courses VALUES (101, 58);
INSERT INTO public.majors_courses VALUES (99, 49);
INSERT INTO public.majors_courses VALUES (101, 55);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: lavie
--

INSERT INTO public.students VALUES (20, 'Rhea', 'Kellems', 98, 2.5);
INSERT INTO public.students VALUES (21, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (22, 'Kimberly', 'Whitley', 99, 3.8);
INSERT INTO public.students VALUES (23, 'Jimmy', 'Felipe', 98, 3.7);
INSERT INTO public.students VALUES (24, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (25, 'Casares', 'Hijo', 103, 4.0);
INSERT INTO public.students VALUES (26, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (27, 'Sterling', 'Boss', 103, 3.9);
INSERT INTO public.students VALUES (28, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (29, 'Kaija', 'Uronen', 103, 3.7);
INSERT INTO public.students VALUES (30, 'Faye', 'Conn', 103, 2.1);
INSERT INTO public.students VALUES (31, 'Efren', 'Reilly', 99, 3.9);
INSERT INTO public.students VALUES (32, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (33, 'Maxine', 'Hagenes', 98, 2.9);
INSERT INTO public.students VALUES (34, 'Larry', 'Saunders', 100, 2.2);
INSERT INTO public.students VALUES (35, 'Karl', 'Kuhar', 99, NULL);
INSERT INTO public.students VALUES (36, 'Lieke', 'Hazenveld', 103, 3.5);
INSERT INTO public.students VALUES (37, 'Obie', 'Hilpert', 99, NULL);
INSERT INTO public.students VALUES (38, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (39, 'Nathan', 'Turner', 98, 3.3);
INSERT INTO public.students VALUES (40, 'Gerald', 'Osiki', 100, 2.2);
INSERT INTO public.students VALUES (41, 'Vanya', 'Hassanah', 103, 4.0);
INSERT INTO public.students VALUES (42, 'Roxelana', 'Florescu', 98, 3.2);
INSERT INTO public.students VALUES (43, 'Helene', 'Parker', 100, 3.4);
INSERT INTO public.students VALUES (44, 'Mariana', 'Russel', 99, 1.8);
INSERT INTO public.students VALUES (45, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (46, 'Mehdi', 'Vandenberghe', 98, 1.9);
INSERT INTO public.students VALUES (47, 'Dejon', 'Howell', 99, 4.0);
INSERT INTO public.students VALUES (48, 'Aliya', 'Gulgowski', 104, 2.6);
INSERT INTO public.students VALUES (49, 'Ana', 'Tupajic', 100, 3.1);
INSERT INTO public.students VALUES (50, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lavie
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 58, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lavie
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 104, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lavie
--

SELECT pg_catalog.setval('public.students_student_id_seq', 50, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lavie
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

