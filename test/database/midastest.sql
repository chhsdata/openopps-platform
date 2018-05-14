--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attachment; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE attachment (
    "fileId" integer,
    "projectId" integer,
    "taskId" integer,
    "userId" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


ALTER TABLE attachment OWNER TO midas;

--
-- Name: attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachment_id_seq OWNER TO midas;

--
-- Name: attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE attachment_id_seq OWNED BY attachment.id;


--
-- Name: badge; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE badge (
    "user" integer,
    task integer,
    id integer NOT NULL,
    type character varying,
    silent boolean DEFAULT false,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


ALTER TABLE badge OWNER TO midas;

--
-- Name: badge_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE badge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE badge_id_seq OWNER TO midas;

--
-- Name: badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE badge_id_seq OWNED BY badge.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE comment (
    topic boolean,
    "projectId" integer,
    "taskId" integer,
    "parentId" integer,
    "userId" integer,
    value text,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


ALTER TABLE comment OWNER TO midas;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comment_id_seq OWNER TO midas;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


--
-- Name: file; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE file (
    "userId" integer,
    name text,
    "isPrivate" boolean,
    "mimeType" text,
    size integer,
    data bytea,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    fd character varying
);


ALTER TABLE file OWNER TO midas;

--
-- Name: file_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE file_id_seq OWNER TO midas;

--
-- Name: file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE file_id_seq OWNED BY file.id;


--
-- Name: midas_user; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE midas_user (
    username text,
    name text,
    title text,
    bio text,
    "photoId" integer,
    "photoUrl" text,
    "isAdmin" boolean,
    disabled boolean,
    "passwordAttempts" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "completedTasks" integer DEFAULT 0 NOT NULL,
    "isAgencyAdmin" boolean DEFAULT false NOT NULL
);


ALTER TABLE midas_user OWNER TO midas;

--
-- Name: midas_user_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE midas_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE midas_user_id_seq OWNER TO midas;

--
-- Name: midas_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE midas_user_id_seq OWNED BY midas_user.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE notification (
    "callerId" integer,
    "callerType" text,
    "triggerGuid" text,
    action text,
    audience text,
    "recipientId" integer,
    "createdDate" timestamp with time zone,
    "localParams" text,
    "globalParams" text,
    "isActive" boolean,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    model json
);


ALTER TABLE notification OWNER TO midas;

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notification_id_seq OWNER TO midas;

--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE notification_id_seq OWNED BY notification.id;


--
-- Name: passport; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE passport (
    protocol text,
    password text,
    "accessToken" text,
    provider text,
    identifier text,
    tokens json,
    "user" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


ALTER TABLE passport OWNER TO midas;

--
-- Name: passport_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE passport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE passport_id_seq OWNER TO midas;

--
-- Name: passport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE passport_id_seq OWNED BY passport.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE tag (
    "projectId" integer,
    "taskId" integer,
    "tagId" integer,
    "userId" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


ALTER TABLE tag OWNER TO midas;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tag_id_seq OWNER TO midas;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE tag_id_seq OWNED BY tag.id;


--
-- Name: tagentity; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE tagentity (
    type text,
    name text,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    data json
);


ALTER TABLE tagentity OWNER TO midas;

--
-- Name: tagentity_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE tagentity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tagentity_id_seq OWNER TO midas;

--
-- Name: tagentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE tagentity_id_seq OWNED BY tagentity.id;


--
-- Name: tagentity_tasks__task_tags; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE tagentity_tasks__task_tags (
    id integer NOT NULL,
    tagentity_tasks integer,
    task_tags integer,
    "deletedAt" timestamp with time zone
);


ALTER TABLE tagentity_tasks__task_tags OWNER TO midas;

--
-- Name: tagentity_tasks__task_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE tagentity_tasks__task_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tagentity_tasks__task_tags_id_seq OWNER TO midas;

--
-- Name: tagentity_tasks__task_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE tagentity_tasks__task_tags_id_seq OWNED BY tagentity_tasks__task_tags.id;


--
-- Name: tagentity_users__user_tags; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE tagentity_users__user_tags (
    id integer NOT NULL,
    tagentity_users integer,
    user_tags integer,
    "deletedAt" timestamp with time zone
);


ALTER TABLE tagentity_users__user_tags OWNER TO midas;

--
-- Name: tagentity_users__user_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE tagentity_users__user_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tagentity_users__user_tags_id_seq OWNER TO midas;

--
-- Name: tagentity_users__user_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE tagentity_users__user_tags_id_seq OWNED BY tagentity_users__user_tags.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE task (
    state text,
    "userId" integer,
    "projectId" integer,
    title text,
    description text,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "publishedAt" timestamp with time zone,
    "assignedAt" timestamp with time zone,
    "completedAt" timestamp with time zone,
    "completedBy" timestamp with time zone,
    "submittedAt" timestamp with time zone,
    restrict character varying
);


ALTER TABLE task OWNER TO midas;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE task_id_seq OWNER TO midas;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE task_id_seq OWNED BY task.id;


--
-- Name: userpasswordreset; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE userpasswordreset (
    "userId" integer,
    token text,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


ALTER TABLE userpasswordreset OWNER TO midas;

--
-- Name: userpasswordreset_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE userpasswordreset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userpasswordreset_id_seq OWNER TO midas;

--
-- Name: userpasswordreset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE userpasswordreset_id_seq OWNED BY userpasswordreset.id;


--
-- Name: volunteer; Type: TABLE; Schema: public; Owner: midas
--

CREATE TABLE volunteer (
    "taskId" integer,
    "userId" integer,
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    silent boolean
);


ALTER TABLE volunteer OWNER TO midas;

--
-- Name: volunteer_id_seq; Type: SEQUENCE; Schema: public; Owner: midas
--

CREATE SEQUENCE volunteer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE volunteer_id_seq OWNER TO midas;

--
-- Name: volunteer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: midas
--

ALTER SEQUENCE volunteer_id_seq OWNED BY volunteer.id;


--
-- Name: attachment id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY attachment ALTER COLUMN id SET DEFAULT nextval('attachment_id_seq'::regclass);


--
-- Name: badge id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY badge ALTER COLUMN id SET DEFAULT nextval('badge_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


--
-- Name: file id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY file ALTER COLUMN id SET DEFAULT nextval('file_id_seq'::regclass);


--
-- Name: midas_user id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY midas_user ALTER COLUMN id SET DEFAULT nextval('midas_user_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY notification ALTER COLUMN id SET DEFAULT nextval('notification_id_seq'::regclass);


--
-- Name: passport id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY passport ALTER COLUMN id SET DEFAULT nextval('passport_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY tag ALTER COLUMN id SET DEFAULT nextval('tag_id_seq'::regclass);


--
-- Name: tagentity id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY tagentity ALTER COLUMN id SET DEFAULT nextval('tagentity_id_seq'::regclass);


--
-- Name: tagentity_tasks__task_tags id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY tagentity_tasks__task_tags ALTER COLUMN id SET DEFAULT nextval('tagentity_tasks__task_tags_id_seq'::regclass);


--
-- Name: tagentity_users__user_tags id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY tagentity_users__user_tags ALTER COLUMN id SET DEFAULT nextval('tagentity_users__user_tags_id_seq'::regclass);


--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);


--
-- Name: userpasswordreset id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY userpasswordreset ALTER COLUMN id SET DEFAULT nextval('userpasswordreset_id_seq'::regclass);


--
-- Name: volunteer id; Type: DEFAULT; Schema: public; Owner: midas
--

ALTER TABLE ONLY volunteer ALTER COLUMN id SET DEFAULT nextval('volunteer_id_seq'::regclass);


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('attachment_id_seq', 1, false);


--
-- Data for Name: badge; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: badge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('badge_id_seq', 1, false);


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('comment_id_seq', 1, false);


--
-- Data for Name: file; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('file_id_seq', 1, false);


--
-- Data for Name: midas_user; Type: TABLE DATA; Schema: public; Owner: midas
--

INSERT INTO midas_user VALUES ('kids@test.gov', 'Tammy Craig', 'Social Media Director', NULL, NULL, NULL, false, false, 0, 1, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('pran@test.gov', 'Pran Mhasalkar', 'Special Advisor', NULL, NULL, NULL, false, false, 0, 2, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('janice@test.gov', 'Janice Thompson', 'Field Officer Level 3', NULL, NULL, NULL, false, false, 0, 3, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('clay@test.gov', 'Clay Smithson', '', NULL, NULL, NULL, false, false, 0, 4, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('cat@test.gov', 'Lucia Esperanza', 'Procurement Manager', NULL, NULL, NULL, false, false, 0, 6, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('dante@test.gov', 'Dante Francis', 'Secret Service Field Agent', NULL, NULL, NULL, false, false, 0, 7, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('alan@test.gov', 'Alan Barret', 'Deputy Secretary', NULL, NULL, NULL, false, false, 0, 5, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('serena@test.gov', 'Serena Chao', '', NULL, NULL, NULL, false, false, 0, 8, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('jason@test.gov', 'Jason Xui', 'TSA Inspector', NULL, NULL, NULL, false, false, 0, 9, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('sally@test.gov', 'Sally Wilson', 'Field Software Engineer', NULL, NULL, NULL, false, false, 0, 10, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('robert@test.gov', 'Robert Simmons', 'Port Security Inspector', NULL, NULL, NULL, false, false, 0, 11, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);
INSERT INTO midas_user VALUES ('tanya@test.gov', 'Tanya de la Rocha', 'Deputy Field Operations Director', NULL, NULL, NULL, false, false, 0, 12, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL, 0, false);


--
-- Name: midas_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('midas_user_id_seq', 12, true);


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('notification_id_seq', 1, false);


--
-- Data for Name: passport; Type: TABLE DATA; Schema: public; Owner: midas
--

INSERT INTO passport VALUES ('local', '$2a$10$VnxbMunsglDu7ECbTe8JwuXG9TY7a6Ietx2kvW4blwu.wJOeXPXDu', 'hdLLO42vimg7KthmANWYwtth5MGZsPuALPjahoIpWlSl75Pnr4qhSc7TcmmbHoKX', NULL, NULL, NULL, 2, 2, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$zWswt5ubVcZs7BbaA9YCAObdmm.D1O.jFJ0CAPoGZKo9ueJG54sQ2', 'AoPG8u8hjNIwSfoJlfscMjk8cnfHCzy0u8KpcbsZhUKnLI1pBl4pTNhVuu5QDJ0l', NULL, NULL, NULL, 3, 3, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$C1ojA34elqQFSog2ZHXgheTtVI7RUz8Cw9hyq5tiZiBADjoQphTBi', 'EQYs7a/WNwNSxHuXbgjYS3+BtyrXURzP5UPnVBApTLRssLZke8Gl/gQajs3/CnYn', NULL, NULL, NULL, 4, 4, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$/JzcizNWd6OK02ICH2wvZupZay1Fris4NeoB89mjCI68/JL5lw7cy', 'aSlB+SLYAGHDdQLIUVLiWM0znS36Ko8lBw53e1/97efoI3OC0HuUmu4uH+HPlqU6', NULL, NULL, NULL, 11, 11, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$kapMHvBd.vVsYY6Hyxg78eC1bczjVaJ2oZGAjLa2Jz.PamInAA9Iq', '46DtR5dYoZ+GFh7BxuvHhrMykaqJyKLiEw7WV3XF40D8rij06WwcC4YpcWE6Ecmx', NULL, NULL, NULL, 12, 12, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$ZSFZSEIT7oVxORkMWuRJXORSwTErxrYFPLHYbgP9WVlLTt1Pi6ecS', 'gkknSnVXGdbUj0nMVbblGzk4AsmqiQ+aZhPUPOoYQaNwrrtxflSl+pBD2L7fMGzB', NULL, NULL, NULL, 7, 6, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$dzS/xD3fJaYDORjMGXqGCez6cBAvbnMYAsJbzq.O8jd3yxeaPySQS', 'je6ObzzLKy2jsAT1RpI5M2p9T0OPquOHnKGMiBWnS8sM08sG66574/wIk80dD7HT', NULL, NULL, NULL, 6, 5, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$wfrKhffC7gZjfSDQFmcymeMU4DLlYNuW7/ilk8P3zXf1snpesaCle', '8D+ZvPbwMfhAjyq3C4aoWDdJUCLzTBE3wg9dFT5/JkCfKnTOhso7wMXm+wdizkwP', NULL, NULL, NULL, 5, 7, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$UG9y9aZ8cdgoRo1z5iXwqeOsdlAFu8oERUpgD6hwCWHBYkHePhkbO', 'kWPzc/R0KWwYF/MTHDrowZGKJPNcKhlMO0gVxtKKDrFoiFaLKbpFT4JuRt+H+n2q', NULL, NULL, NULL, 9, 8, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$JjnaYWG/6qjn3RvzOdWbFOQKPpwBAUbGAsceLis8A0.HQ085UF31y', 'yg+MCnC+dTwjB6rZu0g8dCtIcPXhS1qSBKnchK4oCOhvTJosOOE/ZFygc2MmQXeS', NULL, NULL, NULL, 8, 9, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$cfHhpjQnAMzcX1NNiXjeg.iBhp82ezacLHVlp4SBNB9iVBJIlSvBe', 'vrBbToz6bovSxpcjM36PoIrYySCQJoSbpNtUZBGcI41DWmgXdYHBmgIWyMgM+6Lm', NULL, NULL, NULL, 10, 10, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);
INSERT INTO passport VALUES ('local', '$2a$10$yy3BaP2aa.7j/vUbpK4yvuBa1l9RvK78CnZyjgDWZ4aRWGFox92By', 'i8jeINt9qn3FwxHlSYCKAfupPPowm2KTyx7Wzo/l62I4GY99nZgqT9cDo0PDOh8R', NULL, NULL, NULL, 1, 1, '2017-12-18 15:31:29.864-05', '2017-12-18 15:31:29.864-05', NULL);


--
-- Name: passport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('passport_id_seq', 12, true);


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('tag_id_seq', 1, false);


--
-- Data for Name: tagentity; Type: TABLE DATA; Schema: public; Owner: midas
--

INSERT INTO tagentity VALUES ('task-people', '1 person', 4, '2014-09-16 17:42:43-04', '2014-09-16 17:42:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-people', '2 - 5 people', 5, '2014-09-16 17:42:43-04', '2014-09-16 17:42:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-people', '> 5 people', 6, '2014-09-16 17:42:43-04', '2014-09-16 17:42:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-people', 'A Team', 7, '2014-09-16 17:42:43-04', '2014-09-16 17:42:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-skills-required', 'Required', 8, '2014-09-16 17:42:43-04', '2014-09-16 17:42:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-skills-required', 'Not Required', 9, '2014-09-16 17:42:43-04', '2014-09-16 17:42:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Event', 21, '2014-09-16 20:50:49-04', '2014-09-16 20:50:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'GSA Badge', 22, '2014-09-16 20:50:49-04', '2014-09-16 20:50:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'UX', 24, '2014-09-16 21:17:59-04', '2014-09-16 21:17:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Source', 25, '2014-09-16 21:18:00-04', '2014-09-16 21:18:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'JavaScript', 26, '2014-09-16 21:18:00-04', '2014-09-16 21:18:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Node.js', 27, '2014-09-16 21:18:00-04', '2014-09-16 21:18:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UX', 28, '2014-09-16 21:18:00-04', '2014-09-16 21:18:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Web Application', 29, '2014-09-16 22:20:38-04', '2014-09-16 22:20:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Firefox', 30, '2014-09-16 22:20:39-04', '2014-09-16 22:20:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'test', 31, '2014-10-01 12:51:31-04', '2014-10-01 12:51:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Developers', 32, '2014-10-09 09:58:41-04', '2014-10-09 09:58:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'APIs, General Tech', 33, '2014-10-09 09:58:41-04', '2014-10-09 09:58:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'staffing', 34, '2014-10-14 14:26:05-04', '2014-10-14 14:26:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'human resources', 35, '2014-10-14 14:26:05-04', '2014-10-14 14:26:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'legal', 36, '2014-10-14 14:26:05-04', '2014-10-14 14:26:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', '18F', 37, '2014-10-23 16:25:34-04', '2014-10-23 16:25:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'web development', 38, '2014-10-23 16:25:34-04', '2014-10-23 16:25:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'jekyll', 39, '2014-10-23 16:26:57-04', '2014-10-23 16:26:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'wordpress', 40, '2014-10-23 16:26:57-04', '2014-10-23 16:26:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'git', 41, '2014-10-23 16:26:57-04', '2014-10-23 16:26:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'github', 42, '2014-10-23 16:26:57-04', '2014-10-23 16:26:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ruby', 43, '2014-10-23 16:26:58-04', '2014-10-23 16:26:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'python', 44, '2014-10-23 16:26:58-04', '2014-10-23 16:26:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Affordable Housing Program (Sunlight Program)', 49, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Arlington National Cemetary (DOD/Army)', 54, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Christopher Columbus Fellowship Foundation', 59, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Commission to Eliminate Child Abuse and Neglect Fatalities', 61, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Defense Commisary Agency (DeCA)', 68, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DHS Computer Emergency Readiness Team (US-CERT)', 89, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-required', 'One time', 1, '2014-09-16 17:42:43-04', '2015-07-27 18:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-length', 'Weekly', 12, '2014-09-16 17:42:43-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-length', 'Monthly', 13, '2014-09-16 17:42:43-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-estimate', 'Up to 2 hours', 16, '2015-07-26 22:00:02-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOC Census Bureau', 101, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Premier', 604, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Department of Education (ED)', 75, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ED","domain":"ed.gov","slug":"ed","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Labor (DOL)', 81, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOL","domain":"dol.gov","slug":"dol","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of State (DOS)', 82, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOS","domain":"dos.gov","slug":"dos","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of the Interior (DOI)', 83, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOI","domain":"doi.gov","slug":"doi","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of the Treasury (TREAS)', 84, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"TREAS","domain":"treas.gov","slug":"treas","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Transportation (DOT)', 85, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOT","domain":"dot.gov","slug":"dot","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Veterans Affairs (VA)', 86, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"VA","domain":"va.gov","slug":"va","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS Immigration and Customs Enforcement (ICE)', 93, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ICE","domain":"ice.gov","slug":"ice","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS Secret Service (USSS)', 94, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USSS","domain":"usss.gov","slug":"usss","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Maritime Commission (FMC)', 175, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FMC","domain":"fmc.gov","slug":"fmc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS Transportation Security Administration (TSA)', 95, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"TSA","domain":"tsa.gov","slug":"tsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS United States Citizenship and Immigration Services (USCIS)', 96, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USCIS","domain":"uscis.gov","slug":"uscis","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Director of National Intelligence (DNI)', 97, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DNI","domain":"dni.gov","slug":"dni","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Bureau of Prisons (BOP)', 57, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BOP","domain":"bop.gov","slug":"bop","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Central Intelligence Agency (CIA)', 58, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CIA","domain":"cia.gov","slug":"cia","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Commission on Civil Rights (USCCR)', 60, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USCCR","domain":"usccr.gov","slug":"usccr","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Commodity Futures Trading Commission (CFTC)', 62, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CFTC","domain":"cftc.gov","slug":"cftc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Consumer Financial Protection Bureau (CFPB)', 63, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CFPB","domain":"cfpb.gov","slug":"cfpb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOD Army', 112, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOD Navy', 116, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOJ Marshals Service', 139, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOT Saint Lawrence Seaway Development Corporation', 159, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DAP', 328, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Federal Reserve System', 178, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'FMS Treasury', 181, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'George C Marshall Center European Center for Security Studies', 183, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOE Southwestern Power Administration (SWPA)', 122, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SWPA","domain":"swpa.gov","slug":"swpa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOE Western Area Power Administration (WAPA)', 123, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"WAPA","domain":"wapa.gov","slug":"wapa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOI Fish and Wildlife Service (FWS)', 129, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FWS","domain":"fws.gov","slug":"fws","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOI National Park Service (NPS)', 130, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NPS","domain":"nps.gov","slug":"nps","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOJ Drug Enforcement Administration (DEA)', 136, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DEA","domain":"dea.gov","slug":"dea","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Employment & Training Administration (ETA)', 143, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ETA","domain":"eta.gov","slug":"eta","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Mine Safety and Health Administration (MSHA)', 144, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"MSHA","domain":"msha.gov","slug":"msha","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Occupational Safety and Health Administration (OSHA)', 145, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OSHA","domain":"osha.gov","slug":"osha","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Office of Administrative Law Judges (OALJ)', 146, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OALJ","domain":"oalj.gov","slug":"oalj","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Veterans'' Employment and Training Service (VETS)', 147, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"VETS","domain":"vets.gov","slug":"vets","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Wage and Hour Division (WHD)', 148, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"WHD","domain":"whd.gov","slug":"whd","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Federal Aviation Administration (FAA)', 150, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FAA","domain":"faa.gov","slug":"faa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Maritime Administration (MARAD)', 155, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"MARAD","domain":"marad.gov","slug":"marad","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Pipeline and Hazardous Materials Safety Administration (PHMSA)', 157, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"PHMSA","domain":"phmsa.gov","slug":"phmsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Research and Innovative Technology Administration (RITA)', 158, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"RITA","domain":"rita.gov","slug":"rita","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Surface Transportation Board (STB)', 160, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"STB","domain":"stb.gov","slug":"stb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'ED Federal Student Aid (FAFSA)', 161, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FAFSA","domain":"fafsa.gov","slug":"fafsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'ED Institute of Education Sciences (IES)', 162, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"IES","domain":"ies.gov","slug":"ies","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'EOP Office of the U.S. Trade Representative (USTR)', 164, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USTR","domain":"ustr.gov","slug":"ustr","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Communications Commission (FCC)', 169, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FCC","domain":"fcc.gov","slug":"fcc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Labor Relations Authority (FLRA)', 174, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FLRA","domain":"flra.gov","slug":"flra","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Mediation and Conciliation Service (FMCS)', 176, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FMCS","domain":"fmcs.gov","slug":"fmcs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Mine Safety and Health Review Commission (FMSHRC)', 177, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FMSHRC","domain":"fmshrc.gov","slug":"fmshrc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Retirement Thrift Investment Board (FRTIB)', 179, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FRTIB","domain":"frtib.gov","slug":"frtib","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Trade Commission (FTC)', 180, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FTC","domain":"ftc.gov","slug":"ftc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'General Services Administration (GSA)', 182, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"GSA","domain":"gsa.gov","slug":"gsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC National Institute of Standards and Technology (NIST)', 106, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NIST","domain":"nist.gov","slug":"nist","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOD Special Operations Command (SOCOM)', 117, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SOCOM","domain":"socom.gov","slug":"socom","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOE Bonneville Power Administration (BPA)', 118, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BPA","domain":"bpa.gov","slug":"bpa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'House', 196, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'National Cancer Institute (HHS/NIH)', 204, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'National Endowment for the Arts', 210, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'National Library of Medicine (HHS/NIH)', 215, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Office of Compliance', 226, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Office of Management and Budget (OMB/EOP/White House)', 228, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Panama Canal Commission', 233, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Peace Corps', 234, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Recovery Accountability and Transparency Board', 239, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'TREAS Bureau of the Fiscal Service', 248, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'TREAS United States Mint', 254, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'US Courts', 259, '2014-10-29 13:56:17.913-04', '2014-10-29 13:56:17.913-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'National Capital Planning Commission (NCPC)', 205, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NCPC","domain":"ncpc.gov","slug":"ncpc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Center for Telehealth & Technology (T2) (DOD)', 206, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOD","domain":"dod.gov","slug":"dod","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Council on Disability (NCD)', 207, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NCD","domain":"ncd.gov","slug":"ncd","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Defense University (NDU)', 209, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NDU","domain":"ndu.gov","slug":"ndu","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Endowment for the Humanities (NEH)', 211, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NEH","domain":"neh.gov","slug":"neh","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Labor Relations Board (NLRB)', 214, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NLRB","domain":"nlrb.gov","slug":"nlrb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Science Foundation (NSF)', 219, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NSF","domain":"nsf.gov","slug":"nsf","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Office of Government Ethics (OGE)', 227, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OGE","domain":"oge.gov","slug":"oge","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Pension Benefit Guaranty Corporation (PBGC)', 235, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"PBGC","domain":"pbgc.gov","slug":"pbgc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Postal Regulatory Commission (PRC)', 236, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"PRC","domain":"prc.gov","slug":"prc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Privacy and Civil Liberties Oversight Board (PCLOB)', 237, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"PCLOB","domain":"pclob.gov","slug":"pclob","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Railroad Retirement Board (RRB)', 238, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"RRB","domain":"rrb.gov","slug":"rrb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Securities and Exchange Commission (SEC)', 240, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SEC","domain":"sec.gov","slug":"sec","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'TREAS Financial Crimes Enforcement Network (FINCEN)', 250, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FINCEN","domain":"fincen.gov","slug":"fincen","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'TREAS Community Development Financial Institution (CDFI)', 249, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CDFI","domain":"cdfi.gov","slug":"cdfi","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'TREAS Bureau of Engraving and Printing (BEP)', 247, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BEP","domain":"bep.gov","slug":"bep","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('skill', 'strategic communications', 369, '2014-12-18 13:50:11-05', '2014-12-18 13:50:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content management', 370, '2014-12-18 13:50:11-05', '2014-12-18 13:50:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'TREAS Office of the Comptroller of the Currency (OCC)', 252, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OCC","domain":"occ.gov","slug":"occ","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'TREAS Internal Revenue Service (IRS)', 251, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"IRS","domain":"irs.gov","slug":"irs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'United States International Trade Commission (USITD)', 257, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USITD","domain":"usitd.gov","slug":"usitd","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'United States Postal Service (USPS)', 258, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USPS","domain":"usps.gov","slug":"usps","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Agricultural Marketing Service (AMS)', 260, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"AMS","domain":"ams.gov","slug":"ams","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Agricultural Research Service (ARS)', 261, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ARS","domain":"ars.gov","slug":"ars","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Animal and Plant Health Inspection Service (APHIS)', 262, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"APHIS","domain":"aphis.gov","slug":"aphis","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Centers for Medicare and Medicaid Services (CMS)', 190, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CMS","domain":"cms.gov","slug":"cms","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Food and Drug Administration (FDA)', 191, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FDA","domain":"fda.gov","slug":"fda","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Health Resources and Services Administration (HRSA)', 192, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"HRSA","domain":"hrsa.gov","slug":"hrsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Indian Health Service (IHS)', 193, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"IHS","domain":"ihs.gov","slug":"ihs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Security Agency (NSA)', 220, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NSA","domain":"nsa.gov","slug":"nsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('topic', 'digital government', 285, '2014-10-31 15:37:08-04', '2014-10-31 15:37:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'operations', 286, '2014-10-31 15:37:08-04', '2014-10-31 15:37:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'program management', 287, '2014-10-31 15:37:08-04', '2014-10-31 15:37:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'product management', 288, '2014-10-31 15:37:08-04', '2014-10-31 15:37:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'strategy', 289, '2014-10-31 15:37:08-04', '2014-10-31 15:37:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'communications', 290, '2014-10-31 15:37:08-04', '2014-10-31 15:37:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social media', 291, '2014-11-04 16:24:21-05', '2014-11-04 16:24:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social media', 292, '2014-11-04 21:06:39-05', '2014-11-04 21:06:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Management ', 293, '2014-11-05 10:47:55-05', '2014-11-05 10:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 294, '2014-11-05 10:47:55-05', '2014-11-05 10:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Outreach', 295, '2014-11-05 10:47:55-05', '2014-11-05 10:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Web Development', 297, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Content Migration', 298, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Web Design', 299, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Event Management', 300, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'User Experience', 301, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social Media', 302, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Customer Experience', 303, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSS', 304, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HTML', 305, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'JavaScript', 306, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Stellent', 307, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CMS', 308, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'WordPress', 309, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Drupal', 310, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'jQuery', 311, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Responsive Design', 312, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Photoshop', 313, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic Design', 314, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Logo Design', 315, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SEO', 316, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SMM', 317, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Search Engine Optimization', 318, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social Media', 319, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social Media Marketing', 320, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Brand Mangement', 321, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Content Migration', 322, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Metrics', 323, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Analytics', 324, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Google Analytics', 325, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Analytics Program', 326, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UX', 327, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'User Interface', 329, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UI', 330, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Event Management', 336, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'User Experience', 331, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Webinar', 335, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'GUI', 332, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphical User Interface', 333, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Webcast', 334, '2014-11-10 13:42:43-05', '2014-11-10 13:42:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Editing', 337, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Eventbrite', 338, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MailChimp', 339, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cvent', 340, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'GovDelivery', 341, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Copy-editing', 342, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Technical Writing', 343, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'AP Stylebook', 344, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Proofreading', 345, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Chicago Manual of Style', 346, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 347, '2014-11-10 13:47:40-05', '2014-11-10 13:47:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Brand Management', 348, '2014-11-10 13:52:54-05', '2014-11-10 13:52:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Section 508 Compliance', 349, '2014-11-10 13:56:21-05', '2014-11-10 13:56:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Usability Testing', 350, '2014-11-10 14:14:32-05', '2014-11-10 14:14:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Usability Testing', 351, '2014-11-10 14:14:32-05', '2014-11-10 14:14:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Mobile', 352, '2014-11-12 16:18:44-05', '2014-11-12 16:18:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Draft and edit our weekly newsletter', 353, '2014-11-18 16:06:46-05', '2014-11-18 16:06:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Drafting and editing skills', 354, '2014-11-18 16:06:46-05', '2014-11-18 16:06:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'graphic design', 355, '2014-11-25 22:52:28-05', '2014-11-25 22:52:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'graphic design', 356, '2014-11-25 22:52:28-05', '2014-11-25 22:52:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'API', 357, '2014-12-02 16:09:48-05', '2014-12-02 16:09:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research ', 358, '2014-12-03 17:28:09-05', '2014-12-03 17:28:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'wordpress basics (or willingness to learn)', 359, '2014-12-03 17:34:51-05', '2014-12-03 17:34:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'basic tech skills', 360, '2014-12-03 17:34:51-05', '2014-12-03 17:34:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Indesign', 603, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'willingness to conduct interviews', 361, '2014-12-03 17:34:51-05', '2014-12-03 17:34:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Innovation', 362, '2014-12-10 13:43:01-05', '2014-12-10 13:43:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Health Care', 363, '2014-12-10 13:43:01-05', '2014-12-10 13:43:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile', 364, '2014-12-11 13:22:19-05', '2014-12-11 13:22:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' open source', 365, '2014-12-11 13:22:19-05', '2014-12-11 13:22:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research', 366, '2014-12-11 13:22:19-05', '2014-12-11 13:22:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' code', 367, '2014-12-11 13:22:19-05', '2014-12-11 13:22:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital communication', 368, '2014-12-18 13:50:11-05', '2014-12-18 13:50:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'usability', 371, '2014-12-18 13:50:11-05', '2014-12-18 13:50:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'public affairs', 372, '2014-12-18 13:50:11-05', '2014-12-18 13:50:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'USDA Risk Management Agency (RMA)', 279, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"RMA","domain":"rma.gov","slug":"rma","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Rural Development (RD)', 280, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"RD","domain":"rd.gov","slug":"rd","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Veterans Administration (VA)', 284, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"VA","domain":"va.gov","slug":"va","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Forest Service (FS)', 271, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FS","domain":"fs.gov","slug":"fs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Office of the Chief Economist (OCE)', 278, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OCE","domain":"oce.gov","slug":"oce","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'VA National Cemetery Administration (NCA)', 281, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NCA","domain":"nca.gov","slug":"nca","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('skill', 'campaign development', 373, '2014-12-18 13:50:11-05', '2014-12-18 13:50:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data', 374, '2014-12-29 11:06:01-05', '2014-12-29 11:06:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'automated testing', 375, '2015-01-06 12:37:07-05', '2015-01-06 12:37:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'C++', 376, '2015-01-06 12:37:07-05', '2015-01-06 12:37:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'open data', 377, '2015-01-07 14:55:55-05', '2015-01-07 14:55:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' content models', 378, '2015-01-07 14:55:55-05', '2015-01-07 14:55:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' IA', 379, '2015-01-07 14:55:55-05', '2015-01-07 14:55:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'project management', 380, '2015-01-07 14:55:55-05', '2015-01-07 14:55:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'program management', 381, '2015-01-07 14:55:55-05', '2015-01-07 14:55:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile testing', 382, '2015-01-07 14:59:39-05', '2015-01-07 14:59:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' responsive web design', 383, '2015-01-07 14:59:39-05', '2015-01-07 14:59:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile testing', 384, '2015-01-07 14:59:39-05', '2015-01-07 14:59:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'project management', 385, '2015-01-07 14:59:39-05', '2015-01-07 14:59:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Plain Language', 386, '2015-01-08 15:06:36-05', '2015-01-08 15:06:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'blogging', 387, '2015-01-08 15:06:36-05', '2015-01-08 15:06:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' writing', 388, '2015-01-08 15:06:36-05', '2015-01-08 15:06:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' plain language', 389, '2015-01-08 15:06:36-05', '2015-01-08 15:06:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'manufacturing', 391, '2015-01-15 14:26:53-05', '2015-01-15 14:26:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'innovation', 392, '2015-01-15 14:26:53-05', '2015-01-15 14:26:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'public-private partnerships', 393, '2015-01-15 14:26:53-05', '2015-01-15 14:26:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'video production', 394, '2015-01-15 14:26:53-05', '2015-01-15 14:26:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'iPhone', 396, '2015-01-15 14:26:54-05', '2015-01-15 14:26:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 397, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' editing', 398, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' blogging', 399, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' branding', 400, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' research', 401, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Google Apps', 402, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' strategy', 403, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' organizational development', 404, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' marketing', 405, '2015-01-15 14:29:13-05', '2015-01-15 14:29:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Sharepoint', 406, '2015-01-15 14:29:14-05', '2015-01-15 14:29:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'manufacturing', 407, '2015-01-15 16:16:49-05', '2015-01-15 16:16:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 408, '2015-01-15 16:16:49-05', '2015-01-15 16:16:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'discourse analysis', 409, '2015-01-16 10:12:08-05', '2015-01-16 10:12:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'project management', 410, '2015-01-16 10:12:08-05', '2015-01-16 10:12:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'instructional technology', 411, '2015-01-16 10:12:08-05', '2015-01-16 10:12:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'performance support', 412, '2015-01-16 10:12:08-05', '2015-01-16 10:12:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'curriculum development', 413, '2015-01-16 10:12:11-05', '2015-01-16 10:12:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'research', 414, '2015-01-20 16:26:26-05', '2015-01-20 16:26:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'trends', 415, '2015-01-20 16:26:26-05', '2015-01-20 16:26:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'user habits', 416, '2015-01-20 16:26:26-05', '2015-01-20 16:26:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research', 417, '2015-01-20 16:26:26-05', '2015-01-20 16:26:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'technology trends', 418, '2015-01-20 16:36:01-05', '2015-01-20 16:36:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'smartphones', 419, '2015-01-20 16:36:01-05', '2015-01-20 16:36:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile', 420, '2015-01-21 18:02:00-05', '2015-01-21 18:02:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'usability', 421, '2015-01-21 19:06:50-05', '2015-01-21 19:06:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'communication', 422, '2015-01-21 19:17:44-05', '2015-01-21 19:17:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'emotional intelligence', 423, '2015-01-21 19:17:44-05', '2015-01-21 19:17:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'content ', 424, '2015-01-22 16:55:23-05', '2015-01-22 16:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'write', 425, '2015-01-22 16:55:23-05', '2015-01-22 16:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'policy', 426, '2015-01-23 15:31:42-05', '2015-01-23 15:31:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'laws', 427, '2015-01-23 15:31:42-05', '2015-01-23 15:31:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'PRA', 428, '2015-01-23 15:31:42-05', '2015-01-23 15:31:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'TOS', 429, '2015-01-23 15:31:42-05', '2015-01-23 15:31:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'hiring', 430, '2015-01-23 15:31:42-05', '2015-01-23 15:31:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'FISMA', 431, '2015-01-23 15:31:42-05', '2015-01-23 15:31:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'RFP', 432, '2015-01-23 15:31:42-05', '2015-01-23 15:31:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writer', 433, '2015-01-23 15:33:43-05', '2015-01-23 15:33:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'education', 434, '2015-01-25 11:11:13-05', '2015-01-25 11:11:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'inventions', 435, '2015-01-25 11:11:13-05', '2015-01-25 11:11:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'technology transfer', 436, '2015-01-25 11:11:13-05', '2015-01-25 11:11:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research', 437, '2015-01-25 11:11:13-05', '2015-01-25 11:11:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'training', 438, '2015-01-25 11:11:13-05', '2015-01-25 11:11:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'editing', 439, '2015-01-25 11:11:13-05', '2015-01-25 11:11:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'LinkedIn ', 440, '2015-01-26 17:23:56-05', '2015-01-26 17:23:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Building', 441, '2015-01-26 17:23:56-05', '2015-01-26 17:23:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Community', 442, '2015-01-26 17:23:56-05', '2015-01-26 17:23:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Advanced Manufacturing', 443, '2015-01-26 17:26:52-05', '2015-01-26 17:26:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Communication', 444, '2015-01-26 17:26:52-05', '2015-01-26 17:26:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digital Engagement', 445, '2015-01-26 17:26:52-05', '2015-01-26 17:26:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'LinkedIn', 446, '2015-01-26 17:26:52-05', '2015-01-26 17:26:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Community', 447, '2015-01-26 17:26:52-05', '2015-01-26 17:26:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Proactive', 448, '2015-01-26 17:26:52-05', '2015-01-26 17:26:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 449, '2015-01-26 17:26:52-05', '2015-01-26 17:26:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Outreach', 450, '2015-01-26 17:26:52-05', '2015-01-26 17:26:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research', 452, '2015-01-29 13:40:47-05', '2015-01-29 13:40:47-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Search', 453, '2015-01-29 13:40:47-05', '2015-01-29 13:40:47-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'search', 454, '2015-01-29 13:40:47-05', '2015-01-29 13:40:47-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Search', 455, '2015-01-29 13:45:32-05', '2015-01-29 13:45:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research', 456, '2015-01-29 13:45:32-05', '2015-01-29 13:45:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'search', 457, '2015-01-29 13:45:32-05', '2015-01-29 13:45:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'testing', 458, '2015-02-02 10:24:42-05', '2015-02-02 10:24:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'communications skills', 459, '2015-02-02 10:24:42-05', '2015-02-02 10:24:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Writing', 460, '2015-02-03 10:35:26-05', '2015-02-03 10:35:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 461, '2015-02-03 10:35:26-05', '2015-02-03 10:35:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Entrepreneurship', 462, '2015-02-03 11:22:28-05', '2015-02-03 11:22:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design Thinking', 463, '2015-02-03 11:22:28-05', '2015-02-03 11:22:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lean Startup', 464, '2015-02-03 11:22:28-05', '2015-02-03 11:22:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'infographics', 465, '2015-02-03 16:16:32-05', '2015-02-03 16:16:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DevOps', 466, '2015-02-04 16:11:44-05', '2015-02-04 16:11:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Programming', 467, '2015-02-06 09:59:00-05', '2015-02-06 09:59:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Intelligence', 468, '2015-02-06 10:01:51-05', '2015-02-06 10:01:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'data modeling', 469, '2015-02-06 14:35:55-05', '2015-02-06 14:35:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ETL', 470, '2015-02-06 14:35:55-05', '2015-02-06 14:35:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'search', 471, '2015-02-09 09:18:34-05', '2015-02-09 09:18:34-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'knowledge strategy', 472, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'open government', 473, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'technology forecasting', 474, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'innovation', 475, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'emerging technologies', 476, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'e-learning', 477, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'health information', 478, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'product direction', 480, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'portfolio management', 481, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'metadata', 485, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'expertise mining', 479, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'information design', 482, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'information architecture', 483, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'full service creative', 488, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social media', 491, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'user experience design', 484, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research analytics', 486, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'project management', 487, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social networking', 490, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'instructional design', 489, '2015-02-10 11:07:45-05', '2015-02-10 11:07:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Business Intelligence', 492, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Full-cycle budget application', 493, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Salesforce', 494, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Citizen Developers', 495, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Analysis', 496, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Busines Intelligence', 497, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Requirements Analysis', 498, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Wireframing', 499, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Busines Process Mapping', 500, '2015-02-10 12:29:58-05', '2015-02-10 12:29:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Salesforce', 501, '2015-02-10 12:58:28-05', '2015-02-10 12:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Minimum Viable Product', 502, '2015-02-10 12:58:28-05', '2015-02-10 12:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Database Design', 503, '2015-02-10 12:58:28-05', '2015-02-10 12:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Agile', 504, '2015-02-10 12:58:28-05', '2015-02-10 12:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Database Design', 505, '2015-02-10 12:58:28-05', '2015-02-10 12:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Database Development', 506, '2015-02-10 12:58:28-05', '2015-02-10 12:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Modeling', 507, '2015-02-10 12:58:28-05', '2015-02-10 12:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Familiarity with Java (helpful) ', 508, '2015-02-10 12:58:29-05', '2015-02-10 12:58:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Familiarity with SQL (helpful)', 509, '2015-02-10 12:58:29-05', '2015-02-10 12:58:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ability to learn quickly and independently', 510, '2015-02-10 12:58:29-05', '2015-02-10 12:58:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Salesforce', 511, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Minimum Viable Product', 512, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Database Design', 513, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Agile', 514, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digital Repositories', 515, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Database Development', 516, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Metadata', 517, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Linked Data', 518, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Source', 519, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Government', 520, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Repository Development', 521, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Metadata', 522, '2015-02-10 13:18:10-05', '2015-02-10 13:18:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'library technologies', 523, '2015-02-10 13:47:06-05', '2015-02-10 13:47:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Agile', 524, '2015-02-10 13:47:06-05', '2015-02-10 13:47:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'research analytics', 525, '2015-02-10 13:47:36-05', '2015-02-10 13:47:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'expert networking', 526, '2015-02-10 13:47:36-05', '2015-02-10 13:47:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 527, '2015-02-10 16:20:07-05', '2015-02-10 16:20:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'search', 528, '2015-02-12 15:36:08-05', '2015-02-12 15:36:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Marketing', 529, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Evaluation Design', 530, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Stakeholder Management ', 531, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Portfolio Management', 532, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Strategic Planning', 533, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Needs Assessment', 534, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Technology Planning', 535, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Leadership', 536, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Innovation', 537, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 538, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Marketing', 539, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 540, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Branding', 541, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Outreach', 542, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Planning', 543, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Evaluation Design', 544, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Needs Assessment', 545, '2015-02-12 17:18:13-05', '2015-02-12 17:18:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Source', 546, '2015-02-13 11:55:22-05', '2015-02-13 11:55:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Technical Documentation', 547, '2015-02-13 11:55:22-05', '2015-02-13 11:55:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Scientific Collaboration', 548, '2015-02-13 11:55:22-05', '2015-02-13 11:55:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Project Planning', 549, '2015-02-13 11:55:22-05', '2015-02-13 11:55:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 550, '2015-02-13 11:55:22-05', '2015-02-13 11:55:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Data', 551, '2015-02-13 11:55:22-05', '2015-02-13 11:55:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Informatics', 552, '2015-02-13 11:55:22-05', '2015-02-13 11:55:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Planning', 553, '2015-02-13 11:55:23-05', '2015-02-13 11:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Technical Specifications', 554, '2015-02-13 11:55:23-05', '2015-02-13 11:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Budget Estimation', 555, '2015-02-13 11:55:23-05', '2015-02-13 11:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Accessibility', 556, '2015-02-13 13:04:06-05', '2015-02-13 13:04:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Front-end', 557, '2015-02-13 13:04:06-05', '2015-02-13 13:04:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Gulp', 558, '2015-02-13 13:04:06-05', '2015-02-13 13:04:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Training', 559, '2015-02-13 13:04:06-05', '2015-02-13 13:04:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sass', 560, '2015-02-13 13:04:06-05', '2015-02-13 13:04:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Bootstrap', 561, '2015-02-13 13:04:06-05', '2015-02-13 13:04:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'wordpress', 562, '2015-02-15 12:31:50-05', '2015-02-15 12:31:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSS', 563, '2015-02-15 12:31:51-05', '2015-02-15 12:31:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'citizen science', 564, '2015-02-15 12:31:52-05', '2015-02-15 12:31:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UI', 565, '2015-02-15 12:31:52-05', '2015-02-15 12:31:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'innovation', 566, '2015-02-15 12:31:52-05', '2015-02-15 12:31:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'toolkit', 567, '2015-02-15 12:31:52-05', '2015-02-15 12:31:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UX', 568, '2015-02-15 12:31:52-05', '2015-02-15 12:31:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'adobe photoshop', 569, '2015-02-15 12:31:52-05', '2015-02-15 12:31:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Illustrator', 570, '2015-02-15 12:31:52-05', '2015-02-15 12:31:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'website architecture ', 571, '2015-02-15 12:31:52-05', '2015-02-15 12:31:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'testing and troubleshooting on the WordPress CMS', 572, '2015-02-15 12:31:53-05', '2015-02-15 12:31:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'crowdsourcing', 573, '2015-02-15 13:04:50-05', '2015-02-15 13:04:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'prize design', 574, '2015-02-15 13:20:57-05', '2015-02-15 13:20:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'technology policy', 575, '2015-02-15 13:20:57-05', '2015-02-15 13:20:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'citizen science', 576, '2015-02-15 13:20:57-05', '2015-02-15 13:20:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'crowdsourcing', 577, '2015-02-15 13:20:57-05', '2015-02-15 13:20:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'open innovation', 578, '2015-02-15 13:20:57-05', '2015-02-15 13:20:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'leadership', 579, '2015-02-15 13:20:57-05', '2015-02-15 13:20:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'program management', 580, '2015-02-15 13:20:57-05', '2015-02-15 13:20:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital stewardship', 581, '2015-02-17 08:58:28-05', '2015-02-17 08:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital curation', 582, '2015-02-17 08:58:28-05', '2015-02-17 08:58:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'strategic intelligence', 583, '2015-02-17 08:58:46-05', '2015-02-17 08:58:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'eScience', 584, '2015-02-17 09:17:32-05', '2015-02-17 09:17:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile testing', 585, '2015-02-17 09:53:29-05', '2015-02-17 09:53:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' compatability testing', 586, '2015-02-17 09:53:29-05', '2015-02-17 09:53:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Raspberry Pi', 587, '2015-02-17 12:06:40-05', '2015-02-17 12:06:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'natural hazards', 588, '2015-02-17 17:10:38-05', '2015-02-17 17:10:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Content', 589, '2015-02-18 08:50:09-05', '2015-02-18 08:50:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Mobile', 590, '2015-02-18 08:50:09-05', '2015-02-18 08:50:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HTML5', 591, '2015-02-18 08:50:09-05', '2015-02-18 08:50:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' CSS', 592, '2015-02-18 08:50:09-05', '2015-02-18 08:50:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' SASS', 593, '2015-02-18 08:50:10-05', '2015-02-18 08:50:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Umbraco', 594, '2015-02-18 08:51:09-05', '2015-02-18 08:51:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HTML5', 595, '2015-02-18 08:51:09-05', '2015-02-18 08:51:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Drupal', 596, '2015-02-18 08:51:09-05', '2015-02-18 08:51:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSS3', 597, '2015-02-18 08:51:09-05', '2015-02-18 08:51:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mobile', 598, '2015-02-18 08:52:15-05', '2015-02-18 08:52:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PHP', 599, '2015-02-18 09:54:22-05', '2015-02-18 09:54:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CMS', 600, '2015-02-18 09:55:48-05', '2015-02-18 09:55:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Photoshop', 601, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Illustrator', 602, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Illustration', 605, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Photography', 606, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sketching', 608, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Type Setting', 611, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Presentation', 607, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Poster', 610, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Visual Communication', 609, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Book Layouts', 612, '2015-02-18 10:04:37-05', '2015-02-18 10:04:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Coda', 613, '2015-02-18 12:31:19-05', '2015-02-18 12:31:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Word', 614, '2015-02-18 12:31:19-05', '2015-02-18 12:31:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'problem solver', 615, '2015-02-18 12:32:07-05', '2015-02-18 12:32:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'graphics', 616, '2015-02-18 13:13:40-05', '2015-02-18 13:13:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'outreach', 617, '2015-02-18 14:27:20-05', '2015-02-18 14:27:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Communication Strategy', 618, '2015-02-18 16:02:05-05', '2015-02-18 16:02:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Writing', 619, '2015-02-18 16:02:06-05', '2015-02-18 16:02:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 620, '2015-02-18 16:02:06-05', '2015-02-18 16:02:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategy', 621, '2015-02-18 16:02:06-05', '2015-02-18 16:02:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'search', 622, '2015-02-18 16:54:54-05', '2015-02-18 16:54:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'science', 623, '2015-02-18 20:54:29-05', '2015-02-18 20:54:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'science', 624, '2015-02-18 20:57:43-05', '2015-02-18 20:57:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Editing', 625, '2015-02-19 08:50:58-05', '2015-02-19 08:50:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Web Content Management', 626, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CommonSpot', 627, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'EpiServer', 628, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Wordpress', 629, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Human Centered Design', 630, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Photoshop', 631, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Interactive Design', 632, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Creative Suite', 633, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Management', 634, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Tumult Hype Interactive Design', 635, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Project Management', 636, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Speaking', 637, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Six Sigma Green Belt', 638, '2015-02-19 15:10:27-05', '2015-02-19 15:10:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'substantive editing', 641, '2015-02-20 08:54:03-05', '2015-02-20 08:54:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HTML', 642, '2015-02-20 08:54:03-05', '2015-02-20 08:54:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSS', 643, '2015-02-20 08:54:03-05', '2015-02-20 08:54:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PowerPoint', 644, '2015-02-20 08:54:03-05', '2015-02-20 08:54:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Excel', 645, '2015-02-20 08:54:03-05', '2015-02-20 08:54:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Django', 646, '2015-02-20 08:54:03-05', '2015-02-20 08:54:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Presentations', 647, '2015-02-25 14:47:35-05', '2015-02-25 14:47:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Ignite', 648, '2015-02-25 14:47:35-05', '2015-02-25 14:47:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Presentations', 649, '2015-02-25 14:47:36-05', '2015-02-25 14:47:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Creating training materials', 650, '2015-02-25 14:47:36-05', '2015-02-25 14:47:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Storyboard', 651, '2015-02-25 14:47:36-05', '2015-02-25 14:47:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Presenters', 653, '2015-02-25 14:47:36-05', '2015-02-25 14:47:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Widget', 654, '2015-02-26 12:20:41-05', '2015-02-26 12:20:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Software', 655, '2015-02-26 12:20:41-05', '2015-02-26 12:20:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Technology', 656, '2015-02-26 12:20:41-05', '2015-02-26 12:20:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'software develoment', 657, '2015-02-26 12:20:41-05', '2015-02-26 12:20:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'iFrame', 658, '2015-02-26 12:20:41-05', '2015-02-26 12:20:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Editorial', 659, '2015-02-26 13:29:03-05', '2015-02-26 13:29:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Collaboration', 660, '2015-02-26 13:29:03-05', '2015-02-26 13:29:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Newsltters', 661, '2015-02-26 13:29:03-05', '2015-02-26 13:29:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Writing', 662, '2015-02-26 13:29:03-05', '2015-02-26 13:29:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Learning Management System Administration', 663, '2015-02-27 11:51:52-05', '2015-02-27 11:51:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Moodle', 664, '2015-02-27 11:51:52-05', '2015-02-27 11:51:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'LMS', 665, '2015-02-27 11:51:52-05', '2015-02-27 11:51:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'LMS', 666, '2015-02-27 11:51:52-05', '2015-02-27 11:51:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Learning Management System Administration', 667, '2015-02-27 11:51:52-05', '2015-02-27 11:51:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Moodle', 668, '2015-02-27 11:51:52-05', '2015-02-27 11:51:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'e-Learning', 669, '2015-02-27 11:51:52-05', '2015-02-27 11:51:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'analysis', 670, '2015-02-27 14:58:29-05', '2015-02-27 14:58:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'food security', 671, '2015-02-27 19:43:00-05', '2015-02-27 19:43:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'environment', 672, '2015-02-27 19:43:00-05', '2015-02-27 19:43:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'planning', 673, '2015-02-27 19:43:00-05', '2015-02-27 19:43:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'climate change', 674, '2015-02-27 19:43:00-05', '2015-02-27 19:43:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'presentations', 675, '2015-02-27 19:43:00-05', '2015-02-27 19:43:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'facilitation', 676, '2015-02-27 19:43:00-05', '2015-02-27 19:43:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'graphics', 677, '2015-02-27 19:43:00-05', '2015-02-27 19:43:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Audience Engagement', 678, '2015-03-03 14:17:39-05', '2015-03-03 14:17:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Strategy', 679, '2015-03-03 14:17:39-05', '2015-03-03 14:17:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Education', 680, '2015-03-04 13:35:23-05', '2015-03-04 13:35:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Policy', 681, '2015-03-04 13:35:22-05', '2015-03-04 13:35:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Agriculture', 682, '2015-03-04 13:35:22-05', '2015-03-04 13:35:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Food', 683, '2015-03-04 13:35:22-05', '2015-03-04 13:35:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Drupal', 684, '2015-03-04 13:35:22-05', '2015-03-04 13:35:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Infographics', 685, '2015-03-04 13:35:22-05', '2015-03-04 13:35:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'counseling', 686, '2015-03-05 06:49:05-05', '2015-03-05 06:49:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 687, '2015-03-05 07:47:19-05', '2015-03-05 07:47:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'critical thinking', 688, '2015-03-05 07:47:19-05', '2015-03-05 07:47:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'graphics', 689, '2015-03-05 07:52:56-05', '2015-03-05 07:52:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'organizational culture', 690, '2015-03-05 07:52:56-05', '2015-03-05 07:52:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'thinking', 691, '2015-03-05 07:52:56-05', '2015-03-05 07:52:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'graphic design', 692, '2015-03-05 07:52:56-05', '2015-03-05 07:52:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'critical thinking', 693, '2015-03-05 07:52:57-05', '2015-03-05 07:52:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'public policy', 694, '2015-03-05 07:52:57-05', '2015-03-05 07:52:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'research', 696, '2015-03-05 07:56:21-05', '2015-03-05 07:56:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research', 697, '2015-03-05 07:56:21-05', '2015-03-05 07:56:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'technology', 695, '2015-03-05 07:56:21-05', '2015-03-05 07:56:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Internet', 698, '2015-03-05 07:56:21-05', '2015-03-05 07:56:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IBM Websphere', 699, '2015-03-05 10:06:37-05', '2015-03-05 10:06:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DotNetNuke', 700, '2015-03-05 10:06:38-05', '2015-03-05 10:06:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DNN', 701, '2015-03-05 10:06:38-05', '2015-03-05 10:06:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digital Analytics Program', 702, '2015-03-05 13:14:09-05', '2015-03-05 13:14:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Knowledge of the Digital analytics program', 703, '2015-03-05 13:14:09-05', '2015-03-05 13:14:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Mobile', 704, '2015-03-09 11:51:44-04', '2015-03-09 11:51:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Language', 705, '2015-03-09 11:51:44-04', '2015-03-09 11:51:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Archives', 706, '2015-03-09 11:51:44-04', '2015-03-09 11:51:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Museums', 707, '2015-03-09 11:51:45-04', '2015-03-09 11:51:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ruby', 708, '2015-03-09 11:51:45-04', '2015-03-09 11:51:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Data', 709, '2015-03-09 11:51:46-04', '2015-03-09 11:51:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Source', 710, '2015-03-09 11:51:46-04', '2015-03-09 11:51:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design', 711, '2015-03-09 11:51:46-04', '2015-03-09 11:51:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Product Management', 712, '2015-03-09 11:51:44-04', '2015-03-09 11:51:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software Development', 713, '2015-03-09 11:51:46-04', '2015-03-09 11:51:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'German', 714, '2015-03-09 11:51:46-04', '2015-03-09 11:51:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Spanish', 715, '2015-03-09 11:51:46-04', '2015-03-09 11:51:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'financial analysis', 716, '2015-03-09 19:14:46-04', '2015-03-09 19:14:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Imagination', 717, '2015-03-09 19:23:16-04', '2015-03-09 19:23:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Communications', 718, '2015-03-10 16:07:43-04', '2015-03-10 16:07:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hospital Operations', 808, '2015-03-27 09:04:41-04', '2015-03-27 09:04:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'San Francisco, California', 719, '2015-03-11 17:04:19-04', '2015-03-11 17:04:19-04', NULL, '{"lat":"37.77493","lon":"-122.41942","source":"geonames","sourceId":"5391959","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('skill', 'HRIS Database Management', 815, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hard-To-Fill Positions', 816, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Position Management', 817, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human Resources', 818, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 23, '2014-09-16 20:53:27-04', '2014-09-16 20:53:27-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Gaithersburg, Maryland', 395, '2015-01-15 14:26:53-05', '2015-01-15 14:26:53-05', NULL, '{"lat":"39.14344","lon":"-77.20137","source":"geonames","sourceId":"4355843","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Frederick, Maryland', 720, '2015-03-13 13:43:30-04', '2015-03-13 13:43:30-04', NULL, '{"lat":"39.41427","lon":"-77.41054","source":"geonames","sourceId":"4355585","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Digital Marketing', 721, '2015-03-16 10:13:31-04', '2015-03-16 10:13:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 722, '2015-03-16 10:13:31-04', '2015-03-16 10:13:31-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Open Opportunities', 723, '2015-03-17 12:25:40-04', '2015-03-17 12:25:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Content marketing', 724, '2015-03-17 12:25:40-04', '2015-03-17 12:25:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Storytelling', 725, '2015-03-17 12:25:40-04', '2015-03-17 12:25:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'open data', 726, '2015-03-18 08:18:13-04', '2015-03-18 08:18:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FOIA', 727, '2015-03-18 08:18:13-04', '2015-03-18 08:18:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Privacy Act ', 728, '2015-03-18 08:18:13-04', '2015-03-18 08:18:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Professional Development Trainer', 729, '2015-03-18 09:21:33-04', '2015-03-18 09:21:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Events', 730, '2015-03-18 09:21:33-04', '2015-03-18 09:21:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SharePoint', 731, '2015-03-18 13:40:00-04', '2015-03-18 13:40:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social Media ', 732, '2015-03-18 13:40:00-04', '2015-03-18 13:40:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digital Analytics Program ', 733, '2015-03-18 14:27:05-04', '2015-03-18 14:27:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'reserach', 734, '2015-03-18 16:01:57-04', '2015-03-18 16:01:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 735, '2015-03-18 16:01:57-04', '2015-03-18 16:01:57-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 736, '2015-03-18 16:05:38-04', '2015-03-18 16:05:38-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Adobe Edge', 737, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hype2', 738, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Live Cycle Designer', 739, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Content management', 740, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HTML', 741, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Muse', 742, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Dreamweaver', 743, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'iBook Aurthor', 744, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Photography', 745, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Videography', 746, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Design', 747, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Layout ', 748, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe InDesin', 749, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Compostion', 750, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Responsive Design', 751, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Magazine layout ', 752, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Newspaper layout', 753, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Exhibit Displays', 754, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social Media ', 755, '2015-03-20 07:39:51-04', '2015-03-20 07:39:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Project management', 756, '2015-03-20 08:15:41-04', '2015-03-20 08:15:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project management', 757, '2015-03-20 08:15:41-04', '2015-03-20 08:15:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'search', 758, '2015-03-23 10:16:09-04', '2015-03-23 10:16:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 759, '2015-03-23 13:36:10-04', '2015-03-23 13:36:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' web content', 760, '2015-03-23 13:36:11-04', '2015-03-23 13:36:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digital', 761, '2015-03-23 14:29:35-04', '2015-03-23 14:29:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'strategic thinking', 762, '2015-03-23 14:29:35-04', '2015-03-23 14:29:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'email marketing', 763, '2015-03-23 14:29:35-04', '2015-03-23 14:29:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Emergency Operations', 764, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Command Post Operations', 765, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Contract Management', 766, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Information Systems Management', 767, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Planning', 768, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Program Management', 769, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Training', 770, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Audit', 771, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Small Group Facilitation', 772, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Land Navigation Expert (pre-GPS!)', 773, '2015-03-24 11:06:37-04', '2015-03-24 11:06:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Contract Management', 774, '2015-03-24 11:10:01-04', '2015-03-24 11:10:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Emergency Operations', 775, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Information Systems Management', 776, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Command Post Operations', 777, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Operations', 778, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Planning', 779, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Program Management', 780, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Audit', 781, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Training', 782, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Land Navigation Expert (pre-GPS!)', 783, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Small Group Facilitation', 784, '2015-03-24 11:10:02-04', '2015-03-24 11:10:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'OpenText CMS', 785, '2015-03-25 07:42:29-04', '2015-03-25 07:42:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'WordPress', 786, '2015-03-25 07:42:29-04', '2015-03-25 07:42:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe media Server', 787, '2015-03-25 07:42:29-04', '2015-03-25 07:42:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic design for print and web', 788, '2015-03-26 12:04:10-04', '2015-03-26 12:04:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Web analytics', 789, '2015-03-26 12:04:11-04', '2015-03-26 12:04:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Project management', 790, '2015-03-26 12:04:11-04', '2015-03-26 12:04:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Usability testing', 791, '2015-03-26 12:04:11-04', '2015-03-26 12:04:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Section 508', 792, '2015-03-26 12:04:11-04', '2015-03-26 12:04:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' User research', 793, '2015-03-26 12:04:11-04', '2015-03-26 12:04:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'User research', 794, '2015-03-26 12:07:15-04', '2015-03-26 12:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'graphic design for print and web', 795, '2015-03-26 12:07:15-04', '2015-03-26 12:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' card sort', 796, '2015-03-26 12:07:15-04', '2015-03-26 12:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' usability testing', 797, '2015-03-26 12:07:15-04', '2015-03-26 12:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' wireframes', 798, '2015-03-26 12:07:15-04', '2015-03-26 12:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Tobii eye tracker', 799, '2015-03-26 12:07:15-04', '2015-03-26 12:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' web analytics', 800, '2015-03-26 12:07:15-04', '2015-03-26 12:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic design', 801, '2015-03-26 12:09:22-04', '2015-03-26 12:09:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'User research', 802, '2015-03-26 12:09:22-04', '2015-03-26 12:09:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'YouTube Video Playlist', 803, '2015-03-27 07:42:22-04', '2015-03-27 07:42:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 804, '2015-03-27 07:42:22-04', '2015-03-27 07:42:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 805, '2015-03-27 07:44:18-04', '2015-03-27 07:44:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Operations Management', 806, '2015-03-27 09:04:41-04', '2015-03-27 09:04:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Administration', 807, '2015-03-27 09:04:41-04', '2015-03-27 09:04:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Military Operations', 809, '2015-03-27 09:04:41-04', '2015-03-27 09:04:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Clinical Data Management', 810, '2015-03-27 09:04:41-04', '2015-03-27 09:04:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Resource Management', 811, '2015-03-27 09:04:41-04', '2015-03-27 09:04:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Department Reorganization', 812, '2015-03-27 09:04:41-04', '2015-03-27 09:04:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Clinic Management', 813, '2015-03-27 09:04:41-04', '2015-03-27 09:04:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Downsizing', 814, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Records Management', 819, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Databases', 820, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Operating Budgets', 821, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contractor Recruitment', 822, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Purchase Management', 828, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Planning', 829, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Change Management', 831, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Performance Improvement', 832, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Balanced Scorecard', 834, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Process Improvement', 835, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Performance Metrics', 836, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Quality Assurance', 837, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Key Performance Indicators', 838, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Employee Benefits', 841, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Veterans Benefits', 843, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Staff Supervision', 847, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Performance Reviews', 849, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customer Support', 850, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customer Relations', 852, '2015-03-27 09:04:44-04', '2015-03-27 09:04:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Veterans Affairs', 851, '2015-03-27 09:04:44-04', '2015-03-27 09:04:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cost Management', 823, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Acquisitions', 826, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Planning', 830, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lesson Planning', 844, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Dallas, Texas', 855, '2015-03-27 09:04:44-04', '2015-03-27 09:04:44-04', NULL, '{"lat":"32.78306","lon":"-96.80667","source":"geonames","sourceId":"4684888","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'Contract Management', 824, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Budget Management', 825, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Travel Management', 827, '2015-03-27 09:04:42-04', '2015-03-27 09:04:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Performance Measurement', 833, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Inspections', 839, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Accreditation', 840, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Retirement Benefits', 842, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Instructor-led Training', 845, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Staff Management', 846, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customers Satisfaction', 848, '2015-03-27 09:04:43-04', '2015-03-27 09:04:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cost Benefit', 853, '2015-03-27 09:04:44-04', '2015-03-27 09:04:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customer Service', 854, '2015-03-27 09:04:44-04', '2015-03-27 09:04:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing ', 856, '2015-03-27 19:56:24-04', '2015-03-27 19:56:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content strategy', 857, '2015-03-27 19:56:24-04', '2015-03-27 19:56:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'editorial strategy', 858, '2015-03-27 19:56:35-04', '2015-03-27 19:56:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Sepatu Murah', 859, '2015-03-28 00:37:57-04', '2015-03-28 00:37:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Agen sepatu', 860, '2015-03-28 00:37:57-04', '2015-03-28 00:37:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Jakarta, Jakarta Raya, ID', 861, '2015-03-28 00:37:57-04', '2015-03-28 00:37:57-04', NULL, '{"lat":"-6.21462","lon":"106.84513","source":"geonames","sourceId":"1642911","dstOffset":"7","gmtOffset":"7","timeZoneId":"Asia/Jakarta"}');
INSERT INTO tagentity VALUES ('skill', 'Critical thinking', 862, '2015-03-30 08:25:21-04', '2015-03-30 08:25:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' design', 863, '2015-03-30 08:25:22-04', '2015-03-30 08:25:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' writing', 864, '2015-03-30 08:25:22-04', '2015-03-30 08:25:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' graphic design', 865, '2015-03-30 08:25:22-04', '2015-03-30 08:25:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PowerPoint', 866, '2015-03-30 08:25:22-04', '2015-03-30 08:25:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Facebook', 867, '2015-03-30 08:27:54-04', '2015-03-30 08:27:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Community gardening', 868, '2015-03-30 08:27:54-04', '2015-03-30 08:27:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Duluth, Minnesota', 869, '2015-03-31 12:26:33-04', '2015-03-31 12:26:33-04', NULL, '{"lat":"46.78327","lon":"-92.10658","source":"geonames","sourceId":"5024719","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Boulder, Colorado', 870, '2015-03-31 16:55:52-04', '2015-03-31 16:55:52-04', NULL, '{"lat":"40.01499","lon":"-105.27055","source":"geonames","sourceId":"5574991","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('topic', 'serious gaming', 871, '2015-03-31 17:05:37-04', '2015-03-31 17:05:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Creative Suite', 872, '2015-03-31 17:05:37-04', '2015-03-31 17:05:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'data visualization', 873, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'gamification', 874, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'environmental science', 875, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Unity3D', 876, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Unity', 877, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Second Life', 878, '2015-03-31 17:05:37-04', '2015-03-31 17:05:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Virtual Worlds', 879, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MySQL', 880, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Design', 881, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PHP', 882, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Amazon Web Services', 883, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Moodle', 884, '2015-03-31 17:05:37-04', '2015-03-31 17:05:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Presentations', 885, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Management', 886, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic Design', 887, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data  Visualization', 888, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Wordpress', 889, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Photoshop', 890, '2015-03-31 17:05:38-04', '2015-03-31 17:05:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Virtual Reality', 891, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Security', 892, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Video Games', 893, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSS', 894, '2015-03-31 17:05:38-04', '2015-03-31 17:05:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Gamification', 895, '2015-03-31 17:05:23-04', '2015-03-31 17:05:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'SEO', 896, '2015-03-31 17:42:44-04', '2015-03-31 17:42:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'YouTube', 897, '2015-03-31 17:42:44-04', '2015-03-31 17:42:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Establishing A Data Repository', 898, '2015-04-07 14:07:04-04', '2015-04-07 14:07:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Archiving', 899, '2015-04-07 14:07:04-04', '2015-04-07 14:07:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Knowledge Management', 900, '2015-04-07 14:07:04-04', '2015-04-07 14:07:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Information Science', 901, '2015-04-07 14:07:04-04', '2015-04-07 14:07:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Open Data', 902, '2015-04-07 14:07:04-04', '2015-04-07 14:07:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Search Engine Optimization', 903, '2015-04-07 14:07:04-04', '2015-04-07 14:07:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Gaithersburg, Maryland', 904, '2015-04-07 14:07:04-04', '2015-04-07 14:07:04-04', NULL, '{"lat":"39.14344","lon":"-77.20137","source":"geonames","sourceId":"4355843","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'DAP', 905, '2015-04-07 14:22:59-04', '2015-04-07 14:22:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Javascript', 906, '2015-04-07 14:22:59-04', '2015-04-07 14:22:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'lean start-up', 907, '2015-04-07 15:11:32-04', '2015-04-07 15:11:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'project management', 908, '2015-04-07 15:11:32-04', '2015-04-07 15:11:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile apps', 909, '2015-04-07 15:11:32-04', '2015-04-07 15:11:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'product management', 910, '2015-04-07 15:11:32-04', '2015-04-07 15:11:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'start-ups', 911, '2015-04-07 15:11:32-04', '2015-04-07 15:11:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile app development', 912, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'UX', 913, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'visual design', 914, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'market research', 915, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'business development', 916, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'MVP', 917, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UX', 918, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'entrepreneurship', 919, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Product Development', 920, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Start-ups', 921, '2015-04-07 15:11:33-04', '2015-04-07 15:11:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Agile', 922, '2015-04-07 15:13:29-04', '2015-04-07 15:13:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 923, '2015-04-07 15:13:10-04', '2015-04-07 15:13:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Interpretation', 924, '2015-04-09 10:51:27-04', '2015-04-09 10:51:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Content Management', 925, '2015-04-09 10:51:27-04', '2015-04-09 10:51:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic Design for Print and Web', 926, '2015-04-09 10:51:27-04', '2015-04-09 10:51:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Environmental Education', 927, '2015-04-09 10:51:27-04', '2015-04-09 10:51:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Civic Engagement', 928, '2015-04-09 10:51:27-04', '2015-04-09 10:51:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Youth Mentor', 929, '2015-04-09 10:51:27-04', '2015-04-09 10:51:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Outdoor Leader', 930, '2015-04-09 10:51:27-04', '2015-04-09 10:51:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Microsoft Office', 931, '2015-04-09 11:33:22-04', '2015-04-09 11:33:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Morgantown, West Virginia', 932, '2015-04-13 06:48:12-04', '2015-04-13 06:48:12-04', NULL, '{"lat":"39.62953","lon":"-79.9559","source":"geonames","sourceId":"4815352","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'customer experience', 933, '2015-04-14 22:19:06-04', '2015-04-14 22:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'CX', 934, '2015-04-14 22:19:06-04', '2015-04-14 22:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'governance', 935, '2015-04-14 22:19:06-04', '2015-04-14 22:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'written communication', 936, '2015-04-14 22:19:06-04', '2015-04-14 22:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'oral communication', 937, '2015-04-14 22:19:06-04', '2015-04-14 22:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'plain language', 938, '2015-04-14 22:19:06-04', '2015-04-14 22:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'editing', 939, '2015-04-14 22:19:06-04', '2015-04-14 22:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'CX', 940, '2015-04-14 22:38:11-04', '2015-04-14 22:38:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'metrics', 941, '2015-04-14 22:38:12-04', '2015-04-14 22:38:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'innovation', 942, '2015-04-15 14:54:44-04', '2015-04-15 14:54:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'prize', 943, '2015-04-15 14:54:45-04', '2015-04-15 14:54:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'challenge', 944, '2015-04-15 14:54:45-04', '2015-04-15 14:54:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'toolkit', 945, '2015-04-15 14:54:45-04', '2015-04-15 14:54:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'USA.gov', 1169, '2015-06-01 11:16:16-04', '2015-06-01 11:16:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Spokane, Washington', 946, '2015-04-16 11:45:02-04', '2015-04-16 11:45:02-04', NULL, '{"lat":"47.65966","lon":"-117.42908","source":"geonames","sourceId":"5811696","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('skill', 'Grants', 947, '2015-04-17 13:55:32-04', '2015-04-17 13:55:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Terms of Service; Social Media; Training', 948, '2015-04-22 10:56:46-04', '2015-04-22 10:56:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social Gov Terms of Service', 949, '2015-04-22 11:15:02-04', '2015-04-22 11:15:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Jill of all trades', 950, '2015-04-22 11:35:57-04', '2015-04-22 11:35:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social networks', 951, '2015-04-22 12:26:52-04', '2015-04-22 12:26:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Baltimore, Maryland', 952, '2015-04-24 08:56:20-04', '2015-04-24 08:56:20-04', NULL, '{"lat":"39.29038","lon":"-76.61219","source":"geonames","sourceId":"4347778","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'North Bethesda, Maryland', 953, '2015-04-24 10:39:36-04', '2015-04-24 10:39:36-04', NULL, '{"lat":"39.04455","lon":"-77.11887","source":"geonames","sourceId":"4363843","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Spanish', 954, '2015-04-27 21:06:24-04', '2015-04-27 21:06:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Print', 955, '2015-04-27 21:06:38-04', '2015-04-27 21:06:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'employee engagement', 956, '2015-04-28 11:58:55-04', '2015-04-28 11:58:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'APIs', 957, '2015-04-29 11:40:37-04', '2015-04-29 11:40:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'APIs', 958, '2015-04-29 11:44:54-04', '2015-04-29 11:44:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'sponsorship', 959, '2015-04-30 13:50:07-04', '2015-04-30 13:50:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'sponsorship', 960, '2015-04-30 14:00:15-04', '2015-04-30 14:00:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'printing', 961, '2015-04-30 14:10:41-04', '2015-04-30 14:10:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'journey mapping', 962, '2015-04-30 15:35:16-04', '2015-04-30 15:35:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'personas', 963, '2015-04-30 15:35:38-04', '2015-04-30 15:35:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'agile', 964, '2015-05-01 13:35:04-04', '2015-05-01 13:35:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'python', 965, '2015-05-01 14:03:02-04', '2015-05-01 14:03:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Loading and ETL pipelines', 966, '2015-05-01 14:03:02-04', '2015-05-01 14:03:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Flask', 967, '2015-05-01 14:03:02-04', '2015-05-01 14:03:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Postgresql', 968, '2015-05-01 14:03:02-04', '2015-05-01 14:03:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Elasticsearch', 969, '2015-05-01 14:03:02-04', '2015-05-01 14:03:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'procurement', 970, '2015-05-01 14:05:56-04', '2015-05-01 14:05:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'agile', 971, '2015-05-01 14:05:30-04', '2015-05-01 14:05:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Arduino', 972, '2015-05-01 14:05:30-04', '2015-05-01 14:05:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'EMR', 973, '2015-05-01 15:19:47-04', '2015-05-01 15:19:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Community Manager', 974, '2015-05-01 16:36:40-04', '2015-05-01 16:36:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'engagement strategy management', 975, '2015-05-01 16:36:40-04', '2015-05-01 16:36:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Community management', 976, '2015-05-01 16:36:40-04', '2015-05-01 16:36:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Networking', 977, '2015-05-01 16:36:40-04', '2015-05-01 16:36:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ruby on Rails', 978, '2015-05-01 17:02:45-04', '2015-05-01 17:02:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'French', 979, '2015-05-01 17:02:45-04', '2015-05-01 17:02:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'QA', 980, '2015-05-01 17:02:45-04', '2015-05-01 17:02:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Debugging', 981, '2015-05-01 17:02:45-04', '2015-05-01 17:02:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Troubleshooting', 982, '2015-05-01 17:02:45-04', '2015-05-01 17:02:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mac productivity', 983, '2015-05-01 17:02:45-04', '2015-05-01 17:02:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mac automation', 984, '2015-05-01 17:02:46-04', '2015-05-01 17:02:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DJ', 985, '2015-05-01 17:10:26-04', '2015-05-01 17:10:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'piano', 986, '2015-05-01 17:10:26-04', '2015-05-01 17:10:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'trumpet imitation', 987, '2015-05-01 17:10:27-04', '2015-05-01 17:10:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'git', 988, '2015-05-01 17:11:45-04', '2015-05-01 17:11:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'github', 989, '2015-05-01 17:11:45-04', '2015-05-01 17:11:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'interviewing', 990, '2015-05-01 18:18:52-04', '2015-05-01 18:18:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Video ', 991, '2015-05-01 18:18:52-04', '2015-05-01 18:18:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'privacy', 992, '2015-05-02 18:43:07-04', '2015-05-02 18:43:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'brand development', 993, '2015-05-02 18:43:07-04', '2015-05-02 18:43:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'interaction design', 994, '2015-05-02 18:43:07-04', '2015-05-02 18:43:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'identity', 995, '2015-05-02 18:43:07-04', '2015-05-02 18:43:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'video production', 996, '2015-05-02 18:43:07-04', '2015-05-02 18:43:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'user experience', 997, '2015-05-02 18:43:07-04', '2015-05-02 18:43:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'illustration', 998, '2015-05-02 18:43:07-04', '2015-05-02 18:43:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'painting', 999, '2015-05-02 18:43:07-04', '2015-05-02 18:43:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customer Experience', 1000, '2015-05-03 06:51:42-04', '2015-05-03 06:51:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Portfolio Management', 1001, '2015-05-03 06:51:42-04', '2015-05-03 06:51:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Audiovisual Production', 1002, '2015-05-04 09:55:03-04', '2015-05-04 09:55:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'electronic document management', 1003, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'tracking systems', 1004, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'open financial exchange', 1005, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'public services', 1006, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'scheduling software', 1007, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'health information technologies', 1009, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'networking and transparency', 1010, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'bleeding edge technologies ', 1011, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'optical character recognition', 1012, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile app develoment ', 1013, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'market research ', 1014, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'big data analytics ', 1015, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'open government ', 1008, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'automation', 1016, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'project management', 1017, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'data mining', 1018, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'software design ', 1019, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'business development ', 1020, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'entrepreneurship ', 1021, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Big data analytics', 1022, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'leadership', 1023, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software design', 1024, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software architecture ', 1025, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Conflict Resolution', 1026, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Programming', 1027, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Problem solving', 1028, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Procedure and process management', 1029, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project management', 1030, '2015-05-05 11:23:03-04', '2015-05-05 11:23:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Interaction design ', 1031, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Prototype development', 1032, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research ', 1033, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Information mapping', 1034, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web management', 1035, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Stakeholder management and outreach', 1036, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Technical communication', 1037, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Oral and written communication', 1038, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Structured writing techniques', 1039, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mentoring', 1040, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Agile development', 1041, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Marketing', 1042, '2015-05-05 11:23:04-04', '2015-05-05 11:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'portfolio management ', 1043, '2015-05-05 11:55:38-04', '2015-05-05 11:55:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'user experience design ', 1044, '2015-05-05 11:55:38-04', '2015-05-05 11:55:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'information architecture ', 1045, '2015-05-05 11:55:38-04', '2015-05-05 11:55:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'project management ', 1046, '2015-05-05 11:55:38-04', '2015-05-05 11:55:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'optical character recognition', 1047, '2015-05-05 11:55:38-04', '2015-05-05 11:55:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'open financial exchange', 1048, '2015-05-05 11:55:38-04', '2015-05-05 11:55:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'tracking systems', 1049, '2015-05-05 11:55:38-04', '2015-05-05 11:55:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'health information technologies', 1056, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'networking and transparency', 1060, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software design ', 1067, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Programming', 1071, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project management', 1074, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'electronic document management', 1050, '2015-05-05 11:55:38-04', '2015-05-05 11:55:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'public services', 1057, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software architecture ', 1068, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'scheduling software', 1051, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'automation', 1052, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'software development', 1053, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'open government', 1054, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'data mining', 1058, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'big data analytics ', 1059, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'project management ', 1061, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'entrepreneurship ', 1063, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Agile development', 1070, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Interaction design ', 1069, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Problem solving', 1073, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Procedure and process management', 1075, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Information mapping', 1078, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Technical communication', 1080, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Marketing', 1082, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'bleeding edge technologies ', 1055, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile app develoment ', 1062, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'leadership', 1065, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Prototype development', 1076, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Stakeholder management and outreach', 1079, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mentoring', 1083, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Baltimore, Maryland', 1084, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, '{"lat":"39.29038","lon":"-76.61219","source":"geonames","sourceId":"4347778","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'cyber security', 1064, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Big data analytics', 1066, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Conflict Resolution', 1072, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web management', 1077, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Oral and written communication', 1081, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Structured writing techniques', 1085, '2015-05-05 11:55:39-04', '2015-05-05 11:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Dayton, Ohio', 1086, '2015-05-05 12:57:51-04', '2015-05-05 12:57:51-04', NULL, '{"lat":"39.75895","lon":"-84.19161","source":"geonames","sourceId":"4509884","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Raleigh, North Carolina', 1087, '2015-05-05 12:58:08-04', '2015-05-05 12:58:08-04', NULL, '{"lat":"35.7721","lon":"-78.63861","source":"geonames","sourceId":"4487042","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'html', 1088, '2015-05-05 12:59:08-04', '2015-05-05 12:59:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' css', 1089, '2015-05-05 12:59:08-04', '2015-05-05 12:59:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'javascript', 1090, '2015-05-05 12:59:08-04', '2015-05-05 12:59:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'django', 1091, '2015-05-05 12:59:08-04', '2015-05-05 12:59:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'jekyll', 1092, '2015-05-05 12:59:08-04', '2015-05-05 12:59:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'law', 1093, '2015-05-05 12:59:47-04', '2015-05-05 12:59:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' security', 1094, '2015-05-05 13:00:26-04', '2015-05-05 13:00:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' privacy', 1095, '2015-05-05 12:59:47-04', '2015-05-05 12:59:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'interaction design', 1096, '2015-05-05 13:00:26-04', '2015-05-05 13:00:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' information architecture', 1097, '2015-05-05 13:00:26-04', '2015-05-05 13:00:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Python', 1098, '2015-05-05 13:00:04-04', '2015-05-05 13:00:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Oracle', 1099, '2015-05-05 13:00:04-04', '2015-05-05 13:00:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web scraping', 1100, '2015-05-05 13:00:04-04', '2015-05-05 13:00:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data conversion', 1101, '2015-05-05 13:00:04-04', '2015-05-05 13:00:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Diversity', 1102, '2015-05-05 13:01:01-04', '2015-05-05 13:01:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Usability test', 1103, '2015-05-06 01:15:38-04', '2015-05-06 01:15:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Fiscal compliance', 1104, '2015-05-06 08:17:24-04', '2015-05-06 08:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' leadership ', 1105, '2015-05-06 08:17:24-04', '2015-05-06 08:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'recruiting grants management', 1106, '2015-05-06 08:17:24-04', '2015-05-06 08:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'R ', 1107, '2015-05-07 18:25:27-04', '2015-05-07 18:25:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'identity management', 1108, '2015-05-11 12:44:30-04', '2015-05-11 12:44:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'urban computing', 1109, '2015-05-11 12:44:30-04', '2015-05-11 12:44:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'California state spending data', 1110, '2015-05-12 16:24:09-04', '2015-05-12 16:24:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'python', 1111, '2015-05-12 16:23:06-04', '2015-05-12 16:23:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'College Park, Maryland', 1112, '2015-05-15 15:31:17-04', '2015-05-15 15:31:17-04', NULL, '{"lat":"38.98067","lon":"-76.93692","source":"geonames","sourceId":"4351977","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Communication', 1113, '2015-05-19 10:01:46-04', '2015-05-19 10:01:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' writing', 1114, '2015-05-19 10:01:46-04', '2015-05-19 10:01:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' self-starter', 1115, '2015-05-19 10:01:46-04', '2015-05-19 10:01:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' highly organized', 1116, '2015-05-19 10:01:46-04', '2015-05-19 10:01:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' collaborator', 1117, '2015-05-19 10:01:46-04', '2015-05-19 10:01:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'data management policy', 1118, '2015-05-19 10:09:33-04', '2015-05-19 10:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Communication', 1119, '2015-05-19 10:09:33-04', '2015-05-19 10:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' writing', 1120, '2015-05-19 10:09:33-04', '2015-05-19 10:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' collaborator', 1121, '2015-05-19 10:09:33-04', '2015-05-19 10:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' self-starter', 1122, '2015-05-19 10:09:33-04', '2015-05-19 10:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile apps', 1123, '2015-05-20 09:24:34-04', '2015-05-20 09:24:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'iOS developer', 1124, '2015-05-20 09:24:34-04', '2015-05-20 09:24:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Tableau', 1125, '2015-05-20 09:24:34-04', '2015-05-20 09:24:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile apps', 1126, '2015-05-20 09:28:48-04', '2015-05-20 09:28:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Acquisition', 1127, '2015-05-20 16:12:17-04', '2015-05-20 16:12:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cisco', 1128, '2015-05-20 16:12:17-04', '2015-05-20 16:12:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Microsoft Licensing', 1129, '2015-05-20 16:12:17-04', '2015-05-20 16:12:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'IT Spending', 1130, '2015-05-20 16:12:17-04', '2015-05-20 16:12:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Esri Geospatial', 1131, '2015-05-20 16:12:17-04', '2015-05-20 16:12:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Strategic Sourcing', 1132, '2015-05-20 16:12:17-04', '2015-05-20 16:12:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' IT end user devices', 1133, '2015-05-20 16:12:17-04', '2015-05-20 16:12:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1134, '2015-05-21 13:11:56-04', '2015-05-21 13:11:56-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Psychology of Design', 1135, '2015-05-26 07:34:38-04', '2015-05-26 07:34:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'qualitative analysis', 1136, '2015-05-26 07:34:38-04', '2015-05-26 07:34:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'statistics', 1137, '2015-05-26 07:34:38-04', '2015-05-26 07:34:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Plain Language', 1138, '2015-05-26 07:40:15-04', '2015-05-26 07:40:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Education', 1139, '2015-05-26 13:01:34-04', '2015-05-26 13:01:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Development', 1140, '2015-05-26 13:01:34-04', '2015-05-26 13:01:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open Data', 1141, '2015-05-26 13:02:03-04', '2015-05-26 13:02:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Learning and Development ', 1142, '2015-05-26 13:02:03-04', '2015-05-26 13:02:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Twitter', 1143, '2015-05-26 15:03:16-04', '2015-05-26 15:03:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Kids.gov', 1144, '2015-05-26 15:03:16-04', '2015-05-26 15:03:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Chief Data Officer', 1145, '2015-05-27 14:55:15-04', '2015-05-27 14:55:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Enterprise Architect', 1146, '2015-05-27 14:55:15-04', '2015-05-27 14:55:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Management', 1147, '2015-05-27 14:55:15-04', '2015-05-27 14:55:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Federal Information Security Management Act', 1148, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'National Institute of Standards and Technology (NIST)', 1149, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Office of Management and Budget (OMB)', 1150, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Federal Information Processing Standards (FIPS)', 1151, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Federal Cyber Security Policy', 1152, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '•	Recent (within 5 years) strong experience writing California state policy and procedures', 1153, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cyber Security experience or training', 1154, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '•	Knowledge in information and information system assurance activities as set by California state mandates. These would include but not limited to governing entities such as National Institute of Standards and Technology (NIST)', 1156, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '•	Ability to collaborate across the ASOC and USDA agencies to ensure research is conducted and integration of business requirements', 1155, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CISSP or equivalent', 1157, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '•	Strong knowledge of APA or MPA Style Guide', 1158, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' grammatical standards', 1159, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '•	Must possess an background clearance of a National Agency Check with Inquiries', 1160, '2015-05-28 13:29:46-04', '2015-05-28 13:29:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'knowledge of information and information system assurance activities as set by California state mandates', 1161, '2015-05-29 14:29:59-04', '2015-05-29 14:29:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ability to collaborate', 1162, '2015-05-29 14:29:59-04', '2015-05-29 14:29:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Must possess a background clearance of a National Agency ', 1163, '2015-05-29 14:29:59-04', '2015-05-29 14:29:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'knowledge of information and information system assurance activities as set by California state mandates', 1164, '2015-06-01 10:45:24-04', '2015-06-01 10:45:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strong knowledge of APA or MPA style guides', 1165, '2015-06-01 10:45:24-04', '2015-06-01 10:45:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Recent experience writing California state policy and procedures', 1166, '2015-06-01 11:04:56-04', '2015-06-01 11:04:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Knowledge of information and information system assurance activities as set by California state mandate', 1167, '2015-06-01 11:04:56-04', '2015-06-01 11:04:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Experience using the APA or MPA style guide', 1168, '2015-06-01 11:04:56-04', '2015-06-01 11:04:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' testing', 1170, '2015-06-01 11:16:16-04', '2015-06-01 11:16:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' mobile', 1171, '2015-06-01 11:16:16-04', '2015-06-01 11:16:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'compatability testing', 1172, '2015-06-01 11:16:16-04', '2015-06-01 11:16:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'collaboration tools', 1173, '2015-06-02 08:13:09-04', '2015-06-02 08:13:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Sourcing', 1174, '2015-06-02 15:54:08-04', '2015-06-02 15:54:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'business administration', 1175, '2015-06-03 11:58:52-04', '2015-06-03 11:58:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Secretarial Services', 1176, '2015-06-03 11:58:52-04', '2015-06-03 11:58:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Long Beach, California', 1177, '2015-06-03 11:58:52-04', '2015-06-03 11:58:52-04', NULL, '{"lat":"33.76696","lon":"-118.18923","source":"geonames","sourceId":5367929,"dstOffset":-7,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('skill', 'Business Administration ', 1178, '2015-06-03 12:10:10-04', '2015-06-03 12:10:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'please discard', 1179, '2015-06-03 15:19:08-04', '2015-06-03 15:19:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Federal Judicial Center', 1180, '2015-06-03 16:45:56-04', '2015-06-03 16:45:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Defense Language Institute Foreign Language Center DLIFLC', 1181, '2015-06-03 16:51:08-04', '2015-06-03 16:51:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Portland, Oregon', 1183, '2015-06-03 17:31:58-04', '2015-06-03 17:31:58-04', NULL, '{"lat":"45.52345","lon":"-122.67621","source":"geonames","sourceId":5746545,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('skill', 'paralegal', 1184, '2015-06-03 17:39:44-04', '2015-06-03 17:39:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'St. Louis, Missouri', 1185, '2015-06-03 17:39:44-04', '2015-06-03 17:39:44-04', NULL, '{"lat":"38.62727","lon":"-90.19789","source":"geonames","sourceId":4407066,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'Water Safety', 1186, '2015-06-03 17:43:41-04', '2015-06-03 17:43:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Paralegal', 1187, '2015-06-03 17:43:41-04', '2015-06-03 17:43:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'data management', 1188, '2015-06-03 17:43:41-04', '2015-06-03 17:43:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'deployment', 1189, '2015-06-03 17:43:41-04', '2015-06-03 17:43:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Java', 1190, '2015-06-03 17:46:36-04', '2015-06-03 17:46:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Grails', 1191, '2015-06-03 17:46:36-04', '2015-06-03 17:46:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Ames, Iowa', 1192, '2015-06-03 17:46:36-04', '2015-06-03 17:46:36-04', NULL, '{"lat":"42.03471","lon":"-93.61994","source":"geonames","sourceId":4846834,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Sunbury, Pennsylvania', 1193, '2015-06-03 18:37:59-04', '2015-06-03 18:37:59-04', NULL, '{"lat":"40.86259","lon":"-76.79441","source":"geonames","sourceId":5214814,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Alexandria, Virginia', 1194, '2015-06-03 20:20:20-04', '2015-06-03 20:20:20-04', NULL, '{"lat":"38.80484","lon":"-77.04692","source":"geonames","sourceId":4744091,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Turkey', 1273, '2015-06-12 09:13:01-04', '2015-06-12 09:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Middle East', 1274, '2015-06-12 09:13:01-04', '2015-06-12 09:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Analysis', 1275, '2015-06-12 10:29:01-04', '2015-06-12 10:29:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Louisville, Kentucky', 1195, '2015-06-04 07:06:40-04', '2015-06-04 07:06:40-04', NULL, '{"lat":"38.25424","lon":"-85.75941","source":"geonames","sourceId":4299276,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/Kentucky/Louisville"}');
INSERT INTO tagentity VALUES ('skill', 'Project Management', 1196, '2015-06-04 07:43:53-04', '2015-06-04 07:43:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Quality Management', 1197, '2015-06-04 07:43:53-04', '2015-06-04 07:43:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mathematics', 1198, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SPSS', 1199, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SQL', 1200, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SAS', 1201, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Java Script', 1202, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'VB Script', 1203, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'C#', 1204, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Android', 1205, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'iOS', 1206, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'LINUX', 1207, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Idaho Falls, Idaho', 1208, '2015-06-04 10:08:28-04', '2015-06-04 10:08:28-04', NULL, '{"lat":"43.46658","lon":"-112.03414","source":"geonames","sourceId":5596475,"dstOffset":-6,"gmtOffset":-7,"timeZoneId":"America/Boise"}');
INSERT INTO tagentity VALUES ('topic', 'caption', 1209, '2015-06-04 10:57:10-04', '2015-06-04 10:57:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'write', 1210, '2015-06-04 10:57:10-04', '2015-06-04 10:57:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 1211, '2015-06-04 10:57:10-04', '2015-06-04 10:57:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 1212, '2015-06-04 10:57:10-04', '2015-06-04 10:57:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1213, '2015-06-04 10:57:10-04', '2015-06-04 10:57:10-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Silver Spring, Maryland', 1214, '2015-06-04 10:57:10-04', '2015-06-04 10:57:10-04', NULL, '{"lat":"38.99067","lon":"-77.02609","source":"geonames","sourceId":4369596,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Arlington, Virginia', 1215, '2015-06-04 10:57:10-04', '2015-06-04 10:57:10-04', NULL, '{"lat":"38.88101","lon":"-77.10428","source":"geonames","sourceId":4744709,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 1216, '2015-06-04 10:57:10-04', '2015-06-04 10:57:10-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":4367175,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'manufacturing', 1217, '2015-06-04 11:18:01-04', '2015-06-04 11:18:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research', 1218, '2015-06-04 11:28:13-04', '2015-06-04 11:28:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Spatial Analysis', 1219, '2015-06-04 11:28:13-04', '2015-06-04 11:28:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'GIS', 1220, '2015-06-04 11:28:13-04', '2015-06-04 11:28:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Geospatial Analysis', 1221, '2015-06-04 11:34:36-04', '2015-06-04 11:34:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Mapping', 1222, '2015-06-04 11:34:36-04', '2015-06-04 11:34:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cartography', 1223, '2015-06-04 11:34:36-04', '2015-06-04 11:34:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Maker Faire', 1224, '2015-06-04 11:36:21-04', '2015-06-04 11:36:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Video production', 1225, '2015-06-04 11:36:21-04', '2015-06-04 11:36:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1226, '2015-06-04 11:36:21-04', '2015-06-04 11:36:21-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Operations Research', 1227, '2015-06-04 12:42:25-04', '2015-06-04 12:42:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Chemistry', 1228, '2015-06-04 12:42:25-04', '2015-06-04 12:42:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Editing', 1229, '2015-06-04 14:54:31-04', '2015-06-04 14:54:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Planning', 1230, '2015-06-04 15:11:24-04', '2015-06-04 15:11:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Leadership', 1231, '2015-06-04 15:12:25-04', '2015-06-04 15:12:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'technology', 1232, '2015-06-04 15:12:25-04', '2015-06-04 15:12:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Communications', 1233, '2015-06-04 15:12:25-04', '2015-06-04 15:12:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Foreign Affairs', 1234, '2015-06-04 15:12:25-04', '2015-06-04 15:12:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Latin America', 1235, '2015-06-04 15:12:50-04', '2015-06-04 15:12:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Briefing', 1236, '2015-06-04 15:13:50-04', '2015-06-04 15:13:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Internal Communications', 1237, '2015-06-04 15:13:50-04', '2015-06-04 15:13:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic Design', 1238, '2015-06-04 17:03:35-04', '2015-06-04 17:03:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Copyright', 1239, '2015-06-05 00:43:13-04', '2015-06-05 00:43:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Garmisch-Partenkirchen, Bavaria, DE', 1240, '2015-06-05 00:43:13-04', '2015-06-05 00:43:13-04', NULL, '{"lat":"47.49209","lon":"11.09576","source":"geonames","sourceId":2922530,"dstOffset":2,"gmtOffset":1,"timeZoneId":"Europe/Berlin"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1241, '2015-06-05 16:31:26-04', '2015-06-05 16:31:26-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Seattle, Washington', 1242, '2015-06-08 13:07:47-04', '2015-06-08 13:07:47-04', NULL, '{"lat":"47.60621","lon":"-122.33207","source":"geonames","sourceId":5809844,"dstOffset":-7,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('location', 'Asheville, North Carolina', 1243, '2015-06-09 07:30:01-04', '2015-06-09 07:30:01-04', NULL, '{"lat":"35.60095","lon":"-82.55402","source":"geonames","sourceId":4453066,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1244, '2015-06-09 13:03:12-04', '2015-06-09 13:03:12-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('topic', 'Maker Faire', 1245, '2015-06-09 13:06:28-04', '2015-06-09 13:06:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 1246, '2015-06-09 13:06:28-04', '2015-06-09 13:06:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1247, '2015-06-09 13:06:28-04', '2015-06-09 13:06:28-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Maker Faire', 1248, '2015-06-09 14:00:55-04', '2015-06-09 14:00:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social media', 1249, '2015-06-09 14:00:55-04', '2015-06-09 14:00:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1250, '2015-06-09 14:00:55-04', '2015-06-09 14:00:55-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'intrapreneurship', 1251, '2015-06-10 11:50:21-04', '2015-06-10 11:50:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Testing', 1252, '2015-06-10 11:50:21-04', '2015-06-10 11:50:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'We manage grants and don''t have an easy visual way of seeing the status of those grants on a regular basis. We want someone to help look through our data', 1253, '2015-06-10 21:34:53-04', '2015-06-10 21:34:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' experience with databases', 1254, '2015-06-10 21:34:53-04', '2015-06-10 21:34:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'interviewing', 1255, '2015-06-10 21:34:53-04', '2015-06-10 21:34:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'data visualization', 1256, '2015-06-10 21:34:53-04', '2015-06-10 21:34:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Graphic and Data visualization for managers to easily see grant status.', 1257, '2015-06-10 21:36:52-04', '2015-06-10 21:36:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'new employees', 1258, '2015-06-11 12:05:39-04', '2015-06-11 12:05:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'sharing information', 1259, '2015-06-11 12:05:39-04', '2015-06-11 12:05:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'creating community', 1260, '2015-06-11 12:05:39-04', '2015-06-11 12:05:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'ideation platform', 1261, '2015-06-11 12:05:39-04', '2015-06-11 12:05:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'email', 1363, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'event management', 1365, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Atlanta, Georgia', 1262, '2015-06-11 13:05:03-04', '2015-06-11 13:05:03-04', NULL, '{"lat":"33.749","lon":"-84.38798","source":"geonames","sourceId":4180439,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Atlanta, Georgia', 1263, '2015-06-11 13:07:37-04', '2015-06-11 13:07:37-04', NULL, '{"lat":"33.749","lon":"-84.38798","source":"geonames","sourceId":4180439,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'detail oriented', 1264, '2015-06-11 13:33:12-04', '2015-06-11 13:33:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MS Office', 1265, '2015-06-11 13:33:12-04', '2015-06-11 13:33:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Turkish', 1266, '2015-06-12 09:09:04-04', '2015-06-12 09:09:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Affairs', 1267, '2015-06-12 09:09:04-04', '2015-06-12 09:09:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Media Relations', 1268, '2015-06-12 09:11:55-04', '2015-06-12 09:11:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Translation', 1269, '2015-06-12 09:11:55-04', '2015-06-12 09:11:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Foreign Direct Investment', 1270, '2015-06-12 09:13:01-04', '2015-06-12 09:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'International Trade', 1271, '2015-06-12 09:13:01-04', '2015-06-12 09:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Diplomacy', 1272, '2015-06-12 09:13:01-04', '2015-06-12 09:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'asset management', 1276, '2015-06-12 11:35:27-04', '2015-06-12 11:35:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'real estate development', 1277, '2015-06-12 11:35:27-04', '2015-06-12 11:35:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'construction', 1278, '2015-06-12 11:35:28-04', '2015-06-12 11:35:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'architecture', 1279, '2015-06-12 11:35:28-04', '2015-06-12 11:35:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Chicago, Illinois', 1280, '2015-06-12 11:35:28-04', '2015-06-12 11:35:28-04', NULL, '{"lat":"41.85003","lon":"-87.65005","source":"geonames","sourceId":4887398,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'employee engagement', 1281, '2015-06-13 10:26:26-04', '2015-06-13 10:26:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'jobs', 1282, '2015-06-13 10:28:40-04', '2015-06-13 10:28:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'system change', 1283, '2015-06-13 10:28:40-04', '2015-06-13 10:28:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'innovation', 1284, '2015-06-13 10:28:40-04', '2015-06-13 10:28:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'interpreting specific data needs into formats that can be used by data experts', 1285, '2015-06-13 10:33:23-04', '2015-06-13 10:33:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'infographics', 1286, '2015-06-13 10:36:26-04', '2015-06-13 10:36:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'dashboards', 1287, '2015-06-13 10:36:26-04', '2015-06-13 10:36:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HTML', 1288, '2015-06-15 08:14:26-04', '2015-06-15 08:14:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSS', 1290, '2015-06-15 08:14:26-04', '2015-06-15 08:14:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'WordPress', 1291, '2015-06-15 08:14:26-04', '2015-06-15 08:14:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Drupal', 1292, '2015-06-15 08:14:26-04', '2015-06-15 08:14:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Front-End Development', 1289, '2015-06-15 08:14:26-04', '2015-06-15 08:14:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'calendar', 1293, '2015-06-15 10:10:16-04', '2015-06-15 10:10:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'user experience', 1294, '2015-06-15 10:10:16-04', '2015-06-15 10:10:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'New York City, New York', 1295, '2015-06-15 14:55:13-04', '2015-06-15 14:55:13-04', NULL, '{"lat":"40.71427","lon":"-74.00597","source":"geonames","sourceId":5128581,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'javascript', 1296, '2015-06-15 14:55:57-04', '2015-06-15 14:55:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'css', 1297, '2015-06-15 14:55:57-04', '2015-06-15 14:55:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'html', 1298, '2015-06-15 14:55:57-04', '2015-06-15 14:55:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile apps', 1299, '2015-06-15 15:58:11-04', '2015-06-15 15:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' mobile websites', 1300, '2015-06-15 15:58:11-04', '2015-06-15 15:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' native apps', 1301, '2015-06-15 15:58:11-04', '2015-06-15 15:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' mobile product promotion', 1302, '2015-06-15 15:58:11-04', '2015-06-15 15:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' project management', 1303, '2015-06-15 15:58:11-04', '2015-06-15 15:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' marketing', 1304, '2015-06-15 15:58:11-04', '2015-06-15 15:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'data analysis', 1305, '2015-06-15 15:58:11-04', '2015-06-15 15:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social Media Mar', 1306, '2015-06-16 10:10:20-04', '2015-06-16 10:10:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Internal Communications', 1307, '2015-06-16 10:10:20-04', '2015-06-16 10:10:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Virtual Collaboration', 1308, '2015-06-16 10:10:20-04', '2015-06-16 10:10:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Innovative Tech', 1309, '2015-06-16 10:10:20-04', '2015-06-16 10:10:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe InDesign', 1310, '2015-06-16 10:10:20-04', '2015-06-16 10:10:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Facilitation', 1311, '2015-06-16 10:11:09-04', '2015-06-16 10:11:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Content Management', 1312, '2015-06-16 10:15:01-04', '2015-06-16 10:15:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social Media', 1313, '2015-06-16 10:15:01-04', '2015-06-16 10:15:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sharepoint', 1314, '2015-06-16 10:15:01-04', '2015-06-16 10:15:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Innovative Technologies', 1315, '2015-06-16 10:24:22-04', '2015-06-16 10:24:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social Media Marketing', 1316, '2015-06-16 10:24:22-04', '2015-06-16 10:24:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Citizen Science', 1317, '2015-06-16 10:24:22-04', '2015-06-16 10:24:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Presentation Design', 1318, '2015-06-16 10:24:22-04', '2015-06-16 10:24:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Web Content Curation', 1319, '2015-06-16 10:24:22-04', '2015-06-16 10:24:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Conflict Resolution', 1320, '2015-06-16 10:24:22-04', '2015-06-16 10:24:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Denver, Colorado', 1321, '2015-06-16 14:48:17-04', '2015-06-16 14:48:17-04', NULL, '{"lat":"39.73915","lon":"-104.9847","source":"geonames","sourceId":5419384,"dstOffset":-6,"gmtOffset":-7,"timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('skill', 'Marketing communications', 1322, '2015-06-16 16:07:49-04', '2015-06-16 16:07:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Draft Newsletter', 1323, '2015-06-16 17:17:17-04', '2015-06-16 17:17:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing short conversational copy', 1324, '2015-06-16 17:17:17-04', '2015-06-16 17:17:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Editing', 1325, '2015-06-16 17:17:17-04', '2015-06-16 17:17:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', '508 compliance', 1326, '2015-06-16 17:39:50-04', '2015-06-16 17:39:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'accessibility', 1327, '2015-06-16 17:39:50-04', '2015-06-16 17:39:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Familiarity with Section 508 Guidelines', 1328, '2015-06-16 17:39:50-04', '2015-06-16 17:39:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Familiarity with Adobe Acrobat', 1329, '2015-06-16 17:39:50-04', '2015-06-16 17:39:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Creativity', 1330, '2015-06-16 17:39:50-04', '2015-06-16 17:39:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile apps', 1331, '2015-06-17 11:22:27-04', '2015-06-17 11:22:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' mobile websites', 1332, '2015-06-17 11:22:27-04', '2015-06-17 11:22:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' native apps', 1333, '2015-06-17 11:22:27-04', '2015-06-17 11:22:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' ios', 1334, '2015-06-17 11:22:27-04', '2015-06-17 11:22:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' android', 1335, '2015-06-17 11:22:27-04', '2015-06-17 11:22:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'html5', 1336, '2015-06-17 11:22:27-04', '2015-06-17 11:22:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' research', 1337, '2015-06-17 11:22:27-04', '2015-06-17 11:22:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 1338, '2015-06-17 11:22:27-04', '2015-06-17 11:22:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'us', 1339, '2015-06-17 13:58:32-04', '2015-06-17 13:58:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HTML', 1340, '2015-06-17 13:58:32-04', '2015-06-17 13:58:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'accounting', 1341, '2015-06-17 13:58:32-04', '2015-06-17 13:58:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Contracting Officer Represenative', 1342, '2015-06-17 14:07:50-04', '2015-06-17 14:07:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Project Management', 1343, '2015-06-17 14:07:50-04', '2015-06-17 14:07:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Contracting Officer Represenative', 1344, '2015-06-17 14:35:30-04', '2015-06-17 14:35:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Project Management', 1345, '2015-06-17 14:35:30-04', '2015-06-17 14:35:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Winchester, Virginia', 1346, '2015-06-17 14:51:08-04', '2015-06-17 14:51:08-04', NULL, '{"lat":"39.18566","lon":"-78.16333","source":"geonames","sourceId":4794120,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('topic', 'advanced manufacturing', 1347, '2015-06-17 15:00:57-04', '2015-06-17 15:00:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' web', 1348, '2015-06-17 15:00:57-04', '2015-06-17 15:00:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social media', 1349, '2015-06-17 15:00:57-04', '2015-06-17 15:00:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Innovation', 1350, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'R&D', 1351, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Technology', 1352, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Manufacturing', 1353, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 1354, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' graphics', 1355, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' social media', 1356, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' producer', 1357, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' editing', 1358, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' video', 1359, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'director', 1360, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'equipment handler', 1361, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'telephone calls', 1362, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'correspondence', 1364, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1366, '2015-06-18 12:30:40-04', '2015-06-18 12:30:40-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Chrome', 1367, '2015-06-18 13:32:07-04', '2015-06-18 13:32:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Publisher', 1368, '2015-06-18 13:32:07-04', '2015-06-18 13:32:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Problem Solving', 1369, '2015-06-18 13:32:07-04', '2015-06-18 13:32:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Event Planning', 1370, '2015-06-18 13:32:07-04', '2015-06-18 13:32:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic Design', 1371, '2015-06-18 13:36:23-04', '2015-06-18 13:36:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cat Herding', 1372, '2015-06-18 13:36:23-04', '2015-06-18 13:36:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Anchorage, Alaska', 1373, '2015-06-18 13:36:23-04', '2015-06-18 13:36:23-04', NULL, '{"lat":"61.21806","lon":"-149.90028","source":"geonames","sourceId":5879400,"dstOffset":-8,"gmtOffset":-9,"timeZoneId":"America/Anchorage"}');
INSERT INTO tagentity VALUES ('skill', 'photoshop ', 1374, '2015-06-19 09:24:09-04', '2015-06-19 09:24:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'swiming', 1375, '2015-06-19 09:24:09-04', '2015-06-19 09:24:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'China, Maine', 1376, '2015-06-19 09:27:54-04', '2015-06-19 09:27:54-04', NULL, '{"lat":"44.47868","lon":"-69.51726","source":"geonames","sourceId":4960817,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('agency', 'AbilityOne Commission', 1377, '2015-06-19 10:58:49-04', '2015-06-19 10:58:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Trusted Teser- CBP Certified for Section 508 Manual Testing Web and Software', 1378, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ISTQB Certified Software Tester', 1379, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ITIL V3 Certified', 1380, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Experience with Procurement', 1381, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Section 508 Software and Web Standards', 1382, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Test script creation', 1383, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Accessibility Features WIn OS', 1384, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Vendor Remediation', 1385, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Accessibility features- IOS', 1386, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Outreach for Section 508', 1387, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mobile Testing', 1388, '2015-06-19 12:04:03-04', '2015-06-19 12:04:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Section 508 Certified Trusted Tester', 1389, '2015-06-19 12:10:24-04', '2015-06-19 12:10:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ITIL v 3 Certified', 1390, '2015-06-19 12:10:24-04', '2015-06-19 12:10:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ASTQB Certified Tester', 1391, '2015-06-19 12:10:24-04', '2015-06-19 12:10:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digital Services', 1392, '2015-06-22 10:28:42-04', '2015-06-22 10:28:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Innovative Acquisitions - IT Services', 1393, '2015-06-22 10:28:42-04', '2015-06-22 10:28:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'communications strategy', 1394, '2015-06-22 13:24:53-04', '2015-06-22 13:24:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'writing', 1395, '2015-06-22 13:24:53-04', '2015-06-22 13:24:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'multimedia', 1396, '2015-06-22 13:24:53-04', '2015-06-22 13:24:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 1397, '2015-06-22 13:24:53-04', '2015-06-22 13:24:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'editing', 1398, '2015-06-22 13:24:53-04', '2015-06-22 13:24:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Reston, Virginia', 1399, '2015-06-22 13:24:53-04', '2015-06-22 13:24:53-04', NULL, '{"lat":"38.96872","lon":"-77.3411","source":"geonames","sourceId":4781530,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Emerging Threats', 1400, '2015-06-22 15:06:25-04', '2015-06-22 15:06:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Emerging Technologies', 1401, '2015-06-22 15:06:25-04', '2015-06-22 15:06:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social Engineering', 1402, '2015-06-22 15:06:25-04', '2015-06-22 15:06:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FISMA', 1403, '2015-06-22 15:06:25-04', '2015-06-22 15:06:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cybersecurity', 1404, '2015-06-22 15:06:25-04', '2015-06-22 15:06:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human Centered Design', 1405, '2015-06-22 15:06:25-04', '2015-06-22 15:06:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Woodlawn, Maryland', 1406, '2015-06-22 15:06:25-04', '2015-06-22 15:06:25-04', NULL, '{"lat":"39.32288","lon":"-76.72803","source":"geonames","sourceId":4374054,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Woodlawn, Maryland', 1407, '2015-06-23 11:40:00-04', '2015-06-23 11:40:00-04', NULL, '{"lat":"39.32288","lon":"-76.72803","source":"geonames","sourceId":4374054,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Newsletters', 1408, '2015-06-23 11:50:10-04', '2015-06-23 11:50:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social media', 1409, '2015-06-23 22:54:22-04', '2015-06-23 22:54:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital strategy', 1410, '2015-06-23 22:54:22-04', '2015-06-23 22:54:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital engagement', 1411, '2015-06-23 22:54:22-04', '2015-06-23 22:54:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'history', 1412, '2015-06-23 22:54:36-04', '2015-06-23 22:54:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'art', 1413, '2015-06-23 22:54:36-04', '2015-06-23 22:54:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Bethesda, Maryland', 1414, '2015-06-24 11:44:05-04', '2015-06-24 11:44:05-04', NULL, '{"lat":"38.98067","lon":"-77.10026","source":"geonames","sourceId":4348599,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'SDLC', 1415, '2015-06-29 06:55:48-04', '2015-06-29 06:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Quality', 1416, '2015-06-29 06:55:48-04', '2015-06-29 06:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software Testing', 1417, '2015-06-29 06:55:48-04', '2015-06-29 06:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digital Government Strategy', 1418, '2015-06-29 09:25:09-04', '2015-06-29 09:25:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mobile product testing', 1419, '2015-06-29 09:25:09-04', '2015-06-29 09:25:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Testing strategy', 1420, '2015-06-29 09:25:09-04', '2015-06-29 09:25:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'user groups', 1421, '2015-06-29 09:25:09-04', '2015-06-29 09:25:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Mobile Product testing', 1422, '2015-06-29 09:25:09-04', '2015-06-29 09:25:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Information Technolgy; ', 1423, '2015-06-29 16:55:29-04', '2015-06-29 16:55:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Wharton, New Jersey', 1424, '2015-06-29 17:30:33-04', '2015-06-29 17:30:33-04', NULL, '{"lat":"40.89315","lon":"-74.58183","source":"geonames","sourceId":5106361,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Task creation', 1425, '2015-06-30 11:00:03-04', '2015-06-30 11:00:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Lincoln, Nebraska', 1426, '2015-06-30 17:38:48-04', '2015-06-30 17:38:48-04', NULL, '{"lat":"40.8","lon":"-96.66696","source":"geonames","sourceId":5072006,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Twitter', 1427, '2015-07-01 10:41:05-04', '2015-07-01 10:41:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Facebook', 1428, '2015-07-01 10:41:05-04', '2015-07-01 10:41:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Joint Professional Military Education', 1429, '2015-07-01 10:41:05-04', '2015-07-01 10:41:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 1430, '2015-07-01 10:41:05-04', '2015-07-01 10:41:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design', 1431, '2015-07-01 10:50:59-04', '2015-07-01 10:50:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'HTML', 1432, '2015-07-01 10:59:23-04', '2015-07-01 10:59:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digitization', 1433, '2015-07-01 11:29:41-04', '2015-07-01 11:29:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Accessibility', 1434, '2015-07-01 11:29:41-04', '2015-07-01 11:29:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Writing', 1435, '2015-07-01 14:59:10-04', '2015-07-01 14:59:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Research', 1436, '2015-07-01 14:59:10-04', '2015-07-01 14:59:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Collaboration', 1437, '2015-07-01 14:59:10-04', '2015-07-01 14:59:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Panchkula, Haryana, IN', 1438, '2015-07-06 01:21:14-04', '2015-07-06 01:21:14-04', NULL, '{"lat":"30.69461","lon":"76.8504","source":"geonames","sourceId":6690108,"gmtOffset":5.5,"timeZoneId":"Asia/Kolkata","dstOffset":5.5}');
INSERT INTO tagentity VALUES ('location', 'Philadelphia, Pennsylvania', 1439, '2015-07-06 09:27:56-04', '2015-07-06 09:27:56-04', NULL, '{"lat":"39.95233","lon":"-75.16379","source":"geonames","sourceId":4560349,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('topic', 'HR', 1440, '2015-07-07 07:20:04-04', '2015-07-07 07:20:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' ELR', 1441, '2015-07-07 07:20:04-04', '2015-07-07 07:20:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Excellent written and verbal communication skill.  Skilled project manager.', 1442, '2015-07-07 07:20:04-04', '2015-07-07 07:20:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Contracting professional', 1443, '2015-07-07 07:20:04-04', '2015-07-07 07:20:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'branding', 1444, '2015-07-07 11:04:38-04', '2015-07-07 11:04:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' marketing', 1445, '2015-07-07 11:04:38-04', '2015-07-07 11:04:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing ', 1446, '2015-07-07 11:04:38-04', '2015-07-07 11:04:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' messaging', 1447, '2015-07-07 11:04:38-04', '2015-07-07 11:04:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' communications ', 1448, '2015-07-07 11:04:38-04', '2015-07-07 11:04:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'branding', 1449, '2015-07-07 11:04:38-04', '2015-07-07 11:04:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'technical symposium', 1450, '2015-07-07 12:30:59-04', '2015-07-07 12:30:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'event', 1451, '2015-07-07 12:30:59-04', '2015-07-07 12:30:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'conference', 1452, '2015-07-07 12:30:59-04', '2015-07-07 12:30:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'event planning', 1453, '2015-07-07 12:30:59-04', '2015-07-07 12:30:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Logo development', 1454, '2015-07-07 12:35:11-04', '2015-07-07 12:35:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic design', 1455, '2015-07-07 12:35:11-04', '2015-07-07 12:35:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sharepoint web technologies', 1456, '2015-07-07 12:41:42-04', '2015-07-07 12:41:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Alternative Dispute Resolution', 1457, '2015-07-07 13:28:53-04', '2015-07-07 13:28:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' plain writing', 1458, '2015-07-07 13:28:53-04', '2015-07-07 13:28:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'communication ', 1459, '2015-07-07 13:28:53-04', '2015-07-07 13:28:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Emergency communications', 1460, '2015-07-07 13:28:53-04', '2015-07-07 13:28:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'plain writing', 1461, '2015-07-07 17:22:09-04', '2015-07-07 17:22:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'video editing', 1462, '2015-07-07 21:46:08-04', '2015-07-07 21:46:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Sigonella, Sicily, IT', 1463, '2015-07-08 02:26:19-04', '2015-07-08 02:26:19-04', NULL, '{"lat":"37.41039","lon":"14.91025","source":"geonames","sourceId":8469108,"gmtOffset":1,"timeZoneId":"Europe/Rome","dstOffset":2}');
INSERT INTO tagentity VALUES ('location', 'Rochester, New York', 1464, '2015-07-08 15:05:47-04', '2015-07-08 15:05:47-04', NULL, '{"lat":"43.15478","lon":"-77.61556","source":"geonames","sourceId":5134086,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Health surveillance', 1465, '2015-07-09 08:50:33-04', '2015-07-09 08:50:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Epidemio', 1466, '2015-07-09 08:51:03-04', '2015-07-09 08:51:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Kansas City, Missouri', 1467, '2015-07-09 12:13:54-04', '2015-07-09 12:13:54-04', NULL, '{"lat":"39.09973","lon":"-94.57857","source":"geonames","sourceId":4393217,"gmtOffset":-6,"timeZoneId":"America/Chicago","dstOffset":-5}');
INSERT INTO tagentity VALUES ('topic', 'injury prevention', 1468, '2015-07-14 14:01:19-04', '2015-07-14 14:01:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'psychology', 1469, '2015-07-14 14:01:19-04', '2015-07-14 14:01:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'safety', 1470, '2015-07-14 14:06:12-04', '2015-07-14 14:06:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'human factors', 1471, '2015-07-14 14:08:01-04', '2015-07-14 14:08:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'type', 1472, '2015-07-15 04:48:57-04', '2015-07-15 04:48:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'typing', 1473, '2015-07-15 04:48:57-04', '2015-07-15 04:48:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Salina, Kansas', 1474, '2015-07-15 15:51:10-04', '2015-07-15 15:51:10-04', NULL, '{"lat":"38.84028","lon":"-97.61142","source":"geonames","sourceId":4278890,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Huntsville, Alabama', 1475, '2015-07-17 11:54:50-04', '2015-07-17 11:54:50-04', NULL, '{"lat":"34.73037","lon":"-86.5861","source":"geonames","sourceId":4068590,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Defense Acquisition', 1476, '2015-07-21 12:56:08-04', '2015-07-21 12:56:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'business development', 1477, '2015-07-21 12:56:08-04', '2015-07-21 12:56:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fort Belvoir, Virginia', 1478, '2015-07-21 12:56:08-04', '2015-07-21 12:56:08-04', NULL, '{"lat":"38.7119","lon":"-77.14589","source":"geonames","sourceId":7257902,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Test', 1479, '2015-07-22 10:43:52-04', '2015-07-22 10:43:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'systems engineering', 1480, '2015-07-22 10:43:52-04', '2015-07-22 10:43:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Production Based Logisitics', 1481, '2015-07-22 10:43:52-04', '2015-07-22 10:43:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'test & evaluation', 1482, '2015-07-22 10:43:52-04', '2015-07-22 10:43:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'acquisition', 1483, '2015-07-22 10:43:52-04', '2015-07-22 10:43:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'AJAX', 1494, '2015-07-29 12:48:22-04', '2015-07-29 12:48:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Boston, Massachusetts', 1495, '2015-07-29 13:29:26-04', '2015-07-29 13:29:26-04', NULL, '{"lat":"42.35843","lon":"-71.05977","source":"geonames","sourceId":4930956,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('task-time-required', 'Ongoing', 2, '2014-09-16 17:42:43-04', '2015-07-27 18:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Salt Lake City, Utah', 1496, '2015-07-29 14:09:33-04', '2015-07-29 14:09:33-04', NULL, '{"lat":"40.76078","lon":"-111.89105","source":"geonames","sourceId":5780993,"dstOffset":-6,"gmtOffset":-7,"timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('skill', 'outcomes', 1497, '2015-07-29 15:42:50-04', '2015-07-29 15:42:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'primary care', 1498, '2015-07-29 15:42:50-04', '2015-07-29 15:42:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Accountable Care Organizations', 1499, '2015-07-29 15:42:50-04', '2015-07-29 15:42:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Tucson, Arizona', 1488, '2015-07-29 11:16:01-04', '2015-07-29 11:16:01-04', NULL, '{"lat":"32.22174","lon":"-110.92648","source":"geonames","sourceId":5318313,"gmtOffset":-7,"timeZoneId":"America/Phoenix","dstOffset":-7}');
INSERT INTO tagentity VALUES ('topic', 'css animations', 1489, '2015-07-29 12:47:01-04', '2015-07-29 12:47:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'health', 1500, '2015-07-29 15:42:50-04', '2015-07-29 15:42:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mental health', 1501, '2015-07-29 15:42:50-04', '2015-07-29 15:42:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'coordinated care', 1502, '2015-07-29 15:42:50-04', '2015-07-29 15:42:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1503, '2015-07-30 09:54:19-04', '2015-07-30 09:54:19-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'phonegap', 1490, '2015-07-29 12:47:01-04', '2015-07-29 12:47:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ASP.NET', 1491, '2015-07-29 12:47:01-04', '2015-07-29 12:47:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Usability', 1492, '2015-07-29 12:47:01-04', '2015-07-29 12:47:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MSSQL', 1493, '2015-07-29 12:47:01-04', '2015-07-29 12:47:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'telework', 1504, '2015-07-30 09:55:48-04', '2015-07-30 09:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'culture', 1505, '2015-07-30 09:55:48-04', '2015-07-30 09:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'workplace', 1506, '2015-07-30 09:55:48-04', '2015-07-30 09:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'worklife', 1507, '2015-07-30 09:55:48-04', '2015-07-30 09:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'change communications', 1508, '2015-07-30 09:55:48-04', '2015-07-30 09:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'performance management', 1509, '2015-07-30 09:55:48-04', '2015-07-30 09:55:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'PowerPoint', 1510, '2015-08-03 10:50:15-04', '2015-08-03 10:50:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Orlando, Florida', 1511, '2015-08-04 05:47:56-04', '2015-08-04 05:47:56-04', NULL, '{"lat":"28.53834","lon":"-81.37924","source":"geonames","sourceId":"4167147","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'San Antonio, Texas', 1512, '2015-08-04 09:14:19-04', '2015-08-04 09:14:19-04', NULL, '{"lat":"29.42412","lon":"-98.49363","source":"geonames","sourceId":"4726206","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1513, '2015-08-04 09:20:42-04', '2015-08-04 09:20:42-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Providence, Rhode Island', 1514, '2015-08-04 09:26:08-04', '2015-08-04 09:26:08-04', NULL, '{"lat":"41.82399","lon":"-71.41283","source":"geonames","sourceId":"5224151","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Section 508 Accessibility', 1515, '2015-08-04 09:31:15-04', '2015-08-04 09:31:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Content Development', 1516, '2015-08-04 09:33:09-04', '2015-08-04 09:33:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Section 508 Remediation', 1517, '2015-08-04 09:33:09-04', '2015-08-04 09:33:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Savannah, Georgia', 1518, '2015-08-04 09:43:18-04', '2015-08-04 09:43:18-04', NULL, '{"lat":"32.08354","lon":"-81.09983","source":"geonames","sourceId":"4221552","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Tacoma, Washington', 1519, '2015-08-04 09:59:07-04', '2015-08-04 09:59:07-04', NULL, '{"lat":"47.25288","lon":"-122.44429","source":"geonames","sourceId":"5812944","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('location', 'San Jose, California', 1520, '2015-08-04 13:55:27-04', '2015-08-04 13:55:27-04', NULL, '{"lat":"37.33939","lon":"-121.89496","source":"geonames","sourceId":"5392171","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'customer service', 1521, '2015-08-04 14:32:26-04', '2015-08-04 14:32:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1522, '2015-08-04 17:46:35-04', '2015-08-04 17:46:35-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Richland, Washington', 1523, '2015-08-04 18:08:46-04', '2015-08-04 18:08:46-04', NULL, '{"lat":"46.28569","lon":"-119.28446","source":"geonames","sourceId":"5808276","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Phoenix, Arizona', 1524, '2015-08-05 10:45:55-04', '2015-08-05 10:45:55-04', NULL, '{"lat":"33.44838","lon":"-112.07404","source":"geonames","sourceId":"5308655","dstOffset":"-7","gmtOffset":"-7","timeZoneId":"America/Phoenix"}');
INSERT INTO tagentity VALUES ('location', 'New Orleans, Louisiana', 1525, '2015-08-05 17:22:30-04', '2015-08-05 17:22:30-04', NULL, '{"lat":"29.95465","lon":"-90.07507","source":"geonames","sourceId":"4335045","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Indianapolis, Indiana', 1526, '2015-08-11 13:56:48-04', '2015-08-11 13:56:48-04', NULL, '{"lat":"39.76838","lon":"-86.15804","source":"geonames","sourceId":"4259418","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/Indiana/Indianapolis"}');
INSERT INTO tagentity VALUES ('location', 'Vallejo, California', 1527, '2015-08-11 17:52:41-04', '2015-08-11 17:52:41-04', NULL, '{"lat":"38.10409","lon":"-122.25664","source":"geonames","sourceId":"5405380","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('location', 'Harrisonburg, Virginia', 1528, '2015-08-17 11:50:55-04', '2015-08-17 11:50:55-04', NULL, '{"lat":"38.44957","lon":"-78.86892","source":"geonames","sourceId":"4763231","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'data', 1529, '2015-08-17 14:50:54-04', '2015-08-17 14:50:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'building partnerships', 1530, '2015-08-17 17:27:48-04', '2015-08-17 17:27:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'community outreach', 1531, '2015-08-17 18:26:01-04', '2015-08-17 18:26:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Cleanup', 1532, '2015-08-18 15:25:13-04', '2015-08-18 15:25:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Data cleanup', 1533, '2015-08-18 15:25:13-04', '2015-08-18 15:25:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Creative Marketing', 1534, '2015-08-19 10:15:33-04', '2015-08-19 10:15:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Branding design ', 1536, '2015-08-19 10:15:33-04', '2015-08-19 10:15:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'graphic design artist', 1537, '2015-08-19 10:15:33-04', '2015-08-19 10:15:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 1538, '2015-08-19 10:15:34-04', '2015-08-19 10:15:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'artist', 1535, '2015-08-19 10:15:33-04', '2015-08-19 10:15:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'taxes', 1539, '2015-08-20 19:16:01-04', '2015-08-20 19:16:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Future Government Workplace Predictions', 1540, '2015-08-21 14:06:02-04', '2015-08-21 14:06:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Workforce Planning', 1541, '2015-08-21 14:06:02-04', '2015-08-21 14:06:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Culture Change', 1542, '2015-08-21 14:06:02-04', '2015-08-21 14:06:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'civic hacking', 1543, '2015-08-24 12:39:54-04', '2015-08-24 12:39:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IRB', 1551, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'regulatory affairs', 1552, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'quality improvement', 1553, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research regulations', 1554, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'QI', 1555, '2015-08-25 19:28:02-04', '2015-08-25 19:28:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'CSS', 1556, '2015-08-25 19:28:02-04', '2015-08-25 19:28:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SharePoint 2013', 1557, '2015-08-25 19:28:02-04', '2015-08-25 19:28:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research administration', 1558, '2015-08-25 19:28:02-04', '2015-08-25 19:28:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Institutional Review Board', 1559, '2015-08-25 19:28:02-04', '2015-08-25 19:28:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content development', 1560, '2015-08-25 19:28:02-04', '2015-08-25 19:28:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'technical writing', 1561, '2015-08-25 19:28:44-04', '2015-08-25 19:28:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Institutional Review Board (IRB)', 1562, '2015-08-25 19:59:40-04', '2015-08-25 19:59:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SAS', 1563, '2015-08-26 09:14:48-04', '2015-08-26 09:14:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' PowerPoint', 1564, '2015-08-26 09:14:48-04', '2015-08-26 09:14:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-length', 'Biweekly', 1544, '2015-08-24 15:37:26-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-estimate', 'Less than 1 hour', 15, '2015-07-26 21:00:02-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-estimate', '2 - 4 hours', 1486, '2015-07-27 18:46:38-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-estimate', '8 - 16 hours', 18, '2014-09-16 17:42:44-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-estimate', '4 - 8 hours', 17, '2014-09-16 17:42:44-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-estimate', '16 - 24 hours', 1484, '2015-07-27 18:46:38-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-estimate', '24 - 40 hours', 1487, '2015-07-27 18:46:38-04', '2015-08-24 15:37:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Seattle, Washington', 1545, '2015-08-25 16:59:12-04', '2015-08-25 16:59:12-04', NULL, '{"lat":"47.60621","lon":"-122.33207","source":"geonames","sourceId":"5809844","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'organizational behavior', 1546, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'human subjects protection', 1547, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'systems thinking', 1548, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'compliance', 1549, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'human subjects research', 1550, '2015-08-25 17:13:13-04', '2015-08-25 17:13:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ASP', 1565, '2015-08-26 09:14:48-04', '2015-08-26 09:14:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Economics', 1566, '2015-08-26 09:14:48-04', '2015-08-26 09:14:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SAS ', 1567, '2015-08-26 09:17:42-04', '2015-08-26 09:17:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Grand Forks, North Dakota', 1568, '2015-08-31 10:58:43-04', '2015-08-31 10:58:43-04', NULL, '{"lat":"47.92526","lon":"-97.03285","source":"geonames","sourceId":"5059429","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Columbus, Ohio', 1569, '2015-09-02 11:52:26-04', '2015-09-02 11:52:26-04', NULL, '{"lat":"39.96118","lon":"-82.99879","source":"geonames","sourceId":"4509177","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'FGDLA', 1570, '2015-09-02 12:17:02-04', '2015-09-02 12:17:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'USDLA', 1571, '2015-09-02 12:17:02-04', '2015-09-02 12:17:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'ATD', 1572, '2015-09-02 12:17:02-04', '2015-09-02 12:17:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Joomla!', 1573, '2015-09-02 12:17:02-04', '2015-09-02 12:17:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'open source', 1574, '2015-09-02 12:17:02-04', '2015-09-02 12:17:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Sierra Vista, Arizona', 1575, '2015-09-02 17:42:46-04', '2015-09-02 17:42:46-04', NULL, '{"lat":"31.55454","lon":"-110.30369","source":"geonames","sourceId":"5314328","gmtOffset":"-7","timeZoneId":"America/Phoenix","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Fort Meade, Maryland', 1576, '2015-09-03 05:12:27-04', '2015-09-03 05:12:27-04', NULL, '{"lat":"39.10815","lon":"-76.74323","source":"geonames","sourceId":"7257909","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Aberdeen, Maryland', 1577, '2015-09-03 09:45:19-04', '2015-09-03 09:45:19-04', NULL, '{"lat":"39.50956","lon":"-76.16412","source":"geonames","sourceId":"4346913","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'mobile', 1578, '2015-09-03 10:02:11-04', '2015-09-03 10:02:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Bethesda, Maryland', 1579, '2015-09-03 11:55:52-04', '2015-09-03 11:55:52-04', NULL, '{"lat":"38.98067","lon":"-77.10026","source":"geonames","sourceId":"4348599","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Lawrence, Kansas', 1580, '2015-09-03 13:57:43-04', '2015-09-03 13:57:43-04', NULL, '{"lat":"38.97167","lon":"-95.23525","source":"geonames","sourceId":4274277,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'Product Owner', 1582, '2015-09-03 14:55:18-04', '2015-09-03 14:55:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Kanban', 1583, '2015-09-03 14:55:18-04', '2015-09-03 14:55:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Scrum', 1581, '2015-09-03 14:55:18-04', '2015-09-03 14:55:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Scaled Agile Framework', 1584, '2015-09-03 14:55:18-04', '2015-09-03 14:55:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Platform-as-a-Service', 1585, '2015-09-03 14:59:30-04', '2015-09-03 14:59:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Microservices', 1586, '2015-09-03 14:59:30-04', '2015-09-03 14:59:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Service-Oriented Architecture', 1587, '2015-09-03 14:59:30-04', '2015-09-03 14:59:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Agile Governance', 1588, '2015-09-03 14:59:30-04', '2015-09-03 14:59:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Video Game Development', 1589, '2015-09-03 14:59:30-04', '2015-09-03 14:59:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Los Angeles, California', 1590, '2015-09-03 20:36:33-04', '2015-09-03 20:36:33-04', NULL, '{"lat":"34.05223","lon":"-118.24368","source":"geonames","sourceId":5368361,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('location', 'Norfolk, Virginia', 1591, '2015-09-04 08:18:43-04', '2015-09-04 08:18:43-04', NULL, '{"lat":"36.84681","lon":"-76.28522","source":"geonames","sourceId":"4776222","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Human Capital ', 1593, '2015-09-04 10:21:12-04', '2015-09-04 10:21:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'EVS', 1592, '2015-09-04 10:21:12-04', '2015-09-04 10:21:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Benchmarking', 1594, '2015-09-04 10:21:13-04', '2015-09-04 10:21:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Improving Employee Satisfaction ', 1595, '2015-09-04 10:23:28-04', '2015-09-04 10:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Employee Engagement ', 1596, '2015-09-04 10:23:28-04', '2015-09-04 10:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Graphic Design ', 1597, '2015-09-04 10:23:28-04', '2015-09-04 10:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Employee Engagement ', 1598, '2015-09-04 10:23:28-04', '2015-09-04 10:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HR Transformation ', 1599, '2015-09-04 10:23:28-04', '2015-09-04 10:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Kuwait City, Al Asimah, KW', 1600, '2015-09-07 02:16:25-04', '2015-09-07 02:16:25-04', NULL, '{"lat":"29.36972","lon":"47.97833","source":"geonames","sourceId":"285787","dstOffset":"3","gmtOffset":"3","timeZoneId":"Asia/Kuwait"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1601, '2015-09-08 08:40:25-04', '2015-09-08 08:40:25-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Program Design ', 1602, '2015-09-08 14:09:33-04', '2015-09-08 14:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Workforce Reporting ', 1603, '2015-09-08 14:09:33-04', '2015-09-08 14:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Change Management ', 1604, '2015-09-08 14:09:33-04', '2015-09-08 14:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Talent Management ', 1605, '2015-09-08 14:09:33-04', '2015-09-08 14:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human Capital Analytics ', 1606, '2015-09-08 14:09:33-04', '2015-09-08 14:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human Capital Strategy', 1607, '2015-09-08 14:09:33-04', '2015-09-08 14:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Management ', 1608, '2015-09-08 14:09:33-04', '2015-09-08 14:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Diversity & Inclusion', 1609, '2015-09-08 14:12:52-04', '2015-09-08 14:12:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Human Resources Management ', 1610, '2015-09-08 14:12:52-04', '2015-09-08 14:12:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'leadership development', 1611, '2015-09-09 10:56:46-04', '2015-09-09 10:56:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'training development', 1612, '2015-09-09 10:56:46-04', '2015-09-09 10:56:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Impact of technology on the public and non-profit sectors mission', 1613, '2015-09-09 12:39:05-04', '2015-09-09 12:39:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Laboratory Information Systems', 1614, '2015-09-09 12:39:05-04', '2015-09-09 12:39:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CRM', 1615, '2015-09-09 12:39:05-04', '2015-09-09 12:39:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Energy Analysis', 1616, '2015-09-09 12:39:05-04', '2015-09-09 12:39:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Ann Arbor, Michigan', 1617, '2015-09-09 15:14:25-04', '2015-09-09 15:14:25-04', NULL, '{"lat":"42.27756","lon":"-83.74088","source":"geonames","sourceId":"4984247","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/Detroit"}');
INSERT INTO tagentity VALUES ('skill', 'digital preservation', 1618, '2015-09-09 15:29:52-04', '2015-09-09 15:29:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'California state records', 1619, '2015-09-09 15:29:52-04', '2015-09-09 15:29:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Miami, Florida', 1620, '2015-09-15 09:08:17-04', '2015-09-15 09:08:17-04', NULL, '{"lat":"25.77427","lon":"-80.19366","source":"geonames","sourceId":"4164138","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'White Oak, Maryland', 1621, '2015-09-15 10:07:43-04', '2015-09-15 10:07:43-04', NULL, '{"lat":"39.03983","lon":"-76.99303","source":"geonames","sourceId":"4373449","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'College Park, Maryland', 1622, '2015-09-15 10:40:34-04', '2015-09-15 10:40:34-04', NULL, '{"lat":"38.98067","lon":"-76.93692","source":"geonames","sourceId":"4351977","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Glendale, California', 1623, '2015-09-15 10:50:26-04', '2015-09-15 10:50:26-04', NULL, '{"lat":"34.14251","lon":"-118.25508","source":"geonames","sourceId":"5352423","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Fort Hood, Texas', 1624, '2015-09-15 12:34:04-04', '2015-09-15 12:34:04-04', NULL, '{"lat":"31.13489","lon":"-97.77561","source":"geonames","sourceId":"7261291","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 1625, '2015-09-15 12:59:30-04', '2015-09-15 12:59:30-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Pittsburgh, Pennsylvania', 1626, '2015-09-16 15:03:42-04', '2015-09-16 15:03:42-04', NULL, '{"lat":"40.44062","lon":"-79.99589","source":"geonames","sourceId":"5206379","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Sewell, New Jersey', 1627, '2015-09-16 17:20:24-04', '2015-09-16 17:20:24-04', NULL, '{"lat":"39.7665","lon":"-75.14434","source":"geonames","sourceId":"4504048","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Charlotte, North Carolina', 1628, '2015-09-17 07:13:52-04', '2015-09-17 07:13:52-04', NULL, '{"lat":"35.22709","lon":"-80.84313","source":"geonames","sourceId":4460243,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'consulting', 1629, '2015-09-17 07:21:50-04', '2015-09-17 07:21:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Minneapolis, Minnesota', 1630, '2015-09-18 10:58:11-04', '2015-09-18 10:58:11-04', NULL, '{"lat":"44.97997","lon":"-93.26384","source":"geonames","sourceId":"5037649","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'Organization and attention to detail', 1631, '2015-09-18 13:00:12-04', '2015-09-18 13:00:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'wordpress developer', 1632, '2015-09-18 14:16:18-04', '2015-09-18 14:16:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'user experience', 1633, '2015-09-21 11:16:13-04', '2015-09-21 11:16:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' ux ', 1634, '2015-09-21 11:16:13-04', '2015-09-21 11:16:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Silverdale, Washington', 1635, '2015-09-21 12:54:35-04', '2015-09-21 12:54:35-04', NULL, '{"lat":"47.64454","lon":"-122.69487","source":"geonames","sourceId":"5810490","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('skill', '18F', 1636, '2015-09-21 17:34:22-04', '2015-09-21 17:34:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Bozeman, Montana', 1637, '2015-09-23 11:07:32-04', '2015-09-23 11:07:32-04', NULL, '{"lat":"45.67965","lon":"-111.03856","source":"geonames","sourceId":"5641727","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'teamwork', 1638, '2015-09-23 13:30:16-04', '2015-09-23 13:30:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Arabic', 1639, '2015-09-23 13:30:16-04', '2015-09-23 13:30:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'budgeting', 1640, '2015-09-23 13:30:16-04', '2015-09-23 13:30:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'polling', 1641, '2015-09-23 13:30:16-04', '2015-09-23 13:30:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mediating', 1642, '2015-09-23 13:30:16-04', '2015-09-23 13:30:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'multicultural', 1643, '2015-09-23 13:30:16-04', '2015-09-23 13:30:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'innovative', 1645, '2015-09-23 13:30:16-04', '2015-09-23 13:30:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'resourceful', 1644, '2015-09-23 13:30:16-04', '2015-09-23 13:30:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'strategic communications', 1646, '2015-09-23 13:46:10-04', '2015-09-23 13:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'humanitarianism', 1647, '2015-09-23 13:46:10-04', '2015-09-23 13:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'civic engagement', 1648, '2015-09-23 13:46:10-04', '2015-09-23 13:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'human rights', 1649, '2015-09-23 13:46:10-04', '2015-09-23 13:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'interfaith', 1650, '2015-09-23 13:46:10-04', '2015-09-23 13:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social justice', 1651, '2015-09-23 13:46:10-04', '2015-09-23 13:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'conflict analysis', 1652, '2015-09-23 13:46:10-04', '2015-09-23 13:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'people', 1653, '2015-09-23 13:48:32-04', '2015-09-23 13:48:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'gra', 1654, '2015-09-24 09:51:41-04', '2015-09-24 09:51:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Harpers Ferry, West Virginia', 1655, '2015-09-24 14:01:09-04', '2015-09-24 14:01:09-04', NULL, '{"lat":"39.32538","lon":"-77.73888","source":"geonames","sourceId":"4808234","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Web Management and Development', 1656, '2015-09-24 15:42:51-04', '2015-09-24 15:42:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ComonSpot', 1657, '2015-09-24 15:42:51-04', '2015-09-24 15:42:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cycling', 1658, '2015-09-24 15:48:35-04', '2015-09-24 15:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Soccer', 1659, '2015-09-24 15:48:35-04', '2015-09-24 15:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Photography', 1660, '2015-09-24 15:48:35-04', '2015-09-24 15:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Web Conten Management Systems', 1661, '2015-09-24 15:48:35-04', '2015-09-24 15:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'NonProfit', 1662, '2015-09-24 15:48:35-04', '2015-09-24 15:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Volunteering', 1663, '2015-09-24 15:48:35-04', '2015-09-24 15:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Community Service', 1664, '2015-09-24 15:48:35-04', '2015-09-24 15:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Data Visualization', 1665, '2015-09-24 19:38:46-04', '2015-09-24 19:38:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Visualization', 1666, '2015-09-24 19:38:46-04', '2015-09-24 19:38:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'systems improvement', 1667, '2015-09-24 20:29:17-04', '2015-09-24 20:29:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'lean management', 1668, '2015-09-24 20:29:17-04', '2015-09-24 20:29:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'PTSD', 1669, '2015-09-24 20:29:17-04', '2015-09-24 20:29:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile testing', 1670, '2015-09-24 22:08:28-04', '2015-09-24 22:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' compatability testing', 1671, '2015-09-24 22:08:28-04', '2015-09-24 22:08:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'NRSA fellowship applications', 1767, '2015-09-29 22:32:12-04', '2015-09-29 22:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software development ', 1768, '2015-09-29 22:32:12-04', '2015-09-29 22:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Biloxi, Mississippi', 1672, '2015-09-25 09:22:59-04', '2015-09-25 09:22:59-04', NULL, '{"lat":"30.39603","lon":"-88.88531","source":"geonames","sourceId":"4418478","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'San Francisco, California', 1673, '2015-09-25 11:19:23-04', '2015-09-25 11:19:23-04', NULL, '{"lat":"37.77493","lon":"-122.41942","source":"geonames","sourceId":"5391959","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('skill', 'Advertising', 1674, '2015-09-25 12:16:19-04', '2015-09-25 12:16:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Qualitative Research ', 1675, '2015-09-25 12:56:17-04', '2015-09-25 12:56:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contextual Inquiry', 1676, '2015-09-25 12:56:17-04', '2015-09-25 12:56:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cutting edge technology', 1677, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Implementation of new technologies into existing systems', 1678, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Science Fiction', 1679, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Highly skilled in Customer Support and Hardware troubleshooting', 1680, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'finance', 1781, '2015-09-30 13:18:39-04', '2015-09-30 13:18:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Proven project team lead and team participant', 1681, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Bowling Green, Kentucky', 1682, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, '{"lat":"36.99032","lon":"-86.4436","source":"geonames","sourceId":4285268,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'Highly skilled in network diagnostics and support both wired and wireless', 1683, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Highly skilled in government procurement practices and administration', 1684, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Speed reader and document reduction and interpretation expert', 1685, '2015-09-25 13:49:43-04', '2015-09-25 13:49:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F', 1686, '2015-09-25 15:28:10-04', '2015-09-25 15:28:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Flask', 1687, '2015-09-25 15:28:10-04', '2015-09-25 15:28:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'US Web Design Standards', 1688, '2015-09-25 15:28:10-04', '2015-09-25 15:28:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F Outreach', 1689, '2015-09-25 15:29:11-04', '2015-09-25 15:29:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1690, '2015-09-25 15:42:35-04', '2015-09-25 15:42:35-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', '18F', 1691, '2015-09-27 09:19:01-04', '2015-09-27 09:19:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'postgres', 1692, '2015-09-27 09:19:01-04', '2015-09-27 09:19:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Python', 1693, '2015-09-27 09:19:01-04', '2015-09-27 09:19:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Flask', 1694, '2015-09-27 09:19:01-04', '2015-09-27 09:19:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Flask', 1695, '2015-09-27 09:56:57-04', '2015-09-27 09:56:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Jekyll', 1696, '2015-09-27 09:56:57-04', '2015-09-27 09:56:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'static site generators', 1697, '2015-09-27 09:56:57-04', '2015-09-27 09:56:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Devops', 1698, '2015-09-27 09:56:57-04', '2015-09-27 09:56:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F', 1699, '2015-09-27 17:31:08-04', '2015-09-27 17:31:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Analytics', 1700, '2015-09-27 17:31:08-04', '2015-09-27 17:31:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Google APIs', 1701, '2015-09-27 17:31:08-04', '2015-09-27 17:31:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Flask', 1702, '2015-09-27 17:31:08-04', '2015-09-27 17:31:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Python', 1703, '2015-09-27 17:31:08-04', '2015-09-27 17:31:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F', 1704, '2015-09-27 17:37:47-04', '2015-09-27 17:37:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Flask', 1705, '2015-09-27 17:37:47-04', '2015-09-27 17:37:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Python', 1706, '2015-09-27 17:37:47-04', '2015-09-27 17:37:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Flask', 1707, '2015-09-27 17:38:10-04', '2015-09-27 17:38:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F', 1708, '2015-09-27 17:45:31-04', '2015-09-27 17:45:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Python', 1709, '2015-09-27 17:45:31-04', '2015-09-27 17:45:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Flask', 1710, '2015-09-27 17:45:31-04', '2015-09-27 17:45:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Jekyll', 1711, '2015-09-27 17:45:31-04', '2015-09-27 17:45:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F', 1712, '2015-09-27 17:48:41-04', '2015-09-27 17:48:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F Outreach', 1713, '2015-09-27 17:48:41-04', '2015-09-27 17:48:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Flask', 1714, '2015-09-27 17:48:41-04', '2015-09-27 17:48:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Python', 1715, '2015-09-27 17:48:41-04', '2015-09-27 17:48:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Best practices', 1716, '2015-09-27 17:48:41-04', '2015-09-27 17:48:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'photography', 1717, '2015-09-28 08:23:59-04', '2015-09-28 08:23:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' aviation', 1718, '2015-09-28 08:23:59-04', '2015-09-28 08:23:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'International Development', 1719, '2015-09-28 08:23:59-04', '2015-09-28 08:23:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Lightroom', 1720, '2015-09-28 08:23:59-04', '2015-09-28 08:23:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cycling', 1722, '2015-09-28 08:23:59-04', '2015-09-28 08:23:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HTML', 1721, '2015-09-28 08:23:59-04', '2015-09-28 08:23:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital imaging', 1723, '2015-09-28 08:23:59-04', '2015-09-28 08:23:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSS', 1724, '2015-09-28 08:23:59-04', '2015-09-28 08:23:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Front-end Webdesign', 1725, '2015-09-28 15:18:49-04', '2015-09-28 15:18:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Print design', 1726, '2015-09-28 15:18:49-04', '2015-09-28 15:18:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Illustration', 1727, '2015-09-28 15:18:49-04', '2015-09-28 15:18:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Identity design', 1728, '2015-09-28 15:18:49-04', '2015-09-28 15:18:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Print Design', 1729, '2015-09-28 15:18:49-04', '2015-09-28 15:18:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'front-end web design ', 1730, '2015-09-28 15:18:49-04', '2015-09-28 15:18:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'storytelling', 1731, '2015-09-28 23:27:04-04', '2015-09-28 23:27:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'multimedia', 1732, '2015-09-28 23:27:04-04', '2015-09-28 23:27:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'People', 1733, '2015-09-29 15:00:19-04', '2015-09-29 15:00:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Ceramics', 1735, '2015-09-29 15:00:19-04', '2015-09-29 15:00:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'standard poodles', 1736, '2015-09-29 15:00:19-04', '2015-09-29 15:00:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'horses', 1734, '2015-09-29 15:00:19-04', '2015-09-29 15:00:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Interesting historic hot spring ', 1737, '2015-09-29 15:04:10-04', '2015-09-29 15:04:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fresno, California', 1738, '2015-09-29 17:47:44-04', '2015-09-29 17:47:44-04', NULL, '{"lat":"36.74773","lon":"-119.77237","source":"geonames","sourceId":"5350937","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('topic', 'analysis', 1739, '2015-09-29 21:02:46-04', '2015-09-29 21:02:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Development', 1740, '2015-09-29 21:20:36-04', '2015-09-29 21:20:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'review data', 1741, '2015-09-29 21:24:29-04', '2015-09-29 21:24:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'best practices', 1742, '2015-09-29 21:24:29-04', '2015-09-29 21:24:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research evaluation', 1743, '2015-09-29 22:24:04-04', '2015-09-29 22:24:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'scientific review of grant applications', 1744, '2015-09-29 22:24:04-04', '2015-09-29 22:24:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal policy for training future scientists', 1745, '2015-09-29 22:24:04-04', '2015-09-29 22:24:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'NRSA fellowship applications', 1746, '2015-09-29 22:24:04-04', '2015-09-29 22:24:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Science policy', 1747, '2015-09-29 22:25:27-04', '2015-09-29 22:25:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'user interface', 1748, '2015-09-29 22:25:27-04', '2015-09-29 22:25:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research evaluation', 1749, '2015-09-29 22:25:27-04', '2015-09-29 22:25:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'scientific review of grant applications', 1750, '2015-09-29 22:25:27-04', '2015-09-29 22:25:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal policy for training future scientists', 1751, '2015-09-29 22:25:27-04', '2015-09-29 22:25:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'NRSA fellowship applications', 1752, '2015-09-29 22:25:27-04', '2015-09-29 22:25:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software development ', 1753, '2015-09-29 22:25:27-04', '2015-09-29 22:25:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Science policy', 1754, '2015-09-29 22:31:46-04', '2015-09-29 22:31:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'user interface', 1755, '2015-09-29 22:31:46-04', '2015-09-29 22:31:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research evaluation', 1756, '2015-09-29 22:31:46-04', '2015-09-29 22:31:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'scientific review of grant applications', 1757, '2015-09-29 22:31:46-04', '2015-09-29 22:31:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal policy for training future scientists', 1758, '2015-09-29 22:31:46-04', '2015-09-29 22:31:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'NRSA fellowship applications', 1759, '2015-09-29 22:31:46-04', '2015-09-29 22:31:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software development ', 1760, '2015-09-29 22:31:46-04', '2015-09-29 22:31:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Science policy', 1761, '2015-09-29 22:32:12-04', '2015-09-29 22:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'user interface', 1762, '2015-09-29 22:32:12-04', '2015-09-29 22:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Problem solving', 1763, '2015-09-29 22:32:12-04', '2015-09-29 22:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research evaluation', 1764, '2015-09-29 22:32:12-04', '2015-09-29 22:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'scientific review of grant applications', 1765, '2015-09-29 22:32:12-04', '2015-09-29 22:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal policy for training future scientists', 1766, '2015-09-29 22:32:12-04', '2015-09-29 22:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Authority to Operate', 1769, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ATO', 1770, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Risk management', 1771, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Infrastructure as a Service', 1772, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IaaS', 1773, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Platform as a Service', 1774, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cloud.gov', 1775, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PaaS', 1776, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'experiments', 1777, '2015-09-30 11:16:33-04', '2015-09-30 11:16:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'bureacracy hacking', 1778, '2015-09-30 11:18:00-04', '2015-09-30 11:18:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'dodea.edu', 1779, '2015-09-30 11:24:45-04', '2015-09-30 11:24:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Winchester, Massachusetts', 1780, '2015-09-30 13:10:24-04', '2015-09-30 13:10:24-04', NULL, '{"lat":"42.45232","lon":"-71.137","source":"geonames","sourceId":"4955884","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'acc', 1782, '2015-09-30 13:18:39-04', '2015-09-30 13:18:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'financial statements', 1783, '2015-09-30 13:18:39-04', '2015-09-30 13:18:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Trenton, New Jersey', 1784, '2015-09-30 13:51:04-04', '2015-09-30 13:51:04-04', NULL, '{"lat":"40.21705","lon":"-74.74294","source":"geonames","sourceId":"5105496","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'jinja', 1785, '2015-10-01 10:13:45-04', '2015-10-01 10:13:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F Pages', 1786, '2015-10-01 10:30:14-04', '2015-10-01 10:30:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F Guides', 1787, '2015-10-01 10:30:14-04', '2015-10-01 10:30:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1788, '2015-10-01 10:31:19-04', '2015-10-01 10:31:19-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'MS Suite', 1789, '2015-10-01 10:35:28-04', '2015-10-01 10:35:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Legal research engines', 1790, '2015-10-01 10:35:28-04', '2015-10-01 10:35:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Medical Records', 1791, '2015-10-01 10:35:28-04', '2015-10-01 10:35:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '.about.yml', 1792, '2015-10-01 10:38:22-04', '2015-10-01 10:38:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Team API', 1793, '2015-10-01 10:38:22-04', '2015-10-01 10:38:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'YAML', 1794, '2015-10-01 10:38:22-04', '2015-10-01 10:38:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'JSON', 1795, '2015-10-01 10:38:22-04', '2015-10-01 10:38:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'API Design', 1796, '2015-10-01 10:38:22-04', '2015-10-01 10:38:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'API Integration', 1797, '2015-10-01 11:16:11-04', '2015-10-01 11:16:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F Hub', 1798, '2015-10-01 11:16:11-04', '2015-10-01 11:16:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F Team API', 1799, '2015-10-01 11:16:11-04', '2015-10-01 11:16:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Neo4j', 1800, '2015-10-01 11:21:57-04', '2015-10-01 11:21:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Infosec', 1804, '2015-10-01 11:21:57-04', '2015-10-01 11:21:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'TCB', 1802, '2015-10-01 11:21:57-04', '2015-10-01 11:21:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SLA', 1803, '2015-10-01 11:21:57-04', '2015-10-01 11:21:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'TDD', 1801, '2015-10-01 11:21:57-04', '2015-10-01 11:21:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Santa Barbara, California', 1805, '2015-10-01 11:21:57-04', '2015-10-01 11:21:57-04', NULL, '{"lat":"34.42083","lon":"-119.69819","source":"geonames","sourceId":5392952,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('skill', 'Rapid Prototyping', 1806, '2015-10-01 11:30:39-04', '2015-10-01 11:30:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'python', 1807, '2015-10-01 14:45:04-04', '2015-10-01 14:45:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'jekyll', 1808, '2015-10-01 14:45:04-04', '2015-10-01 14:45:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ruby', 1809, '2015-10-01 14:45:04-04', '2015-10-01 14:45:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'jupyter notebok', 1810, '2015-10-01 14:45:04-04', '2015-10-01 14:45:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F', 1811, '2015-10-01 14:45:04-04', '2015-10-01 14:45:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F', 1812, '2015-10-01 17:18:17-04', '2015-10-01 17:18:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '18F Outreach', 1813, '2015-10-01 17:18:17-04', '2015-10-01 17:18:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'liquid templates', 1814, '2015-10-01 17:18:17-04', '2015-10-01 17:18:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'jekyll', 1815, '2015-10-01 17:18:17-04', '2015-10-01 17:18:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'value based healthcare', 1816, '2015-10-01 20:45:23-04', '2015-10-01 20:45:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Six Sigma', 1817, '2015-10-01 20:45:23-04', '2015-10-01 20:45:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'population health management', 1818, '2015-10-01 20:45:23-04', '2015-10-01 20:45:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'six sigma', 1819, '2015-10-01 20:45:23-04', '2015-10-01 20:45:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'value based healthcare', 1820, '2015-10-01 20:45:23-04', '2015-10-01 20:45:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SAP', 1821, '2015-10-01 23:53:17-04', '2015-10-01 23:53:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Health', 1822, '2015-10-01 23:53:18-04', '2015-10-01 23:53:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Silver Spring, Maryland', 1823, '2015-10-02 13:07:04-04', '2015-10-02 13:07:04-04', NULL, '{"lat":"38.99067","lon":"-77.02609","source":"geonames","sourceId":"4369596","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Boise, Idaho', 1824, '2015-10-05 06:46:55-04', '2015-10-05 06:46:55-04', NULL, '{"lat":"43.6135","lon":"-116.20345","source":"geonames","sourceId":"5586437","gmtOffset":"-7","timeZoneId":"America/Boise","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Fort Collins, Colorado', 1825, '2015-10-05 08:59:39-04', '2015-10-05 08:59:39-04', NULL, '{"lat":"40.58526","lon":"-105.08442","source":"geonames","sourceId":"5577147","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('skill', 'CSS ', 1826, '2015-10-05 13:23:16-04', '2015-10-05 13:23:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'performance', 1827, '2015-10-05 17:17:15-04', '2015-10-05 17:17:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'gaming', 1828, '2015-10-05 17:17:15-04', '2015-10-05 17:17:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Houston, Texas', 1829, '2015-10-06 10:01:20-04', '2015-10-06 10:01:20-04', NULL, '{"lat":"29.76328","lon":"-95.36327","source":"geonames","sourceId":"4699066","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'AudioEye', 1830, '2015-10-06 15:10:18-04', '2015-10-06 15:10:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1831, '2015-10-06 15:22:25-04', '2015-10-06 15:22:25-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Montrose, New York', 1832, '2015-10-07 09:56:40-04', '2015-10-07 09:56:40-04', NULL, '{"lat":"41.25232","lon":"-73.93153","source":"geonames","sourceId":"5127368","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'mobile', 1833, '2015-10-07 14:05:12-04', '2015-10-07 14:05:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Xcode', 1834, '2015-10-07 14:05:12-04', '2015-10-07 14:05:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Location Servces', 1835, '2015-10-07 14:05:12-04', '2015-10-07 14:05:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'location services', 1836, '2015-10-07 14:15:43-04', '2015-10-07 14:15:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Xamarin', 1837, '2015-10-07 14:15:43-04', '2015-10-07 14:15:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Saint Petersburg, Florida', 1838, '2015-10-08 09:23:08-04', '2015-10-08 09:23:08-04', NULL, '{"lat":"27.77086","lon":"-82.67927","source":"geonames","sourceId":4171563,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'designer', 1839, '2015-10-08 09:35:05-04', '2015-10-08 09:35:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'public affairs', 1840, '2015-10-08 09:59:14-04', '2015-10-08 09:59:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'internet communications', 1841, '2015-10-08 09:59:14-04', '2015-10-08 09:59:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'health writing', 1842, '2015-10-08 09:59:14-04', '2015-10-08 09:59:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social media to spread health messages', 1843, '2015-10-08 09:59:14-04', '2015-10-08 09:59:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'webinar coordiantion', 1844, '2015-10-08 09:59:14-04', '2015-10-08 09:59:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'computer skills', 1845, '2015-10-08 09:59:14-04', '2015-10-08 09:59:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'promotion', 1846, '2015-10-08 09:59:14-04', '2015-10-08 09:59:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'conference management', 1847, '2015-10-08 09:59:14-04', '2015-10-08 09:59:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1848, '2015-10-08 09:59:39-04', '2015-10-08 09:59:39-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Data science', 1849, '2015-10-08 11:22:04-04', '2015-10-08 11:22:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'application development; database administration; application testing;;quality assurance ', 1850, '2015-10-08 11:22:04-04', '2015-10-08 11:22:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'application development and testing; quality assurance; and database administration. ', 1851, '2015-10-08 11:31:57-04', '2015-10-08 11:31:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Music', 1852, '2015-10-08 11:39:35-04', '2015-10-08 11:39:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'theater', 1853, '2015-10-08 11:39:35-04', '2015-10-08 11:39:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Nonprofit Management', 1854, '2015-10-08 11:39:35-04', '2015-10-08 11:39:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', '18F outreach', 1855, '2015-10-08 11:44:16-04', '2015-10-08 11:44:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cybersecurity', 1856, '2015-10-08 11:51:57-04', '2015-10-08 11:51:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'AngularJS', 1857, '2015-10-08 12:47:02-04', '2015-10-08 12:47:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'intergovernmental work', 1858, '2015-10-08 15:08:52-04', '2015-10-08 15:08:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1859, '2015-10-09 13:28:21-04', '2015-10-09 13:28:21-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Great Neck, New York', 1860, '2015-10-09 15:38:51-04', '2015-10-09 15:38:51-04', NULL, '{"lat":"40.80066","lon":"-73.72846","source":"geonames","sourceId":"5119218","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'structured content', 1861, '2015-10-09 15:39:29-04', '2015-10-09 15:39:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile', 1862, '2015-10-09 15:39:29-04', '2015-10-09 15:39:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Atlanta, Georgia', 1863, '2015-10-12 02:10:14-04', '2015-10-12 02:10:14-04', NULL, '{"lat":"33.749","lon":"-84.38798","source":"geonames","sourceId":"4180439","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Montgomery, Alabama', 1864, '2015-10-13 10:53:01-04', '2015-10-13 10:53:01-04', NULL, '{"lat":"32.36681","lon":"-86.29997","source":"geonames","sourceId":"4076784","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Innovation. Good government.', 1865, '2015-10-13 10:55:24-04', '2015-10-13 10:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Emerging technologies', 1866, '2015-10-13 10:55:24-04', '2015-10-13 10:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' social media', 1867, '2015-10-13 10:55:24-04', '2015-10-13 10:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' customer service', 1868, '2015-10-13 10:55:24-04', '2015-10-13 10:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' speaking', 1869, '2015-10-13 10:55:24-04', '2015-10-13 10:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' public policy', 1870, '2015-10-13 10:55:24-04', '2015-10-13 10:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1871, '2015-10-13 15:41:16-04', '2015-10-13 15:41:16-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'developer', 1872, '2015-10-14 13:31:41-04', '2015-10-14 13:31:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Acrobat', 1873, '2015-10-14 15:20:14-04', '2015-10-14 15:20:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Wharton, New Jersey', 1874, '2015-10-14 16:06:20-04', '2015-10-14 16:06:20-04', NULL, '{"lat":"40.89315","lon":"-74.58183","source":"geonames","sourceId":5106361,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('topic', 'Hiking', 1875, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' photography', 1876, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' drawing', 1877, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' advertising', 1878, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' traveling', 1879, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' poetry', 1880, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' kickboxing and sparring', 1881, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'reading', 1882, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Illustrator CS5', 1883, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Photoshop CS5', 1884, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe InDesign CS5', 1885, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Final CU', 1886, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Creative Writing', 1887, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Newsletters', 1888, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Press Releases', 1889, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Command Information', 1890, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Community Information', 1891, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Camera Interviews', 1892, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SME Preps', 1893, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Press Interviews', 1894, '2015-10-14 16:13:28-04', '2015-10-14 16:13:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Project Management', 1895, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Change Management', 1896, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'labor relations', 1897, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'employee relations', 1898, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Labor Relations', 1899, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'personnel', 1900, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'employment', 1901, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Employee Relations', 1902, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'project managmenet', 1903, '2015-10-14 16:46:57-04', '2015-10-14 16:46:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '	Employee Communications', 1904, '2015-10-14 16:47:25-04', '2015-10-14 16:47:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '	Media & Public Relations', 1905, '2015-10-14 16:47:25-04', '2015-10-14 16:47:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '	Crisis Management ', 1906, '2015-10-14 16:47:25-04', '2015-10-14 16:47:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '	Social Media Campaigns', 1907, '2015-10-14 16:47:25-04', '2015-10-14 16:47:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '	Corporate Social Responsibility', 1908, '2015-10-14 16:47:25-04', '2015-10-14 16:47:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '	Corporate Communications', 1909, '2015-10-14 16:47:25-04', '2015-10-14 16:47:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Windhoek, Khomas, NA', 1910, '2015-10-15 09:36:31-04', '2015-10-15 09:36:31-04', NULL, '{"lat":"-22.55941","lon":"17.08323","source":"geonames","sourceId":"3352136","gmtOffset":"2","timeZoneId":"Africa/Windhoek","dstOffset":"1"}');
INSERT INTO tagentity VALUES ('topic', 'International Policy Analyst', 1911, '2015-10-15 12:28:28-04', '2015-10-15 12:28:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contracting Officer Representative Level II', 1912, '2015-10-15 12:28:28-04', '2015-10-15 12:28:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FDA Web Content Management System', 1913, '2015-10-15 12:44:11-04', '2015-10-15 12:44:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Silver Spring, Maryland', 1914, '2015-10-15 14:21:05-04', '2015-10-15 14:21:05-04', NULL, '{"lat":"38.99067","lon":"-77.02609","source":"geonames","sourceId":"4369596","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Innovative Solutions', 1915, '2015-10-15 14:23:28-04', '2015-10-15 14:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Collaboration and Coordination', 1916, '2015-10-15 14:23:28-04', '2015-10-15 14:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Evaluation', 1917, '2015-10-15 14:23:28-04', '2015-10-15 14:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research and Analysis', 1918, '2015-10-15 14:23:28-04', '2015-10-15 14:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Guidance and Instructional', 1919, '2015-10-15 14:23:28-04', '2015-10-15 14:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Prezi', 1920, '2015-10-15 14:23:28-04', '2015-10-15 14:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Rails', 1921, '2015-10-15 14:25:58-04', '2015-10-15 14:25:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sinatra', 1922, '2015-10-15 14:25:58-04', '2015-10-15 14:25:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'D3', 1923, '2015-10-15 14:56:42-04', '2015-10-15 14:56:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Oklahoma City, Oklahoma', 1924, '2015-10-15 15:25:15-04', '2015-10-15 15:25:15-04', NULL, '{"lat":"35.46756","lon":"-97.51643","source":"geonames","sourceId":"4544349","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Department of Veterans Affairs', 1925, '2015-10-15 15:42:55-04', '2015-10-15 15:42:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'creative', 1926, '2015-10-15 15:42:55-04', '2015-10-15 15:42:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'creative thinking', 1927, '2015-10-15 15:42:55-04', '2015-10-15 15:42:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'problem solver', 1928, '2015-10-15 15:42:55-04', '2015-10-15 15:42:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' creative', 1929, '2015-10-15 15:42:55-04', '2015-10-15 15:42:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'editor', 1930, '2015-10-15 15:42:55-04', '2015-10-15 15:42:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1931, '2015-10-16 12:12:01-04', '2015-10-16 12:12:01-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Ideation', 1932, '2015-10-16 12:29:13-04', '2015-10-16 12:29:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Deoartment of State', 1933, '2015-10-17 14:37:58-04', '2015-10-17 14:37:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1934, '2015-10-19 10:29:18-04', '2015-10-19 10:29:18-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Quantitative Analysis', 1935, '2015-10-19 11:02:03-04', '2015-10-19 11:02:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 1936, '2015-10-19 12:47:00-04', '2015-10-19 12:47:00-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'deadline oriented', 1937, '2015-10-19 14:36:25-04', '2015-10-19 14:36:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'consumer technology', 1938, '2015-10-19 14:55:44-04', '2015-10-19 14:55:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Snagit', 1939, '2015-10-21 09:48:55-04', '2015-10-21 09:48:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Public Health', 1940, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'International Relations', 1941, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Advocacy', 1942, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'International Development', 1943, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Scheduling', 1944, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Design', 1945, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC-COR Level 1', 1946, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Political Science', 1947, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'International Relations', 1948, '2015-10-21 10:35:29-04', '2015-10-21 10:35:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'grant writing', 1949, '2015-10-21 10:43:48-04', '2015-10-21 10:43:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cooking', 1950, '2015-10-21 10:43:48-04', '2015-10-21 10:43:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'WordPress (basic)', 1951, '2015-10-21 10:43:48-04', '2015-10-21 10:43:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'football', 1952, '2015-10-21 10:43:48-04', '2015-10-21 10:43:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Fundraising', 1953, '2015-10-21 10:43:48-04', '2015-10-21 10:43:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Membership', 1954, '2015-10-21 10:43:48-04', '2015-10-21 10:43:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Lompoc, California', 1955, '2015-10-21 12:24:15-04', '2015-10-21 12:24:15-04', NULL, '{"lat":"34.63915","lon":"-120.45794","source":"geonames","sourceId":"5367788","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('skill', 'twitter', 1956, '2015-10-21 12:30:35-04', '2015-10-21 12:30:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Luray, Virginia', 1957, '2015-10-21 12:36:05-04', '2015-10-21 12:36:05-04', NULL, '{"lat":"38.6654","lon":"-78.45945","source":"geonames","sourceId":"4771014","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'public speaking ', 1958, '2015-10-21 12:38:05-04', '2015-10-21 12:38:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Dreamwweaver', 1959, '2015-10-21 12:38:05-04', '2015-10-21 12:38:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Twitter', 1960, '2015-10-21 12:38:05-04', '2015-10-21 12:38:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Blogging', 1961, '2015-10-21 12:38:05-04', '2015-10-21 12:38:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' HTML', 1962, '2015-10-21 12:38:05-04', '2015-10-21 12:38:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Desktop Publishing ', 1963, '2015-10-21 12:38:05-04', '2015-10-21 12:38:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Beltsville, Maryland', 1964, '2015-10-21 12:56:14-04', '2015-10-21 12:56:14-04', NULL, '{"lat":"39.03483","lon":"-76.90747","source":"geonames","sourceId":"4348353","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Travel', 1965, '2015-10-21 13:41:26-04', '2015-10-21 13:41:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'outdoors', 1966, '2015-10-21 13:41:26-04', '2015-10-21 13:41:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Sports', 1967, '2015-10-21 13:41:26-04', '2015-10-21 13:41:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'French (West African)', 1968, '2015-10-21 13:41:27-04', '2015-10-21 13:41:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sales', 1969, '2015-10-21 13:41:27-04', '2015-10-21 13:41:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Salesforce', 1970, '2015-10-21 14:09:53-04', '2015-10-21 14:09:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Salesforce', 1971, '2015-10-21 14:09:53-04', '2015-10-21 14:09:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fort Worth, Texas', 1972, '2015-10-21 14:12:00-04', '2015-10-21 14:12:00-04', NULL, '{"lat":"32.72541","lon":"-97.32085","source":"geonames","sourceId":"4691930","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Science ', 1973, '2015-10-21 14:28:53-04', '2015-10-21 14:28:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'JIRA', 1974, '2015-10-21 15:33:00-04', '2015-10-21 15:33:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Tennis', 1975, '2015-10-21 16:32:11-04', '2015-10-21 16:32:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Blogger', 1976, '2015-10-21 16:32:11-04', '2015-10-21 16:32:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'CMS', 1977, '2015-10-21 16:33:56-04', '2015-10-21 16:33:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1978, '2015-10-21 17:19:51-04', '2015-10-21 17:19:51-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Tokyo, JP', 1979, '2015-10-21 20:28:17-04', '2015-10-21 20:28:17-04', NULL, '{"lat":"35.6895","lon":"139.69171","source":"geonames","sourceId":"1850147","dstOffset":"9","gmtOffset":"9","timeZoneId":"Asia/Tokyo"}');
INSERT INTO tagentity VALUES ('skill', 'foreign language', 1980, '2015-10-21 20:36:17-04', '2015-10-21 20:36:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web development', 1981, '2015-10-21 20:36:17-04', '2015-10-21 20:36:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Yokosuka, Kanagawa, JP', 1982, '2015-10-21 22:08:42-04', '2015-10-21 22:08:42-04', NULL, '{"lat":"35.28361","lon":"139.66722","source":"geonames","sourceId":"1848313","dstOffset":"9","gmtOffset":"9","timeZoneId":"Asia/Tokyo"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1983, '2015-10-22 12:00:31-04', '2015-10-22 12:00:31-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'web best practices', 1984, '2015-10-22 12:31:25-04', '2015-10-22 12:31:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'web editing', 1985, '2015-10-22 12:31:25-04', '2015-10-22 12:31:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'web publishing', 1986, '2015-10-22 12:31:25-04', '2015-10-22 12:31:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Berkeley, California', 1987, '2015-10-22 17:05:35-04', '2015-10-22 17:05:35-04', NULL, '{"lat":"37.87159","lon":"-122.27275","source":"geonames","sourceId":5327684,"dstOffset":-7,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('topic', 'language access', 1988, '2015-10-22 17:18:25-04', '2015-10-22 17:18:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 1989, '2015-10-22 17:18:25-04', '2015-10-22 17:18:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ux design', 1990, '2015-10-22 17:18:25-04', '2015-10-22 17:18:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'user interviews', 1991, '2015-10-22 17:18:25-04', '2015-10-22 17:18:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'interface design', 1992, '2015-10-22 17:18:25-04', '2015-10-22 17:18:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Chicago, Illinois', 1993, '2015-10-24 22:06:57-04', '2015-10-24 22:06:57-04', NULL, '{"lat":"41.85003","lon":"-87.65005","source":"geonames","sourceId":"4887398","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Pensacola, Florida', 1994, '2015-10-26 08:08:10-04', '2015-10-26 08:08:10-04', NULL, '{"lat":"30.42131","lon":"-87.21691","source":"geonames","sourceId":"4168228","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 1995, '2015-10-26 08:48:47-04', '2015-10-26 08:48:47-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'oceanography', 1996, '2015-10-26 11:20:04-04', '2015-10-26 11:20:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'climate', 1997, '2015-10-26 11:20:04-04', '2015-10-26 11:20:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Charleston, South Carolina', 1998, '2015-10-26 11:54:15-04', '2015-10-26 11:54:15-04', NULL, '{"lat":"32.77657","lon":"-79.93092","source":"geonames","sourceId":"4574324","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Louisville, Kentucky', 1999, '2015-10-26 14:23:34-04', '2015-10-26 14:23:34-04', NULL, '{"lat":"38.25424","lon":"-85.75941","source":"geonames","sourceId":"4299276","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/Kentucky/Louisville"}');
INSERT INTO tagentity VALUES ('skill', 'Asana', 2000, '2015-10-27 09:13:53-04', '2015-10-27 09:13:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Slack', 2001, '2015-10-27 09:13:53-04', '2015-10-27 09:13:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Public Administration', 2002, '2015-10-27 09:49:48-04', '2015-10-27 09:49:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Contracting', 2003, '2015-10-27 09:49:48-04', '2015-10-27 09:49:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2004, '2015-10-27 14:34:58-04', '2015-10-27 14:34:58-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Cambridge, Massachusetts', 2005, '2015-10-28 07:51:34-04', '2015-10-28 07:51:34-04', NULL, '{"lat":"42.3751","lon":"-71.10561","source":"geonames","sourceId":"4931972","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Organizational Leadership', 2006, '2015-10-28 09:12:46-04', '2015-10-28 09:12:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Apple', 2007, '2015-10-28 09:12:46-04', '2015-10-28 09:12:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'design', 2008, '2015-10-28 09:12:46-04', '2015-10-28 09:12:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Gov 2.0', 2009, '2015-10-28 09:12:46-04', '2015-10-28 09:12:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'print production', 2010, '2015-10-28 09:12:46-04', '2015-10-28 09:12:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'C#', 2011, '2015-10-28 09:33:04-04', '2015-10-28 09:33:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' java', 2012, '2015-10-28 09:33:04-04', '2015-10-28 09:33:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'XSLT', 2013, '2015-10-28 09:33:04-04', '2015-10-28 09:33:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Customer Feedback', 2014, '2015-10-28 11:12:47-04', '2015-10-28 11:12:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cross-Agency Collaboration', 2015, '2015-10-28 11:12:47-04', '2015-10-28 11:12:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cross-Agency Collaboration', 2016, '2015-10-28 11:12:47-04', '2015-10-28 11:12:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Policy', 2017, '2015-10-28 11:12:47-04', '2015-10-28 11:12:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'International Policy', 2018, '2015-10-28 16:23:04-04', '2015-10-28 16:23:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'word press', 2117, '2015-11-16 19:41:21-05', '2015-11-16 19:41:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Knoxville, Tennessee', 2019, '2015-10-28 19:07:43-04', '2015-10-28 19:07:43-04', NULL, '{"lat":"35.96064","lon":"-83.92074","source":"geonames","sourceId":"4634946","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'micro-details', 2020, '2015-10-29 09:46:50-04', '2015-10-29 09:46:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Agile Workforce', 2021, '2015-10-29 09:46:50-04', '2015-10-29 09:46:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MS project', 2022, '2015-10-29 09:46:50-04', '2015-10-29 09:46:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'process improvement', 2023, '2015-10-29 09:46:50-04', '2015-10-29 09:46:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'executive dashboard', 2024, '2015-10-30 17:12:58-04', '2015-10-30 17:12:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'microstrategy', 2025, '2015-10-30 17:12:58-04', '2015-10-30 17:12:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Citizen Services', 2026, '2015-11-03 07:49:57-05', '2015-11-03 07:49:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Citizen Services', 2027, '2015-11-03 07:52:33-05', '2015-11-03 07:52:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Political Analysis', 2028, '2015-11-03 08:41:06-05', '2015-11-03 08:41:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Foreign Policy', 2029, '2015-11-03 08:41:06-05', '2015-11-03 08:41:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'communication', 2030, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'strategy', 2031, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social media', 2032, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'email marketing', 2033, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'blogging', 2034, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 2035, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'reporting', 2036, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital marketing', 2037, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital media', 2038, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'marketing', 2039, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content marketing', 2040, '2015-11-03 10:10:32-05', '2015-11-03 10:10:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'multilingual', 2041, '2015-11-03 10:14:03-05', '2015-11-03 10:14:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'hispanic marketing', 2042, '2015-11-03 10:14:03-05', '2015-11-03 10:14:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cloud computing', 2043, '2015-11-03 10:16:08-05', '2015-11-03 10:16:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'identity management', 2044, '2015-11-03 10:16:08-05', '2015-11-03 10:16:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'content marketing', 2045, '2015-11-03 10:17:17-05', '2015-11-03 10:17:17-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC-C Level III', 2046, '2015-11-03 10:24:09-05', '2015-11-03 10:24:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social media', 2047, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' customer experience', 2048, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'contact center', 2049, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'new technology', 2050, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' collaboration', 2051, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'blog writing', 2052, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'academic writing', 2053, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 2054, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'management', 2055, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'organization', 2056, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' event planning', 2057, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' podcasting', 2058, '2015-11-03 10:30:18-05', '2015-11-03 10:30:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PMP ', 2059, '2015-11-03 10:38:01-05', '2015-11-03 10:38:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'COTR', 2060, '2015-11-03 10:38:01-05', '2015-11-03 10:38:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PMP', 2061, '2015-11-03 10:44:42-05', '2015-11-03 10:44:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Open Government', 2062, '2015-11-03 10:44:42-05', '2015-11-03 10:44:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Enterprise Architecture', 2063, '2015-11-03 10:44:42-05', '2015-11-03 10:44:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'COR', 2064, '2015-11-03 10:44:42-05', '2015-11-03 10:44:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Tableau', 2065, '2015-11-03 11:00:04-05', '2015-11-03 11:00:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Richmond, Virginia', 2066, '2015-11-03 14:33:49-05', '2015-11-03 14:33:49-05', NULL, '{"lat":"37.55376","lon":"-77.46026","source":"geonames","sourceId":"4781708","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'energy', 2067, '2015-11-03 15:10:40-05', '2015-11-03 15:10:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'transportation', 2068, '2015-11-03 15:10:40-05', '2015-11-03 15:10:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'bicycling', 2069, '2015-11-03 15:10:40-05', '2015-11-03 15:10:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'sustainable agriculture', 2070, '2015-11-03 15:10:40-05', '2015-11-03 15:10:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Carthage, Illinois', 2071, '2015-11-04 09:31:54-05', '2015-11-04 09:31:54-05', NULL, '{"lat":"40.41643","lon":"-91.13625","source":"geonames","sourceId":"4886716","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'SQL', 2072, '2015-11-04 10:08:10-05', '2015-11-04 10:08:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' SAS', 2073, '2015-11-04 10:08:10-05', '2015-11-04 10:08:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'VBA', 2074, '2015-11-04 10:08:10-05', '2015-11-04 10:08:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'OpenSUSE', 2075, '2015-11-04 10:08:10-05', '2015-11-04 10:08:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'KDE', 2076, '2015-11-04 10:08:10-05', '2015-11-04 10:08:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Gnome', 2077, '2015-11-04 10:08:10-05', '2015-11-04 10:08:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ArcGIS', 2078, '2015-11-04 10:08:10-05', '2015-11-04 10:08:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Idaho Falls, Idaho', 2079, '2015-11-04 10:08:10-05', '2015-11-04 10:08:10-05', NULL, '{"lat":"43.46658","lon":"-112.03414","source":"geonames","sourceId":5596475,"dstOffset":-6,"gmtOffset":-7,"timeZoneId":"America/Boise"}');
INSERT INTO tagentity VALUES ('location', 'Springfield, Virginia', 2080, '2015-11-04 20:03:56-05', '2015-11-04 20:03:56-05', NULL, '{"lat":"38.78928","lon":"-77.1872","source":"geonames","sourceId":"4787117","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2081, '2015-11-05 12:30:53-05', '2015-11-05 12:30:53-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Simplification', 2082, '2015-11-05 16:50:40-05', '2015-11-05 16:50:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'TV production', 2083, '2015-11-05 17:11:16-05', '2015-11-05 17:11:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'News', 2084, '2015-11-05 17:11:16-05', '2015-11-05 17:11:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Print media', 2085, '2015-11-05 17:11:16-05', '2015-11-05 17:11:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Client management', 2086, '2015-11-05 17:11:16-05', '2015-11-05 17:11:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Service Announcements', 2087, '2015-11-05 17:11:16-05', '2015-11-05 17:11:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Typewriter', 2088, '2015-11-05 17:11:16-05', '2015-11-05 17:11:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hispanic marketing ', 2089, '2015-11-05 17:11:16-05', '2015-11-05 17:11:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Consumer issues ', 2090, '2015-11-05 17:15:04-05', '2015-11-05 17:15:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Media', 2091, '2015-11-05 17:15:04-05', '2015-11-05 17:15:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Autism', 2092, '2015-11-05 17:15:04-05', '2015-11-05 17:15:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Excel', 2093, '2015-11-05 17:16:18-05', '2015-11-05 17:16:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Apps', 2094, '2015-11-05 17:16:37-05', '2015-11-05 17:16:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Scripts', 2095, '2015-11-05 17:17:52-05', '2015-11-05 17:17:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Shell', 2096, '2015-11-06 14:48:55-05', '2015-11-06 14:48:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Terminal', 2097, '2015-11-06 14:48:55-05', '2015-11-06 14:48:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Vim', 2098, '2015-11-06 14:48:55-05', '2015-11-06 14:48:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'USCourts', 2099, '2015-11-08 20:53:02-05', '2015-11-08 20:53:02-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Prototyping', 2100, '2015-11-09 11:49:47-05', '2015-11-09 11:49:47-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Albuquerque, New Mexico', 2101, '2015-11-10 17:40:27-05', '2015-11-10 17:40:27-05', NULL, '{"lat":"35.08449","lon":"-106.65114","source":"geonames","sourceId":"5454711","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('skill', 'onboarding', 2102, '2015-11-12 11:57:14-05', '2015-11-12 11:57:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Identify problems and develop novel solutions', 2103, '2015-11-12 21:35:42-05', '2015-11-12 21:35:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lifetime learner', 2104, '2015-11-12 21:35:42-05', '2015-11-12 21:35:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Physician', 2105, '2015-11-12 21:37:00-05', '2015-11-12 21:37:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Addiction medicine', 2106, '2015-11-12 21:37:00-05', '2015-11-12 21:37:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'video call recording', 2107, '2015-11-13 11:12:28-05', '2015-11-13 11:12:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'organizing', 2108, '2015-11-13 11:37:04-05', '2015-11-13 11:37:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2109, '2015-11-16 14:12:03-05', '2015-11-16 14:12:03-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'E-mail', 2110, '2015-11-16 19:37:22-05', '2015-11-16 19:37:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', '#SomosSocial', 2111, '2015-11-16 19:37:22-05', '2015-11-16 19:37:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'word press', 2112, '2015-11-16 19:37:22-05', '2015-11-16 19:37:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'measured voice', 2113, '2015-11-16 19:37:22-05', '2015-11-16 19:37:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'hootsuite', 2114, '2015-11-16 19:37:22-05', '2015-11-16 19:37:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'E-mail', 2115, '2015-11-16 19:41:21-05', '2015-11-16 19:41:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', '#Health', 2116, '2015-11-16 19:41:21-05', '2015-11-16 19:41:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'measured voice', 2118, '2015-11-16 19:41:21-05', '2015-11-16 19:41:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'hootsuite', 2119, '2015-11-16 19:41:21-05', '2015-11-16 19:41:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'North Las Vegas, Nevada', 2120, '2015-11-17 22:44:47-05', '2015-11-17 22:44:47-05', NULL, '{"lat":"36.19886","lon":"-115.1175","source":"geonames","sourceId":5509403,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('location', 'Las Vegas, Nevada', 2121, '2015-11-17 22:45:45-05', '2015-11-17 22:45:45-05', NULL, '{"lat":"36.17497","lon":"-115.13722","source":"geonames","sourceId":5506956,"dstOffset":-7,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('skill', 'Taxonomy', 2122, '2015-11-18 08:20:56-05', '2015-11-18 08:20:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Salem, Virginia', 2123, '2015-11-18 11:17:31-05', '2015-11-18 11:17:31-05', NULL, '{"lat":"37.29347","lon":"-80.05476","source":"geonames","sourceId":"4784112","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'XML', 2916, '2016-03-23 11:12:57-04', '2016-03-23 11:12:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Key West, Florida', 2124, '2015-11-18 12:11:26-05', '2015-11-18 12:11:26-05', NULL, '{"lat":"24.55524","lon":"-81.78163","source":"geonames","sourceId":"4160812","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2125, '2015-11-18 14:23:45-05', '2015-11-18 14:23:45-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Environmental Compliance', 2126, '2015-11-18 14:49:19-05', '2015-11-18 14:49:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Science', 2127, '2015-11-19 21:48:07-05', '2015-11-19 21:48:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'R programming', 2128, '2015-11-19 21:48:07-05', '2015-11-19 21:48:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Stata', 2129, '2015-11-19 21:48:07-05', '2015-11-19 21:48:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Statisitcs', 2130, '2015-11-19 21:48:07-05', '2015-11-19 21:48:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Effective government', 2131, '2015-11-19 21:48:50-05', '2015-11-19 21:48:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'REDCap', 2132, '2015-11-19 21:49:54-05', '2015-11-19 21:49:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Highlands, New Jersey', 2133, '2015-11-20 18:12:41-05', '2015-11-20 18:12:41-05', NULL, '{"lat":"40.40372","lon":"-73.99153","source":"geonames","sourceId":"5099060","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2134, '2015-11-20 23:28:46-05', '2015-11-20 23:28:46-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'workforce planning ', 2135, '2015-11-23 09:05:56-05', '2015-11-23 09:05:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2136, '2015-11-23 10:06:20-05', '2015-11-23 10:06:20-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'Analytics', 2137, '2015-11-24 08:03:49-05', '2015-11-24 08:03:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Predictive Analytics', 2138, '2015-11-24 13:13:42-05', '2015-11-24 13:13:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Human-Computer Interaction', 2139, '2015-11-24 13:13:42-05', '2015-11-24 13:13:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Dashboards', 2140, '2015-11-24 13:13:42-05', '2015-11-24 13:13:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design', 2141, '2015-11-24 13:17:29-05', '2015-11-24 13:17:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Design Research', 2142, '2015-11-24 13:20:29-05', '2015-11-24 13:20:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Decision Support', 2143, '2015-11-24 13:20:29-05', '2015-11-24 13:20:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'rugby', 2144, '2015-11-24 14:48:55-05', '2015-11-24 14:48:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Little Free Libraries', 2145, '2015-11-24 14:48:55-05', '2015-11-24 14:48:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social change', 2146, '2015-11-24 14:48:55-05', '2015-11-24 14:48:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'dynamic websites', 2147, '2015-11-24 14:48:55-05', '2015-11-24 14:48:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2148, '2015-11-27 10:52:10-05', '2015-11-27 10:52:10-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2149, '2015-11-27 21:54:36-05', '2015-11-27 21:54:36-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Procurement ', 2150, '2015-11-27 22:00:41-05', '2015-11-27 22:00:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contracting Officer Level II', 2151, '2015-11-27 22:00:41-05', '2015-11-27 22:00:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Intrested in Human Resourses', 2152, '2015-11-27 22:18:59-05', '2015-11-27 22:18:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Contracting ', 2153, '2015-11-27 22:18:59-05', '2015-11-27 22:18:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Human Resources', 2154, '2015-11-27 23:14:49-05', '2015-11-27 23:14:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Grants', 2155, '2015-11-27 23:14:49-05', '2015-11-27 23:14:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC- COR Level II', 2156, '2015-11-27 23:14:49-05', '2015-11-27 23:14:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC- C Level II', 2157, '2015-11-27 23:14:49-05', '2015-11-27 23:14:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Market Reseach ', 2158, '2015-11-27 23:14:50-05', '2015-11-27 23:14:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Verbal and written communicaton', 2159, '2015-11-27 23:14:50-05', '2015-11-27 23:14:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Detail Oriented ', 2160, '2015-11-27 23:14:50-05', '2015-11-27 23:14:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'customer experience', 2161, '2015-11-30 15:17:00-05', '2015-11-30 15:17:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' employee engagement', 2162, '2015-11-30 15:17:00-05', '2015-11-30 15:17:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'marketing and outreach', 2163, '2015-11-30 15:17:00-05', '2015-11-30 15:17:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'employee empowerment', 2164, '2015-11-30 15:21:03-05', '2015-11-30 15:21:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Lanham, Maryland', 2165, '2015-11-30 16:57:53-05', '2015-11-30 16:57:53-05', NULL, '{"lat":"38.96875","lon":"-76.8634","source":"geonames","sourceId":"4360321","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Organiational', 2166, '2015-12-01 10:40:40-05', '2015-12-01 10:40:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'programming', 2167, '2015-12-01 14:42:16-05', '2015-12-01 14:42:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' database', 2168, '2015-12-01 14:42:16-05', '2015-12-01 14:42:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Microsoft Office', 2169, '2015-12-01 14:42:16-05', '2015-12-01 14:42:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Microsoft Access ', 2170, '2015-12-01 14:42:16-05', '2015-12-01 14:42:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Gaithersburg, Maryland', 2171, '2015-12-01 14:42:16-05', '2015-12-01 14:42:16-05', NULL, '{"lat":"39.14344","lon":"-77.20137","source":"geonames","sourceId":4355843,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'PDF', 2172, '2015-12-01 16:30:58-05', '2015-12-01 16:30:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'data policy', 2173, '2015-12-01 18:35:40-05', '2015-12-01 18:35:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cloud', 2174, '2015-12-01 18:35:40-05', '2015-12-01 18:35:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'legislation', 2175, '2015-12-01 18:35:40-05', '2015-12-01 18:35:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'legal', 2176, '2015-12-01 18:35:40-05', '2015-12-01 18:35:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'National security', 2177, '2015-12-01 18:35:41-05', '2015-12-01 18:35:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'privacy', 2178, '2015-12-01 18:35:41-05', '2015-12-01 18:35:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'civil litigation', 2179, '2015-12-01 18:35:41-05', '2015-12-01 18:35:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'intelligence community', 2180, '2015-12-01 18:35:41-05', '2015-12-01 18:35:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'legislative', 2181, '2015-12-01 18:35:41-05', '2015-12-01 18:35:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'data policy', 2182, '2015-12-01 18:35:41-05', '2015-12-01 18:35:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'counterterrorism', 2183, '2015-12-01 18:35:41-05', '2015-12-01 18:35:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'law', 2184, '2015-12-01 18:35:41-05', '2015-12-01 18:35:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'crypto currencies', 2185, '2015-12-02 10:20:04-05', '2015-12-02 10:20:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Penetration Testing', 2186, '2015-12-02 10:20:04-05', '2015-12-02 10:20:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Bash Scripting', 2187, '2015-12-02 10:20:04-05', '2015-12-02 10:20:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Geospatial', 2188, '2015-12-02 11:42:02-05', '2015-12-02 11:42:02-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FOSS', 2189, '2015-12-02 11:42:02-05', '2015-12-02 11:42:02-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'organizational development', 2190, '2015-12-02 12:32:25-05', '2015-12-02 12:32:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'partnership development', 2191, '2015-12-02 12:32:25-05', '2015-12-02 12:32:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Bureaucracy Hacking', 2192, '2015-12-02 15:46:48-05', '2015-12-02 15:46:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Internet of Things', 2193, '2015-12-02 16:53:42-05', '2015-12-02 16:53:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Healthcare', 2194, '2015-12-02 16:53:42-05', '2015-12-02 16:53:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Network Auditing', 2195, '2015-12-02 16:53:42-05', '2015-12-02 16:53:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'FedRAMP', 2196, '2015-12-02 18:47:07-05', '2015-12-02 18:47:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cloud Security', 2197, '2015-12-02 18:47:07-05', '2015-12-02 18:47:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cloud integration', 2198, '2015-12-02 18:47:07-05', '2015-12-02 18:47:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cloud Innovation', 2199, '2015-12-02 18:47:07-05', '2015-12-02 18:47:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cloud Security', 2200, '2015-12-02 18:47:07-05', '2015-12-02 18:47:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mobile Security', 2201, '2015-12-02 18:47:07-05', '2015-12-02 18:47:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Policy Development', 2202, '2015-12-02 18:47:07-05', '2015-12-02 18:47:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'risk management ', 2203, '2015-12-02 18:47:07-05', '2015-12-02 18:47:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Out of the Box', 2204, '2015-12-03 04:41:16-05', '2015-12-03 04:41:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FedRAMP', 2205, '2015-12-03 13:59:06-05', '2015-12-03 13:59:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cloud computing', 2206, '2015-12-03 13:59:06-05', '2015-12-03 13:59:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'NIST', 2207, '2015-12-03 13:59:06-05', '2015-12-03 13:59:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'information assurance', 2208, '2015-12-03 13:59:06-05', '2015-12-03 13:59:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'information security', 2209, '2015-12-03 13:59:06-05', '2015-12-03 13:59:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Problem Solving ', 2210, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Analytics', 2211, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lean ', 2212, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Theory of Contraints', 2213, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Aircraft Overhaul and Maintenance', 2214, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Statistical Techniques', 2215, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Process Mapping', 2216, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategy Development', 2217, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Jacksonville, Florida', 2218, '2015-12-03 14:38:31-05', '2015-12-03 14:38:31-05', NULL, '{"lat":"30.33218","lon":"-81.65565","source":"geonames","sourceId":4160021,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Spanish speakers', 2219, '2015-12-03 15:45:41-05', '2015-12-03 15:45:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2220, '2015-12-03 21:00:39-05', '2015-12-03 21:00:39-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('topic', 'content strategy', 2221, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'content management', 2222, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'content structure', 2223, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'content automation', 2224, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'effective processes', 2225, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content marketing', 2226, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CQ5', 2227, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Fireworks', 2228, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Omniture', 2229, '2015-12-04 00:26:22-05', '2015-12-04 00:26:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'financial literacy', 2230, '2015-12-04 09:19:03-05', '2015-12-04 09:19:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content creation', 2231, '2015-12-04 09:19:03-05', '2015-12-04 09:19:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Graphic Design & Infographics', 2232, '2015-12-04 10:17:15-05', '2015-12-04 10:17:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing--news and feature stories', 2233, '2015-12-04 10:17:15-05', '2015-12-04 10:17:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing--web content and e-newsletters', 2234, '2015-12-04 10:17:15-05', '2015-12-04 10:17:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Feature story writing', 2235, '2015-12-04 10:17:15-05', '2015-12-04 10:17:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Learning Adobe Illustrator and Photoshop', 2236, '2015-12-04 10:17:15-05', '2015-12-04 10:17:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Photo editing (I don''t pick up a camera anymore)', 2237, '2015-12-04 10:17:15-05', '2015-12-04 10:17:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CX', 2238, '2015-12-04 10:47:00-05', '2015-12-04 10:47:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'usable security', 2239, '2015-12-04 10:50:54-05', '2015-12-04 10:50:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'information architecture', 2240, '2015-12-04 10:50:54-05', '2015-12-04 10:50:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'monitoring and evaluation', 2241, '2015-12-04 11:46:18-05', '2015-12-04 11:46:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Patuxent River Estates, Maryland', 2242, '2015-12-04 13:49:04-05', '2015-12-04 13:49:04-05', NULL, '{"lat":"38.97956","lon":"-76.69608","source":"geonames","sourceId":"4365083","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'movies', 2243, '2015-12-04 13:58:42-05', '2015-12-04 13:58:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'population estimation', 2245, '2015-12-04 15:30:39-05', '2015-12-04 15:30:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Saint George, Utah', 2247, '2015-12-04 15:30:39-05', '2015-12-04 15:30:39-05', NULL, '{"lat":"37.10415","lon":"-113.58412","source":"geonames","sourceId":5546220,"gmtOffset":-7,"timeZoneId":"America/Denver","dstOffset":-6}');
INSERT INTO tagentity VALUES ('skill', 'habitat management', 2246, '2015-12-04 15:30:39-05', '2015-12-04 15:30:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'wild horses', 2244, '2015-12-04 15:30:39-05', '2015-12-04 15:30:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Austin, Texas', 2248, '2015-12-04 15:36:33-05', '2015-12-04 15:36:33-05', NULL, '{"lat":"30.26715","lon":"-97.74306","source":"geonames","sourceId":"4671654","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'consumer engagement', 2249, '2015-12-04 16:59:34-05', '2015-12-04 16:59:34-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'monetary policy', 2250, '2015-12-04 16:59:34-05', '2015-12-04 16:59:34-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hadoop', 2251, '2015-12-04 20:17:02-05', '2015-12-04 20:17:02-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Sterling, Virginia', 2252, '2015-12-07 06:47:41-05', '2015-12-07 06:47:41-05', NULL, '{"lat":"39.00622","lon":"-77.4286","source":"geonames","sourceId":"4787534","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Brunswick, Georgia', 2253, '2015-12-07 07:26:32-05', '2015-12-07 07:26:32-05', NULL, '{"lat":"31.14995","lon":"-81.49149","source":"geonames","sourceId":"4184845","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Suitland, Maryland', 2254, '2015-12-07 07:31:19-05', '2015-12-07 07:31:19-05', NULL, '{"lat":"38.84872","lon":"-76.92386","source":"geonames","sourceId":"4370616","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Agile Risk Management ', 2255, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'total cost of the Ownership', 2256, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Enterprise Resouce Planning', 2257, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Performance management ', 2258, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Psychology of Cultures and Workplace', 2259, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ergonomics', 2260, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'configuration management', 2261, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Performance Management', 2262, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'enabler', 2263, '2015-12-07 07:32:14-05', '2015-12-07 07:32:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Durham, North Carolina', 2264, '2015-12-07 07:37:09-05', '2015-12-07 07:37:09-05', NULL, '{"lat":"35.99403","lon":"-78.89862","source":"geonames","sourceId":"4464368","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Quantico, Virginia', 2265, '2015-12-07 07:56:29-05', '2015-12-07 07:56:29-05', NULL, '{"lat":"38.52234","lon":"-77.29359","source":"geonames","sourceId":"4780703","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Cincinnati, Ohio', 2266, '2015-12-07 09:12:11-05', '2015-12-07 09:12:11-05', NULL, '{"lat":"39.162","lon":"-84.45689","source":"geonames","sourceId":"4508722","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Newark, Delaware', 2267, '2015-12-07 09:13:43-05', '2015-12-07 09:13:43-05', NULL, '{"lat":"39.68372","lon":"-75.74966","source":"geonames","sourceId":"4143861","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'McLean, Virginia', 2268, '2015-12-07 09:17:33-05', '2015-12-07 09:17:33-05', NULL, '{"lat":"38.93428","lon":"-77.17748","source":"geonames","sourceId":"4772354","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'painting', 2269, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'internet research', 2270, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'sculpture', 2271, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Access data base design', 2272, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Powerpoint presentation design', 2273, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'share point developer', 2274, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'web developer', 2275, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'memorandum writer/editor', 2276, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'workforce succession planning', 2277, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'organizational skills trainer', 2278, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'employee development', 2279, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'on-line course developer', 2280, '2015-12-07 09:27:33-05', '2015-12-07 09:27:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Negotiation', 2356, '2015-12-15 16:15:39-05', '2015-12-15 16:15:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Little Rock, Arkansas', 2281, '2015-12-07 11:05:38-05', '2015-12-07 11:05:38-05', NULL, '{"lat":"34.74648","lon":"-92.28959","source":"geonames","sourceId":"4119403","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Newport News, Virginia', 2282, '2015-12-07 11:11:28-05', '2015-12-07 11:11:28-05', NULL, '{"lat":"36.97876","lon":"-76.428","source":"geonames","sourceId":"4776024","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Martinsburg, West Virginia', 2283, '2015-12-07 14:11:35-05', '2015-12-07 14:11:35-05', NULL, '{"lat":"39.45621","lon":"-77.96389","source":"geonames","sourceId":"4813878","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Indian Head, Maryland', 2284, '2015-12-07 14:53:53-05', '2015-12-07 14:53:53-05', NULL, '{"lat":"38.60012","lon":"-77.1622","source":"geonames","sourceId":"4358916","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Masters in Library and Information Science', 2285, '2015-12-07 16:33:09-05', '2015-12-07 16:33:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Certified Knowledge Manager', 2286, '2015-12-07 16:33:09-05', '2015-12-07 16:33:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cerified Taxonomy Specialist', 2287, '2015-12-07 16:33:09-05', '2015-12-07 16:33:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Certified Federal Records Manager (NARA)', 2289, '2015-12-07 16:33:09-05', '2015-12-07 16:33:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Certified Information Governance Specialist (AIIM)', 2288, '2015-12-07 16:33:09-05', '2015-12-07 16:33:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Masters in American History', 2290, '2015-12-07 16:33:09-05', '2015-12-07 16:33:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Certified Project Manager', 2291, '2015-12-07 16:33:09-05', '2015-12-07 16:33:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Narration', 2292, '2015-12-07 17:19:30-05', '2015-12-07 17:19:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Menlo Park, California', 2293, '2015-12-07 17:58:03-05', '2015-12-07 17:58:03-05', NULL, '{"lat":"37.45383","lon":"-122.18219","source":"geonames","sourceId":"5372223","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('skill', 'data analysis', 2294, '2015-12-07 18:06:04-05', '2015-12-07 18:06:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' STATA', 2295, '2015-12-07 18:06:04-05', '2015-12-07 18:06:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'one-on-one interviews', 2296, '2015-12-07 18:06:04-05', '2015-12-07 18:06:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Atlas.ti', 2297, '2015-12-07 18:06:04-05', '2015-12-07 18:06:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'survey design', 2298, '2015-12-07 18:06:04-05', '2015-12-07 18:06:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2299, '2015-12-08 06:31:35-05', '2015-12-08 06:31:35-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'contact center ', 2300, '2015-12-08 07:52:48-05', '2015-12-08 07:52:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'contact center ', 2301, '2015-12-08 07:58:14-05', '2015-12-08 07:58:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Marion, Iowa', 2302, '2015-12-08 12:20:05-05', '2015-12-08 12:20:05-05', NULL, '{"lat":"42.03417","lon":"-91.59768","source":"geonames","sourceId":"4866263","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Performance measurement', 2303, '2015-12-08 12:29:08-05', '2015-12-08 12:29:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Visual Basic programming', 2304, '2015-12-08 12:29:08-05', '2015-12-08 12:29:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Bangor Trident Base, Washington', 2305, '2015-12-08 19:55:33-05', '2015-12-08 19:55:33-05', NULL, '{"lat":"47.72274","lon":"-122.71446","source":"geonames","sourceId":"7260845","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('topic', 'Protocol Analysis', 2306, '2015-12-09 09:48:09-05', '2015-12-09 09:48:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Network Design', 2307, '2015-12-09 09:48:09-05', '2015-12-09 09:48:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Alexandria, Virginia', 2308, '2015-12-09 09:48:09-05', '2015-12-09 09:48:09-05', NULL, '{"lat":"38.80484","lon":"-77.04692","source":"geonames","sourceId":4744091,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Protocol Analysis', 2309, '2015-12-09 10:02:55-05', '2015-12-09 10:02:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing for the web', 2310, '2015-12-09 10:26:49-05', '2015-12-09 10:26:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Karaoke', 2311, '2015-12-09 11:32:33-05', '2015-12-09 11:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Motion Graphics', 2312, '2015-12-09 11:32:33-05', '2015-12-09 11:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe AfterEffects', 2313, '2015-12-09 11:32:33-05', '2015-12-09 11:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Teaching', 2314, '2015-12-09 11:32:33-05', '2015-12-09 11:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2315, '2015-12-09 11:44:17-05', '2015-12-09 11:44:17-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'animation', 2316, '2015-12-09 12:12:22-05', '2015-12-09 12:12:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'drawing', 2317, '2015-12-09 12:12:22-05', '2015-12-09 12:12:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content management systems', 2318, '2015-12-09 14:14:28-05', '2015-12-09 14:14:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' digital content creation', 2319, '2015-12-09 14:14:28-05', '2015-12-09 14:14:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'public communication', 2320, '2015-12-09 14:14:28-05', '2015-12-09 14:14:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Denali National Park, Alaska', 2321, '2015-12-09 14:14:28-05', '2015-12-09 14:14:28-05', NULL, '{"lat":"63.54078","lon":"-151.72361","source":"geonames","sourceId":8605009,"dstOffset":-8,"gmtOffset":-9,"timeZoneId":"America/Anchorage"}');
INSERT INTO tagentity VALUES ('topic', 'ski-joring', 2322, '2015-12-09 14:34:31-05', '2015-12-09 14:34:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'folksonomies', 2323, '2015-12-09 14:34:31-05', '2015-12-09 14:34:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'electrical engineering', 2324, '2015-12-10 08:53:31-05', '2015-12-10 08:53:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'GIS', 2325, '2015-12-10 12:27:22-05', '2015-12-10 12:27:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'ArcGIS', 2326, '2015-12-10 12:27:22-05', '2015-12-10 12:27:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Reston, Virginia', 2327, '2015-12-10 13:39:05-05', '2015-12-10 13:39:05-05', NULL, '{"lat":"38.96872","lon":"-77.3411","source":"geonames","sourceId":4781530,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'IT Strategic Planning', 2328, '2015-12-10 14:35:58-05', '2015-12-10 14:35:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Sales', 2329, '2015-12-11 12:04:55-05', '2015-12-11 12:04:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Customer Focused Consultative Approach', 2330, '2015-12-11 12:04:55-05', '2015-12-11 12:04:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Charlottesville, Virginia', 2331, '2015-12-11 14:01:55-05', '2015-12-11 14:01:55-05', NULL, '{"lat":"38.02931","lon":"-78.47668","source":"geonames","sourceId":"4752031","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'public policy', 2332, '2015-12-14 08:04:23-05', '2015-12-14 08:04:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Accra, Greater Accra, GH', 2333, '2015-12-14 10:14:11-05', '2015-12-14 10:14:11-05', NULL, '{"lat":"5.55602","lon":"-0.1969","source":"geonames","sourceId":2306104,"gmtOffset":0,"timeZoneId":"Africa/Accra","dstOffset":0}');
INSERT INTO tagentity VALUES ('location', 'Gatlinburg, Tennessee', 2334, '2015-12-14 10:50:25-05', '2015-12-14 10:50:25-05', NULL, '{"lat":"35.71453","lon":"-83.51189","source":"geonames","sourceId":"4624443","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Water', 2335, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Environmental Analysis', 2336, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Program Evaluation', 2337, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'China', 2338, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Southeast Asia', 2339, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Economic Analysis', 2340, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Evaluation', 2341, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Surveys', 2342, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Focus Groups', 2343, '2015-12-14 11:42:45-05', '2015-12-14 11:42:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Interviews', 2344, '2015-12-14 11:42:46-05', '2015-12-14 11:42:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Query and Reporting', 2345, '2015-12-14 12:41:36-05', '2015-12-14 12:41:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Mining', 2346, '2015-12-14 12:50:04-05', '2015-12-14 12:50:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Predictive Modeling', 2347, '2015-12-14 12:51:36-05', '2015-12-14 12:51:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Data Optimization', 2348, '2015-12-14 12:51:36-05', '2015-12-14 12:51:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Health Informatics', 2349, '2015-12-14 13:03:20-05', '2015-12-14 13:03:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Riverdale, Maryland', 2350, '2015-12-15 10:26:51-05', '2015-12-15 10:26:51-05', NULL, '{"lat":"39.09928","lon":"-76.5358","source":"geonames","sourceId":"4366910","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Clean energy', 2351, '2015-12-15 16:15:39-05', '2015-12-15 16:15:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Entrepreneurship', 2352, '2015-12-15 16:15:39-05', '2015-12-15 16:15:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'STEM', 2353, '2015-12-15 16:15:39-05', '2015-12-15 16:15:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Sustainability', 2354, '2015-12-15 16:15:39-05', '2015-12-15 16:15:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Science', 2355, '2015-12-15 16:15:39-05', '2015-12-15 16:15:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Fact checking', 2357, '2015-12-15 16:15:39-05', '2015-12-15 16:15:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2358, '2015-12-15 16:44:40-05', '2015-12-15 16:44:40-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'text mining', 2359, '2015-12-16 11:58:36-05', '2015-12-16 11:58:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'advanced analytics', 2360, '2015-12-16 11:58:36-05', '2015-12-16 11:58:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Lakewood, Colorado', 2361, '2015-12-16 12:42:37-05', '2015-12-16 12:42:37-05', NULL, '{"lat":"39.70471","lon":"-105.08137","source":"geonames","sourceId":"5427946","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'Behavioral Economics', 2362, '2015-12-16 18:20:05-05', '2015-12-16 18:20:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Behavioral Science', 2363, '2015-12-16 18:20:05-05', '2015-12-16 18:20:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Quantiative Analysis', 2364, '2015-12-16 18:20:05-05', '2015-12-16 18:20:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'network analysis', 2365, '2015-12-17 12:25:43-05', '2015-12-17 12:25:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Temple, Texas', 2366, '2015-12-17 12:43:28-05', '2015-12-17 12:43:28-05', NULL, '{"lat":"31.09823","lon":"-97.34278","source":"geonames","sourceId":"4735966","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Columbia, South Carolina', 2367, '2015-12-17 12:44:43-05', '2015-12-17 12:44:43-05', NULL, '{"lat":"34.00071","lon":"-81.03481","source":"geonames","sourceId":"4575352","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'tinkering with old cars', 2368, '2015-12-17 12:51:00-05', '2015-12-17 12:51:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' raising and caring for two femaile Siberian Huskies', 2369, '2015-12-17 12:51:00-05', '2015-12-17 12:51:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', '5 children and 1 grandchild keep me busy still', 2370, '2015-12-17 12:51:00-05', '2015-12-17 12:51:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'See BIO above', 2371, '2015-12-17 12:51:00-05', '2015-12-17 12:51:00-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Information Security', 2372, '2015-12-17 13:01:02-05', '2015-12-17 13:01:02-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Crowley, Louisiana', 2373, '2015-12-17 13:02:00-05', '2015-12-17 13:02:00-05', NULL, '{"lat":"30.21409","lon":"-92.37458","source":"geonames","sourceId":"4321310","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Saint Paul, Minnesota', 2374, '2015-12-17 13:03:16-05', '2015-12-17 13:03:16-05', NULL, '{"lat":"44.94441","lon":"-93.09327","source":"geonames","sourceId":"5045360","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Informatoin security', 2375, '2015-12-17 13:37:18-05', '2015-12-17 13:37:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Computer programming', 2376, '2015-12-17 13:37:18-05', '2015-12-17 13:37:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Visual Studio', 2377, '2015-12-17 13:37:18-05', '2015-12-17 13:37:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SQL Server', 2378, '2015-12-17 13:37:18-05', '2015-12-17 13:37:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Nessus', 2379, '2015-12-17 13:37:18-05', '2015-12-17 13:37:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Network Vuilnerability Scanning', 2380, '2015-12-17 13:37:18-05', '2015-12-17 13:37:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Kansas City, Missouri', 2381, '2015-12-17 13:37:18-05', '2015-12-17 13:37:18-05', NULL, '{"lat":"39.09973","lon":"-94.57857","source":"geonames","sourceId":4393217,"dstOffset":-5,"gmtOffset":-6,"timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Des Moines, Iowa', 2382, '2015-12-17 13:39:31-05', '2015-12-17 13:39:31-05', NULL, '{"lat":"41.60054","lon":"-93.60911","source":"geonames","sourceId":"4853828","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Clinton, Missouri', 2383, '2015-12-17 13:45:57-05', '2015-12-17 13:45:57-05', NULL, '{"lat":"38.36863","lon":"-93.77827","source":"geonames","sourceId":"4381643","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Security', 2384, '2015-12-17 13:52:19-05', '2015-12-17 13:52:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Network+', 2385, '2015-12-17 13:52:19-05', '2015-12-17 13:52:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'A+', 2386, '2015-12-17 13:52:19-05', '2015-12-17 13:52:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Security+', 2387, '2015-12-17 13:52:19-05', '2015-12-17 13:52:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hardware', 2388, '2015-12-17 13:52:19-05', '2015-12-17 13:52:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Kayaking', 2389, '2015-12-17 13:55:37-05', '2015-12-17 13:55:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Yorkville, Illinois', 2390, '2015-12-17 14:19:21-05', '2015-12-17 14:19:21-05', NULL, '{"lat":"41.64114","lon":"-88.44729","source":"geonames","sourceId":"4917298","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Bay Minette, Alabama', 2391, '2015-12-17 14:38:07-05', '2015-12-17 14:38:07-05', NULL, '{"lat":"30.88296","lon":"-87.77305","source":"geonames","sourceId":"4046255","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Mayfield, Kentucky', 2392, '2015-12-17 16:57:00-05', '2015-12-17 16:57:00-05', NULL, '{"lat":"36.74172","lon":"-88.63672","source":"geonames","sourceId":"4300105","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Brookings, South Dakota', 2393, '2015-12-17 16:58:30-05', '2015-12-17 16:58:30-05', NULL, '{"lat":"44.31136","lon":"-96.79839","source":"geonames","sourceId":"5226534","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'c# programming', 2394, '2015-12-17 17:01:20-05', '2015-12-17 17:01:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'C++ ', 2395, '2015-12-17 17:01:20-05', '2015-12-17 17:01:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Tech Support', 2396, '2015-12-17 17:01:20-05', '2015-12-17 17:01:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Indianapolis, Indiana', 2397, '2015-12-17 18:44:34-05', '2015-12-17 18:44:34-05', NULL, '{"lat":"39.76838","lon":"-86.15804","source":"geonames","sourceId":"4259418","gmtOffset":"-5","timeZoneId":"America/Indiana/Indianapolis","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Harrisburg, Pennsylvania', 2398, '2015-12-18 09:05:32-05', '2015-12-18 09:05:32-05', NULL, '{"lat":"40.2737","lon":"-76.88442","source":"geonames","sourceId":"5192726","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Hays, Kansas', 2399, '2015-12-18 09:24:23-05', '2015-12-18 09:24:23-05', NULL, '{"lat":"38.87918","lon":"-99.32677","source":"geonames","sourceId":"4272782","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Mount Vernon, Washington', 2400, '2015-12-18 15:29:27-05', '2015-12-18 15:29:27-05', NULL, '{"lat":"48.42122","lon":"-122.33405","source":"geonames","sourceId":"5804127","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'Learning New Things', 2401, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Linux', 2402, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Computing', 2403, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Firewalls', 2404, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Proxies', 2405, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Air Force Boundary Protection', 2406, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'B.S. in Information Systems', 2407, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'M.B.A. in Information Systems', 2408, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'System Administrator', 2409, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Windows OS', 2410, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '15 Years Professional IT Experience', 2411, '2015-12-18 16:39:53-05', '2015-12-18 16:39:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Port Hueneme, California', 2412, '2015-12-18 16:43:25-05', '2015-12-18 16:43:25-05', NULL, '{"lat":"34.14778","lon":"-119.19511","source":"geonames","sourceId":"5384339","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('topic', 'Learning', 2413, '2015-12-18 16:50:13-05', '2015-12-18 16:50:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CompTIA A+', 2414, '2015-12-18 16:50:13-05', '2015-12-18 16:50:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CompTIA Security+', 2415, '2015-12-18 16:50:13-05', '2015-12-18 16:50:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CompTIA Network+', 2416, '2015-12-18 16:50:13-05', '2015-12-18 16:50:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Air Force Boundary Protection Specialist', 2417, '2015-12-18 16:50:13-05', '2015-12-18 16:50:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'B.S. Information Technology', 2418, '2015-12-18 16:50:13-05', '2015-12-18 16:50:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'M.B.A. Information Technology', 2419, '2015-12-18 16:50:13-05', '2015-12-18 16:50:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Basic Programming', 2420, '2015-12-18 16:50:13-05', '2015-12-18 16:50:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'renewable energy', 2421, '2015-12-18 16:50:57-05', '2015-12-18 16:50:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'energy storage', 2422, '2015-12-18 16:50:57-05', '2015-12-18 16:50:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'energy analysis', 2423, '2015-12-18 16:50:57-05', '2015-12-18 16:50:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'R ', 2424, '2015-12-18 16:50:57-05', '2015-12-18 16:50:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Masters in Information Asurance ', 2425, '2015-12-18 18:07:08-05', '2015-12-18 18:07:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Auto-learning for Image Recgonition', 2426, '2015-12-21 10:06:41-05', '2015-12-21 10:06:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Innovation ', 2427, '2015-12-21 10:06:41-05', '2015-12-21 10:06:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Knowledge Management', 2428, '2015-12-21 10:06:41-05', '2015-12-21 10:06:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Asset Management', 2429, '2015-12-21 10:06:41-05', '2015-12-21 10:06:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'systems administration', 2430, '2015-12-21 11:01:03-05', '2015-12-21 11:01:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'voip technology', 2431, '2015-12-21 11:01:03-05', '2015-12-21 11:01:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'pstn technology', 2432, '2015-12-21 11:01:03-05', '2015-12-21 11:01:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'telephony', 2433, '2015-12-21 11:01:03-05', '2015-12-21 11:01:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'network administration', 2434, '2015-12-21 11:01:03-05', '2015-12-21 11:01:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cisco routing and switching', 2435, '2015-12-21 11:01:03-05', '2015-12-21 11:01:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cisco voice', 2436, '2015-12-21 11:01:03-05', '2015-12-21 11:01:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'it security', 2437, '2015-12-21 11:01:03-05', '2015-12-21 11:01:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobility technology', 2438, '2015-12-21 11:03:42-05', '2015-12-21 11:03:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Columbia, Missouri', 2439, '2015-12-21 16:22:29-05', '2015-12-21 16:22:29-05', NULL, '{"lat":"38.95171","lon":"-92.33407","source":"geonames","sourceId":"4381982","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'Citrix', 2440, '2015-12-21 16:25:58-05', '2015-12-21 16:25:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'St. Louis, Missouri', 2441, '2015-12-22 12:20:36-05', '2015-12-22 12:20:36-05', NULL, '{"lat":"38.62727","lon":"-90.19789","source":"geonames","sourceId":"4407066","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'St. Louis, Missouri', 2442, '2015-12-22 16:37:42-05', '2015-12-22 16:37:42-05', NULL, '{"lat":"38.62727","lon":"-90.19789","source":"geonames","sourceId":"4407066","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'database administration', 2443, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'c++ programming', 2444, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ITIL Problem Management/Knowledge Management', 2445, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data structures', 2446, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Bachelors of Science in Computer Science: Concentration in Mathematics:  Calculus I II & Multivariable', 2447, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Differential Equations', 2448, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Finite Mathematics', 2449, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Linear Algebra', 2450, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'System design and analysis', 2451, '2015-12-22 17:01:50-05', '2015-12-22 17:01:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ITIL V2011 Certification', 2452, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ITIL Problem/Knowledge management', 2453, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MS server 2003/2008', 2454, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'experience with databases - oracle - sybase', 2455, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'LAN/WAN manager', 2456, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'system administrator - telephony', 2457, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Bachelors of Science in Computer Science: Concentration in Mathematics:  Calculus I II & Multivariable', 2458, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Differential Equations', 2459, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Linear Algebra', 2460, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Finite Mathematics', 2461, '2015-12-22 17:13:38-05', '2015-12-22 17:13:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Eureka, Illinois', 2462, '2015-12-23 08:59:19-05', '2015-12-23 08:59:19-05', NULL, '{"lat":"40.72143","lon":"-89.27286","source":"geonames","sourceId":"4891310","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'selenium test automation', 2463, '2015-12-23 10:14:19-05', '2015-12-23 10:14:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'healthcare informatics', 2464, '2015-12-23 10:15:43-05', '2015-12-23 10:15:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HIPAA Compliance', 2465, '2015-12-23 10:15:43-05', '2015-12-23 10:15:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Yokota, Tokyo, JP', 2466, '2015-12-23 17:33:03-05', '2015-12-23 17:33:03-05', NULL, '{"lat":"35.75","lon":"139.38333","source":"geonames","sourceId":1848305,"dstOffset":9,"gmtOffset":9,"timeZoneId":"Asia/Tokyo"}');
INSERT INTO tagentity VALUES ('location', 'Stuttgart, Baden-Württemberg, DE', 2467, '2015-12-28 07:40:46-05', '2015-12-28 07:40:46-05', NULL, '{"lat":"48.78232","lon":"9.17702","source":"geonames","sourceId":"2825297","dstOffset":"2","gmtOffset":"1","timeZoneId":"Europe/Berlin"}');
INSERT INTO tagentity VALUES ('location', 'Fairfield, Iowa', 2468, '2015-12-28 15:14:35-05', '2015-12-28 15:14:35-05', NULL, '{"lat":"41.00863","lon":"-91.96267","source":"geonames","sourceId":"4855967","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2469, '2015-12-30 13:32:25-05', '2015-12-30 13:32:25-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Automation', 2470, '2016-01-04 10:29:34-05', '2016-01-04 10:29:34-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Automation', 2471, '2016-01-04 10:29:34-05', '2016-01-04 10:29:34-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Linux OS', 2472, '2016-01-04 10:29:34-05', '2016-01-04 10:29:34-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Unix OS', 2473, '2016-01-04 10:29:34-05', '2016-01-04 10:29:34-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Red Hat', 2474, '2016-01-04 10:37:21-05', '2016-01-04 10:37:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Puppet Enterprise', 2475, '2016-01-04 10:37:21-05', '2016-01-04 10:37:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Satellite', 2476, '2016-01-04 10:37:21-05', '2016-01-04 10:37:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MuleSoft ESB', 2477, '2016-01-04 10:37:21-05', '2016-01-04 10:37:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Stenography', 2478, '2016-01-04 11:26:07-05', '2016-01-04 11:26:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'acquisition workforce', 2479, '2016-01-05 07:15:36-05', '2016-01-05 07:15:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' FAI', 2480, '2016-01-05 07:15:36-05', '2016-01-05 07:15:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal Acquisition Institute', 2481, '2016-01-05 07:15:36-05', '2016-01-05 07:15:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'contracting', 2482, '2016-01-05 07:15:36-05', '2016-01-05 07:15:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Running', 2483, '2016-01-05 11:37:59-05', '2016-01-05 11:37:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' cycling', 2484, '2016-01-05 11:37:59-05', '2016-01-05 11:37:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' reading', 2485, '2016-01-05 11:37:59-05', '2016-01-05 11:37:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'family', 2486, '2016-01-05 11:37:59-05', '2016-01-05 11:37:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contract Management', 2487, '2016-01-05 11:37:59-05', '2016-01-05 11:37:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'organizational development ', 2488, '2016-01-05 11:37:59-05', '2016-01-05 11:37:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Skills repository', 2489, '2016-01-05 14:37:43-05', '2016-01-05 14:37:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' learning', 2490, '2016-01-05 14:37:43-05', '2016-01-05 14:37:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'learning management system', 2491, '2016-01-05 14:37:43-05', '2016-01-05 14:37:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'business improvement processes', 2492, '2016-01-05 15:33:10-05', '2016-01-05 15:33:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'recruiting', 2493, '2016-01-05 15:33:10-05', '2016-01-05 15:33:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Large group facilitation', 2494, '2016-01-06 08:26:32-05', '2016-01-06 08:26:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'visual', 2495, '2016-01-06 08:29:22-05', '2016-01-06 08:29:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lean', 2496, '2016-01-06 08:29:22-05', '2016-01-06 08:29:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'coach', 2497, '2016-01-06 08:29:23-05', '2016-01-06 08:29:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'leadership development', 2498, '2016-01-06 08:29:23-05', '2016-01-06 08:29:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'strategic workforce planning', 2499, '2016-01-06 09:57:33-05', '2016-01-06 09:57:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PD Classification', 2500, '2016-01-06 09:57:33-05', '2016-01-06 09:57:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Behavioral economics', 2501, '2016-01-06 10:56:06-05', '2016-01-06 10:56:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MATLAB', 2502, '2016-01-06 10:56:06-05', '2016-01-06 10:56:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ACCESS', 2503, '2016-01-06 10:56:06-05', '2016-01-06 10:56:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Vendor Relations', 2504, '2016-01-06 11:01:36-05', '2016-01-06 11:01:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'KM', 2505, '2016-01-06 11:30:35-05', '2016-01-06 11:30:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' CI', 2506, '2016-01-06 11:30:35-05', '2016-01-06 11:30:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'BI', 2507, '2016-01-06 11:30:35-05', '2016-01-06 11:30:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Confluence', 2508, '2016-01-06 11:30:35-05', '2016-01-06 11:30:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'dogs', 2509, '2016-01-06 16:34:48-05', '2016-01-06 16:34:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Art', 2510, '2016-01-07 12:39:30-05', '2016-01-07 12:39:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Music', 2511, '2016-01-07 12:39:30-05', '2016-01-07 12:39:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'VISUAL COMMUNICATION', 2512, '2016-01-07 13:23:33-05', '2016-01-07 13:23:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'MUSIC PRODUCTION', 2513, '2016-01-07 13:23:33-05', '2016-01-07 13:23:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'SHAREPOINT BRANDING', 2514, '2016-01-07 13:25:20-05', '2016-01-07 13:25:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SHAREPOINT BRANDING', 2515, '2016-01-07 13:25:20-05', '2016-01-07 13:25:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sustainable Design', 2693, '2016-02-10 09:03:09-05', '2016-02-10 09:03:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2516, '2016-01-07 16:08:04-05', '2016-01-07 16:08:04-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2517, '2016-01-08 13:32:24-05', '2016-01-08 13:32:24-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'graphics', 2518, '2016-01-08 14:46:14-05', '2016-01-08 14:46:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'RegTech', 2519, '2016-01-08 17:14:32-05', '2016-01-08 17:14:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Financial Inclusion', 2520, '2016-01-08 17:14:32-05', '2016-01-08 17:14:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Supervision', 2521, '2016-01-08 17:14:32-05', '2016-01-08 17:14:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Regulation ', 2522, '2016-01-08 17:14:32-05', '2016-01-08 17:14:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Digital Finance', 2523, '2016-01-08 17:14:32-05', '2016-01-08 17:14:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Frederick, Maryland', 2524, '2016-01-11 09:07:01-05', '2016-01-11 09:07:01-05', NULL, '{"lat":"39.41427","lon":"-77.41054","source":"geonames","sourceId":"4355585","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Financial Inclusion', 2525, '2016-01-11 17:51:23-05', '2016-01-11 17:51:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Consumer Finance', 2526, '2016-01-11 17:51:23-05', '2016-01-11 17:51:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Consumer Protection', 2527, '2016-01-11 17:51:23-05', '2016-01-11 17:51:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('task-time-required', 'Full Time Detail', 2528, '2016-01-11 18:43:23-05', '2016-01-11 18:43:23-05', NULL, '{"agency":{"name":"General Services Administration (GSA)","id":182}}');
INSERT INTO tagentity VALUES ('topic', 'Audiobooks', 2529, '2016-01-12 15:53:31-05', '2016-01-12 15:53:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Podcasts', 2530, '2016-01-12 15:53:31-05', '2016-01-12 15:53:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'GSA', 2531, '2016-01-13 13:13:04-05', '2016-01-13 13:13:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Lexington, Nebraska', 2532, '2016-01-14 15:00:02-05', '2016-01-14 15:00:02-05', NULL, '{"lat":"40.78084","lon":"-99.7415","source":"geonames","sourceId":"5071934","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Bridgeport, Texas', 2533, '2016-01-15 08:28:56-05', '2016-01-15 08:28:56-05', NULL, '{"lat":"33.21012","lon":"-97.75476","source":"geonames","sourceId":"4676327","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'WCAG', 2534, '2016-01-15 12:07:04-05', '2016-01-15 12:07:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'svn', 2535, '2016-01-15 12:07:04-05', '2016-01-15 12:07:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'W3C WCAG 2.0', 2536, '2016-01-15 12:21:39-05', '2016-01-15 12:21:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Walla Walla, Washington', 2537, '2016-01-19 16:25:20-05', '2016-01-19 16:25:20-05', NULL, '{"lat":"46.06458","lon":"-118.34302","source":"geonames","sourceId":"5814916","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2538, '2016-01-20 08:27:52-05', '2016-01-20 08:27:52-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'development', 2539, '2016-01-20 11:30:50-05', '2016-01-20 11:30:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Python', 2540, '2016-01-20 11:30:50-05', '2016-01-20 11:30:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Ruby', 2541, '2016-01-20 11:30:50-05', '2016-01-20 11:30:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Markdown', 2542, '2016-01-20 11:30:50-05', '2016-01-20 11:30:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web writing', 2543, '2016-01-20 13:12:43-05', '2016-01-20 13:12:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Communications planning', 2544, '2016-01-20 13:12:43-05', '2016-01-20 13:12:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Honolulu, Hawaii', 2545, '2016-01-21 19:19:39-05', '2016-01-21 19:19:39-05', NULL, '{"lat":"21.30694","lon":"-157.85833","source":"geonames","sourceId":"5856195","gmtOffset":"-10","timeZoneId":"Pacific/Honolulu","dstOffset":"-10"}');
INSERT INTO tagentity VALUES ('location', 'Newtown Square, Pennsylvania', 2546, '2016-01-22 09:58:34-05', '2016-01-22 09:58:34-05', NULL, '{"lat":"39.98678","lon":"-75.40103","source":"geonames","sourceId":"4560006","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'innovation', 2547, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' innovations', 2548, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' challenge', 2549, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' prize', 2550, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' winners', 2551, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' ventures', 2552, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' platform', 2553, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' funding', 2554, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' investment', 2555, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' programming', 2556, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' website', 2557, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'portal', 2558, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social network', 2559, '2016-01-22 16:22:41-05', '2016-01-22 16:22:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'innovation design', 2560, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'organizational innovation', 2561, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'prizes', 2562, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'challenges', 2563, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'modern management', 2564, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'change management', 2565, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'innovation design', 2566, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'prizes', 2567, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'challenges', 2568, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social behavior', 2569, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'management', 2570, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'innovative leadership', 2571, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'organizational culture ', 2572, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'organizational behavior', 2573, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social networks', 2574, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'platform design', 2575, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'private sector partnerships', 2576, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'entreprenuership', 2577, '2016-01-22 16:28:45-05', '2016-01-22 16:28:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customer Interface', 2578, '2016-01-25 17:54:35-05', '2016-01-25 17:54:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Small group discussions', 2579, '2016-01-25 17:54:35-05', '2016-01-25 17:54:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Learn about Policy and its increasing importance', 2580, '2016-01-25 17:54:35-05', '2016-01-25 17:54:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Scott Air Force Base, Illinois', 2581, '2016-01-26 07:46:52-05', '2016-01-26 07:46:52-05', NULL, '{"lat":"38.5427","lon":"-89.85035","source":"geonames","sourceId":"7259489","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Guitar', 2582, '2016-01-26 07:50:40-05', '2016-01-26 07:50:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Mountain Biking', 2583, '2016-01-26 07:50:40-05', '2016-01-26 07:50:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Pivot Tables', 2584, '2016-01-26 07:50:40-05', '2016-01-26 07:50:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'OneNote', 2585, '2016-01-26 07:50:40-05', '2016-01-26 07:50:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'West Hattiesburg, Mississippi', 2586, '2016-01-26 10:41:13-05', '2016-01-26 10:41:13-05', NULL, '{"lat":"31.31906","lon":"-89.37506","source":"geonames","sourceId":"4450695","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', 'IBM RPG Programming Language', 2587, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'COBOL Programming Language', 2588, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CISCO EVOIP', 2589, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Android Devices', 2590, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Simpana Commvault', 2591, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Active Directory', 2592, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Operating System Deployment', 2593, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Printing Administration', 2594, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SCCM', 2595, '2016-01-26 12:32:12-05', '2016-01-26 12:32:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Windows Server 2012', 2596, '2016-01-26 12:40:55-05', '2016-01-26 12:40:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'intrusion detection and prevention systems', 2597, '2016-01-26 12:49:35-05', '2016-01-26 12:49:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'network vulnerability scanning', 2598, '2016-01-26 12:49:35-05', '2016-01-26 12:49:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'network vulnerability scanning', 2599, '2016-01-26 12:49:36-05', '2016-01-26 12:49:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Architecture', 2694, '2016-02-10 09:09:24-05', '2016-02-10 09:09:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Inclusion', 2903, '2016-03-22 12:51:11-04', '2016-03-22 12:51:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'San Diego, California', 2600, '2016-01-26 15:30:06-05', '2016-01-26 15:30:06-05', NULL, '{"lat":"32.71533","lon":"-117.15726","source":"geonames","sourceId":"5391811","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('skill', '#webpage', 2601, '2016-01-26 16:00:01-05', '2016-01-26 16:00:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '#html', 2602, '2016-01-26 16:00:01-05', '2016-01-26 16:00:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '#angularjs', 2603, '2016-01-26 16:00:01-05', '2016-01-26 16:00:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '#mentalhealth', 2604, '2016-01-26 16:00:01-05', '2016-01-26 16:00:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '#screening', 2605, '2016-01-26 16:00:01-05', '2016-01-26 16:00:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'anxiety disorders', 2606, '2016-01-26 16:41:15-05', '2016-01-26 16:41:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research coordination', 2607, '2016-01-26 16:41:15-05', '2016-01-26 16:41:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'machine learning', 2608, '2016-01-26 20:44:17-05', '2016-01-26 20:44:17-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'facilities engineering', 2609, '2016-01-26 20:48:54-05', '2016-01-26 20:48:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'system engineering', 2610, '2016-01-26 20:48:54-05', '2016-01-26 20:48:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'technology research', 2611, '2016-01-27 10:39:16-05', '2016-01-27 10:39:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mental health', 2612, '2016-01-27 10:39:16-05', '2016-01-27 10:39:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Information Technology', 2613, '2016-01-27 11:31:10-05', '2016-01-27 11:31:10-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Geography', 2614, '2016-01-27 11:40:30-05', '2016-01-27 11:40:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Astrophysics', 2615, '2016-01-27 11:40:30-05', '2016-01-27 11:40:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Dynamic Modeling', 2616, '2016-01-27 11:40:30-05', '2016-01-27 11:40:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Decision Theory', 2617, '2016-01-27 11:40:30-05', '2016-01-27 11:40:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Game Theory', 2618, '2016-01-27 11:40:30-05', '2016-01-27 11:40:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'perl', 2619, '2016-01-27 11:47:54-05', '2016-01-27 11:47:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'objective c', 2620, '2016-01-27 11:47:54-05', '2016-01-27 11:47:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'windows phone', 2621, '2016-01-27 11:47:54-05', '2016-01-27 11:47:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'regulation', 2622, '2016-01-27 12:31:45-05', '2016-01-27 12:31:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'policy analysis', 2623, '2016-01-27 12:31:45-05', '2016-01-27 12:31:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Bakersfield, California', 2624, '2016-01-27 12:31:45-05', '2016-01-27 12:31:45-05', NULL, '{"lat":"35.37329","lon":"-119.01871","source":"geonames","sourceId":5325738,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('location', 'Fort Collins, Colorado', 2625, '2016-01-27 12:32:00-05', '2016-01-27 12:32:00-05', NULL, '{"lat":"40.58526","lon":"-105.08442","source":"geonames","sourceId":"5577147","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('topic', 'knowledgement management', 2626, '2016-01-28 10:28:29-05', '2016-01-28 10:28:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Innovation in Government ', 2627, '2016-01-28 12:47:25-05', '2016-01-28 12:47:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Organizational Leadership ', 2628, '2016-01-28 12:47:25-05', '2016-01-28 12:47:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Backend Development', 2629, '2016-01-28 13:47:51-05', '2016-01-28 13:47:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Computer Development', 2630, '2016-01-28 13:47:51-05', '2016-01-28 13:47:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'snowboarding', 2631, '2016-01-29 16:19:53-05', '2016-01-29 16:19:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'motorcycles', 2632, '2016-01-29 16:19:53-05', '2016-01-29 16:19:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '.net', 2633, '2016-01-29 16:19:53-05', '2016-01-29 16:19:53-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Security', 2634, '2016-01-29 16:22:31-05', '2016-01-29 16:22:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'data analysis', 2635, '2016-01-29 16:22:31-05', '2016-01-29 16:22:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cyber security', 2636, '2016-01-29 16:22:31-05', '2016-01-29 16:22:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'powershell', 2637, '2016-01-29 16:22:31-05', '2016-01-29 16:22:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Statistics', 2638, '2016-01-30 17:54:13-05', '2016-01-30 17:54:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'vulnerability scanning', 2639, '2016-01-30 18:54:33-05', '2016-01-30 18:54:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2640, '2016-02-01 11:31:15-05', '2016-02-01 11:31:15-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'integrative health', 2641, '2016-02-02 09:24:04-05', '2016-02-02 09:24:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 2642, '2016-02-02 09:24:04-05', '2016-02-02 09:24:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'relationship building ', 2643, '2016-02-02 09:24:04-05', '2016-02-02 09:24:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fort Lee, Virginia', 2644, '2016-02-03 09:48:51-05', '2016-02-03 09:48:51-05', NULL, '{"lat":"37.24694","lon":"-77.33442","source":"geonames","sourceId":"7257908","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Acquisitions Workforce', 2645, '2016-02-03 09:58:37-05', '2016-02-03 09:58:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'management structure', 2646, '2016-02-03 09:58:37-05', '2016-02-03 09:58:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT deployment', 2647, '2016-02-03 09:58:37-05', '2016-02-03 09:58:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Communications Design', 2648, '2016-02-03 09:58:37-05', '2016-02-03 09:58:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Process', 2649, '2016-02-03 09:58:37-05', '2016-02-03 09:58:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Government Policy', 2650, '2016-02-03 09:58:37-05', '2016-02-03 09:58:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'AWS', 2651, '2016-02-03 11:45:38-05', '2016-02-03 11:45:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cPanel/WHM', 2652, '2016-02-03 11:45:38-05', '2016-02-03 11:45:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SSH', 2653, '2016-02-03 11:45:38-05', '2016-02-03 11:45:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Expert in business negociation', 2654, '2016-02-04 09:11:22-05', '2016-02-04 09:11:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Expert in Procurment Negociation', 2655, '2016-02-04 09:12:25-05', '2016-02-04 09:12:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile testing', 2656, '2016-02-04 09:17:44-05', '2016-02-04 09:17:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'The Arts', 2657, '2016-02-04 10:12:41-05', '2016-02-04 10:12:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Public Private Partnerships', 2658, '2016-02-04 10:12:41-05', '2016-02-04 10:12:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cultural Studies', 2659, '2016-02-04 10:12:41-05', '2016-02-04 10:12:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Visual Arts', 2660, '2016-02-04 10:12:41-05', '2016-02-04 10:12:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cultural Diplomacy', 2662, '2016-02-04 10:12:41-05', '2016-02-04 10:12:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Diplomacy', 2661, '2016-02-04 10:12:41-05', '2016-02-04 10:12:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Diplomacy', 2663, '2016-02-04 10:12:41-05', '2016-02-04 10:12:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Intercultural Communication', 2664, '2016-02-04 10:12:41-05', '2016-02-04 10:12:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Foreign Policy', 2665, '2016-02-04 10:12:57-05', '2016-02-04 10:12:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Contemporary Art', 2666, '2016-02-04 10:23:46-05', '2016-02-04 10:23:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cultural Arts', 2667, '2016-02-04 10:23:46-05', '2016-02-04 10:23:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Audio & Video Production', 2668, '2016-02-04 10:23:46-05', '2016-02-04 10:23:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Greenbelt, Maryland', 2669, '2016-02-04 10:34:53-05', '2016-02-04 10:34:53-05', NULL, '{"lat":"39.00455","lon":"-76.87553","source":"geonames","sourceId":"4356847","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Emmitsburg, Maryland', 2670, '2016-02-04 10:44:41-05', '2016-02-04 10:44:41-05', NULL, '{"lat":"39.70454","lon":"-77.32693","source":"geonames","sourceId":"4354352","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'UX', 2671, '2016-02-04 11:14:46-05', '2016-02-04 11:14:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Goddard, Maryland', 2672, '2016-02-04 15:18:22-05', '2016-02-04 15:18:22-05', NULL, '{"lat":"38.98955","lon":"-76.85331","source":"geonames","sourceId":"4356341","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Career consular office', 2673, '2016-02-04 16:47:44-05', '2016-02-04 16:47:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Solar Power', 2674, '2016-02-08 10:56:50-05', '2016-02-08 10:56:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Camping', 2675, '2016-02-08 10:56:50-05', '2016-02-08 10:56:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Gardening', 2677, '2016-02-08 10:56:50-05', '2016-02-08 10:56:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Making the world a better place', 2678, '2016-02-08 10:56:50-05', '2016-02-08 10:56:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Ultimate Frisbee', 2676, '2016-02-08 10:56:50-05', '2016-02-08 10:56:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Medical Staff Affairs', 2679, '2016-02-08 15:33:12-05', '2016-02-08 15:33:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Credentialing', 2680, '2016-02-08 15:33:12-05', '2016-02-08 15:33:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Privileging', 2681, '2016-02-08 15:33:12-05', '2016-02-08 15:33:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hospital', 2682, '2016-02-08 15:33:12-05', '2016-02-08 15:33:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Healthcare Management', 2683, '2016-02-08 15:33:12-05', '2016-02-08 15:33:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Physician Relations', 2684, '2016-02-08 15:33:12-05', '2016-02-08 15:33:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Joint Commission', 2685, '2016-02-08 15:33:12-05', '2016-02-08 15:33:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Accredidation', 2686, '2016-02-08 15:33:12-05', '2016-02-08 15:33:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Root Cause Analysis', 2687, '2016-02-08 15:33:13-05', '2016-02-08 15:33:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSS', 2688, '2016-02-09 14:16:55-05', '2016-02-09 14:16:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Micro details', 2689, '2016-02-10 08:45:33-05', '2016-02-10 08:45:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Resource Development', 2690, '2016-02-10 09:02:45-05', '2016-02-10 09:02:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Architectural Design', 2691, '2016-02-10 09:03:09-05', '2016-02-10 09:03:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Construction Management', 2692, '2016-02-10 09:03:09-05', '2016-02-10 09:03:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Protfolio Management', 2695, '2016-02-10 09:09:24-05', '2016-02-10 09:09:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Finalcial Literacy', 2696, '2016-02-10 09:09:24-05', '2016-02-10 09:09:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Lifecycle Management', 2697, '2016-02-10 09:09:24-05', '2016-02-10 09:09:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Arcihitectural Design', 2698, '2016-02-10 09:09:24-05', '2016-02-10 09:09:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Helping people I currently volunteer in  a feeding the homeless organization in Kansas City.  I also assit in coaching girls basketball team for 10', 2699, '2016-02-10 11:03:03-05', '2016-02-10 11:03:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', '11 and 12 year olds.  I''m interested in energy work such as massage therapy and pranic healing.', 2700, '2016-02-10 11:03:03-05', '2016-02-10 11:03:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'I love to read books', 2701, '2016-02-10 11:03:03-05', '2016-02-10 11:03:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' I love to travel', 2702, '2016-02-10 11:03:03-05', '2016-02-10 11:03:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'I''m currently trying to learn how to speak Arabic.', 2703, '2016-02-10 11:03:03-05', '2016-02-10 11:03:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'In the future I would like to be an Arctic Yoga', 2704, '2016-02-10 11:03:03-05', '2016-02-10 11:03:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'I am currently working on becoming debt free!', 2705, '2016-02-10 11:03:03-05', '2016-02-10 11:03:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Time Management', 2706, '2016-02-10 11:03:04-05', '2016-02-10 11:03:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ability to multitask', 2707, '2016-02-10 11:03:04-05', '2016-02-10 11:03:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Develop Plan and Excute Projects', 2708, '2016-02-10 11:03:04-05', '2016-02-10 11:03:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'financial freedom', 2709, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'books', 2710, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'learning different langauages', 2711, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'energy work', 2712, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'pranic healing', 2713, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Arctic Yoga', 2714, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'living a purpose driving life', 2715, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Efficient', 2716, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ability to organize ', 2717, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Reliable', 2718, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Trustworthy', 2719, '2016-02-10 12:55:23-05', '2016-02-10 12:55:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Bethesda, Maryland', 2720, '2016-02-11 16:13:23-05', '2016-02-11 16:13:23-05', NULL, '{"lat":"38.98067","lon":"-77.10026","source":"geonames","sourceId":"4348599","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2721, '2016-02-16 07:53:10-05', '2016-02-16 07:53:10-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Sacramento, California', 2722, '2016-02-17 09:46:38-05', '2016-02-17 09:46:38-05', NULL, '{"lat":"38.58157","lon":"-121.4944","source":"geonames","sourceId":"5389489","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('skill', 'Omeka', 2723, '2016-02-17 09:51:24-05', '2016-02-17 09:51:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Library', 2724, '2016-02-17 09:51:24-05', '2016-02-17 09:51:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Museum Collections', 2725, '2016-02-17 09:51:24-05', '2016-02-17 09:51:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Exhibit', 2726, '2016-02-17 09:51:24-05', '2016-02-17 09:51:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Omaha, Nebraska', 2727, '2016-02-17 10:30:41-05', '2016-02-17 10:30:41-05', NULL, '{"lat":"41.25861","lon":"-95.93779","source":"geonames","sourceId":5074472,"gmtOffset":-6,"timeZoneId":"America/Chicago","dstOffset":-5}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2728, '2016-02-17 12:00:03-05', '2016-02-17 12:00:03-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'digital libraries', 2729, '2016-02-18 08:47:32-05', '2016-02-18 08:47:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2730, '2016-02-18 10:35:00-05', '2016-02-18 10:35:00-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Kalispell, Montana', 2731, '2016-02-18 12:40:28-05', '2016-02-18 12:40:28-05', NULL, '{"lat":"48.19579","lon":"-114.31291","source":"geonames","sourceId":"5660340","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('topic', 'proofreading', 2732, '2016-02-18 12:57:48-05', '2016-02-18 12:57:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'copy-editing', 2733, '2016-02-18 12:57:48-05', '2016-02-18 12:57:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2734, '2016-02-18 16:07:43-05', '2016-02-18 16:07:43-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Web content', 2735, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' content strategies', 2736, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'web policies ', 2737, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web standards', 2738, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web design ', 2739, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web implementation', 2740, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web maintenance', 2741, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web operations', 2742, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web quality assurance', 2743, '2016-02-18 16:47:38-05', '2016-02-18 16:47:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Traveller', 2744, '2016-02-18 16:57:03-05', '2016-02-18 16:57:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Foodie', 2745, '2016-02-18 16:57:03-05', '2016-02-18 16:57:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Yogi', 2746, '2016-02-18 16:57:03-05', '2016-02-18 16:57:03-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web governance', 2747, '2016-02-18 17:00:09-05', '2016-02-18 17:00:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Requirements', 2748, '2016-02-18 17:00:09-05', '2016-02-18 17:00:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Nature; Art; the beach.', 2749, '2016-02-19 17:16:36-05', '2016-02-19 17:16:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web development; troubleshooting; Dreamweaver; WordPress; XAMPP; RDMS (mostly MS Access but now mySQL)', 2750, '2016-02-19 17:16:36-05', '2016-02-19 17:16:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Modern CSS methods', 2751, '2016-02-19 17:31:45-05', '2016-02-19 17:31:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Adobe Illustrator and Apps', 2752, '2016-02-19 17:31:45-05', '2016-02-19 17:31:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Fedora', 2753, '2016-02-20 17:57:40-05', '2016-02-20 17:57:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'virtualization', 2754, '2016-02-22 09:37:32-05', '2016-02-22 09:37:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2755, '2016-02-22 17:12:48-05', '2016-02-22 17:12:48-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2756, '2016-02-23 09:16:57-05', '2016-02-23 09:16:57-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'reading', 2757, '2016-02-23 16:53:17-05', '2016-02-23 16:53:17-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'walking', 2758, '2016-02-23 16:53:17-05', '2016-02-23 16:53:17-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Microsoft Publisher', 2759, '2016-02-23 16:53:17-05', '2016-02-23 16:53:17-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Bachelors of Arts in Journalism', 2760, '2016-02-23 16:53:17-05', '2016-02-23 16:53:17-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Minneapolis, Minnesota', 2761, '2016-02-24 09:54:29-05', '2016-02-24 09:54:29-05', NULL, '{"lat":"44.97997","lon":"-93.26384","source":"geonames","sourceId":"5037649","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('skill', '.NET Solution Architect', 2762, '2016-02-24 09:57:36-05', '2016-02-24 09:57:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Vale, Oregon', 2763, '2016-02-24 10:41:57-05', '2016-02-24 10:41:57-05', NULL, '{"lat":"43.98211","lon":"-117.23823","source":"geonames","sourceId":"5758413","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Boise"}');
INSERT INTO tagentity VALUES ('location', 'Cleveland, Ohio', 2764, '2016-02-24 10:45:57-05', '2016-02-24 10:45:57-05', NULL, '{"lat":"41.4995","lon":"-81.69541","source":"geonames","sourceId":"5150529","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Tulsa, Oklahoma', 2765, '2016-02-24 10:58:29-05', '2016-02-24 10:58:29-05', NULL, '{"lat":"36.15398","lon":"-95.99278","source":"geonames","sourceId":"4553433","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'fishing', 2766, '2016-02-24 11:17:49-05', '2016-02-24 11:17:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'singing', 2767, '2016-02-24 11:17:49-05', '2016-02-24 11:17:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'home building', 2768, '2016-02-24 11:17:49-05', '2016-02-24 11:17:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'interior decorating', 2769, '2016-02-24 11:17:49-05', '2016-02-24 11:17:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Diversity', 2902, '2016-03-22 12:51:11-04', '2016-03-22 12:51:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'El Paso, Texas', 2770, '2016-02-24 11:37:06-05', '2016-02-24 11:37:06-05', NULL, '{"lat":"31.75872","lon":"-106.48693","source":"geonames","sourceId":"5520993","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Saint Cloud, Minnesota', 2771, '2016-02-24 11:40:32-05', '2016-02-24 11:40:32-05', NULL, '{"lat":"45.5608","lon":"-94.16249","source":"geonames","sourceId":"5044407","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2772, '2016-02-24 12:15:45-05', '2016-02-24 12:15:45-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Jamaica, New York', 2773, '2016-02-24 12:32:03-05', '2016-02-24 12:32:03-05', NULL, '{"lat":"40.69149","lon":"-73.80569","source":"geonames","sourceId":"5122520","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Writing', 2774, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Research on various topics dealing with Agriculture', 2775, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Public Presentations.', 2776, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Equal Opportunity Issues.', 2777, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writer', 2778, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' PowerPoint Presentations.', 2779, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' On Line', 2780, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Library', 2781, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Researcher', 2782, '2016-02-24 12:46:13-05', '2016-02-24 12:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'writing', 2783, '2016-02-24 12:56:39-05', '2016-02-24 12:56:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Disabiities', 2784, '2016-02-24 12:56:39-05', '2016-02-24 12:56:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Equal Oportunity Issues.', 2785, '2016-02-24 12:56:39-05', '2016-02-24 12:56:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 2786, '2016-02-24 12:56:39-05', '2016-02-24 12:56:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Speach writing.', 2787, '2016-02-24 12:56:39-05', '2016-02-24 12:56:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' PowerPoint.  ', 2788, '2016-02-24 12:56:39-05', '2016-02-24 12:56:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research writing', 2789, '2016-02-24 12:56:39-05', '2016-02-24 12:56:39-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MS Publisher', 2790, '2016-02-24 13:44:44-05', '2016-02-24 13:44:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'New Orleans, Louisiana', 2791, '2016-02-24 15:42:55-05', '2016-02-24 15:42:55-05', NULL, '{"lat":"29.95465","lon":"-90.07507","source":"geonames","sourceId":"4335045","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'data', 2792, '2016-02-24 16:07:55-05', '2016-02-24 16:07:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'design thinking', 2793, '2016-02-24 16:07:55-05', '2016-02-24 16:07:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' mobile health', 2794, '2016-02-24 16:07:55-05', '2016-02-24 16:07:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'veterans', 2795, '2016-02-24 16:07:55-05', '2016-02-24 16:07:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'global health', 2796, '2016-02-24 16:07:55-05', '2016-02-24 16:07:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'women''s health', 2797, '2016-02-24 16:07:55-05', '2016-02-24 16:07:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile health', 2798, '2016-02-24 16:08:15-05', '2016-02-24 16:08:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mobile health', 2799, '2016-02-24 16:09:23-05', '2016-02-24 16:09:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Detroit, Michigan', 2800, '2016-02-25 08:42:55-05', '2016-02-25 08:42:55-05', NULL, '{"lat":"42.33143","lon":"-83.04575","source":"geonames","sourceId":"4990729","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/Detroit"}');
INSERT INTO tagentity VALUES ('location', 'Quinton, Virginia', 2801, '2016-02-25 09:21:29-05', '2016-02-25 09:21:29-05', NULL, '{"lat":"37.53376","lon":"-77.12108","source":"geonames","sourceId":"4780773","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Hampton, Virginia', 2802, '2016-02-25 09:31:32-05', '2016-02-25 09:31:32-05', NULL, '{"lat":"37.02987","lon":"-76.34522","source":"geonames","sourceId":"4762894","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Alexandria, Louisiana', 2803, '2016-02-25 09:47:24-05', '2016-02-25 09:47:24-05', NULL, '{"lat":"31.31129","lon":"-92.44514","source":"geonames","sourceId":"4314550","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2804, '2016-02-25 10:24:17-05', '2016-02-25 10:24:17-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Carver, Minnesota', 2805, '2016-02-25 10:31:06-05', '2016-02-25 10:31:06-05', NULL, '{"lat":"44.76357","lon":"-93.62579","source":"geonames","sourceId":"5020496","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Frederick, Maryland', 2806, '2016-02-25 12:32:49-05', '2016-02-25 12:32:49-05', NULL, '{"lat":"39.41427","lon":"-77.41054","source":"geonames","sourceId":"4355585","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2807, '2016-02-25 14:13:36-05', '2016-02-25 14:13:36-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Renton, Washington', 2808, '2016-02-25 18:17:42-05', '2016-02-25 18:17:42-05', NULL, '{"lat":"47.48288","lon":"-122.21707","source":"geonames","sourceId":"5808189","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Albany, New York', 2809, '2016-02-26 14:51:35-05', '2016-02-26 14:51:35-05', NULL, '{"lat":"42.65258","lon":"-73.75623","source":"geonames","sourceId":"5106834","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'CCNA', 2810, '2016-02-26 15:46:32-05', '2016-02-26 15:46:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Routing and Switching', 2811, '2016-02-26 15:46:32-05', '2016-02-26 15:46:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Helping people', 2812, '2016-02-26 16:49:16-05', '2016-02-26 16:49:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'motivated', 2813, '2016-02-26 16:49:16-05', '2016-02-26 16:49:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'conference planning', 2814, '2016-02-29 14:20:22-05', '2016-02-29 14:20:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' scheduling', 2815, '2016-02-29 14:20:22-05', '2016-02-29 14:20:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' logistics', 2816, '2016-02-29 14:20:22-05', '2016-02-29 14:20:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' meeting planning', 2817, '2016-02-29 14:20:22-05', '2016-02-29 14:20:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' program management', 2818, '2016-02-29 14:20:22-05', '2016-02-29 14:20:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' events', 2819, '2016-02-29 14:20:22-05', '2016-02-29 14:20:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2820, '2016-02-29 16:19:43-05', '2016-02-29 16:19:43-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Des Plaines, Illinois', 2821, '2016-02-29 17:36:25-05', '2016-02-29 17:36:25-05', NULL, '{"lat":"42.03336","lon":"-87.8834","source":"geonames","sourceId":"4889772","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2822, '2016-03-01 11:10:12-05', '2016-03-01 11:10:12-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2823, '2016-03-01 11:49:12-05', '2016-03-01 11:49:12-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Santa Fe, New Mexico', 2824, '2016-03-01 12:02:53-05', '2016-03-01 12:02:53-05', NULL, '{"lat":"35.68698","lon":"-105.9378","source":"geonames","sourceId":"5490263","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2825, '2016-03-01 21:03:26-05', '2016-03-01 21:03:26-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Quito, Pichincha, EC', 2826, '2016-03-03 09:13:50-05', '2016-03-03 09:13:50-05', NULL, '{"lat":"-0.22985","lon":"-78.52495","source":"geonames","sourceId":"3652462","gmtOffset":"-5","timeZoneId":"America/Guayaquil","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Herndon, Virginia', 2827, '2016-03-03 11:12:57-05', '2016-03-03 11:12:57-05', NULL, '{"lat":"38.96955","lon":"-77.3861","source":"geonames","sourceId":"4763793","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Functional Testing', 2828, '2016-03-03 13:38:21-05', '2016-03-03 13:38:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'HCI', 2829, '2016-03-03 13:38:21-05', '2016-03-03 13:38:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Requirements', 2830, '2016-03-03 13:38:21-05', '2016-03-03 13:38:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Systems Analysis', 2831, '2016-03-03 13:38:21-05', '2016-03-03 13:38:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Business Analysis', 2832, '2016-03-03 13:38:21-05', '2016-03-03 13:38:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human-computer Interaction', 2833, '2016-03-03 13:38:21-05', '2016-03-03 13:38:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Congressional Budget Office', 2834, '2016-03-03 14:14:21-05', '2016-03-03 14:14:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Northport, New York', 2835, '2016-03-04 09:49:40-05', '2016-03-04 09:49:40-05', NULL, '{"lat":"40.90093","lon":"-73.34317","source":"geonames","sourceId":"5129290","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Fort Bragg, North Carolina', 2836, '2016-03-04 09:59:05-05', '2016-03-04 09:59:05-05', NULL, '{"lat":"35.139","lon":"-79.00603","source":"geonames","sourceId":"6941080","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'hallway testing', 2837, '2016-03-04 10:50:04-05', '2016-03-04 10:50:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'personas', 2838, '2016-03-04 10:50:04-05', '2016-03-04 10:50:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mockups', 2839, '2016-03-04 10:50:04-05', '2016-03-04 10:50:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 2840, '2016-03-04 10:50:04-05', '2016-03-04 10:50:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'macros', 2841, '2016-03-08 10:00:14-05', '2016-03-08 10:00:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human Services', 2842, '2016-03-08 10:00:14-05', '2016-03-08 10:00:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Rider Experience', 2915, '2016-03-23 10:17:06-04', '2016-03-23 10:17:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SharePoint ', 2917, '2016-03-23 12:13:01-04', '2016-03-23 12:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MS Project ', 2918, '2016-03-23 12:13:01-04', '2016-03-23 12:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Rock Island, Illinois', 2843, '2016-03-08 13:20:47-05', '2016-03-08 13:20:47-05', NULL, '{"lat":"41.50948","lon":"-90.57875","source":"geonames","sourceId":"4907907","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'St. Louis, Missouri', 2844, '2016-03-08 13:46:45-05', '2016-03-08 13:46:45-05', NULL, '{"lat":"38.62727","lon":"-90.19789","source":"geonames","sourceId":"4407066","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'workforce analysis', 2845, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'executive resources', 2846, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'competency modeling', 2847, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'California state employee viewpoint survey', 2848, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'succession planning', 2849, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'executive development', 2850, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'executive performance', 2851, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'senior executive service', 2852, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SES', 2853, '2016-03-08 14:50:07-05', '2016-03-08 14:50:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'West Covington, Kentucky', 2854, '2016-03-09 08:45:46-05', '2016-03-09 08:45:46-05', NULL, '{"lat":"39.08895","lon":"-84.53383","source":"geonames","sourceId":"4312981","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'max.gov', 2855, '2016-03-09 11:15:15-05', '2016-03-09 11:15:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Nature', 2856, '2016-03-09 14:07:09-05', '2016-03-09 14:07:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'web content strategy', 2857, '2016-03-09 14:07:09-05', '2016-03-09 14:07:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'content management systems', 2858, '2016-03-09 14:07:09-05', '2016-03-09 14:07:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '508 compliance', 2859, '2016-03-09 14:07:09-05', '2016-03-09 14:07:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'web design principles', 2860, '2016-03-09 14:07:09-05', '2016-03-09 14:07:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'QA testing', 2861, '2016-03-09 14:07:09-05', '2016-03-09 14:07:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Iowa City, Iowa', 2862, '2016-03-10 14:19:53-05', '2016-03-10 14:19:53-05', NULL, '{"lat":"41.66113","lon":"-91.53017","source":"geonames","sourceId":"4862034","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2863, '2016-03-10 15:01:43-05', '2016-03-10 15:01:43-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2864, '2016-03-14 10:22:32-04', '2016-03-14 10:22:32-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 2865, '2016-03-14 10:32:45-04', '2016-03-14 10:32:45-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'exploring', 2866, '2016-03-14 11:15:15-04', '2016-03-14 11:15:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'public health', 2867, '2016-03-14 11:15:15-04', '2016-03-14 11:15:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' communications', 2868, '2016-03-14 11:15:15-04', '2016-03-14 11:15:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' behavioral psychology', 2869, '2016-03-14 11:15:15-04', '2016-03-14 11:15:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'AFPIMS', 2870, '2016-03-14 11:15:15-04', '2016-03-14 11:15:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'epidemiology', 2871, '2016-03-14 11:15:15-04', '2016-03-14 11:15:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Falls Church, Virginia', 2872, '2016-03-14 11:15:49-04', '2016-03-14 11:15:49-04', NULL, '{"lat":"38.88233","lon":"-77.17109","source":"geonames","sourceId":"4758390","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Copy', 2873, '2016-03-14 11:35:57-04', '2016-03-14 11:35:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Grand Rapids, Michigan', 2874, '2016-03-14 11:38:00-04', '2016-03-14 11:38:00-04', NULL, '{"lat":"42.96336","lon":"-85.66809","source":"geonames","sourceId":"4994358","gmtOffset":"-5","timeZoneId":"America/Detroit","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Facebook', 2875, '2016-03-14 11:42:04-04', '2016-03-14 11:42:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'clean eating', 2876, '2016-03-14 11:42:04-04', '2016-03-14 11:42:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fort Sam Houston, Texas', 2877, '2016-03-14 11:59:18-04', '2016-03-14 11:59:18-04', NULL, '{"lat":"29.45746","lon":"-98.4472","source":"geonames","sourceId":"10401340","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Helping out where my skills can add value', 2878, '2016-03-14 12:00:18-04', '2016-03-14 12:00:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Crisis Communications', 2879, '2016-03-14 12:00:18-04', '2016-03-14 12:00:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Media Strategy', 2880, '2016-03-14 12:00:18-04', '2016-03-14 12:00:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Relations Strategy', 2881, '2016-03-14 12:04:30-04', '2016-03-14 12:04:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social media policy', 2882, '2016-03-14 12:09:33-04', '2016-03-14 12:09:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social media strategy and implementation', 2883, '2016-03-14 12:11:58-04', '2016-03-14 12:11:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design thinking best practices', 2884, '2016-03-14 12:11:58-04', '2016-03-14 12:11:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2885, '2016-03-14 15:32:10-04', '2016-03-14 15:32:10-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Milwaukee, Wisconsin', 2886, '2016-03-14 16:46:00-04', '2016-03-14 16:46:00-04', NULL, '{"lat":"43.0389","lon":"-87.90647","source":"geonames","sourceId":"5263045","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Oakland, California', 2887, '2016-03-14 17:01:38-04', '2016-03-14 17:01:38-04', NULL, '{"lat":"37.80437","lon":"-122.2708","source":"geonames","sourceId":"5378538","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('topic', 'Animal Welfare', 2888, '2016-03-14 17:54:20-04', '2016-03-14 17:54:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2889, '2016-03-15 09:37:49-04', '2016-03-15 09:37:49-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Web', 2890, '2016-03-15 15:42:28-04', '2016-03-15 15:42:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Audio', 2891, '2016-03-15 15:42:28-04', '2016-03-15 15:42:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Video', 2892, '2016-03-15 15:42:28-04', '2016-03-15 15:42:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Morale', 2893, '2016-03-15 15:42:28-04', '2016-03-15 15:42:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Women''s Issues', 2894, '2016-03-15 15:42:28-04', '2016-03-15 15:42:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2895, '2016-03-16 12:08:27-04', '2016-03-16 12:08:27-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Infopath', 2896, '2016-03-16 19:46:10-04', '2016-03-16 19:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Workflows', 2897, '2016-03-16 19:46:10-04', '2016-03-16 19:46:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Front End Web Development', 2898, '2016-03-17 11:51:48-04', '2016-03-17 11:51:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Content Strategy', 2899, '2016-03-17 11:51:48-04', '2016-03-17 11:51:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Information Architecture', 2900, '2016-03-17 12:30:49-04', '2016-03-17 12:30:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Idea Labs', 2901, '2016-03-22 12:51:11-04', '2016-03-22 12:51:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Program Management', 2904, '2016-03-22 12:51:11-04', '2016-03-22 12:51:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'dance', 2905, '2016-03-22 13:30:31-04', '2016-03-22 13:30:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Big Spring, Texas', 2906, '2016-03-22 17:22:42-04', '2016-03-22 17:22:42-04', NULL, '{"lat":"32.2504","lon":"-101.47874","source":"geonames","sourceId":"5517061","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2907, '2016-03-23 09:23:45-04', '2016-03-23 09:23:45-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2908, '2016-03-23 09:59:35-04', '2016-03-23 09:59:35-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Anthropology', 2909, '2016-03-23 10:17:06-04', '2016-03-23 10:17:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'transit', 2910, '2016-03-23 10:17:06-04', '2016-03-23 10:17:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'ethnography', 2911, '2016-03-23 10:17:06-04', '2016-03-23 10:17:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ethnography', 2912, '2016-03-23 10:17:06-04', '2016-03-23 10:17:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UX Research', 2913, '2016-03-23 10:17:06-04', '2016-03-23 10:17:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'heuristic analysis', 2914, '2016-03-23 10:17:06-04', '2016-03-23 10:17:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '508', 2919, '2016-03-23 12:13:01-04', '2016-03-23 12:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Managment', 2920, '2016-03-23 12:13:01-04', '2016-03-23 12:13:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'XQuery', 2921, '2016-03-23 18:14:42-04', '2016-03-23 18:14:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'historical research', 2922, '2016-03-23 18:19:39-04', '2016-03-23 18:19:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Phnom Penh, KH', 2923, '2016-03-29 00:20:13-04', '2016-03-29 00:20:13-04', NULL, '{"lat":"11.56245","lon":"104.91601","source":"geonames","sourceId":"1821306","gmtOffset":"7","timeZoneId":"Asia/Phnom_Penh","dstOffset":"7"}');
INSERT INTO tagentity VALUES ('topic', 'HIV/AIDS', 2924, '2016-03-29 00:29:09-04', '2016-03-29 00:29:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Malaria', 2925, '2016-03-29 00:29:09-04', '2016-03-29 00:29:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Tuberculosis', 2926, '2016-03-29 00:29:09-04', '2016-03-29 00:29:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Neglected Tropical Diseases', 2927, '2016-03-29 00:29:09-04', '2016-03-29 00:29:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Non-communicable Diseases', 2928, '2016-03-29 00:29:09-04', '2016-03-29 00:29:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Field Epidemiology Training', 2929, '2016-03-29 00:29:09-04', '2016-03-29 00:29:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'tropical medicine', 2930, '2016-03-29 00:29:09-04', '2016-03-29 00:29:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'HTML 5', 2931, '2016-03-30 17:14:38-04', '2016-03-30 17:14:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Section 508 Remediation', 2932, '2016-03-30 17:14:38-04', '2016-03-30 17:14:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Access Database Design', 2933, '2016-03-30 17:14:38-04', '2016-03-30 17:14:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Adobe Photoshop', 2934, '2016-03-30 17:14:38-04', '2016-03-30 17:14:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Adobe Illustrator', 2935, '2016-03-30 17:14:38-04', '2016-03-30 17:14:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Alternative Text', 2936, '2016-03-30 17:31:53-04', '2016-03-30 17:31:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'PDF Conversion', 2937, '2016-03-30 17:31:53-04', '2016-03-30 17:31:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Tagging Documents', 2938, '2016-03-30 17:31:53-04', '2016-03-30 17:31:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Touch Up Reading Order', 2939, '2016-03-30 17:31:53-04', '2016-03-30 17:31:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Touch Up Reading Order', 2940, '2016-03-30 17:31:53-04', '2016-03-30 17:31:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design Standards', 2941, '2016-03-30 17:31:53-04', '2016-03-30 17:31:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Technology', 2942, '2016-03-30 17:35:15-04', '2016-03-30 17:35:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Silver Spring, Maryland', 2943, '2016-04-01 16:41:53-04', '2016-04-01 16:41:53-04', NULL, '{"lat":"38.99067","lon":"-77.02609","source":"geonames","sourceId":4369596,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Gaithersburg, Maryland', 2944, '2016-04-01 16:41:53-04', '2016-04-01 16:41:53-04', NULL, '{"lat":"39.14344","lon":"-77.20137","source":"geonames","sourceId":4355843,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'STEM education', 2945, '2016-04-01 16:43:01-04', '2016-04-01 16:43:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'high school', 2946, '2016-04-01 16:43:01-04', '2016-04-01 16:43:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'summer program', 2947, '2016-04-01 16:43:01-04', '2016-04-01 16:43:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Baltimore, Maryland', 2948, '2016-04-01 20:56:59-04', '2016-04-01 20:56:59-04', NULL, '{"lat":"39.29038","lon":"-76.61219","source":"geonames","sourceId":"4347778","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Foreign Language content', 2949, '2016-04-02 21:45:50-04', '2016-04-02 21:45:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Frederick, Maryland', 2950, '2016-04-05 07:19:24-04', '2016-04-05 07:19:24-04', NULL, '{"lat":"39.41427","lon":"-77.41054","source":"geonames","sourceId":"4355585","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Elizabeth City, North Carolina', 2951, '2016-04-05 07:45:19-04', '2016-04-05 07:45:19-04', NULL, '{"lat":"35.29291","lon":"-81.4912","source":"geonames","sourceId":"4465087","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Arlington, Virginia', 2952, '2016-04-05 08:24:05-04', '2016-04-05 08:24:05-04', NULL, '{"lat":"38.88101","lon":"-77.10428","source":"geonames","sourceId":"4744709","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', '2D & 3D Design', 2953, '2016-04-05 10:25:55-04', '2016-04-05 10:25:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Systems Engineering & Integration', 2954, '2016-04-05 10:25:55-04', '2016-04-05 10:25:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Master Planning', 2955, '2016-04-05 10:25:55-04', '2016-04-05 10:25:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC-COR', 2956, '2016-04-05 10:25:55-04', '2016-04-05 10:25:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DAWIA PM', 2957, '2016-04-05 10:25:55-04', '2016-04-05 10:25:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DAWIA Systems Engineering', 2958, '2016-04-05 10:25:55-04', '2016-04-05 10:25:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Bedford, Massachusetts', 2959, '2016-04-05 12:21:00-04', '2016-04-05 12:21:00-04', NULL, '{"lat":"42.49065","lon":"-71.27617","source":"geonames","sourceId":"4930183","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Denver, Colorado', 2960, '2016-04-05 23:55:10-04', '2016-04-05 23:55:10-04', NULL, '{"lat":"39.73915","lon":"-104.9847","source":"geonames","sourceId":"5419384","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('location', 'Tampa, Florida', 2961, '2016-04-06 06:48:28-04', '2016-04-06 06:48:28-04', NULL, '{"lat":"27.94752","lon":"-82.45843","source":"geonames","sourceId":"4174757","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Chantilly, Virginia', 2962, '2016-04-06 07:22:26-04', '2016-04-06 07:22:26-04', NULL, '{"lat":"38.89428","lon":"-77.4311","source":"geonames","sourceId":4751935,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Hartford, Kentucky', 2963, '2016-04-06 08:40:23-04', '2016-04-06 08:40:23-04', NULL, '{"lat":"37.45116","lon":"-86.90916","source":"geonames","sourceId":"4294195","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2964, '2016-04-06 12:06:32-04', '2016-04-06 12:06:32-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'team building', 2965, '2016-04-06 12:18:41-04', '2016-04-06 12:18:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'team development', 2966, '2016-04-06 12:18:41-04', '2016-04-06 12:18:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Edwards Air Force Base, California', 2967, '2016-04-06 13:34:36-04', '2016-04-06 13:34:36-04', NULL, '{"lat":"34.91637","lon":"-117.93535","source":"geonames","sourceId":"7261098","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'Autonomous Vehicles', 2968, '2016-04-06 13:58:03-04', '2016-04-06 13:58:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Aerospace Engineering', 2969, '2016-04-06 13:58:03-04', '2016-04-06 13:58:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Edwards Air Force Base, California', 2970, '2016-04-06 13:58:03-04', '2016-04-06 13:58:03-04', NULL, '{"lat":"34.91637","lon":"-117.93535","source":"geonames","sourceId":7261098,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('location', 'Allenwood, Pennsylvania', 2971, '2016-04-06 14:23:09-04', '2016-04-06 14:23:09-04', NULL, '{"lat":"41.10758","lon":"-76.8983","source":"geonames","sourceId":"5178141","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'writing', 2972, '2016-04-06 16:34:32-04', '2016-04-06 16:34:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'lexis-nexis', 2973, '2016-04-06 16:34:32-04', '2016-04-06 16:34:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'UAS', 2974, '2016-04-06 19:11:22-04', '2016-04-06 19:11:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'professional development', 2975, '2016-04-07 10:08:35-04', '2016-04-07 10:08:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'speaker coordination', 2976, '2016-04-07 10:08:35-04', '2016-04-07 10:08:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'logistics', 2977, '2016-04-07 10:08:35-04', '2016-04-07 10:08:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'fac-cor Level III', 2978, '2016-04-07 17:55:45-04', '2016-04-07 17:55:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Arlington, Virginia', 2979, '2016-04-08 11:31:42-04', '2016-04-08 11:31:42-04', NULL, '{"lat":"38.88101","lon":"-77.10428","source":"geonames","sourceId":"4744709","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Home remodeling', 2980, '2016-04-08 12:40:21-04', '2016-04-08 12:40:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Fixing cars', 2981, '2016-04-08 12:40:21-04', '2016-04-08 12:40:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Structural Analysis', 2982, '2016-04-08 18:10:33-04', '2016-04-08 18:10:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 2983, '2016-04-12 14:44:12-04', '2016-04-12 14:44:12-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Ballston, Virginia', 2984, '2016-04-13 09:26:40-04', '2016-04-13 09:26:40-04', NULL, '{"lat":"38.88011","lon":"-77.11387","source":"geonames","sourceId":"4745469","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'cost ana', 2985, '2016-04-13 10:31:23-04', '2016-04-13 10:31:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Laws and regulations', 3323, '2016-06-14 15:48:30-04', '2016-06-14 15:48:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Workforce Development', 3325, '2016-06-14 15:48:30-04', '2016-06-14 15:48:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Golden, Colorado', 2986, '2016-04-13 10:31:23-04', '2016-04-13 10:31:23-04', NULL, '{"lat":"39.75554","lon":"-105.2211","source":"geonames","sourceId":5423294,"gmtOffset":-7,"timeZoneId":"America/Denver","dstOffset":-6}');
INSERT INTO tagentity VALUES ('topic', 'Leading a team', 2987, '2016-04-14 10:36:51-04', '2016-04-14 10:36:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Microfinance', 2988, '2016-04-14 10:36:51-04', '2016-04-14 10:36:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'environment', 2989, '2016-04-14 10:39:22-04', '2016-04-14 10:39:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'agriculture', 2990, '2016-04-14 10:39:22-04', '2016-04-14 10:39:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 2991, '2016-04-14 17:12:19-04', '2016-04-14 17:12:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' ux', 2992, '2016-04-14 17:12:19-04', '2016-04-14 17:12:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'css', 2993, '2016-04-14 17:12:19-04', '2016-04-14 17:12:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'presenters', 2994, '2016-04-15 09:28:35-04', '2016-04-15 09:28:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'IT Accessibility', 2995, '2016-04-15 10:36:18-04', '2016-04-15 10:36:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' UI Design', 2996, '2016-04-15 10:36:18-04', '2016-04-15 10:36:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Shared Services', 2997, '2016-04-15 10:36:18-04', '2016-04-15 10:36:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Accessibility Testing', 2998, '2016-04-15 10:36:18-04', '2016-04-15 10:36:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Accessible Design', 2999, '2016-04-15 10:36:18-04', '2016-04-15 10:36:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UI Testing', 3000, '2016-04-15 10:36:18-04', '2016-04-15 10:36:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'quality control', 3001, '2016-04-15 10:36:18-04', '2016-04-15 10:36:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Projects', 3002, '2016-04-15 11:29:16-04', '2016-04-15 11:29:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Hackathon', 3003, '2016-04-15 11:30:10-04', '2016-04-15 11:30:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Phoenix, Arizona', 3004, '2016-04-15 15:31:19-04', '2016-04-15 15:31:19-04', NULL, '{"lat":"33.44838","lon":"-112.07404","source":"geonames","sourceId":"5308655","gmtOffset":"-7","timeZoneId":"America/Phoenix","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'legal research', 3005, '2016-04-18 14:07:39-04', '2016-04-18 14:07:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' medical research', 3006, '2016-04-18 14:07:39-04', '2016-04-18 14:07:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'legislative research', 3007, '2016-04-18 14:07:39-04', '2016-04-18 14:07:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'case law research', 3008, '2016-04-18 14:07:39-04', '2016-04-18 14:07:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'integrated library systems', 3009, '2016-04-18 14:07:39-04', '2016-04-18 14:07:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'collection development', 3010, '2016-04-18 14:07:39-04', '2016-04-18 14:07:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'copyright compliance', 3011, '2016-04-18 14:07:39-04', '2016-04-18 14:07:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'public safety', 3012, '2016-04-18 17:23:40-04', '2016-04-18 17:23:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'networking', 3013, '2016-04-18 17:23:40-04', '2016-04-18 17:23:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3014, '2016-04-18 17:41:04-04', '2016-04-18 17:41:04-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Chattanooga, Tennessee', 3015, '2016-04-19 16:17:13-04', '2016-04-19 16:17:13-04', NULL, '{"lat":"35.04563","lon":"-85.30968","source":"geonames","sourceId":"4612862","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Yoga', 3016, '2016-04-20 09:24:01-04', '2016-04-20 09:24:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Weightlifting', 3017, '2016-04-20 09:24:01-04', '2016-04-20 09:24:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Coaching', 3018, '2016-04-20 09:24:01-04', '2016-04-20 09:24:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'peacebuilding', 3019, '2016-04-20 11:08:18-04', '2016-04-20 11:08:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'violent extreemism', 3020, '2016-04-20 11:08:18-04', '2016-04-20 11:08:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'functional testing', 3021, '2016-04-21 11:39:25-04', '2016-04-21 11:39:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ionic', 3022, '2016-04-22 09:02:27-04', '2016-04-22 09:02:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Intermediate Sign Language', 3023, '2016-04-22 10:09:29-04', '2016-04-22 10:09:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Portuguese Speaker', 3024, '2016-04-22 10:09:29-04', '2016-04-22 10:09:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'statistics', 3025, '2016-04-25 09:32:59-04', '2016-04-25 09:32:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' psychometrics', 3026, '2016-04-25 09:32:59-04', '2016-04-25 09:32:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'research design', 3027, '2016-04-25 09:32:59-04', '2016-04-25 09:32:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'survey design and analysis', 3028, '2016-04-25 09:32:59-04', '2016-04-25 09:32:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '•	Psychometric theory application and analysis using cognitive acuity methods of construct measurement. ', 3029, '2016-04-25 09:32:59-04', '2016-04-25 09:32:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'research design', 3030, '2016-04-25 10:10:48-04', '2016-04-25 10:10:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'statisitcs', 3031, '2016-04-25 10:10:48-04', '2016-04-25 10:10:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'psychometrics', 3032, '2016-04-25 10:10:48-04', '2016-04-25 10:10:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'survey research', 3033, '2016-04-25 10:10:48-04', '2016-04-25 10:10:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'data mining', 3034, '2016-04-25 10:10:48-04', '2016-04-25 10:10:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data mining', 3035, '2016-04-25 10:55:43-04', '2016-04-25 10:55:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'psychometrics', 3036, '2016-04-25 10:55:43-04', '2016-04-25 10:55:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research design', 3037, '2016-04-25 10:55:43-04', '2016-04-25 10:55:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'tests and measures', 3038, '2016-04-25 10:55:43-04', '2016-04-25 10:55:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'statistics', 3039, '2016-04-25 10:55:43-04', '2016-04-25 10:55:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'exercise', 3040, '2016-04-25 13:08:54-04', '2016-04-25 13:08:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'aging', 3041, '2016-04-25 13:08:54-04', '2016-04-25 13:08:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'brain health', 3042, '2016-04-25 13:08:54-04', '2016-04-25 13:08:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'MRI', 3043, '2016-04-25 13:08:54-04', '2016-04-25 13:08:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'fmri', 3044, '2016-04-25 13:08:54-04', '2016-04-25 13:08:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'tms', 3045, '2016-04-25 13:08:54-04', '2016-04-25 13:08:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3046, '2016-04-26 09:41:32-04', '2016-04-26 09:41:32-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Data Science', 3047, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Financial Regulation', 3048, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'CRMX', 3049, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Business Intelligence ', 3050, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Process Redesign', 3051, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Health Care Data', 3052, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Financial Markets Data', 3053, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Fraud Analytics', 3054, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Case Management', 3055, '2016-04-26 09:54:51-04', '2016-04-26 09:54:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data science', 3056, '2016-04-26 09:57:57-04', '2016-04-26 09:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Business Intelligence', 3057, '2016-04-26 09:57:57-04', '2016-04-26 09:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Health Care Data Fraud Analytics', 3058, '2016-04-26 09:57:57-04', '2016-04-26 09:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Securities Industry Fraud and Compliance Analytics', 3059, '2016-04-26 09:57:57-04', '2016-04-26 09:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Process Redesign', 3060, '2016-04-26 09:57:57-04', '2016-04-26 09:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Call Center Solutions', 3061, '2016-04-26 09:57:57-04', '2016-04-26 09:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customer Relationship Manager', 3062, '2016-04-26 09:57:57-04', '2016-04-26 09:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Securities Industry Fraud and Compliance Analytics', 3063, '2016-04-26 10:01:50-04', '2016-04-26 10:01:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Case Management', 3064, '2016-04-26 10:01:50-04', '2016-04-26 10:01:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'OpenStreetMap', 3065, '2016-04-26 13:11:09-04', '2016-04-26 13:11:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'behavioral health', 3066, '2016-04-28 17:55:21-04', '2016-04-28 17:55:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social equity', 3067, '2016-04-28 17:55:21-04', '2016-04-28 17:55:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'child welfare', 3068, '2016-04-28 17:55:21-04', '2016-04-28 17:55:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design thinking', 3069, '2016-04-28 17:55:21-04', '2016-04-28 17:55:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'systems thinking', 3070, '2016-04-28 17:55:21-04', '2016-04-28 17:55:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'human-centered design', 3071, '2016-04-28 17:55:21-04', '2016-04-28 17:55:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'visual design', 3072, '2016-04-28 17:55:21-04', '2016-04-28 17:55:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'product design', 3073, '2016-04-28 18:23:41-04', '2016-04-28 18:23:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'service design thinking', 3074, '2016-04-28 18:23:41-04', '2016-04-28 18:23:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Service Design', 3075, '2016-04-28 18:23:41-04', '2016-04-28 18:23:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social communities', 3076, '2016-04-28 18:23:41-04', '2016-04-28 18:23:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'complex consumer communication', 3077, '2016-04-28 18:23:41-04', '2016-04-28 18:23:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'design innovation', 3078, '2016-04-28 18:37:55-04', '2016-04-28 18:37:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'service innovation', 3079, '2016-04-28 18:37:55-04', '2016-04-28 18:37:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'marketing innovation', 3080, '2016-04-28 18:37:55-04', '2016-04-28 18:37:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'service innovation', 3081, '2016-04-28 18:37:55-04', '2016-04-28 18:37:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'marketing and design innovation', 3082, '2016-04-28 18:37:55-04', '2016-04-28 18:37:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Laws and Regulations', 3324, '2016-06-14 15:48:30-04', '2016-06-14 15:48:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Warrenton, Virginia', 3083, '2016-04-29 07:40:28-04', '2016-04-29 07:40:28-04', NULL, '{"lat":"38.71345","lon":"-77.79527","source":"geonames","sourceId":"4792255","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'design research', 3084, '2016-05-02 16:41:51-04', '2016-05-02 16:41:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design strategy', 3085, '2016-05-02 16:41:51-04', '2016-05-02 16:41:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'concepting', 3086, '2016-05-02 16:41:51-04', '2016-05-02 16:41:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'prototyping', 3087, '2016-05-02 16:41:51-04', '2016-05-02 16:41:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HCD', 3088, '2016-05-02 16:41:51-04', '2016-05-02 16:41:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'mindfulness', 3089, '2016-05-02 16:43:54-04', '2016-05-02 16:43:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'travel ', 3090, '2016-05-02 16:43:54-04', '2016-05-02 16:43:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'fiction', 3091, '2016-05-02 16:43:54-04', '2016-05-02 16:43:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'film', 3092, '2016-05-02 16:43:54-04', '2016-05-02 16:43:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3093, '2016-05-02 17:12:06-04', '2016-05-02 17:12:06-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3094, '2016-05-03 12:01:57-04', '2016-05-03 12:01:57-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Organizational Leadership • IT/Project Management & Review• Systems Management & Evaluation• Process Improvement • Technology Architecture & Integration • Leading Edge Software Development • Team Management • Technical Support • Global IT Delivery • Budgeting & Cost Control • Electronic Commerce Strategy/Development • Strategic Analysis & Internal Consulting Organization & Staff Development • Staff Recruitment • Problem Resolution • Client Relations Management ', 3095, '2016-05-04 09:01:30-04', '2016-05-04 09:01:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 3096, '2016-05-04 10:08:40-04', '2016-05-04 10:08:40-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Seattle, Washington', 3097, '2016-05-04 23:52:40-04', '2016-05-04 23:52:40-04', NULL, '{"lat":"47.60621","lon":"-122.33207","source":"geonames","sourceId":"5809844","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('skill', 'tech diversity', 3098, '2016-05-06 10:19:26-04', '2016-05-06 10:19:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'STEM education and outreach', 3099, '2016-05-06 10:19:26-04', '2016-05-06 10:19:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3100, '2016-05-06 11:54:45-04', '2016-05-06 11:54:45-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3101, '2016-05-06 12:26:37-04', '2016-05-06 12:26:37-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', '3D Printing', 3102, '2016-05-06 12:47:45-04', '2016-05-06 12:47:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Healthcare', 3103, '2016-05-06 12:47:45-04', '2016-05-06 12:47:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Optical Imaging', 3104, '2016-05-06 13:21:47-04', '2016-05-06 13:21:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Internal Medicine', 3105, '2016-05-06 13:21:47-04', '2016-05-06 13:21:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Gastroenterology', 3106, '2016-05-06 13:21:47-04', '2016-05-06 13:21:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Telluride, Colorado', 3107, '2016-05-10 11:12:59-04', '2016-05-10 11:12:59-04', NULL, '{"lat":"37.93749","lon":"-107.81229","source":"geonames","sourceId":"5441199","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'Rapid Prototyping', 3108, '2016-05-11 08:18:36-04', '2016-05-11 08:18:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Revit', 3109, '2016-05-11 08:18:36-04', '2016-05-11 08:18:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Writing', 3110, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Blogging', 3111, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Graphic Design', 3112, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Copywriting', 3113, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Communications', 3114, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Marketing', 3115, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Branding', 3116, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Social Media', 3117, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Project Management', 3118, '2016-05-11 10:36:14-04', '2016-05-11 10:36:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Digital Communications', 3119, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 3120, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Graphic Desgin', 3121, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Blogging', 3122, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Journalism', 3123, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Copywriting', 3124, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Branding', 3125, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Marketing', 3126, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Communications', 3127, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Project Management', 3128, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Social Media Community Management', 3129, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Digital Communications', 3130, '2016-05-11 10:46:38-04', '2016-05-11 10:46:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'market research ', 3132, '2016-05-11 11:55:05-04', '2016-05-11 11:55:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'gathering and documenting requirements', 3133, '2016-05-11 11:55:05-04', '2016-05-11 11:55:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'develop recommendations ', 3134, '2016-05-11 11:55:05-04', '2016-05-11 11:55:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Alternatives of Analysis', 3131, '2016-05-11 11:55:05-04', '2016-05-11 11:55:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'market research ', 3135, '2016-05-11 12:04:52-04', '2016-05-11 12:04:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'gathering and documenting requirements', 3136, '2016-05-11 12:04:52-04', '2016-05-11 12:04:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Alternatives of Analysis', 3137, '2016-05-11 12:04:52-04', '2016-05-11 12:04:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'develop recommendations ', 3138, '2016-05-11 12:04:52-04', '2016-05-11 12:04:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3139, '2016-05-11 16:35:12-04', '2016-05-11 16:35:12-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Fort Lauderdale, Florida', 3140, '2016-05-12 15:26:00-04', '2016-05-12 15:26:00-04', NULL, '{"lat":"26.12231","lon":"-80.14338","source":"geonames","sourceId":"4155966","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Futurism', 3141, '2016-05-16 12:01:15-04', '2016-05-16 12:01:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Promotions', 3142, '2016-05-16 12:01:15-04', '2016-05-16 12:01:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 3143, '2016-05-17 12:18:02-04', '2016-05-17 12:18:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3144, '2016-05-19 08:07:44-04', '2016-05-19 08:07:44-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'contract specialist', 3312, '2016-06-14 10:18:20-04', '2016-06-14 10:18:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3145, '2016-05-19 10:54:43-04', '2016-05-19 10:54:43-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"dstOffset":-4,"gmtOffset":-5,"timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3146, '2016-05-19 13:24:04-04', '2016-05-19 13:24:04-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'wikis', 3147, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'economic history', 3148, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'history of technology', 3149, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'productivity', 3150, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'productivity statistics', 3151, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'productivity measurement', 3152, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'wikis', 3153, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MediaWiki', 3154, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'productivity statistics', 3155, '2016-05-20 14:51:47-04', '2016-05-20 14:51:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Shiprock, New Mexico', 3156, '2016-05-23 10:55:14-04', '2016-05-23 10:55:14-04', NULL, '{"lat":"36.78555","lon":"-108.68703","source":"geonames","sourceId":"5491288","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('location', 'Germantown, Maryland', 3157, '2016-05-23 15:41:51-04', '2016-05-23 15:41:51-04', NULL, '{"lat":"39.17316","lon":"-77.27165","source":"geonames","sourceId":"4356050","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Redstone Arsenal, Alabama', 3158, '2016-05-23 16:28:14-04', '2016-05-23 16:28:14-04', NULL, '{"lat":"34.68387","lon":"-86.64764","source":"geonames","sourceId":"7260623","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'UI Design', 3159, '2016-05-23 16:36:32-04', '2016-05-23 16:36:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' UX', 3160, '2016-05-23 16:36:32-04', '2016-05-23 16:36:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'AngularJS', 3161, '2016-05-23 16:36:32-04', '2016-05-23 16:36:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Informix', 3162, '2016-05-23 16:36:32-04', '2016-05-23 16:36:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Codeigniter', 3163, '2016-05-23 16:36:32-04', '2016-05-23 16:36:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Brooklyn, New York', 3164, '2016-05-25 09:49:46-04', '2016-05-25 09:49:46-04', NULL, '{"lat":"40.6501","lon":"-73.94958","source":"geonames","sourceId":"5110302","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Culinary Arts', 3165, '2016-05-25 10:25:40-04', '2016-05-25 10:25:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Communciations', 3166, '2016-05-25 10:25:40-04', '2016-05-25 10:25:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'competent in data analysis by leveraging data minning and statistical tools to analyza large datasets', 3167, '2016-05-25 11:31:34-04', '2016-05-25 11:31:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design dashboards and develope data visualizations', 3168, '2016-05-25 11:31:34-04', '2016-05-25 11:31:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Learning management system administration-AGLearn', 3169, '2016-05-25 11:31:34-04', '2016-05-25 11:31:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'program managment-SDLC', 3170, '2016-05-25 11:31:34-04', '2016-05-25 11:31:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Datawarehouse-ETL', 3171, '2016-05-25 11:31:34-04', '2016-05-25 11:31:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'creative thinking', 3172, '2016-05-25 14:51:14-04', '2016-05-25 14:51:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'modeling', 3173, '2016-05-25 14:51:14-04', '2016-05-25 14:51:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'business', 3174, '2016-05-25 14:51:14-04', '2016-05-25 14:51:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'synthesis', 3175, '2016-05-25 14:51:14-04', '2016-05-25 14:51:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'engineering', 3176, '2016-05-25 14:51:14-04', '2016-05-25 14:51:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'critical thinking', 3177, '2016-05-25 14:52:44-04', '2016-05-25 14:52:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'engineering', 3178, '2016-05-25 14:52:44-04', '2016-05-25 14:52:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'modeling', 3179, '2016-05-25 14:52:44-04', '2016-05-25 14:52:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'business', 3180, '2016-05-25 14:52:44-04', '2016-05-25 14:52:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'synthesis', 3181, '2016-05-25 14:52:44-04', '2016-05-25 14:52:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'risk assessment', 3182, '2016-05-25 14:54:02-04', '2016-05-25 14:54:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'risk management', 3183, '2016-05-25 14:54:02-04', '2016-05-25 14:54:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'risk assessment', 3184, '2016-05-25 14:54:02-04', '2016-05-25 14:54:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Google Tag Manager', 3185, '2016-05-27 09:47:38-04', '2016-05-27 09:47:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Regular Expressions', 3186, '2016-05-27 09:47:39-04', '2016-05-27 09:47:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Euless, Texas', 3187, '2016-06-01 12:33:18-04', '2016-06-01 12:33:18-04', NULL, '{"lat":"32.83707","lon":"-97.08195","source":"geonames","sourceId":"4689550","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Staffing Plan Development', 3188, '2016-06-01 12:37:25-04', '2016-06-01 12:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Changing the Federal Recruitment Process', 3189, '2016-06-01 12:37:25-04', '2016-06-01 12:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Monterey, California', 3190, '2016-06-03 20:37:04-04', '2016-06-03 20:37:04-04', NULL, '{"lat":"36.60024","lon":"-121.89468","source":"geonames","sourceId":"5374361","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('topic', 'USGS', 3191, '2016-06-03 22:10:27-04', '2016-06-03 22:10:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'NARA', 3192, '2016-06-03 22:10:27-04', '2016-06-03 22:10:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'NASA', 3193, '2016-06-03 22:10:27-04', '2016-06-03 22:10:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Falls Church, Virginia', 3194, '2016-06-07 09:40:09-04', '2016-06-07 09:40:09-04', NULL, '{"lat":"38.88233","lon":"-77.17109","source":"geonames","sourceId":"4758390","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Technology Management', 3195, '2016-06-07 16:05:21-04', '2016-06-07 16:05:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Auburn, Washington', 3196, '2016-06-08 12:19:11-04', '2016-06-08 12:19:11-04', NULL, '{"lat":"47.30732","lon":"-122.22845","source":"geonames","sourceId":"5785965","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'GSA Schedule contracts', 3197, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Combined Federal Campaign', 3198, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Federal Executive Board', 3199, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'problem solver with acute analytical skills and the ability to quickly identify operational realities.  A highly creative communicator', 3200, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' articulate speaker', 3201, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' enthusiastic trainer', 3202, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' dynamic motivator', 3203, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' energetic', 3204, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' and an innovative thinker who focuses on results.  Team player who consistently performs to high standards', 3205, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' technically proficient', 3206, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' organized', 3207, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' hard-working professional.  Efficient and detail conscious', 3208, '2016-06-08 13:19:18-04', '2016-06-08 13:19:18-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Durham, North Carolina', 3209, '2016-06-09 11:37:19-04', '2016-06-09 11:37:19-04', NULL, '{"lat":"35.99403","lon":"-78.89862","source":"geonames","sourceId":"4464368","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'languages', 3210, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'r ', 3211, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'coding', 3212, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'reproducible research', 3213, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'r markdown', 3214, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'shiny', 3215, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ggplot', 3216, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'htmlwidgets', 3217, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'calculus', 3218, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'queueing theory', 3219, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'linear programming simplex method', 3220, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'econometrics', 3221, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'thinking', 3222, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'r ', 3223, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3224, '2016-06-09 17:13:27-04', '2016-06-09 17:13:27-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'Deadlines', 3313, '2016-06-14 11:07:04-04', '2016-06-14 11:07:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Oak Ridge, Tennessee', 3225, '2016-06-13 09:57:33-04', '2016-06-13 09:57:33-04', NULL, '{"lat":"36.01036","lon":"-84.26964","source":"geonames","sourceId":"4646571","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Salt Lake City, Utah', 3226, '2016-06-13 10:04:33-04', '2016-06-13 10:04:33-04', NULL, '{"lat":"40.76078","lon":"-111.89105","source":"geonames","sourceId":"5780993","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Denver"}');
INSERT INTO tagentity VALUES ('location', 'Frederick, Maryland', 3227, '2016-06-13 10:11:34-04', '2016-06-13 10:11:34-04', NULL, '{"lat":"39.41427","lon":"-77.41054","source":"geonames","sourceId":"4355585","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Bagrām, Parvān, AF', 3228, '2016-06-13 10:11:59-04', '2016-06-13 10:11:59-04', NULL, '{"lat":"34.96694","lon":"69.265","source":"geonames","sourceId":"1147513","dstOffset":"4.5","gmtOffset":"4.5","timeZoneId":"Asia/Kabul"}');
INSERT INTO tagentity VALUES ('location', 'Enid, Oklahoma', 3229, '2016-06-13 10:18:04-04', '2016-06-13 10:18:04-04', NULL, '{"lat":"36.39559","lon":"-97.87839","source":"geonames","sourceId":"4535961","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Mechanicsburg, Pennsylvania', 3230, '2016-06-13 10:22:03-04', '2016-06-13 10:22:03-04', NULL, '{"lat":"40.21426","lon":"-77.00859","source":"geonames","sourceId":"5200657","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Bremerton, Washington', 3231, '2016-06-13 10:26:36-04', '2016-06-13 10:26:36-04', NULL, '{"lat":"47.56732","lon":"-122.63264","source":"geonames","sourceId":"5788054","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Middletown, Iowa', 3232, '2016-06-13 10:31:09-04', '2016-06-13 10:31:09-04', NULL, '{"lat":"40.82837","lon":"-91.25904","source":"geonames","sourceId":"4867297","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Memphis, Tennessee', 3233, '2016-06-13 10:32:48-04', '2016-06-13 10:32:48-04', NULL, '{"lat":"35.14953","lon":"-90.04898","source":"geonames","sourceId":"4641239","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Bend, Oregon', 3234, '2016-06-13 10:34:35-04', '2016-06-13 10:34:35-04', NULL, '{"lat":"44.05817","lon":"-121.31531","source":"geonames","sourceId":"5713587","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Leavenworth, Kansas', 3235, '2016-06-13 10:35:11-04', '2016-06-13 10:35:11-04', NULL, '{"lat":"39.31111","lon":"-94.92246","source":"geonames","sourceId":"4274305","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3236, '2016-06-13 10:44:08-04', '2016-06-13 10:44:08-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Hines, Illinois', 3237, '2016-06-13 10:56:04-04', '2016-06-13 10:56:04-04', NULL, '{"lat":"41.85364","lon":"-87.8395","source":"geonames","sourceId":"4896005","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3238, '2016-06-13 11:01:20-04', '2016-06-13 11:01:20-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 3239, '2016-06-13 11:09:00-04', '2016-06-13 11:09:00-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Bay Saint Louis, Mississippi', 3240, '2016-06-13 11:15:25-04', '2016-06-13 11:15:25-04', NULL, '{"lat":"30.30881","lon":"-89.33005","source":"geonames","sourceId":"4417205","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Pasadena, California', 3241, '2016-06-13 11:15:39-04', '2016-06-13 11:15:39-04', NULL, '{"lat":"34.14778","lon":"-118.14452","source":"geonames","sourceId":"5381396","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('location', 'Managua, NI', 3242, '2016-06-13 11:33:14-04', '2016-06-13 11:33:14-04', NULL, '{"lat":"12.13282","lon":"-86.2504","source":"geonames","sourceId":"3617763","gmtOffset":"-6","timeZoneId":"America/Managua","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'More than 15 years experience in the contracts field', 3243, '2016-06-13 11:36:32-04', '2016-06-13 11:36:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Richland, Washington', 3244, '2016-06-13 11:39:44-04', '2016-06-13 11:39:44-04', NULL, '{"lat":"46.28569","lon":"-119.28446","source":"geonames","sourceId":"5808276","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Vancouver, Washington', 3245, '2016-06-13 11:43:16-04', '2016-06-13 11:43:16-04', NULL, '{"lat":"45.63873","lon":"-122.66149","source":"geonames","sourceId":"5814616","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3246, '2016-06-13 11:45:27-04', '2016-06-13 11:45:27-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'CPCM', 3247, '2016-06-13 11:50:54-04', '2016-06-13 11:50:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' FAC-C Level III', 3248, '2016-06-13 11:50:54-04', '2016-06-13 11:50:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC COR Level III', 3249, '2016-06-13 11:50:54-04', '2016-06-13 11:50:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC P/PM Level III (candidate) ', 3250, '2016-06-13 11:50:54-04', '2016-06-13 11:50:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Martinsburg, West Virginia', 3251, '2016-06-13 11:54:54-04', '2016-06-13 11:54:54-04', NULL, '{"lat":"39.45621","lon":"-77.96389","source":"geonames","sourceId":"4813878","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'North Chicago, Illinois', 3252, '2016-06-13 11:54:59-04', '2016-06-13 11:54:59-04', NULL, '{"lat":"42.32558","lon":"-87.84118","source":"geonames","sourceId":"4903862","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Stafford, Virginia', 3253, '2016-06-13 11:55:14-04', '2016-06-13 11:55:14-04', NULL, '{"lat":"38.42207","lon":"-77.40832","source":"geonames","sourceId":"4787247","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Minneapolis, Minnesota', 3254, '2016-06-13 11:56:36-04', '2016-06-13 11:56:36-04', NULL, '{"lat":"44.97997","lon":"-93.26384","source":"geonames","sourceId":"5037649","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Golden Pond, Kentucky', 3255, '2016-06-13 12:04:28-04', '2016-06-13 12:04:28-04', NULL, '{"lat":"36.78561","lon":"-88.02419","source":"geonames","sourceId":"4292922","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Kearneysville, West Virginia', 3256, '2016-06-13 12:08:30-04', '2016-06-13 12:08:30-04', NULL, '{"lat":"39.38816","lon":"-77.88555","source":"geonames","sourceId":"4810696","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'McClellan Park, California', 3257, '2016-06-13 12:19:27-04', '2016-06-13 12:19:27-04', NULL, '{"lat":"38.66219","lon":"-121.4016","source":"geonames","sourceId":"7315199","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('location', 'Colorado Springs, Colorado', 3258, '2016-06-13 12:24:39-04', '2016-06-13 12:24:39-04', NULL, '{"lat":"38.83388","lon":"-104.82136","source":"geonames","sourceId":"5417598","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Kettering, Ohio', 3259, '2016-06-13 12:25:21-04', '2016-06-13 12:25:21-04', NULL, '{"lat":"39.6895","lon":"-84.16883","source":"geonames","sourceId":"4515843","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'East Lansing, Michigan', 3260, '2016-06-13 12:27:44-04', '2016-06-13 12:27:44-04', NULL, '{"lat":"42.73698","lon":"-84.48387","source":"geonames","sourceId":"4991640","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/Detroit"}');
INSERT INTO tagentity VALUES ('location', 'Lexington, Kentucky', 3261, '2016-06-13 12:29:40-04', '2016-06-13 12:29:40-04', NULL, '{"lat":"37.98869","lon":"-84.47772","source":"geonames","sourceId":"4297983","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Veterans services', 3262, '2016-06-13 12:35:09-04', '2016-06-13 12:35:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' small business', 3263, '2016-06-13 12:35:09-04', '2016-06-13 12:35:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'ACO', 3264, '2016-06-13 12:35:09-04', '2016-06-13 12:35:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Canandaigua, New York', 3265, '2016-06-13 13:00:16-04', '2016-06-13 13:00:16-04', NULL, '{"lat":"42.87423","lon":"-77.28804","source":"geonames","sourceId":"5111405","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Hampton, Virginia', 3266, '2016-06-13 13:02:33-04', '2016-06-13 13:02:33-04', NULL, '{"lat":"37.02987","lon":"-76.34522","source":"geonames","sourceId":"4762894","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Page, Arizona', 3267, '2016-06-13 13:07:21-04', '2016-06-13 13:07:21-04', NULL, '{"lat":"36.91472","lon":"-111.45583","source":"geonames","sourceId":"5307778","gmtOffset":"-7","timeZoneId":"America/Phoenix","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Hampton, Virginia', 3268, '2016-06-13 13:08:46-04', '2016-06-13 13:08:46-04', NULL, '{"lat":"37.02987","lon":"-76.34522","source":"geonames","sourceId":"4762894","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 3269, '2016-06-13 13:20:23-04', '2016-06-13 13:20:23-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Cocoa Beach, Florida', 3270, '2016-06-13 13:21:01-04', '2016-06-13 13:21:01-04', NULL, '{"lat":"28.32055","lon":"-80.60922","source":"geonames","sourceId":"4151441","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Moderating', 3939, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Recife, Pernambuco, BR', 3271, '2016-06-13 13:23:36-04', '2016-06-13 13:23:36-04', NULL, '{"lat":"-8.05389","lon":"-34.88111","source":"geonames","sourceId":"3390760","gmtOffset":"-3","timeZoneId":"America/Recife","dstOffset":"-3"}');
INSERT INTO tagentity VALUES ('topic', 'time management', 3272, '2016-06-13 13:23:45-04', '2016-06-13 13:23:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' biking and movies.', 3273, '2016-06-13 13:29:42-04', '2016-06-13 13:29:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contracting Professional', 3274, '2016-06-13 13:29:42-04', '2016-06-13 13:29:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Boulder City, Nevada', 3275, '2016-06-13 13:33:28-04', '2016-06-13 13:33:28-04', NULL, '{"lat":"35.97859","lon":"-114.83249","source":"geonames","sourceId":"5500539","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Bozeman, Montana', 3276, '2016-06-13 13:39:43-04', '2016-06-13 13:39:43-04', NULL, '{"lat":"45.67965","lon":"-111.03856","source":"geonames","sourceId":"5641727","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Robins Air Force Base, Georgia', 3277, '2016-06-13 13:55:03-04', '2016-06-13 13:55:03-04', NULL, '{"lat":"32.60911","lon":"-83.58444","source":"geonames","sourceId":"7260641","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Contracting Officer Level III', 3278, '2016-06-13 14:09:29-04', '2016-06-13 14:09:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Montgomery, Alabama', 3279, '2016-06-13 14:09:29-04', '2016-06-13 14:09:29-04', NULL, '{"lat":"32.36681","lon":"-86.29997","source":"geonames","sourceId":4076784,"gmtOffset":-6,"timeZoneId":"America/Chicago","dstOffset":-5}');
INSERT INTO tagentity VALUES ('location', 'Eglin Air Force Base, Florida', 3280, '2016-06-13 14:12:51-04', '2016-06-13 14:12:51-04', NULL, '{"lat":"30.45907","lon":"-86.55026","source":"geonames","sourceId":"7259720","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Reading', 3281, '2016-06-13 14:18:09-04', '2016-06-13 14:18:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Travel', 3282, '2016-06-13 14:18:09-04', '2016-06-13 14:18:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Herndon, Virginia', 3283, '2016-06-13 14:43:44-04', '2016-06-13 14:43:44-04', NULL, '{"lat":"38.96955","lon":"-77.3861","source":"geonames","sourceId":"4763793","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Boston, Massachusetts', 3284, '2016-06-13 14:44:33-04', '2016-06-13 14:44:33-04', NULL, '{"lat":"42.35843","lon":"-71.05977","source":"geonames","sourceId":"4930956","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Idaho Falls, Idaho', 3285, '2016-06-13 14:49:11-04', '2016-06-13 14:49:11-04', NULL, '{"lat":"43.46658","lon":"-112.03414","source":"geonames","sourceId":"5596475","dstOffset":"-6","gmtOffset":"-7","timeZoneId":"America/Boise"}');
INSERT INTO tagentity VALUES ('topic', 'College Football', 3286, '2016-06-13 14:53:03-04', '2016-06-13 14:53:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Youth Sports', 3287, '2016-06-13 14:53:03-04', '2016-06-13 14:53:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Japan', 3288, '2016-06-13 14:53:03-04', '2016-06-13 14:53:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Colorado Springs, Colorado', 3289, '2016-06-13 15:10:45-04', '2016-06-13 15:10:45-04', NULL, '{"lat":"38.83388","lon":"-104.82136","source":"geonames","sourceId":"5417598","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('topic', 'business process improvement', 3290, '2016-06-13 15:14:27-04', '2016-06-13 15:14:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Problem Resolution', 3291, '2016-06-13 15:14:27-04', '2016-06-13 15:14:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Team Management', 3292, '2016-06-13 15:14:27-04', '2016-06-13 15:14:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Organizational Realignment', 3293, '2016-06-13 15:14:27-04', '2016-06-13 15:14:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Workload Analysis', 3294, '2016-06-13 15:14:27-04', '2016-06-13 15:14:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 3295, '2016-06-13 15:23:09-04', '2016-06-13 15:23:09-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Montgomery, Alabama', 3296, '2016-06-13 15:35:13-04', '2016-06-13 15:35:13-04', NULL, '{"lat":"32.36681","lon":"-86.29997","source":"geonames","sourceId":"4076784","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Guantánamo, CU', 3297, '2016-06-13 15:40:35-04', '2016-06-13 15:40:35-04', NULL, '{"lat":"20.14444","lon":"-75.20917","source":"geonames","sourceId":"3557689","gmtOffset":"-5","timeZoneId":"America/Havana","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Durham, North Carolina', 3298, '2016-06-13 15:59:35-04', '2016-06-13 15:59:35-04', NULL, '{"lat":"35.99403","lon":"-78.89862","source":"geonames","sourceId":"4464368","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Boyers, Pennsylvania', 3299, '2016-06-13 16:57:32-04', '2016-06-13 16:57:32-04', NULL, '{"lat":"41.10839","lon":"-79.89894","source":"geonames","sourceId":"5181369","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3300, '2016-06-13 17:15:47-04', '2016-06-13 17:15:47-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'FEMP Program', 3301, '2016-06-13 18:48:35-04', '2016-06-13 18:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' SAP', 3302, '2016-06-13 18:48:35-04', '2016-06-13 18:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Collections;', 3303, '2016-06-13 18:48:35-04', '2016-06-13 18:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Closeouts', 3304, '2016-06-13 18:48:35-04', '2016-06-13 18:48:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Nairobi, Nairobi Area, KE', 3305, '2016-06-14 01:46:13-04', '2016-06-14 01:46:13-04', NULL, '{"lat":"-1.28333","lon":"36.81667","source":"geonames","sourceId":"184745","dstOffset":"3","gmtOffset":"3","timeZoneId":"Africa/Nairobi"}');
INSERT INTO tagentity VALUES ('location', 'Ramstein, Rheinland-Pfalz, DE', 3306, '2016-06-14 02:13:41-04', '2016-06-14 02:13:41-04', NULL, '{"lat":"49.45306","lon":"7.59542","source":"geonames","sourceId":"2850539","dstOffset":"2","gmtOffset":"1","timeZoneId":"Europe/Berlin"}');
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 3307, '2016-06-14 06:17:56-04', '2016-06-14 06:17:56-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Gainesville, Florida', 3308, '2016-06-14 07:18:56-04', '2016-06-14 07:18:56-04', NULL, '{"lat":"29.65163","lon":"-82.32483","source":"geonames","sourceId":"4156404","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Air Force Academy, Colorado', 3309, '2016-06-14 09:42:23-04', '2016-06-14 09:42:23-04', NULL, '{"lat":"38.99425","lon":"-104.86375","source":"geonames","sourceId":"7260752","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Missoula, Montana', 3310, '2016-06-14 09:50:11-04', '2016-06-14 09:50:11-04', NULL, '{"lat":"46.87215","lon":"-113.994","source":"geonames","sourceId":"5666639","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Stockton, California', 3311, '2016-06-14 10:05:18-04', '2016-06-14 10:05:18-04', NULL, '{"lat":"37.9577","lon":"-121.29078","source":"geonames","sourceId":"5399020","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('skill', 'Pricing Analysis', 3314, '2016-06-14 11:07:04-04', '2016-06-14 11:07:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Lanham, Maryland', 3315, '2016-06-14 11:24:15-04', '2016-06-14 11:24:15-04', NULL, '{"lat":"38.96875","lon":"-76.8634","source":"geonames","sourceId":"4360321","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', '3d printing', 3316, '2016-06-14 11:30:15-04', '2016-06-14 11:30:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'aviation', 3317, '2016-06-14 11:30:15-04', '2016-06-14 11:30:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'I''m not sure yet.  I''d like to roam the site and see what''s available.', 3318, '2016-06-14 12:54:45-04', '2016-06-14 12:54:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'I need help in finding scholarships for my son who will be entering college in the fall.', 3319, '2016-06-14 12:56:04-04', '2016-06-14 12:56:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Mountain View, California', 3320, '2016-06-14 13:06:10-04', '2016-06-14 13:06:10-04', NULL, '{"lat":"37.38605","lon":"-122.08385","source":"geonames","sourceId":"5375480","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Saint Cloud, Minnesota', 3321, '2016-06-14 15:01:34-04', '2016-06-14 15:01:34-04', NULL, '{"lat":"45.5608","lon":"-94.16249","source":"geonames","sourceId":"5044407","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('topic', 'Hard to specify', 3322, '2016-06-14 15:48:30-04', '2016-06-14 15:48:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contracting / Subcontracting; Tax Preparation; Genealogy; US History', 3326, '2016-06-14 15:48:30-04', '2016-06-14 15:48:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Oberlin, Ohio', 3327, '2016-06-14 15:51:59-04', '2016-06-14 15:51:59-04', NULL, '{"lat":"41.29394","lon":"-82.21738","source":"geonames","sourceId":"5165445","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Legal interpretation', 3328, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'History  ', 3329, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Workforce Development  ', 3330, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open to a variety of opportunities of all kinds ', 3331, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contracting ', 3332, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Subcontracting', 3333, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Tax Preparation', 3334, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Genealogy', 3335, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'US History', 3336, '2016-06-14 15:57:07-04', '2016-06-14 15:57:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Open to a variety of opportunities of all kinds', 3337, '2016-06-14 16:03:47-04', '2016-06-14 16:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contracting  ', 3338, '2016-06-14 16:03:47-04', '2016-06-14 16:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Subcontracting  ', 3339, '2016-06-14 16:03:47-04', '2016-06-14 16:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'US History  ', 3340, '2016-06-14 16:03:47-04', '2016-06-14 16:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Tax Preparation  ', 3341, '2016-06-14 16:03:47-04', '2016-06-14 16:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing  ', 3342, '2016-06-14 16:03:47-04', '2016-06-14 16:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Legal interpretation  ', 3343, '2016-06-14 16:03:47-04', '2016-06-14 16:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Interested in a variety of opportunities', 3344, '2016-06-14 16:07:15-04', '2016-06-14 16:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Online research', 3345, '2016-06-14 16:07:15-04', '2016-06-14 16:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'History', 3346, '2016-06-14 16:07:15-04', '2016-06-14 16:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'I am looking to develop and hone leadership skills and well as some technical skills.', 3347, '2016-06-15 08:46:27-04', '2016-06-15 08:46:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'I have experience in acquisition and procurement using FAR procedures and AMS procedures at FAA', 3348, '2016-06-15 08:46:27-04', '2016-06-15 08:46:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'statutes principals California state laws and procedures to develop impement and promulgate directives guidance policies and instructions.', 3349, '2016-06-15 08:46:27-04', '2016-06-15 08:46:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'I have experience in researching Federal Acquisition Regulations', 3350, '2016-06-15 08:46:27-04', '2016-06-15 08:46:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'I am skilled in communicating with people both inside and outside of my organization both orally and in writing.', 3351, '2016-06-15 08:46:27-04', '2016-06-15 08:46:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Yorktown, Virginia', 3352, '2016-06-15 08:58:47-04', '2016-06-15 08:58:47-04', NULL, '{"lat":"37.23876","lon":"-76.50967","source":"geonames","sourceId":"4046946","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3353, '2016-06-15 08:59:43-04', '2016-06-15 08:59:43-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'Procurement', 3354, '2016-06-15 09:06:39-04', '2016-06-15 09:06:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'market research', 3355, '2016-06-15 09:06:39-04', '2016-06-15 09:06:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'I am looking to develop and hone my leadership skills.', 3356, '2016-06-15 09:25:46-04', '2016-06-15 09:25:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'I have experience in acquisition and procurement using Federal Acquistion Procedures (FAR) and Acquistion Management Procedures (AMS) at the Federal Aviation Administration.', 3357, '2016-06-15 09:25:46-04', '2016-06-15 09:25:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Atlantic City, New Jersey', 3358, '2016-06-15 09:46:11-04', '2016-06-15 09:46:11-04', NULL, '{"lat":"39.36428","lon":"-74.42293","source":"geonames","sourceId":"4500546","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', ' Agile', 3359, '2016-06-15 12:26:58-04', '2016-06-15 12:26:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Software development management', 3360, '2016-06-15 12:26:58-04', '2016-06-15 12:26:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Scrum', 3361, '2016-06-15 12:26:58-04', '2016-06-15 12:26:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Enterprise Architecture', 3362, '2016-06-15 12:26:58-04', '2016-06-15 12:26:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' DevOps', 3363, '2016-06-15 12:26:58-04', '2016-06-15 12:26:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Morgantown, West Virginia', 3364, '2016-06-15 14:21:46-04', '2016-06-15 14:21:46-04', NULL, '{"lat":"39.62953","lon":"-79.9559","source":"geonames","sourceId":"4815352","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Lanham, Maryland', 3365, '2016-06-16 13:00:28-04', '2016-06-16 13:00:28-04', NULL, '{"lat":"38.96875","lon":"-76.8634","source":"geonames","sourceId":"4360321","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Big Data', 3366, '2016-06-16 14:04:21-04', '2016-06-16 14:04:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Architecture', 3367, '2016-06-16 14:04:21-04', '2016-06-16 14:04:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Machine Learning', 3368, '2016-06-16 14:04:21-04', '2016-06-16 14:04:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Natural Language Processing', 3369, '2016-06-16 14:04:21-04', '2016-06-16 14:04:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'NLP', 3370, '2016-06-16 14:04:21-04', '2016-06-16 14:04:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MapR', 3371, '2016-06-16 14:04:21-04', '2016-06-16 14:04:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mapreduce', 3372, '2016-06-16 14:04:21-04', '2016-06-16 14:04:21-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'creativity', 3373, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'innovation management', 3374, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'self sufficiency', 3375, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'DIUx', 3376, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'rapid prototyping', 3377, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'advertising', 3378, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'experiential marketing', 3379, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'experimental programs', 3380, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'non-politicized projects', 3381, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'eliminating bureaucratic inefficiency', 3382, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'monuments', 3383, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Army', 3384, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Veterans Affairs', 3385, '2016-06-16 18:19:06-04', '2016-06-16 18:19:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cyber defense', 3386, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'defense of innovations', 3387, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'pollution', 3388, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'self-sufficiency', 3389, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'survival', 3390, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'emergency planning', 3391, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'virtual desktops', 3392, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social collaboraiton', 3393, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'art', 3394, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'fine art', 3395, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'semiotics', 3396, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'idea analysis', 3397, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lean Six Sigma', 3398, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'continuous process improvement', 3399, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'monuments', 3400, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'knowledge management', 3401, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'fine arts', 3402, '2016-06-16 18:19:07-04', '2016-06-16 18:19:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3403, '2016-06-17 11:30:26-04', '2016-06-17 11:30:26-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('skill', 'electronic filing', 3404, '2016-06-17 13:38:41-04', '2016-06-17 13:38:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Huntsville, Alabama', 3405, '2016-06-20 05:00:23-04', '2016-06-20 05:00:23-04', NULL, '{"lat":"34.73037","lon":"-86.5861","source":"geonames","sourceId":"4068590","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Kansas City, Missouri', 3406, '2016-06-20 09:54:48-04', '2016-06-20 09:54:48-04', NULL, '{"lat":"39.09973","lon":"-94.57857","source":"geonames","sourceId":"4393217","dstOffset":"-5","gmtOffset":"-6","timeZoneId":"America/Chicago"}');
INSERT INTO tagentity VALUES ('location', 'Portsmouth, Virginia', 3407, '2016-06-20 10:40:18-04', '2016-06-20 10:40:18-04', NULL, '{"lat":"36.83543","lon":"-76.29827","source":"geonames","sourceId":"4779999","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'supply', 3408, '2016-06-20 15:41:31-04', '2016-06-20 15:41:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MS Exel', 3409, '2016-06-20 15:41:31-04', '2016-06-20 15:41:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Marine Corps Base Hawaii - MCBH, Hawaii', 3410, '2016-06-20 15:41:31-04', '2016-06-20 15:41:31-04', NULL, '{"lat":"21.44336","lon":"-157.74981","source":"geonames","sourceId":7262734,"gmtOffset":-10,"timeZoneId":"Pacific/Honolulu","dstOffset":-10}');
INSERT INTO tagentity VALUES ('location', 'Arlington, Virginia', 3411, '2016-06-21 10:23:20-04', '2016-06-21 10:23:20-04', NULL, '{"lat":"38.88101","lon":"-77.10428","source":"geonames","sourceId":"4744709","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('topic', 'Risk Communication', 3412, '2016-06-21 11:19:43-04', '2016-06-21 11:19:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3413, '2016-06-21 15:54:17-04', '2016-06-21 15:54:17-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Napa, California', 3414, '2016-06-22 14:33:31-04', '2016-06-22 14:33:31-04', NULL, '{"lat":"38.29714","lon":"-122.28553","source":"geonames","sourceId":"5376095","dstOffset":"-7","gmtOffset":"-8","timeZoneId":"America/Los_Angeles"}');
INSERT INTO tagentity VALUES ('skill', ' user experience', 3415, '2016-06-23 13:11:40-04', '2016-06-23 13:11:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'UX', 3416, '2016-06-23 13:11:40-04', '2016-06-23 13:11:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' writer', 3417, '2016-06-23 13:11:40-04', '2016-06-23 13:11:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'case study', 3418, '2016-06-23 13:11:40-04', '2016-06-23 13:11:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 3419, '2016-06-23 13:11:40-04', '2016-06-23 13:11:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'case studies', 3420, '2016-06-23 13:11:40-04', '2016-06-23 13:11:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'user testing', 3421, '2016-06-23 13:11:40-04', '2016-06-23 13:11:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Google Maps', 3422, '2016-06-24 10:57:28-04', '2016-06-24 10:57:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Geospatial Information System', 3423, '2016-06-24 10:57:28-04', '2016-06-24 10:57:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Geographic Information System', 3424, '2016-06-24 10:57:28-04', '2016-06-24 10:57:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mobile Applications', 3425, '2016-06-29 14:24:37-04', '2016-06-29 14:24:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'YouTube', 3426, '2016-06-29 14:24:37-04', '2016-06-29 14:24:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sparkol', 3427, '2016-06-29 14:24:37-04', '2016-06-29 14:24:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Anacostia, Washington, D.C.', 3428, '2016-06-30 15:27:02-04', '2016-06-30 15:27:02-04', NULL, '{"lat":"38.8665","lon":"-76.98386","source":"geonames","sourceId":"4137523","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'DISTANCE', 3429, '2016-07-01 01:04:28-04', '2016-07-01 01:04:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3430, '2016-07-05 10:29:57-04', '2016-07-05 10:29:57-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Mobile, Alabama', 3431, '2016-07-05 12:04:06-04', '2016-07-05 12:04:06-04', NULL, '{"lat":"30.69436","lon":"-88.04305","source":"geonames","sourceId":"4076598","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3432, '2016-07-06 12:19:07-04', '2016-07-06 12:19:07-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Green Buildings', 3433, '2016-07-06 12:25:17-04', '2016-07-06 12:25:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Energy Efficiency', 3434, '2016-07-06 12:25:17-04', '2016-07-06 12:25:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Smart project management', 3435, '2016-07-06 12:25:17-04', '2016-07-06 12:25:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Financial planning', 3436, '2016-07-06 12:25:17-04', '2016-07-06 12:25:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Forecasting', 3437, '2016-07-06 12:25:17-04', '2016-07-06 12:25:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cost Estimating', 3438, '2016-07-06 12:25:17-04', '2016-07-06 12:25:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Management Offices', 3439, '2016-07-06 12:25:17-04', '2016-07-06 12:25:17-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Eatontown, New Jersey', 3440, '2016-07-06 13:45:32-04', '2016-07-06 13:45:32-04', NULL, '{"lat":"40.29622","lon":"-74.05097","source":"geonames","sourceId":"5097482","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'West Haven, Connecticut', 3441, '2016-07-06 13:52:44-04', '2016-07-06 13:52:44-04', NULL, '{"lat":"41.27065","lon":"-72.94705","source":"geonames","sourceId":"4845419","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3442, '2016-07-06 14:36:34-04', '2016-07-06 14:36:34-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'team building', 3443, '2016-07-06 14:36:47-04', '2016-07-06 14:36:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cultural transformation', 3444, '2016-07-06 14:36:47-04', '2016-07-06 14:36:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'lab management', 3445, '2016-07-07 08:17:44-04', '2016-07-07 08:17:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' acquisition (COR)', 3446, '2016-07-07 08:17:44-04', '2016-07-07 08:17:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'competitive analysis', 3447, '2016-07-07 09:01:15-04', '2016-07-07 09:01:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'profitability analysis', 3448, '2016-07-07 09:01:15-04', '2016-07-07 09:01:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'market planning', 3449, '2016-07-07 09:01:15-04', '2016-07-07 09:01:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cross cultural communications', 3450, '2016-07-07 09:01:15-04', '2016-07-07 09:01:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'business objects', 3451, '2016-07-07 09:01:16-04', '2016-07-07 09:01:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Maynard, Massachusetts', 3452, '2016-07-07 09:02:27-04', '2016-07-07 09:02:27-04', NULL, '{"lat":"42.43343","lon":"-71.44951","source":"geonames","sourceId":"4943490","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Butler, Pennsylvania', 3453, '2016-07-07 09:11:58-04', '2016-07-07 09:11:58-04', NULL, '{"lat":"40.86118","lon":"-79.89533","source":"geonames","sourceId":"5182534","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Los Alamos, New Mexico', 3454, '2016-07-07 10:08:59-04', '2016-07-07 10:08:59-04', NULL, '{"lat":"35.88808","lon":"-106.30697","source":"geonames","sourceId":"5476825","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'College Station, Texas', 3455, '2016-07-07 10:59:54-04', '2016-07-07 10:59:54-04', NULL, '{"lat":"30.62798","lon":"-96.33441","source":"geonames","sourceId":"4682464","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 3456, '2016-07-07 11:27:52-04', '2016-07-07 11:27:52-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3457, '2016-07-07 14:33:07-04', '2016-07-07 14:33:07-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","dstOffset":"-4","gmtOffset":"-5","timeZoneId":"America/New_York"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3458, '2016-07-07 16:28:14-04', '2016-07-07 16:28:14-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Managment and coordination efforts of senior executives.', 3459, '2016-07-08 15:24:29-04', '2016-07-08 15:24:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Hiking', 3460, '2016-07-08 15:36:02-04', '2016-07-08 15:36:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Swimming', 3461, '2016-07-08 15:36:02-04', '2016-07-08 15:36:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Health Management', 3462, '2016-07-08 15:36:02-04', '2016-07-08 15:36:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Procurement Review', 3463, '2016-07-08 15:36:02-04', '2016-07-08 15:36:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'WordPress Content Management System', 3464, '2016-07-12 14:05:57-04', '2016-07-12 14:05:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' design', 3465, '2016-07-12 14:05:57-04', '2016-07-12 14:05:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' website architecture', 3466, '2016-07-12 14:05:57-04', '2016-07-12 14:05:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'testing and troubleshooting in WordPress CMS', 3467, '2016-07-12 14:05:57-04', '2016-07-12 14:05:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Familiarity with Adobe Acrobat Creativity', 3468, '2016-07-12 15:19:38-04', '2016-07-12 15:19:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cio', 3469, '2016-07-14 10:36:06-04', '2016-07-14 10:36:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Experience with FAR', 3470, '2016-07-14 10:36:06-04', '2016-07-14 10:36:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'rapid acquisition', 3471, '2016-07-14 10:36:06-04', '2016-07-14 10:36:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT development programs', 3472, '2016-07-14 10:36:06-04', '2016-07-14 10:36:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' IT contracting', 3542, '2016-07-20 11:32:12-04', '2016-07-20 11:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'intelligent', 3951, '2016-11-17 08:17:24-05', '2016-11-17 08:17:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3473, '2016-07-14 11:36:32-04', '2016-07-14 11:36:32-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('topic', 'business transformation', 3474, '2016-07-15 09:40:42-04', '2016-07-15 09:40:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'government', 3475, '2016-07-15 09:40:42-04', '2016-07-15 09:40:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Newport News, Virginia', 3476, '2016-07-18 12:24:42-04', '2016-07-18 12:24:42-04', NULL, '{"lat":"37.08339","lon":"-76.46965","source":"geonames","sourceId":"4776024","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'HR', 3477, '2016-07-18 14:05:56-04', '2016-07-18 14:05:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PC', 3478, '2016-07-18 14:05:56-04', '2016-07-18 14:05:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Apple', 3479, '2016-07-18 14:05:56-04', '2016-07-18 14:05:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Abuja, Abuja Federal Capital Territory, NG', 3480, '2016-07-19 03:10:47-04', '2016-07-19 03:10:47-04', NULL, '{"lat":"9.05785","lon":"7.49508","source":"geonames","sourceId":2352778,"gmtOffset":1,"timeZoneId":"Africa/Lagos","dstOffset":1}');
INSERT INTO tagentity VALUES ('location', 'Lebanon, Pennsylvania', 3481, '2016-07-19 07:15:38-04', '2016-07-19 07:15:38-04', NULL, '{"lat":"40.34093","lon":"-76.41135","source":"geonames","sourceId":"5197517","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Buffalo, New York', 3482, '2016-07-19 07:46:00-04', '2016-07-19 07:46:00-04', NULL, '{"lat":"42.88645","lon":"-78.87837","source":"geonames","sourceId":"5110629","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Arlington, Virginia', 3483, '2016-07-19 07:56:52-04', '2016-07-19 07:56:52-04', NULL, '{"lat":"38.88101","lon":"-77.10428","source":"geonames","sourceId":"4744709","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Lackland Air Force Base, Texas', 3484, '2016-07-19 08:02:11-04', '2016-07-19 08:02:11-04', NULL, '{"lat":"29.38663","lon":"-98.61797","source":"geonames","sourceId":"7261570","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Lexington Park, Maryland', 3485, '2016-07-19 08:03:24-04', '2016-07-19 08:03:24-04', NULL, '{"lat":"38.26679","lon":"-76.45384","source":"geonames","sourceId":"4360592","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3486, '2016-07-19 08:09:02-04', '2016-07-19 08:09:02-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Baltimore, Maryland', 3487, '2016-07-19 09:00:09-04', '2016-07-19 09:00:09-04', NULL, '{"lat":"39.29038","lon":"-76.61219","source":"geonames","sourceId":"4347778","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'product management', 3488, '2016-07-19 09:03:26-04', '2016-07-19 09:03:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'ux', 3489, '2016-07-19 09:03:26-04', '2016-07-19 09:03:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'metrics and measurement planning', 3490, '2016-07-19 09:03:26-04', '2016-07-19 09:03:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ux', 3491, '2016-07-19 09:03:26-04', '2016-07-19 09:03:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' digital strategy', 3492, '2016-07-19 09:03:26-04', '2016-07-19 09:03:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'project management', 3493, '2016-07-19 09:03:26-04', '2016-07-19 09:03:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital storytelling', 3494, '2016-07-19 09:03:26-04', '2016-07-19 09:03:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'multimedia production', 3495, '2016-07-19 09:03:26-04', '2016-07-19 09:03:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'user testing', 3496, '2016-07-19 09:05:46-04', '2016-07-19 09:05:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT leadership', 3497, '2016-07-19 09:20:07-04', '2016-07-19 09:20:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'E-Business', 3498, '2016-07-19 09:20:07-04', '2016-07-19 09:20:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Organizational Leadership', 3499, '2016-07-19 09:20:07-04', '2016-07-19 09:20:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PMO Leadership', 3500, '2016-07-19 09:34:38-04', '2016-07-19 09:34:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Executive Mentoring', 3501, '2016-07-19 09:34:38-04', '2016-07-19 09:34:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Fishing', 3502, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Camping', 3503, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Watersports ', 3504, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Base Management', 3505, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Supply Managemnt ', 3506, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Healthcare Infomatics', 3507, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Information Systems Managemnt', 3508, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'A/C Logistics Support ', 3509, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MedlLog and MedSurg ', 3510, '2016-07-19 09:46:02-04', '2016-07-19 09:46:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Laguna Niguel, California', 3511, '2016-07-19 09:46:28-04', '2016-07-19 09:46:28-04', NULL, '{"lat":"33.52253","lon":"-117.70755","source":"geonames","sourceId":"5364329","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Hamilton, Montana', 3512, '2016-07-19 12:11:31-04', '2016-07-19 12:11:31-04', NULL, '{"lat":"46.24687","lon":"-114.16037","source":"geonames","sourceId":"5655959","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3513, '2016-07-19 13:41:47-04', '2016-07-19 13:41:47-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3514, '2016-07-19 15:14:15-04', '2016-07-19 15:14:15-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Marion, Missouri', 3515, '2016-07-19 23:53:08-04', '2016-07-19 23:53:08-04', NULL, '{"lat":"38.69087","lon":"-92.3663","source":"geonames","sourceId":"4397106","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Bolivar, Tennessee', 3516, '2016-07-20 07:35:29-04', '2016-07-20 07:35:29-04', NULL, '{"lat":"35.25619","lon":"-88.98784","source":"geonames","sourceId":"4607598","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'New York City, New York', 3517, '2016-07-20 08:40:54-04', '2016-07-20 08:40:54-04', NULL, '{"lat":"40.71427","lon":"-74.00597","source":"geonames","sourceId":"5128581","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Adobe Reports & Analytics', 3518, '2016-07-20 08:48:02-04', '2016-07-20 08:48:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'audience profiling', 3519, '2016-07-20 08:48:02-04', '2016-07-20 08:48:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'android programming', 3520, '2016-07-20 09:07:15-04', '2016-07-20 09:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'web services', 3521, '2016-07-20 09:07:15-04', '2016-07-20 09:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Accessible Design', 3522, '2016-07-20 09:55:39-04', '2016-07-20 09:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'UI Testing', 3523, '2016-07-20 09:55:39-04', '2016-07-20 09:55:39-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'building website', 3524, '2016-07-20 10:17:24-04', '2016-07-20 10:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ontology', 3525, '2016-07-20 10:28:48-04', '2016-07-20 10:28:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Annapolis Junction, Maryland', 3526, '2016-07-20 11:00:52-04', '2016-07-20 11:00:52-04', NULL, '{"lat":"39.12287","lon":"-76.78757","source":"geonames","sourceId":"6692448","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3527, '2016-07-20 11:02:31-04', '2016-07-20 11:02:31-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Frederick, Maryland', 3528, '2016-07-20 11:14:41-04', '2016-07-20 11:14:41-04', NULL, '{"lat":"39.41427","lon":"-77.41054","source":"geonames","sourceId":"4355585","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Source Selection', 3529, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Requirements Analysis', 3530, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contract Administration', 3531, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cost Accounting Standards', 3532, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Pre-Award', 3533, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Requirements Definition', 3534, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Source Selection', 3535, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Financial Assistance', 3536, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cost Type', 3537, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Procurment ', 3538, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cost Analysis', 3539, '2016-07-20 11:28:03-04', '2016-07-20 11:28:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Grand Prairie, Texas', 3540, '2016-07-20 11:31:56-04', '2016-07-20 11:31:56-04', NULL, '{"lat":"32.74596","lon":"-96.99778","source":"geonames","sourceId":"4694482","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Construction contracting', 3541, '2016-07-20 11:32:12-04', '2016-07-20 11:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Simplified acquisition', 3543, '2016-07-20 11:32:12-04', '2016-07-20 11:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'GPC', 3544, '2016-07-20 11:32:12-04', '2016-07-20 11:32:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Lee''s Summit, Missouri', 3545, '2016-07-20 11:32:13-04', '2016-07-20 11:32:13-04', NULL, '{"lat":"38.91084","lon":"-94.38217","source":"geonames","sourceId":"4394870","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Career Development', 3546, '2016-07-20 11:39:04-04', '2016-07-20 11:39:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3547, '2016-07-20 11:40:29-04', '2016-07-20 11:40:29-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Lake City, Florida', 3548, '2016-07-20 12:18:36-04', '2016-07-20 12:18:36-04', NULL, '{"lat":"30.18968","lon":"-82.63929","source":"geonames","sourceId":"4161187","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'concur ', 3549, '2016-07-20 12:53:12-04', '2016-07-20 12:53:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'training and development', 3550, '2016-07-20 12:53:12-04', '2016-07-20 12:53:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Travel Management', 3551, '2016-07-20 12:53:13-04', '2016-07-20 12:53:13-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC-PPM III', 3552, '2016-07-20 13:10:56-04', '2016-07-20 13:10:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'healthcare staffing services', 3553, '2016-07-20 13:23:28-04', '2016-07-20 13:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Unarmed Guard Services', 3554, '2016-07-20 13:23:28-04', '2016-07-20 13:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Education Services ', 3555, '2016-07-20 13:23:28-04', '2016-07-20 13:23:28-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Legal Writing', 3556, '2016-07-20 15:48:49-04', '2016-07-20 15:48:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Organization ', 3557, '2016-07-20 15:48:49-04', '2016-07-20 15:48:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Laredo, Texas', 3558, '2016-07-21 11:44:22-04', '2016-07-21 11:44:22-04', NULL, '{"lat":"27.50641","lon":"-99.50754","source":"geonames","sourceId":"4705349","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Fayetteville, North Carolina', 3559, '2016-07-21 16:29:51-04', '2016-07-21 16:29:51-04', NULL, '{"lat":"35.05266","lon":"-78.87836","source":"geonames","sourceId":"4466033","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Que ', 3560, '2016-07-23 02:36:00-04', '2016-07-23 02:36:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Eleasar barraza cebrerod', 3561, '2016-07-23 02:36:00-04', '2016-07-23 02:36:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Que ', 3562, '2016-07-23 02:36:00-04', '2016-07-23 02:36:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Eleasar barraza cebrerod', 3563, '2016-07-23 02:36:00-04', '2016-07-23 02:36:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Que ', 3564, '2016-07-23 02:36:00-04', '2016-07-23 02:36:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Eleasar barraza cebrerod', 3565, '2016-07-23 02:36:00-04', '2016-07-23 02:36:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'prize competition', 3566, '2016-07-26 12:02:20-04', '2016-07-26 12:02:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'prize competition', 3567, '2016-07-26 12:06:43-04', '2016-07-26 12:06:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Fly Fishing', 3568, '2016-07-26 13:53:55-04', '2016-07-26 13:53:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Softball', 3570, '2016-07-26 13:53:55-04', '2016-07-26 13:53:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Alaska ', 3569, '2016-07-26 13:53:55-04', '2016-07-26 13:53:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'KSN', 3571, '2016-07-26 13:53:55-04', '2016-07-26 13:53:55-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 3572, '2016-07-26 13:59:31-04', '2016-07-26 13:59:31-04', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Computing', 3573, '2016-07-26 14:05:59-04', '2016-07-26 14:05:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Acrobat Pro XI', 3574, '2016-07-26 15:08:14-04', '2016-07-26 15:08:14-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Acquisitions', 3575, '2016-07-27 15:47:57-04', '2016-07-27 15:47:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT', 3576, '2016-07-27 15:47:57-04', '2016-07-27 15:47:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fort Shafter, Hawaii', 3577, '2016-07-29 18:19:39-04', '2016-07-29 18:19:39-04', NULL, '{"lat":"21.34411","lon":"-157.88628","source":"geonames","sourceId":"9781212","gmtOffset":"-10","timeZoneId":"Pacific/Honolulu","dstOffset":"-10"}');
INSERT INTO tagentity VALUES ('skill', 'Organizational Skills', 3578, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Certified Professional Contracts Manager', 3579, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Leadership			', 3580, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Acquisition Strategy', 3581, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lean Six Sigma Black Belt', 3582, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customer/Client Service', 3583, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Resource Mangagement', 3584, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Advisor', 3585, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Community Engagement', 3586, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Performance Based Acquisition', 3587, '2016-07-29 18:37:25-04', '2016-07-29 18:37:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'AccesSurf Hawaii', 3588, '2016-07-29 18:47:03-04', '2016-07-29 18:47:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'National Contract Management Association (Aloha Chapter)', 3589, '2016-07-29 18:47:03-04', '2016-07-29 18:47:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DAWIA III Contracting', 3590, '2016-07-29 18:47:03-04', '2016-07-29 18:47:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DAWIA I Program Management', 3591, '2016-07-29 18:47:03-04', '2016-07-29 18:47:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DAWIA I Production Quality & Manufacturing', 3592, '2016-07-29 18:47:03-04', '2016-07-29 18:47:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Secret Clearance', 3593, '2016-07-29 18:47:03-04', '2016-07-29 18:47:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Organizational Excellence', 3594, '2016-07-29 18:47:03-04', '2016-07-29 18:47:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Stakeholder Engagement', 3595, '2016-07-29 18:51:19-04', '2016-07-29 18:51:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Government Contracting', 3596, '2016-07-29 18:51:19-04', '2016-07-29 18:51:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Certified Federal Contracts Manager', 3597, '2016-07-29 18:51:19-04', '2016-07-29 18:51:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal Contracting', 3598, '2016-07-29 18:51:19-04', '2016-07-29 18:51:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal Acquisition Regulations (FAR)', 3599, '2016-07-29 19:03:02-04', '2016-07-29 19:03:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'National Contract Management Association (NCMA)', 3600, '2016-07-29 19:07:00-04', '2016-07-29 19:07:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'graphics shop', 3601, '2016-08-02 10:20:07-04', '2016-08-02 10:20:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'print shop', 3602, '2016-08-02 10:20:07-04', '2016-08-02 10:20:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mediation', 3603, '2016-08-02 14:00:38-04', '2016-08-02 14:00:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Farming and Ranching', 3604, '2016-08-02 14:00:38-04', '2016-08-02 14:00:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ombudsperson', 3605, '2016-08-02 14:00:38-04', '2016-08-02 14:00:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Leadership coaching', 3606, '2016-08-02 14:00:38-04', '2016-08-02 14:00:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Environmental', 3607, '2016-08-02 14:00:38-04', '2016-08-02 14:00:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Trend Identification', 3608, '2016-08-02 14:14:33-04', '2016-08-02 14:14:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Communication', 3609, '2016-08-02 14:14:33-04', '2016-08-02 14:14:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Farming and Ranching', 3610, '2016-08-02 14:14:33-04', '2016-08-02 14:14:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Access for Historically Underserved Groups', 3611, '2016-08-02 14:14:33-04', '2016-08-02 14:14:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lean UX', 3612, '2016-08-02 14:25:49-04', '2016-08-02 14:25:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Intranet', 3613, '2016-08-02 14:25:49-04', '2016-08-02 14:25:49-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Statistician', 3614, '2016-08-02 15:07:45-04', '2016-08-02 15:07:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Economist', 3615, '2016-08-02 15:07:45-04', '2016-08-02 15:07:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Analyst', 3616, '2016-08-02 15:07:45-04', '2016-08-02 15:07:45-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Accessible Documents', 3617, '2016-08-02 15:20:12-04', '2016-08-02 15:20:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Alexandria, Virginia', 3618, '2016-08-04 08:25:46-04', '2016-08-04 08:25:46-04', NULL, '{"lat":"38.80484","lon":"-77.04692","source":"geonames","sourceId":"4744091","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'expressjs', 3619, '2016-08-04 09:31:43-04', '2016-08-04 09:31:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'grunt', 3620, '2016-08-04 09:31:44-04', '2016-08-04 09:31:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'bower', 3621, '2016-08-04 09:31:44-04', '2016-08-04 09:31:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'npm', 3622, '2016-08-04 09:31:44-04', '2016-08-04 09:31:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'microsoft azure', 3623, '2016-08-04 09:31:44-04', '2016-08-04 09:31:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FHIR', 3624, '2016-08-11 12:17:25-04', '2016-08-11 12:17:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'EHR', 3625, '2016-08-11 12:17:25-04', '2016-08-11 12:17:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'health IT', 3626, '2016-08-11 12:17:25-04', '2016-08-11 12:17:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Small Business', 3627, '2016-08-16 16:14:52-04', '2016-08-16 16:14:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Prather, California', 3628, '2016-08-17 19:18:14-04', '2016-08-17 19:18:14-04', NULL, '{"lat":"37.03745","lon":"-119.51402","source":"geonames","sourceId":"5384800","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('skill', 'Forestry', 3629, '2016-08-17 19:21:50-04', '2016-08-17 19:21:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Ecology', 3630, '2016-08-17 19:21:50-04', '2016-08-17 19:21:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CXO Audience', 3631, '2016-08-23 13:39:04-04', '2016-08-23 13:39:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Food Service', 3632, '2016-08-24 08:21:31-04', '2016-08-24 08:21:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal Nutrition System', 3633, '2016-08-24 08:21:31-04', '2016-08-24 08:21:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cooking', 3634, '2016-08-24 08:21:31-04', '2016-08-24 08:21:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Database', 3635, '2016-08-24 10:01:11-04', '2016-08-24 10:01:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Physics', 3636, '2016-08-24 10:01:11-04', '2016-08-24 10:01:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'C/C++', 3637, '2016-08-24 10:01:11-04', '2016-08-24 10:01:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'noSQL', 3638, '2016-08-24 10:01:11-04', '2016-08-24 10:01:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'predictive', 3639, '2016-08-26 15:28:16-04', '2016-08-26 15:28:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Dashboard Design', 3640, '2016-08-26 15:28:16-04', '2016-08-26 15:28:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Provide acquisition assistance where needed', 3641, '2016-08-29 14:45:12-04', '2016-08-29 14:45:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Procurement Analyst', 3642, '2016-08-29 14:45:12-04', '2016-08-29 14:45:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Department of Homeland Security', 3643, '2016-09-06 10:29:33-04', '2016-09-06 10:29:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Army Corp of Engineers (USACE)', 55, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USACE","domain":"usace.gov","slug":"usace","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Broadcasting Board Of Governors (BBG)', 56, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BBG","domain":"bbg.gov","slug":"bbg","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Corporation for National and Community Service (CNCS)', 65, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CNCS","domain":"cncs.gov","slug":"cncs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Court Services and Offender Supervision Agency for the District of Columbia (CSOSA)', 66, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CSOSA","domain":"csosa.gov","slug":"csosa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Defense Acquisition University (DAU)', 67, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DAU","domain":"dau.gov","slug":"dau","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Defense Finance and Accounting (DFAS)', 69, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DFAS","domain":"dfas.gov","slug":"dfas","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Defense Intelligence Agency (DIA)', 70, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DIA","domain":"dia.gov","slug":"dia","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Energy (DOE)', 76, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOE","domain":"doe.gov","slug":"doe","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Homeland Security (DHS)', 78, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DHS","domain":"dhs.gov","slug":"dhs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Health and Human Services (HHS)', 77, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"HHS","domain":"hhs.gov","slug":"hhs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Justice (DOJ)', 80, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOJ","domain":"doj.gov","slug":"doj","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS Coast Guard (USCG)', 87, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USCG","domain":"uscg.gov","slug":"uscg","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS Coast Guard Auxiliary (CGAUX)', 88, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CGAUX","domain":"cgaux.gov","slug":"cgaux","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS Customs and Border Protection (CBP)', 90, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CBP","domain":"cbp.gov","slug":"cbp","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS Federal Emergency Management Agency (FEMA)', 91, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FEMA","domain":"fema.gov","slug":"fema","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DHS Federal Law Enforcement Training Center (FLETC)', 92, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FLETC","domain":"fletc.gov","slug":"fletc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DNI Information Sharing Environment (ISE)', 98, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ISE","domain":"ise.gov","slug":"ise","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC Bureau of Economic Analysis (BEA)', 99, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BEA","domain":"bea.gov","slug":"bea","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC Bureau of Industry and Security (BIS)', 100, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BIS","domain":"bis.gov","slug":"bis","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC Economic Development Administration (EDA)', 102, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"EDA","domain":"eda.gov","slug":"eda","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC Economics and Statistics Administration (ESA)', 103, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ESA","domain":"esa.gov","slug":"esa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC International Trade Administration (ITA)', 104, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ITA","domain":"ita.gov","slug":"ita","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC Minority Business Development Agency (MBDA)', 105, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"MBDA","domain":"mbda.gov","slug":"mbda","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC National Oceanic and Atmospheric Administration (NOAA)', 107, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NOAA","domain":"noaa.gov","slug":"noaa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC National Technical Information Service (NTIS)', 108, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NTIS","domain":"ntis.gov","slug":"ntis","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC National Telecommunications and Information Administration (NTIA)', 109, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NTIA","domain":"ntia.gov","slug":"ntia","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOC Patent and Trademark Office (USPTO)', 110, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USPTO","domain":"uspto.gov","slug":"uspto","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOD Air Force (AF)', 111, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"AF","domain":"af.gov","slug":"af","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOD Joint Chiefs of Staff (JCS)', 113, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"JCS","domain":"jcs.gov","slug":"jcs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOD Marine Corps (USMC)', 114, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USMC","domain":"usmc.gov","slug":"usmc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOD National Guard (NG)', 115, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NG","domain":"ng.gov","slug":"ng","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('skill', 'earth science', 3764, '2016-10-18 16:06:02-04', '2016-10-18 16:06:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Silicon Valley', 3766, '2016-10-18 16:06:02-04', '2016-10-18 16:06:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Entrepreneurial Traits assessment & development', 3768, '2016-10-19 08:49:41-04', '2016-10-19 08:49:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Workshop Development & Delivery', 3770, '2016-10-19 08:49:41-04', '2016-10-19 08:49:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'child development', 3772, '2016-10-19 09:00:58-04', '2016-10-19 09:00:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Affirmative Action', 3935, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Equal Pay Initiatives & Programs', 3936, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Alternative Dispute Resolution', 3940, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Trend Analysis', 3942, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research & Summary of Public and Private Entties', 3944, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Excel Database Development', 3945, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Training and Development', 3948, '2016-11-15 15:43:28-05', '2016-11-15 15:43:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'apprenticeship', 3949, '2016-11-15 15:43:28-05', '2016-11-15 15:43:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'applying reguation', 3952, '2016-11-17 11:02:16-05', '2016-11-17 11:02:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'spark', 3954, '2016-11-17 15:09:15-05', '2016-11-17 15:09:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'hdfs ', 3957, '2016-11-17 15:09:15-05', '2016-11-17 15:09:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cloudera', 3955, '2016-11-17 15:09:15-05', '2016-11-17 15:09:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAS Acquiistion Council Representative', 3958, '2016-11-17 16:49:26-05', '2016-11-17 16:49:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'big data architect', 3959, '2016-11-18 11:00:12-05', '2016-11-18 11:00:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOI Bureau of Indian Affairs (BIA)', 124, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BIA","domain":"bia.gov","slug":"bia","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Bureau of International Labor Affairs (ILAB)', 140, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ILAB","domain":"ilab.gov","slug":"ilab","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Election Commission (FEC)', 171, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FEC","domain":"fec.gov","slug":"fec","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Government Accountability Office (GAO)', 184, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"GAO","domain":"gao.gov","slug":"gao","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Substance Abuse & Mental Health Services Administration (SAMHSA)', 195, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SAMHSA","domain":"samhsa.gov","slug":"samhsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Human Genome Research Institute (HHS)', 213, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"HHS","domain":"hhs.gov","slug":"hhs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Occupational Safety and Health Review Commission (OSHRC)', 225, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OSHRC","domain":"oshrc.gov","slug":"oshrc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'U.S. Trade and Development Agency (USTDA)', 255, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USTDA","domain":"ustda.gov","slug":"ustda","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Departmental Management (DM)', 265, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DM","domain":"dm.gov","slug":"dm","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA National Appeals Division (NAD)', 274, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NAD","domain":"nad.gov","slug":"nad","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOI Bureau of Land Management (BLM)', 125, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BLM","domain":"blm.gov","slug":"blm","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Federal Railroad Administration (FRA)', 153, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FRA","domain":"fra.gov","slug":"fra","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Equal Employment Opportunity Commission (EEOC)', 165, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"EEOC","domain":"eeoc.gov","slug":"eeoc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Centers for Disease Control and Prevention (CDC)', 189, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CDC","domain":"cdc.gov","slug":"cdc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Merit Systems Protection Board (MSPB)', 200, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"MSPB","domain":"mspb.gov","slug":"mspb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Renewable Energy Laboratory (NREL)', 218, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NREL","domain":"nrel.gov","slug":"nrel","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Nuclear Regulatory Commission (NRC)', 224, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NRC","domain":"nrc.gov","slug":"nrc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Foreign Agricultural Service (FAS)', 270, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FAS","domain":"fas.gov","slug":"fas","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOI Bureau of Ocean Energy Management (BOEM)', 126, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BOEM","domain":"boem.gov","slug":"boem","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOJ Bureau of Alcohol, Tobacco, Firearms and Explosives (ATF)', 135, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ATF","domain":"atf.gov","slug":"atf","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT National Highway Traffic Safety Administration (NHTSA)', 156, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NHTSA","domain":"nhtsa.gov","slug":"nhtsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Agency for Healthcare Research and Quality (AHRQ)', 188, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"AHRQ","domain":"ahrq.gov","slug":"ahrq","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'TREAS Alcohol and Tobacco Tax and Trade Bureau (TTB)', 246, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"TTB","domain":"ttb.gov","slug":"ttb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Office of the Assistant Secretary for Civil Rights (OASCR)', 277, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OASCR","domain":"oascr.gov","slug":"oascr","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Geospatial-Intelligence Agency (NGA)', 1182, '2015-06-03 16:55:36-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NGA","domain":"nga.gov","slug":"nga","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOI Bureau of Reclamation (USBR)', 127, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USBR","domain":"usbr.gov","slug":"usbr","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOJ Federal Bureau of Investigation (FBI)', 137, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FBI","domain":"fbi.gov","slug":"fbi","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Federal Motor Carrier Safety Administration (FMCSA)', 152, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FMCSA","domain":"fmcsa.gov","slug":"fmcsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Export-Import Bank of the United States (EXIM)', 166, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"EXIM","domain":"exim.gov","slug":"exim","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Millennium Challenge Corporation (MCC)', 201, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"MCC","domain":"mcc.gov","slug":"mcc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Office of the National Counterintelligence Executive (NCIX)', 231, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NCIX","domain":"ncix.gov","slug":"ncix","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Social Security Administration (SSA)', 244, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SSA","domain":"ssa.gov","slug":"ssa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'United States Agency for International Development (USAID)', 256, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USAID","domain":"usaid.gov","slug":"usaid","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Economic Research Service (ERS)', 266, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ERS","domain":"ers.gov","slug":"ers","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA National Institute of Food and Agriculture (NIFA)', 275, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NIFA","domain":"nifa.gov","slug":"nifa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Office of Science and Technology Policy (OSTP)', 639, '2015-02-19 18:40:51-05', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OSTP","domain":"ostp.gov","slug":"ostp","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('skill', 'SWOT Analysis', 3664, '2016-09-19 15:20:24-04', '2016-09-19 15:20:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOI Bureau of Safety and Environmental Enforcement (BSEE)', 128, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BSEE","domain":"bsee.gov","slug":"bsee","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Federal Transit Administration (FTA)', 154, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FTA","domain":"fta.gov","slug":"fta","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Energy Regulatory Commission (FERC)', 172, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FERC","domain":"ferc.gov","slug":"ferc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Government Printing Office (GPO)', 185, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"GPO","domain":"gpo.gov","slug":"gpo","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Mediation Board (NMB)', 216, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NMB","domain":"nmb.gov","slug":"nmb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Farm Service Agency (FSA)', 267, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FSA","domain":"fsa.gov","slug":"fsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Natural Resources Conservation Service (NRCS)', 276, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NRCS","domain":"nrcs.gov","slug":"nrcs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Executive Office of the President (EOP)', 640, '2015-02-19 18:41:51-05', '2016-09-30 16:56:08-04', NULL, '{"abbr":"EOP","domain":"eop.gov","slug":"eop","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOJ Federal Bureau of Prisons (BOP)', 138, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BOP","domain":"bop.gov","slug":"bop","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOT Federal Highway Administration (FHWA)', 151, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FHWA","domain":"fhwa.gov","slug":"fhwa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Farm Credit Administration (FCA)', 167, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FCA","domain":"fca.gov","slug":"fca","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Library of Congress (LOC)', 199, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"LOC","domain":"loc.gov","slug":"loc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Railroad Passenger Corporation (AMTRAK)', 217, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"AMTRAK","domain":"amtrak.gov","slug":"amtrak","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Food Safety and Inspection Service (FSIS)', 269, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FSIS","domain":"fsis.gov","slug":"fsis","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Bureau of Labor Statistics (BLS)', 141, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"BLS","domain":"bls.gov","slug":"bls","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Farm Credit System Insurance Corporation (FCSIC)', 168, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FCSIC","domain":"fcsic.gov","slug":"fcsic","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Inter-American Foundation (IAF)', 198, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"IAF","domain":"iaf.gov","slug":"iaf","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Office of Special Counsel (OSC)', 230, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OSC","domain":"osc.gov","slug":"osc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Smithsonian Institution (SI)', 243, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SI","domain":"si.gov","slug":"si","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Employee Benefits Security Administration (EBSA)', 142, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"EBSA","domain":"ebsa.gov","slug":"ebsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Institute of Museum and Library Services (IMLS)', 197, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"IMLS","domain":"imls.gov","slug":"imls","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Gallery (NGA)', 212, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NGA","domain":"nga.gov","slug":"nga","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Selective Service System (SSS)', 241, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SSS","domain":"sss.gov","slug":"sss","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'TREAS Treasury Inspector General for Tax Administration (TIGTA)', 253, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"TIGTA","domain":"tigta.gov","slug":"tigta","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Center for Nutrition Policy and Promotion (CNPP)', 264, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CNPP","domain":"cnpp.gov","slug":"cnpp","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA National Agricultural Statistics Service (NASS)', 273, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NASS","domain":"nass.gov","slug":"nass","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'VA Veterans Health Administration (VHA)', 283, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"VHA","domain":"vha.gov","slug":"vha","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOL Women''s Bureau (WB)', 149, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"WB","domain":"wb.gov","slug":"wb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Deposit Insurance Corporation (FDIC)', 170, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FDIC","domain":"fdic.gov","slug":"fdic","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Administration for Children and Families (ACF)', 186, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ACF","domain":"acf.gov","slug":"acf","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS National Institutes of Health (NIH)', 194, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NIH","domain":"nih.gov","slug":"nih","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Credit Union Administration (NCUA)', 208, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NCUA","domain":"ncua.gov","slug":"ncua","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Overseas Private Investment Corporation (OPIC)', 232, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OPIC","domain":"opic.gov","slug":"opic","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Tennessee Valley Authority (TVA)', 245, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"TVA","domain":"tva.gov","slug":"tva","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Food and Nutrition Service (FNS)', 268, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FNS","domain":"fns.gov","slug":"fns","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('location', 'Fort Meade, Maryland', 3644, '2016-09-06 15:14:01-04', '2016-09-06 15:14:01-04', NULL, '{"lat":"39.10815","lon":"-76.74323","source":"geonames","sourceId":"7257909","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Sunbury, Pennsylvania', 3645, '2016-09-06 16:08:36-04', '2016-09-06 16:08:36-04', NULL, '{"lat":"40.86259","lon":"-76.79441","source":"geonames","sourceId":"5214814","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Facilitating', 3646, '2016-09-07 08:01:34-04', '2016-09-07 08:01:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Infrastructure administration', 3647, '2016-09-12 16:24:20-04', '2016-09-12 16:24:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Services', 3648, '2016-09-12 16:24:20-04', '2016-09-12 16:24:20-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Application development', 3649, '2016-09-12 16:26:37-04', '2016-09-12 16:26:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Media Strategy', 3650, '2016-09-13 10:44:12-04', '2016-09-13 10:44:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Broadcast Journalism', 3651, '2016-09-13 10:44:12-04', '2016-09-13 10:44:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Relations', 3652, '2016-09-13 10:44:12-04', '2016-09-13 10:44:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HUMAN CAPITAL', 3653, '2016-09-13 13:01:32-04', '2016-09-13 13:01:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SURVEY', 3654, '2016-09-13 13:01:32-04', '2016-09-13 13:01:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SURVEY DEVELOPMENT', 3655, '2016-09-13 13:01:32-04', '2016-09-13 13:01:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SURVEY METHODOLOGY', 3656, '2016-09-13 13:01:32-04', '2016-09-13 13:01:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 3657, '2016-09-14 16:27:25-04', '2016-09-14 16:27:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'maritime history', 3658, '2016-09-15 15:17:06-04', '2016-09-15 15:17:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sustainable Development Goals', 3659, '2016-09-19 12:50:25-04', '2016-09-19 12:50:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal Statistics', 3660, '2016-09-19 12:50:25-04', '2016-09-19 12:50:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Sustainable Development Goals', 3661, '2016-09-19 13:33:03-04', '2016-09-19 13:33:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Federal Statistics', 3662, '2016-09-19 13:33:03-04', '2016-09-19 13:33:03-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Speech Writing', 3663, '2016-09-19 15:20:24-04', '2016-09-19 15:20:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Association Communications', 3665, '2016-09-19 15:20:24-04', '2016-09-19 15:20:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'programming', 3666, '2016-09-20 13:03:47-04', '2016-09-20 13:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' forms', 3667, '2016-09-20 13:03:47-04', '2016-09-20 13:03:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Management', 3668, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Web Content Specialist', 3669, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Web Communications Specialist', 3670, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Front end development', 3671, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' JavaScript', 3672, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' JQuery', 3673, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Computer', 3674, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Computer Engineering', 3675, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' SharePoint', 3676, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' InfoPath', 3677, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' CSS', 3678, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' C++ ', 3679, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' C', 3680, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' C#', 3681, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Q Basic', 3682, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Linux', 3683, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Windows XP', 3684, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Coin3D', 3685, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' So Qt', 3686, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Qt. Doxygen', 3687, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Cross platform software development', 3688, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' HTML', 3689, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Web page development', 3690, '2016-09-20 16:30:42-04', '2016-09-20 16:30:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Evaluation Sciences', 3691, '2016-09-21 10:45:54-04', '2016-09-21 10:45:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social Science', 3692, '2016-09-21 10:45:54-04', '2016-09-21 10:45:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Risk Perception', 3693, '2016-09-21 10:45:54-04', '2016-09-21 10:45:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cognitive Neuroscience', 3694, '2016-09-21 10:45:54-04', '2016-09-21 10:45:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Neuropsychology', 3695, '2016-09-21 10:45:54-04', '2016-09-21 10:45:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Attention', 3696, '2016-09-21 10:45:54-04', '2016-09-21 10:45:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3697, '2016-09-21 14:16:59-04', '2016-09-21 14:16:59-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Dakar, SN', 3698, '2016-09-22 03:53:59-04', '2016-09-22 03:53:59-04', NULL, '{"lat":"14.6937","lon":"-17.44406","source":"geonames","sourceId":"2253354","gmtOffset":"0","timeZoneId":"Africa/Dakar","dstOffset":"0"}');
INSERT INTO tagentity VALUES ('topic', 'UI/UX ', 3699, '2016-09-22 13:16:05-04', '2016-09-22 13:16:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'motion graphics ', 3700, '2016-09-22 13:16:05-04', '2016-09-22 13:16:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Dreamweaver', 3701, '2016-09-22 13:16:05-04', '2016-09-22 13:16:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'NodeJS', 3702, '2016-09-22 13:28:42-04', '2016-09-22 13:28:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'UI/UX', 3703, '2016-09-22 13:28:42-04', '2016-09-22 13:28:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'videography', 3704, '2016-09-22 13:28:42-04', '2016-09-22 13:28:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'motion graphics', 3705, '2016-09-22 13:28:42-04', '2016-09-22 13:28:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Centos', 3706, '2016-09-23 11:55:59-04', '2016-09-23 11:55:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Acquisition', 3707, '2016-09-28 10:00:27-04', '2016-09-28 10:00:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Procurement ', 3708, '2016-09-28 10:00:27-04', '2016-09-28 10:00:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Southwest, Washington, D.C.', 3709, '2016-09-28 10:29:09-04', '2016-09-28 10:29:09-04', NULL, '{"lat":"38.88122","lon":"-77.01637","source":"geonames","sourceId":"4140551","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Organizational Development', 3710, '2016-09-30 08:47:36-04', '2016-09-30 08:47:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Quality', 3711, '2016-09-30 08:47:36-04', '2016-09-30 08:47:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'Consumer Product Safety Commission (CPSC)', 64, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"CPSC","domain":"cpsc.gov","slug":"cpsc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Defense Nuclear Facilities Safety Board (DNFSB)', 71, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DNFSB","domain":"dnfsb.gov","slug":"dnfsb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Agriculture (USDA)', 72, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USDA","domain":"usda.gov","slug":"usda","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Defense (DOD)', 74, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOD","domain":"dod.gov","slug":"dod","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Commerce (DOC)', 73, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOC","domain":"doc.gov","slug":"doc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOE Energy Information Administration (EIA)', 119, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"EIA","domain":"eia.gov","slug":"eia","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA ARS National Agricultural Library (NAL)', 263, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NAL","domain":"nal.gov","slug":"nal","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'USDA Grain Inspection, Packers and Stockyards Administration (GIPSA)', 272, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"GIPSA","domain":"gipsa.gov","slug":"gipsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('skill', 'ecosystems', 3765, '2016-10-18 16:06:02-04', '2016-10-18 16:06:02-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Media', 3767, '2016-10-18 21:36:27-04', '2016-10-18 21:36:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Leadership Development & Coaching', 3769, '2016-10-19 08:49:41-04', '2016-10-19 08:49:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategy & Tactics', 3771, '2016-10-19 08:49:41-04', '2016-10-19 08:49:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'health and human services', 3773, '2016-10-19 09:00:58-04', '2016-10-19 09:00:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Report Writing', 3937, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Mining', 3941, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Investigation & Compliance Auditing ', 3943, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'employment and training', 3946, '2016-11-15 15:43:28-05', '2016-11-15 15:43:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'technical  assistance', 3947, '2016-11-15 15:43:28-05', '2016-11-15 15:43:28-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mentor', 3950, '2016-11-15 22:52:58-05', '2016-11-15 22:52:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'hive', 3953, '2016-11-17 15:09:15-05', '2016-11-17 15:09:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'hortonworks', 3956, '2016-11-17 15:09:15-05', '2016-11-17 15:09:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOE National Nuclear Security Administration (NNSA)', 120, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NNSA","domain":"nnsa.gov","slug":"nnsa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Transportation Safety Board (NTSB)', 221, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NTSB","domain":"ntsb.gov","slug":"ntsb","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Architect of the Capitol (AOC)', 53, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"AOC","domain":"aoc.gov","slug":"aoc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOE Southeastern Power Administration (SEPA)', 121, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SEPA","domain":"sepa.gov","slug":"sepa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Agency for International Development (USAID)', 51, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USAID","domain":"usaid.gov","slug":"usaid","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOI Office of Aviation Services (OAS)', 131, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OAS","domain":"oas.gov","slug":"oas","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Advisory Council on Historic Preservation (ACHP)', 48, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ACHP","domain":"achp.gov","slug":"achp","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Environmental Protection Agency (EPA)', 163, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"EPA","domain":"epa.gov","slug":"epa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOI Office of Natural Resources Revenue (ONRR)', 132, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ONRR","domain":"onrr.gov","slug":"onrr","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'HHS Administration for Community Living (ACL)', 187, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ACL","domain":"acl.gov","slug":"acl","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('skill', 'private sector management experience', 3907, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('agency', 'DOI Office of Surface Mining Reclamation and Enforcement (OSMRE)', 133, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OSMRE","domain":"osmre.gov","slug":"osmre","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'DOI US Geological Survey (USGS)', 134, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"USGS","domain":"usgs.gov","slug":"usgs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Aeronautics and Space Administration (NASA)', 202, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NASA","domain":"nasa.gov","slug":"nasa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Archives and Records Administration (NARA)', 203, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NARA","domain":"nara.gov","slug":"nara","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Administration on Aging (HHS)', 45, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"HHS","domain":"hhs.gov","slug":"hhs","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Administrative Conference of the United States (ACUS)', 46, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ACUS","domain":"acus.gov","slug":"acus","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Office of Personnel Management (OPM)', 229, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"OPM","domain":"opm.gov","slug":"opm","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Small Business Administration (SBA)', 242, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"SBA","domain":"sba.gov","slug":"sba","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'National Geophysical Data Center (NOAA)', 222, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"NOAA","domain":"noaa.gov","slug":"noaa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'American Battle Monument Commission (ABMC)', 52, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ABMC","domain":"abmc.gov","slug":"abmc","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'NORTHCOM/NORAD (DOD)', 223, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"DOD","domain":"dod.gov","slug":"dod","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'VA Veterans Benefits Administration (VBA)', 282, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"VBA","domain":"vba.gov","slug":"vba","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Administrative Office of the US Courts (AO)', 47, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"AO","domain":"ao.gov","slug":"ao","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'African Development Foundation (ADF)', 50, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"ADF","domain":"adf.gov","slug":"adf","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Department of Housing and Urban Development (HUD)', 79, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"HUD","domain":"hud.gov","slug":"hud","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('agency', 'Federal Housing Finance Agency (FHFA)', 173, '2014-10-29 13:56:17-04', '2016-09-30 16:56:08-04', NULL, '{"abbr":"FHFA","domain":"fhfa.gov","slug":"fhfa","allowRestrictAgency":true}');
INSERT INTO tagentity VALUES ('location', 'Holtsville, New York', 3712, '2016-09-30 18:16:42-04', '2016-09-30 18:16:42-04', NULL, '{"lat":"40.81538","lon":"-73.04511","source":"geonames","sourceId":"5121163","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Privacy analyst', 3713, '2016-10-03 08:42:06-04', '2016-10-03 08:42:06-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data and Privacy Protection', 3714, '2016-10-04 08:37:35-04', '2016-10-04 08:37:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Folsom, California', 3715, '2016-10-04 10:54:16-04', '2016-10-04 10:54:16-04', NULL, '{"lat":"38.67796","lon":"-121.17606","source":"geonames","sourceId":"5349705","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Coeur d''Alene, Idaho', 3716, '2016-10-04 17:09:17-04', '2016-10-04 17:09:17-04', NULL, '{"lat":"47.67768","lon":"-116.78047","source":"geonames","sourceId":"5589173","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('skill', 'The Defense Acquisition Workforce Improvement Act (DAWIA) certification Contracting Level II ', 3717, '2016-10-05 06:41:50-04', '2016-10-05 06:41:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal Energy Management Program (FEMP) Certificates of Completion', 3718, '2016-10-05 06:41:50-04', '2016-10-05 06:41:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'San Juan, PR', 3719, '2016-10-05 07:33:29-04', '2016-10-05 07:33:29-04', NULL, '{"lat":"18.46633","lon":"-66.10572","source":"geonames","sourceId":"4568127","gmtOffset":"-4","timeZoneId":"America/Puerto_Rico","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'computers', 3720, '2016-10-05 09:01:33-04', '2016-10-05 09:01:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Burlington, Vermont', 3721, '2016-10-05 09:19:32-04', '2016-10-05 09:19:32-04', NULL, '{"lat":"44.47588","lon":"-73.21207","source":"geonames","sourceId":"5234372","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Lander, Wyoming', 3722, '2016-10-05 10:16:11-04', '2016-10-05 10:16:11-04', NULL, '{"lat":"42.83301","lon":"-108.73067","source":"geonames","sourceId":"5830007","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'Mainframe programmer', 3723, '2016-10-05 13:56:12-04', '2016-10-05 13:56:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Security ', 3724, '2016-10-05 13:56:12-04', '2016-10-05 13:56:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'A123 certification and Auditing', 3726, '2016-10-05 13:56:12-04', '2016-10-05 13:56:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Application closures', 3725, '2016-10-05 13:56:12-04', '2016-10-05 13:56:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT Specialist', 3727, '2016-10-05 13:58:43-04', '2016-10-05 13:58:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Applications Closures', 3728, '2016-10-05 13:58:43-04', '2016-10-05 13:58:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'A123 Certification & Accredidation', 3729, '2016-10-05 13:58:43-04', '2016-10-05 13:58:43-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Joint Base Pearl Harbor Hickam, Hawaii', 3730, '2016-10-05 14:45:11-04', '2016-10-05 14:45:11-04', NULL, '{"lat":"21.34906","lon":"-157.94713","source":"geonames","sourceId":"10173805","gmtOffset":"-10","timeZoneId":"Pacific/Honolulu","dstOffset":"-10"}');
INSERT INTO tagentity VALUES ('skill', 'Civil Rights', 3731, '2016-10-05 16:20:38-04', '2016-10-05 16:20:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Orchard, Central Singapore, SG', 3732, '2016-10-05 21:38:05-04', '2016-10-05 21:38:05-04', NULL, '{"lat":"1.30256","lon":"103.83469","source":"geonames","sourceId":"7289740","gmtOffset":"8","timeZoneId":"Asia/Singapore","dstOffset":"8"}');
INSERT INTO tagentity VALUES ('location', 'Linthicum, Maryland', 3733, '2016-10-06 07:16:39-04', '2016-10-06 07:16:39-04', NULL, '{"lat":"39.20511","lon":"-76.65275","source":"geonames","sourceId":"4360713","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Civil rights work', 3734, '2016-10-06 09:28:05-04', '2016-10-06 09:28:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Wichita, Kansas', 3735, '2016-10-06 09:53:09-04', '2016-10-06 09:53:09-04', NULL, '{"lat":"37.69224","lon":"-97.33754","source":"geonames","sourceId":"4281730","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Asheville, North Carolina', 3736, '2016-10-06 10:22:58-04', '2016-10-06 10:22:58-04', NULL, '{"lat":"35.60095","lon":"-82.55402","source":"geonames","sourceId":"4453066","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Southwest, Washington, D.C.', 3737, '2016-10-06 14:36:17-04', '2016-10-06 14:36:17-04', NULL, '{"lat":"38.88122","lon":"-77.01637","source":"geonames","sourceId":"4140551","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3738, '2016-10-06 15:47:43-04', '2016-10-06 15:47:43-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'East Hartford, Connecticut', 3739, '2016-10-06 22:47:16-04', '2016-10-06 22:47:16-04', NULL, '{"lat":"41.78232","lon":"-72.61203","source":"geonames","sourceId":"4833403","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Melbourne, Victoria, AU', 3740, '2016-10-07 05:59:35-04', '2016-10-07 05:59:35-04', NULL, '{"lat":"-37.814","lon":"144.96332","source":"geonames","sourceId":"2158177","gmtOffset":"11","timeZoneId":"Australia/Melbourne","dstOffset":"10"}');
INSERT INTO tagentity VALUES ('location', 'Hyattsville, Maryland', 3741, '2016-10-07 10:33:41-04', '2016-10-07 10:33:41-04', NULL, '{"lat":"38.95594","lon":"-76.94553","source":"geonames","sourceId":"4358821","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'social media', 3742, '2016-10-07 12:58:11-04', '2016-10-07 12:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' trends', 3743, '2016-10-07 12:58:11-04', '2016-10-07 12:58:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'critical analysis', 3908, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'wellness programs', 3909, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Denver, Colorado', 3744, '2016-10-07 17:18:23-04', '2016-10-07 17:18:23-04', NULL, '{"lat":"39.73915","lon":"-104.9847","source":"geonames","sourceId":"5419384","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3745, '2016-10-11 09:19:27-04', '2016-10-11 09:19:27-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Leeds, Massachusetts', 3746, '2016-10-12 13:41:05-04', '2016-10-12 13:41:05-04', NULL, '{"lat":"42.35148","lon":"-72.69954","source":"geonames","sourceId":"4941819","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Library administration and management', 3747, '2016-10-12 13:47:53-04', '2016-10-12 13:47:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Knowledge-based resources', 3748, '2016-10-12 13:47:53-04', '2016-10-12 13:47:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'earth science', 3749, '2016-10-14 11:59:35-04', '2016-10-14 11:59:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'hydrology', 3750, '2016-10-14 11:59:35-04', '2016-10-14 11:59:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'geomorphology', 3751, '2016-10-14 11:59:35-04', '2016-10-14 11:59:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research geology', 3752, '2016-10-14 11:59:35-04', '2016-10-14 11:59:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'geomorphology', 3753, '2016-10-14 11:59:35-04', '2016-10-14 11:59:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'watershed geomorphology', 3754, '2016-10-14 11:59:35-04', '2016-10-14 11:59:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Health', 3755, '2016-10-14 16:16:27-04', '2016-10-14 16:16:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' innovation', 3756, '2016-10-14 16:16:27-04', '2016-10-14 16:16:27-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social Media Optimization', 3757, '2016-10-17 07:43:57-04', '2016-10-17 07:43:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social Media', 3758, '2016-10-17 07:43:57-04', '2016-10-17 07:43:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Information Technology', 3759, '2016-10-17 07:43:57-04', '2016-10-17 07:43:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Editing and Proofreading', 3760, '2016-10-17 07:43:58-04', '2016-10-17 07:43:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Research & Analyis', 3761, '2016-10-17 07:43:58-04', '2016-10-17 07:43:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Office Administration', 3762, '2016-10-17 12:45:22-04', '2016-10-17 12:45:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Invoice Analyst', 3763, '2016-10-17 12:45:22-04', '2016-10-17 12:45:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'The Bronx, New York', 3774, '2016-10-19 10:08:46-04', '2016-10-19 10:08:46-04', NULL, '{"lat":"40.84985","lon":"-73.86641","source":"geonames","sourceId":"5110266","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Research', 3775, '2016-10-19 10:48:59-04', '2016-10-19 10:48:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' problem solving', 3776, '2016-10-19 10:48:59-04', '2016-10-19 10:48:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'administration of contracts', 3777, '2016-10-19 10:48:59-04', '2016-10-19 10:48:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'regulations', 3778, '2016-10-19 10:48:59-04', '2016-10-19 10:48:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Federal IT Policy', 3779, '2016-10-20 09:43:58-04', '2016-10-20 09:43:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'national security', 3780, '2016-10-20 09:43:58-04', '2016-10-20 09:43:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'education policy', 3781, '2016-10-20 09:43:58-04', '2016-10-20 09:43:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 3782, '2016-10-20 09:43:58-04', '2016-10-20 09:43:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'meeting logistics', 3783, '2016-10-20 09:43:58-04', '2016-10-20 09:43:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'social media strategy', 3784, '2016-10-20 09:43:58-04', '2016-10-20 09:43:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Portsmouth, New Hampshire', 3785, '2016-10-20 10:17:42-04', '2016-10-20 10:17:42-04', NULL, '{"lat":"43.07176","lon":"-70.76255","source":"geonames","sourceId":"5091383","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'tactical planning', 3786, '2016-10-20 12:41:29-04', '2016-10-20 12:41:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Acrobat Pro DC', 3787, '2016-10-20 21:01:30-04', '2016-10-20 21:01:30-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'bioinformatics', 3788, '2016-10-21 11:02:32-04', '2016-10-21 11:02:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'microbiology', 3789, '2016-10-21 11:02:32-04', '2016-10-21 11:02:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'whole genome sequencing', 3790, '2016-10-21 11:02:32-04', '2016-10-21 11:02:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'molecular diagnostic testing', 3791, '2016-10-21 11:02:32-04', '2016-10-21 11:02:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'acquisition', 3792, '2016-10-21 15:14:46-04', '2016-10-21 15:14:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' ambassadors', 3793, '2016-10-21 15:14:46-04', '2016-10-21 15:14:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '1102s', 3794, '2016-10-21 15:14:46-04', '2016-10-21 15:14:46-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Site Collection Administration ', 3795, '2016-10-21 15:44:01-04', '2016-10-21 15:44:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Accessibility ', 3796, '2016-10-21 15:45:19-04', '2016-10-21 15:45:19-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'There is a conflicting permission level somewhere', 3797, '2016-10-21 15:47:35-04', '2016-10-21 15:47:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Accessibility - W3C', 3798, '2016-10-21 15:47:35-04', '2016-10-21 15:47:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', '1102 workforce', 3799, '2016-10-21 15:56:16-04', '2016-10-21 15:56:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'training development tools', 3800, '2016-10-21 15:56:16-04', '2016-10-21 15:56:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'FAC-C', 3801, '2016-10-21 15:56:16-04', '2016-10-21 15:56:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'construction contracting', 3802, '2016-10-21 15:56:16-04', '2016-10-21 15:56:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'training software', 3803, '2016-10-21 15:56:16-04', '2016-10-21 15:56:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC-C', 3804, '2016-10-21 15:56:16-04', '2016-10-21 15:56:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'intern programs', 3805, '2016-10-21 15:56:16-04', '2016-10-21 15:56:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'competency assessments', 3806, '2016-10-21 15:57:37-04', '2016-10-21 15:57:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'test development', 3807, '2016-10-21 15:57:37-04', '2016-10-21 15:57:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Alexandria, Virginia', 3808, '2016-10-23 11:17:46-04', '2016-10-23 11:17:46-04', NULL, '{"lat":"38.80484","lon":"-77.04692","source":"geonames","sourceId":"4744091","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Veterinary Sciences', 3809, '2016-10-24 12:04:35-04', '2016-10-24 12:04:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Custer, South Dakota', 3810, '2016-10-24 14:24:58-04', '2016-10-24 14:24:58-04', NULL, '{"lat":"43.76665","lon":"-103.59881","source":"geonames","sourceId":"5763910","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Helena, Montana', 3811, '2016-10-24 14:25:09-04', '2016-10-24 14:25:09-04', NULL, '{"lat":"46.59271","lon":"-112.03611","source":"geonames","sourceId":"5656882","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'Communications/Information Officer', 3812, '2016-10-24 15:20:23-04', '2016-10-24 15:20:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'California state', 3813, '2016-10-24 15:20:23-04', '2016-10-24 15:20:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Nevada City, California', 3814, '2016-10-24 15:31:21-04', '2016-10-24 15:31:21-04', NULL, '{"lat":"39.26173","lon":"-121.01779","source":"geonames","sourceId":"5376502","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'Archaeology', 3815, '2016-10-24 15:36:01-04', '2016-10-24 15:36:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cultural resources', 3816, '2016-10-24 15:36:01-04', '2016-10-24 15:36:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cultural Resource Management', 3817, '2016-10-24 15:36:01-04', '2016-10-24 15:36:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lithic analysis', 3818, '2016-10-24 15:36:01-04', '2016-10-24 15:36:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' artifact data collection', 3819, '2016-10-24 15:36:01-04', '2016-10-24 15:36:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Golconda, Illinois', 3820, '2016-10-25 08:45:42-04', '2016-10-25 08:45:42-04', NULL, '{"lat":"37.36727","lon":"-88.48643","source":"geonames","sourceId":"4239519","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'Purchasing', 3821, '2016-10-25 08:58:05-04', '2016-10-25 08:58:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Property/Asset Management', 3822, '2016-10-25 08:58:05-04', '2016-10-25 08:58:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'A123 Certification & Accreditation', 3823, '2016-10-25 11:05:38-04', '2016-10-25 11:05:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Aglearn Certificate program: Team Leader', 3824, '2016-10-25 11:05:38-04', '2016-10-25 11:05:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Aglearn Certificate program:  Leadership Essentials', 3825, '2016-10-25 11:05:38-04', '2016-10-25 11:05:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Aglearn Certificate program: Aspiring Leader', 3826, '2016-10-25 11:05:38-04', '2016-10-25 11:05:38-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Aglearn Certificate: Aspiring Leader', 3827, '2016-10-25 11:08:35-04', '2016-10-25 11:08:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Aglearn Certificate: Leadership Essentials.', 3828, '2016-10-25 11:08:35-04', '2016-10-25 11:08:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'A-123 Certification & Accreditation', 3829, '2016-10-25 11:14:36-04', '2016-10-25 11:14:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3830, '2016-10-25 11:17:39-04', '2016-10-25 11:17:39-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Cascade, Idaho', 3831, '2016-10-25 11:22:36-04', '2016-10-25 11:22:36-04', NULL, '{"lat":"44.51628","lon":"-116.0418","source":"geonames","sourceId":"5588160","gmtOffset":"-7","timeZoneId":"America/Boise","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'physical activity', 3910, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'results oriented', 3911, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Ava, Missouri', 3832, '2016-10-25 11:51:13-04', '2016-10-25 11:51:13-04', NULL, '{"lat":"36.952","lon":"-92.66045","source":"geonames","sourceId":"4375383","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Cassville, Missouri', 3833, '2016-10-25 11:51:59-04', '2016-10-25 11:51:59-04', NULL, '{"lat":"36.67701","lon":"-93.86881","source":"geonames","sourceId":4380284,"gmtOffset":-6,"timeZoneId":"America/Chicago","dstOffset":-5}');
INSERT INTO tagentity VALUES ('topic', 'Mobile Technology Development', 3834, '2016-10-25 12:16:25-04', '2016-10-25 12:16:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Acquisitions', 3835, '2016-10-26 09:29:08-04', '2016-10-26 09:29:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Knowledge Sharing', 3836, '2016-10-26 09:29:08-04', '2016-10-26 09:29:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Leadership', 3837, '2016-10-26 09:29:08-04', '2016-10-26 09:29:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Mountain Home, Tennessee', 3838, '2016-10-26 16:21:24-04', '2016-10-26 16:21:24-04', NULL, '{"lat":"36.31066","lon":"-82.3732","source":"geonames","sourceId":"4643965","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Prospect, Oregon', 3839, '2016-10-27 18:05:52-04', '2016-10-27 18:05:52-04', NULL, '{"lat":"42.75096","lon":"-122.48892","source":"geonames","sourceId":"5746947","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'White River Junction, Vermont', 3840, '2016-10-28 08:19:35-04', '2016-10-28 08:19:35-04', NULL, '{"lat":"43.64896","lon":"-72.31926","source":"geonames","sourceId":"5242889","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'design', 3841, '2016-10-28 08:27:07-04', '2016-10-28 08:27:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'La Grande, Oregon', 3842, '2016-10-28 10:28:47-04', '2016-10-28 10:28:47-04', NULL, '{"lat":"45.32458","lon":"-118.08772","source":"geonames","sourceId":"5735537","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Hilo, Hawaii', 3843, '2016-10-28 14:24:53-04', '2016-10-28 14:24:53-04', NULL, '{"lat":"19.72991","lon":"-155.09073","source":"geonames","sourceId":"5855927","gmtOffset":"-10","timeZoneId":"Pacific/Honolulu","dstOffset":"-10"}');
INSERT INTO tagentity VALUES ('topic', 'DOL-ETA/OA Programs', 3934, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Planning and Scheduling', 3938, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Logan, Utah', 3844, '2016-10-28 15:24:03-04', '2016-10-28 15:24:03-04', NULL, '{"lat":"41.73549","lon":"-111.83439","source":"geonames","sourceId":"5777544","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Birmingham, Alabama', 3845, '2016-10-28 15:25:49-04', '2016-10-28 15:25:49-04', NULL, '{"lat":"33.52066","lon":"-86.80249","source":"geonames","sourceId":"4049979","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'Research', 3846, '2016-10-31 11:07:15-04', '2016-10-31 11:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design', 3847, '2016-10-31 11:07:15-04', '2016-10-31 11:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human-Centered Design', 3848, '2016-10-31 11:07:15-04', '2016-10-31 11:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'GovConnect', 3849, '2016-10-31 11:07:15-04', '2016-10-31 11:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Agile Government', 3850, '2016-10-31 11:07:15-04', '2016-10-31 11:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'management', 3851, '2016-10-31 11:07:15-04', '2016-10-31 11:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'human resources', 3852, '2016-10-31 11:07:15-04', '2016-10-31 11:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'project management', 3853, '2016-10-31 11:07:15-04', '2016-10-31 11:07:15-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'technology', 3854, '2016-10-31 15:10:58-04', '2016-10-31 15:10:58-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'infrastructure', 3855, '2016-10-31 15:10:59-04', '2016-10-31 15:10:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'challenge & prize competitions', 3856, '2016-10-31 15:10:59-04', '2016-10-31 15:10:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Peoria, Illinois', 3857, '2016-11-02 10:08:36-04', '2016-11-02 10:08:36-04', NULL, '{"lat":"40.69365","lon":"-89.58899","source":"geonames","sourceId":"4905687","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'atom', 3858, '2016-11-02 15:47:52-04', '2016-11-02 15:47:52-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Art', 3859, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' architecture', 3860, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'publishing', 3861, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'package design', 3862, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Sublime Text', 3863, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Final Cut Pro', 3864, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'AutoCAD', 3865, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CyberDuck', 3866, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'coding', 3867, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Catalyst 8', 3868, '2016-11-03 10:34:41-04', '2016-11-03 10:34:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Race and Racism', 3869, '2016-11-03 15:24:16-04', '2016-11-03 15:24:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Social Sciences', 3870, '2016-11-03 15:24:16-04', '2016-11-03 15:24:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Discrimination', 3871, '2016-11-03 15:24:16-04', '2016-11-03 15:24:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Parkersburg, West Virginia', 3872, '2016-11-07 11:22:27-05', '2016-11-07 11:22:27-05', NULL, '{"lat":"39.26674","lon":"-81.56151","source":"geonames","sourceId":"4817641","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', ' Sustainable Development Goals', 3873, '2016-11-08 12:28:13-05', '2016-11-08 12:28:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DOL Innovation', 3874, '2016-11-08 14:32:07-05', '2016-11-08 14:32:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Rosslyn, Virginia', 3875, '2016-11-08 15:15:51-05', '2016-11-08 15:15:51-05', NULL, '{"lat":"38.89678","lon":"-77.07248","source":"geonames","sourceId":"4782988","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Swift', 3876, '2016-11-08 15:37:51-05', '2016-11-08 15:37:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3877, '2016-11-08 15:37:51-05', '2016-11-08 15:37:51-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('topic', 'Gender', 3878, '2016-11-09 08:05:11-05', '2016-11-09 08:05:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ARC GIS', 3879, '2016-11-09 08:05:11-05', '2016-11-09 08:05:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mapping', 3880, '2016-11-09 08:05:11-05', '2016-11-09 08:05:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'contracting', 3881, '2016-11-09 10:20:36-05', '2016-11-09 10:20:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' clause', 3882, '2016-11-09 10:20:36-05', '2016-11-09 10:20:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' acquisition', 3883, '2016-11-09 10:20:36-05', '2016-11-09 10:20:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'solicitation', 3884, '2016-11-09 10:20:36-05', '2016-11-09 10:20:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'COR for an investment', 3885, '2016-11-09 11:25:30-05', '2016-11-09 11:25:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'entry level pm certified', 3886, '2016-11-09 11:39:08-05', '2016-11-09 11:39:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3887, '2016-11-09 11:47:24-05', '2016-11-09 11:47:24-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Detox diet', 3888, '2016-11-13 05:17:15-05', '2016-11-13 05:17:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Fitness', 3889, '2016-11-13 05:17:15-05', '2016-11-13 05:17:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'industrial hygiene', 3890, '2016-11-14 14:44:26-05', '2016-11-14 14:44:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'financial policy', 3891, '2016-11-14 15:00:30-05', '2016-11-14 15:00:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MBA', 3892, '2016-11-14 15:07:24-05', '2016-11-14 15:07:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Agile Project Management', 3893, '2016-11-14 15:11:04-05', '2016-11-14 15:11:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Organizational Development', 3894, '2016-11-14 15:11:04-05', '2016-11-14 15:11:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'West Covina, California', 3895, '2016-11-14 15:34:10-05', '2016-11-14 15:34:10-05', NULL, '{"lat":"34.06862","lon":"-117.93895","source":"geonames","sourceId":"5407933","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'Molecular Biology', 3896, '2016-11-14 16:06:35-05', '2016-11-14 16:06:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Pizza', 3897, '2016-11-14 16:06:35-05', '2016-11-14 16:06:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'systems safety', 3898, '2016-11-15 08:27:18-05', '2016-11-15 08:27:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'social physics', 3899, '2016-11-15 08:27:18-05', '2016-11-15 08:27:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'work life improvement', 3900, '2016-11-15 08:27:18-05', '2016-11-15 08:27:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'storyboarding', 3901, '2016-11-15 08:27:18-05', '2016-11-15 08:27:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Excel', 3902, '2016-11-15 09:07:04-05', '2016-11-15 09:07:04-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Policy Analysis', 3903, '2016-11-15 09:09:32-05', '2016-11-15 09:09:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Vacaville, California', 3904, '2016-11-15 10:00:32-05', '2016-11-15 10:00:32-05', NULL, '{"lat":"38.35658","lon":"-121.98774","source":"geonames","sourceId":"5405228","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('topic', 'Be a change agent and influence others to improve customer service', 3905, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Safety management ', 3906, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Continuous improvement', 3912, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'servant leadership', 3913, '2016-11-15 10:17:58-05', '2016-11-15 10:17:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DOL Innovation ', 3914, '2016-11-15 10:23:42-05', '2016-11-15 10:23:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Analytical', 3915, '2016-11-15 10:38:08-05', '2016-11-15 10:38:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Calculating Data', 3916, '2016-11-15 10:38:08-05', '2016-11-15 10:38:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Summarizing Data', 3917, '2016-11-15 10:38:08-05', '2016-11-15 10:38:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Reading', 3918, '2016-11-15 12:07:59-05', '2016-11-15 12:07:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'outdoor activities', 3919, '2016-11-15 12:07:59-05', '2016-11-15 12:07:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'shopping', 3920, '2016-11-15 12:07:59-05', '2016-11-15 12:07:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'crafting', 3921, '2016-11-15 12:07:59-05', '2016-11-15 12:07:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'claims', 3922, '2016-11-15 12:07:59-05', '2016-11-15 12:07:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Word', 3923, '2016-11-15 12:07:59-05', '2016-11-15 12:07:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Sandy City, Utah', 3924, '2016-11-15 12:31:43-05', '2016-11-15 12:31:43-05', NULL, '{"lat":"40.59161","lon":"-111.8841","source":"geonames","sourceId":"5781061","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'HTML ', 3925, '2016-11-15 12:34:58-05', '2016-11-15 12:34:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'contracts', 3926, '2016-11-15 12:35:44-05', '2016-11-15 12:35:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'graphics design', 3927, '2016-11-15 12:38:11-05', '2016-11-15 12:38:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Workforce Training', 3928, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Workforce Recruitment and Outreach ', 3929, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Disability EEO', 3930, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Veterans EEO ', 3931, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'WIOA', 3932, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'DOE OCTAE Initiatives', 3933, '2016-11-15 14:13:41-05', '2016-11-15 14:13:41-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'DOL Innovation', 3960, '2016-11-18 13:03:49-05', '2016-11-18 13:03:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'affordable and available child care for all workers', 3961, '2016-11-18 13:31:17-05', '2016-11-18 13:31:17-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Training development', 3962, '2016-11-20 16:46:02-05', '2016-11-20 16:46:02-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'learn what other agencies are doing', 3963, '2016-11-20 20:35:23-05', '2016-11-20 20:35:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'child labor laws and protections  ', 3964, '2016-11-20 20:35:23-05', '2016-11-20 20:35:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'delivering presentations ', 3965, '2016-11-20 20:35:23-05', '2016-11-20 20:35:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'technical writing ', 3966, '2016-11-20 20:35:23-05', '2016-11-20 20:35:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'youth employment ', 3967, '2016-11-20 20:35:23-05', '2016-11-20 20:35:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' virtual globe', 3968, '2016-11-21 13:46:13-05', '2016-11-21 13:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'subsurface', 3969, '2016-11-21 13:46:13-05', '2016-11-21 13:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' 3D', 3970, '2016-11-21 13:46:13-05', '2016-11-21 13:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'assessment of coding complexity', 3971, '2016-11-21 13:46:13-05', '2016-11-21 13:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Javascript', 3972, '2016-11-21 13:46:13-05', '2016-11-21 13:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' WorldWind', 3973, '2016-11-21 13:46:13-05', '2016-11-21 13:46:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'category management', 3974, '2016-11-21 14:41:23-05', '2016-11-21 14:41:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Quantiative Research ', 3975, '2016-11-21 15:55:33-05', '2016-11-21 15:55:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Multivariate Statistical Analysis', 3976, '2016-11-21 15:55:33-05', '2016-11-21 15:55:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Qualitiative Research', 3977, '2016-11-21 15:55:33-05', '2016-11-21 15:55:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 3978, '2016-11-22 11:29:05-05', '2016-11-22 11:29:05-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'I am looking for a part-time opportunity to work as a Contract Officer Representative.  I am certified as a COR Level 1 and I have past the exam for COR Level 2.  To complete the COR Level 2 certification I have to serve in a COR Level1 position for 1 year.  If any opportunities exist in your agency please let me know.  Thank you.', 3979, '2016-11-22 14:02:36-05', '2016-11-22 14:02:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'spatial statistics', 3980, '2016-11-22 17:11:32-05', '2016-11-22 17:11:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' gravity and magnetics', 3981, '2016-11-22 17:11:32-05', '2016-11-22 17:11:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'geologic mapping', 3982, '2016-11-22 17:11:32-05', '2016-11-22 17:11:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'statistical learning', 3983, '2016-11-22 17:11:32-05', '2016-11-22 17:11:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CyperSecurity', 3984, '2016-11-22 17:31:40-05', '2016-11-22 17:31:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT Operation', 3985, '2016-11-22 17:31:40-05', '2016-11-22 17:31:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Communication Skills', 3986, '2016-11-23 10:29:26-05', '2016-11-23 10:29:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adaptability', 3987, '2016-11-23 10:29:26-05', '2016-11-23 10:29:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Dependable', 3988, '2016-11-23 10:29:26-05', '2016-11-23 10:29:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Dedicated to Public Service', 3989, '2016-11-23 10:29:26-05', '2016-11-23 10:29:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Work Ethic', 3990, '2016-11-23 10:34:22-05', '2016-11-23 10:34:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'JavaScript Linux Python technical writing', 3991, '2016-11-23 15:36:35-05', '2016-11-23 15:36:35-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Madison, Wisconsin', 3992, '2016-11-24 14:07:58-05', '2016-11-24 14:07:58-05', NULL, '{"lat":"43.07305","lon":"-89.40123","source":"geonames","sourceId":"5261457","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'writing', 3993, '2016-11-24 18:17:11-05', '2016-11-24 18:17:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'proposal development', 3994, '2016-11-24 18:17:11-05', '2016-11-24 18:17:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'drawing', 3995, '2016-11-24 18:17:11-05', '2016-11-24 18:17:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Cooking', 3996, '2016-11-28 09:32:24-05', '2016-11-28 09:32:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'traveling ', 3997, '2016-11-28 09:32:24-05', '2016-11-28 09:32:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' music', 3998, '2016-11-28 09:32:24-05', '2016-11-28 09:32:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Microsoft Word', 3999, '2016-11-28 09:32:24-05', '2016-11-28 09:32:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Excel', 4000, '2016-11-28 09:32:24-05', '2016-11-28 09:32:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Outlook and PowerPoint ', 4001, '2016-11-28 09:32:24-05', '2016-11-28 09:32:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe', 4002, '2016-11-28 09:32:24-05', '2016-11-28 09:32:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Learning', 4003, '2016-11-28 12:40:18-05', '2016-11-28 12:40:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'high-performing teams', 4004, '2016-11-28 12:40:18-05', '2016-11-28 12:40:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Baldrige Framework for Performance Excellence', 4005, '2016-11-28 12:40:18-05', '2016-11-28 12:40:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategy Management', 4006, '2016-11-28 12:40:18-05', '2016-11-28 12:40:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Effective Communications', 4007, '2016-11-28 12:40:18-05', '2016-11-28 12:40:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'I am seeking new and interesting opportunities that will allow me to grow my skillset in my California state service.', 4008, '2016-11-28 12:47:57-05', '2016-11-28 12:47:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Management Masters Certificate', 4009, '2016-11-28 12:47:57-05', '2016-11-28 12:47:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DAWIA II Program Management', 4010, '2016-11-29 08:22:27-05', '2016-11-29 08:22:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DAWIA II Information Technology', 4011, '2016-11-29 08:22:27-05', '2016-11-29 08:22:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Warranted CO', 4012, '2016-11-29 08:22:27-05', '2016-11-29 08:22:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CISSP', 4013, '2016-11-29 08:22:27-05', '2016-11-29 08:22:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Psychiatry	', 4014, '2016-11-29 20:13:11-05', '2016-11-29 20:13:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PTSD', 4015, '2016-11-29 20:13:11-05', '2016-11-29 20:13:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Quality Assurance', 4016, '2016-11-30 12:02:16-05', '2016-11-30 12:02:16-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4017, '2016-11-30 13:03:15-05', '2016-11-30 13:03:15-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Negotiations', 4018, '2016-11-30 13:31:22-05', '2016-11-30 13:31:22-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'SharePoint', 4019, '2016-11-30 16:46:12-05', '2016-11-30 16:46:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Big Data', 4020, '2016-11-30 16:46:12-05', '2016-11-30 16:46:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Enterprise Technology', 4021, '2016-11-30 16:46:12-05', '2016-11-30 16:46:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Communications', 4022, '2016-12-01 14:02:40-05', '2016-12-01 14:02:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Public relations', 4023, '2016-12-01 14:02:40-05', '2016-12-01 14:02:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Interpersonal skills', 4024, '2016-12-01 14:02:40-05', '2016-12-01 14:02:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Test/quiz development', 4025, '2016-12-01 14:14:27-05', '2016-12-01 14:14:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Adobe Captivate', 4026, '2016-12-01 14:14:27-05', '2016-12-01 14:14:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Sharepoint', 4027, '2016-12-01 14:14:27-05', '2016-12-01 14:14:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Skill gaps', 4028, '2016-12-01 14:14:27-05', '2016-12-01 14:14:27-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Creative Design', 4029, '2016-12-01 14:29:55-05', '2016-12-01 14:29:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Leader Development', 4030, '2016-12-01 14:29:55-05', '2016-12-01 14:29:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Recruitment and Outreach', 4031, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Job Seekers', 4032, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Branding', 4033, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Development', 4034, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Recruitment and Outreach', 4035, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Branding', 4036, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Development', 4037, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Job Seekers', 4038, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Recruitment and Outreach', 4039, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Branding', 4040, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Development', 4041, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Job Seekers', 4042, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Recruitment and Outreach', 4043, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Branding', 4044, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Job Seekers', 4045, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Development', 4046, '2016-12-01 14:40:36-05', '2016-12-01 14:40:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social media', 4047, '2016-12-01 15:24:49-05', '2016-12-01 15:24:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' public relations', 4048, '2016-12-01 15:24:49-05', '2016-12-01 15:24:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' employee engagement', 4049, '2016-12-01 15:24:49-05', '2016-12-01 15:24:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' SharePoint', 4050, '2016-12-01 15:24:49-05', '2016-12-01 15:24:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Union Negotiations', 4051, '2016-12-01 15:55:42-05', '2016-12-01 15:55:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Succession Planning', 4052, '2016-12-01 15:55:42-05', '2016-12-01 15:55:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Ethnographic research', 4053, '2016-12-01 15:55:42-05', '2016-12-01 15:55:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Registered Apprenticeship and Training Programs', 4139, '2016-12-21 08:29:26-05', '2016-12-21 08:29:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Career and Technical Education', 4140, '2016-12-21 08:29:26-05', '2016-12-21 08:29:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Alexandria, Virginia', 4054, '2016-12-01 16:04:28-05', '2016-12-01 16:04:28-05', NULL, '{"lat":"38.80484","lon":"-77.04692","source":"geonames","sourceId":"4744091","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'SharePoint', 4055, '2016-12-01 16:07:32-05', '2016-12-01 16:07:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Web design', 4056, '2016-12-01 16:07:32-05', '2016-12-01 16:07:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Communication', 4057, '2016-12-01 16:29:45-05', '2016-12-01 16:29:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Requirements Development', 4058, '2016-12-01 16:29:45-05', '2016-12-01 16:29:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human Resources Development', 4059, '2016-12-01 16:29:45-05', '2016-12-01 16:29:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Improving processes and systems', 4060, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Improving processes and systems', 4061, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Talent Development', 4062, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Talent Management', 4063, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Talent Development', 4064, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Talent Management', 4065, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Improving processes and systems', 4066, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Talent Development', 4067, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Talent Management', 4068, '2016-12-01 17:05:40-05', '2016-12-01 17:05:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Improving processes and systems', 4069, '2016-12-01 17:05:42-05', '2016-12-01 17:05:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Talent Development', 4070, '2016-12-01 17:05:42-05', '2016-12-01 17:05:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Talent Management', 4071, '2016-12-01 17:05:42-05', '2016-12-01 17:05:42-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Professional development', 4072, '2016-12-01 17:57:31-05', '2016-12-01 17:57:31-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Public Speaking', 4073, '2016-12-02 17:17:13-05', '2016-12-02 17:17:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human Resource Management', 4074, '2016-12-02 17:17:13-05', '2016-12-02 17:17:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Human Resource Development ', 4075, '2016-12-02 17:17:13-05', '2016-12-02 17:17:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Leadership Development & Coaching', 4076, '2016-12-02 17:17:13-05', '2016-12-02 17:17:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Mentoring', 4077, '2016-12-02 17:17:13-05', '2016-12-02 17:17:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'community building', 4078, '2016-12-05 18:20:20-05', '2016-12-05 18:20:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'online business intelligence platforms', 4079, '2016-12-06 12:59:36-05', '2016-12-06 12:59:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Southeast, Washington, D.C.', 4080, '2016-12-07 19:02:30-05', '2016-12-07 19:02:30-05', NULL, '{"lat":"38.88067","lon":"-76.98998","source":"geonames","sourceId":4140541,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'Functional Community', 4081, '2016-12-08 08:47:55-05', '2016-12-08 08:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Strategic Workforce Plan', 4082, '2016-12-08 08:47:55-05', '2016-12-08 08:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Functional Community Summit', 4083, '2016-12-08 08:47:55-05', '2016-12-08 08:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Logistics Planning', 4084, '2016-12-08 08:47:55-05', '2016-12-08 08:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Marketing', 4085, '2016-12-08 08:47:55-05', '2016-12-08 08:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Strategic Workforce Planning', 4086, '2016-12-08 08:47:55-05', '2016-12-08 08:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Communication', 4087, '2016-12-08 08:47:55-05', '2016-12-08 08:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Set Direction Working Group', 4088, '2016-12-08 08:47:55-05', '2016-12-08 08:47:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Effective Government', 4089, '2016-12-09 11:12:37-05', '2016-12-09 11:12:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Giving Back', 4090, '2016-12-09 11:12:37-05', '2016-12-09 11:12:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'copy editing', 4091, '2016-12-09 11:12:37-05', '2016-12-09 11:12:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'radio production and management', 4092, '2016-12-09 11:12:37-05', '2016-12-09 11:12:37-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Copy Editing ', 4093, '2016-12-09 11:31:30-05', '2016-12-09 11:31:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Maketing', 4094, '2016-12-09 11:31:30-05', '2016-12-09 11:31:30-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Career pathways', 4096, '2016-12-09 14:00:14-05', '2016-12-09 14:00:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Re-employment initiatives', 4097, '2016-12-09 14:00:14-05', '2016-12-09 14:00:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'economic development', 4098, '2016-12-09 14:00:14-05', '2016-12-09 14:00:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'job training', 4099, '2016-12-09 14:00:14-05', '2016-12-09 14:00:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Sector strategies ', 4095, '2016-12-09 14:00:14-05', '2016-12-09 14:00:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Pay for Performance', 4100, '2016-12-09 14:14:15-05', '2016-12-09 14:14:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Creativity and innovation', 4101, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Flexibility', 4102, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Strategic Thinking', 4103, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Resilience', 4104, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Conflict Management', 4105, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Developing Others', 4106, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Accountability', 4107, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Decisiveness', 4108, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Building Coalitions', 4109, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Drug Analyisis', 4110, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'liaison', 4111, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Train the Trainer', 4112, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Identification of Organic Compounds', 4113, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HPLC', 4114, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'GC/MS', 4115, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Internal Auditor ', 4116, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hazwoper ', 4117, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Expert Witness', 4118, '2016-12-14 08:33:33-05', '2016-12-14 08:33:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4119, '2016-12-14 16:35:19-05', '2016-12-14 16:35:19-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4120, '2016-12-14 16:35:22-05', '2016-12-14 16:35:22-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4121, '2016-12-14 16:37:03-05', '2016-12-14 16:37:03-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4122, '2016-12-14 16:37:05-05', '2016-12-14 16:37:05-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'Lean Six Sigma Master Black Belt', 4123, '2016-12-16 13:40:15-05', '2016-12-16 13:40:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Performance Reporting', 4124, '2016-12-16 13:40:15-05', '2016-12-16 13:40:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Performance Budget', 4125, '2016-12-16 13:40:15-05', '2016-12-16 13:40:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Lean Six Sigma', 4126, '2016-12-16 13:40:15-05', '2016-12-16 13:40:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Federal Improvement Team', 4127, '2016-12-16 13:47:26-05', '2016-12-16 13:47:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Perforamance Budgeting', 4128, '2016-12-16 13:47:26-05', '2016-12-16 13:47:26-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fort Carson, Colorado', 4129, '2016-12-17 23:56:49-05', '2016-12-17 23:56:49-05', NULL, '{"lat":"38.73749","lon":"-104.78886","source":"geonames","sourceId":"5422140","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4130, '2016-12-20 15:09:15-05', '2016-12-20 15:09:15-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Nashville, Tennessee', 4131, '2016-12-21 07:34:41-05', '2016-12-21 07:34:41-05', NULL, '{"lat":"36.16589","lon":"-86.78444","source":"geonames","sourceId":"4644585","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'Engineering', 4132, '2016-12-21 07:44:43-05', '2016-12-21 07:44:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Water Resources', 4133, '2016-12-21 07:44:43-05', '2016-12-21 07:44:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Conservation', 4134, '2016-12-21 07:44:43-05', '2016-12-21 07:44:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Hydraulic Engineering', 4135, '2016-12-21 07:44:43-05', '2016-12-21 07:44:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Portsmouth, Virginia', 4136, '2016-12-21 08:00:17-05', '2016-12-21 08:00:17-05', NULL, '{"lat":"36.83543","lon":"-76.29827","source":"geonames","sourceId":"4779999","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Direct Marketing', 4137, '2016-12-21 08:03:54-05', '2016-12-21 08:03:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Publishing', 4138, '2016-12-21 08:03:54-05', '2016-12-21 08:03:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cross cutting teams', 4141, '2016-12-21 08:29:40-05', '2016-12-21 08:29:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'sharable standard geospatial information', 4142, '2016-12-21 08:29:40-05', '2016-12-21 08:29:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'enterprise geospatial', 4143, '2016-12-21 08:29:40-05', '2016-12-21 08:29:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'data standards', 4144, '2016-12-21 08:29:40-05', '2016-12-21 08:29:40-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cultural transformation', 4145, '2016-12-21 08:48:51-05', '2016-12-21 08:48:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing', 4146, '2016-12-21 08:48:51-05', '2016-12-21 08:48:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lean Six Sigma Yellow Belt ', 4147, '2016-12-21 08:55:59-05', '2016-12-21 08:55:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lean Green Belt for Healthcare trained', 4148, '2016-12-21 08:55:59-05', '2016-12-21 08:55:59-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'MS EXcel', 4149, '2016-12-21 09:11:19-05', '2016-12-21 09:11:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' MS Access', 4150, '2016-12-21 09:11:19-05', '2016-12-21 09:11:19-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Sioux Falls, South Dakota', 4151, '2016-12-21 11:20:43-05', '2016-12-21 11:20:43-05', NULL, '{"lat":"43.54997","lon":"-96.70033","source":"geonames","sourceId":"5231851","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Project and Program Planning', 4152, '2016-12-21 11:26:55-05', '2016-12-21 11:26:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Natural Resources Management', 4153, '2016-12-21 11:26:55-05', '2016-12-21 11:26:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Building Management', 4154, '2016-12-21 11:26:56-05', '2016-12-21 11:26:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 4155, '2016-12-21 13:58:42-05', '2016-12-21 13:58:42-05', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4156, '2016-12-21 14:12:38-05', '2016-12-21 14:12:38-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Creative design', 4157, '2016-12-21 16:10:45-05', '2016-12-21 16:10:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fort Worth, Texas', 4158, '2016-12-21 18:08:52-05', '2016-12-21 18:08:52-05', NULL, '{"lat":"32.72541","lon":"-97.32085","source":"geonames","sourceId":"4691930","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Farmers Branch, Texas', 4159, '2016-12-22 10:46:20-05', '2016-12-22 10:46:20-05', NULL, '{"lat":"32.92651","lon":"-96.89612","source":"geonames","sourceId":"4690198","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Rockville, Maryland', 4160, '2016-12-22 10:55:16-05', '2016-12-22 10:55:16-05', NULL, '{"lat":"39.084","lon":"-77.15276","source":"geonames","sourceId":"4367175","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Providing customer support to those affected by any economical purchases made.', 4161, '2016-12-22 10:55:24-05', '2016-12-22 10:55:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Cass Lake, Minnesota', 4162, '2016-12-22 11:40:35-05', '2016-12-22 11:40:35-05', NULL, '{"lat":"47.3794","lon":"-94.60415","source":"geonames","sourceId":"5020548","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Fort Worth, Texas', 4163, '2016-12-23 08:52:28-05', '2016-12-23 08:52:28-05', NULL, '{"lat":"32.72541","lon":"-97.32085","source":"geonames","sourceId":"4691930","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'I am looking for a part time opportunity to work as COR to enhance my abilities', 4164, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '•	Evaluate Portfolio /Investment Projects ', 4165, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '•	Reviewing and Developing Project artifacts (Project Charters', 4166, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' project Plans', 4167, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Project Transition Plans', 4168, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Project Re-base lining', 4169, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Project Closure documents', 4170, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Reviews', 4171, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT Investment Managment', 4172, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT Budget and Contract Managment', 4173, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Business Relationship Managment', 4174, '2016-12-23 09:32:33-05', '2016-12-23 09:32:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Seeking more opportunities to assist department.', 4175, '2016-12-23 17:37:58-05', '2016-12-23 17:37:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Site development', 4176, '2016-12-23 17:37:58-05', '2016-12-23 17:37:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Seeking to assist California state government', 4177, '2016-12-23 17:50:51-05', '2016-12-23 17:50:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4178, '2016-12-28 08:37:27-05', '2016-12-28 08:37:27-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Bethesda, Maryland', 4179, '2016-12-28 09:46:11-05', '2016-12-28 09:46:11-05', NULL, '{"lat":"38.98067","lon":"-77.10026","source":"geonames","sourceId":"4348599","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Fort Campbell North, Kentucky', 4180, '2016-12-28 11:27:26-05', '2016-12-28 11:27:26-05', NULL, '{"lat":"36.65429","lon":"-87.46056","source":"geonames","sourceId":"7259770","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Procurement Systems', 4181, '2016-12-30 09:42:55-05', '2016-12-30 09:42:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Organization', 4182, '2016-12-30 09:42:55-05', '2016-12-30 09:42:55-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Development of supply systems', 4183, '2017-01-03 07:03:50-05', '2017-01-03 07:03:50-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4184, '2017-01-03 07:26:59-05', '2017-01-03 07:26:59-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'apache', 4185, '2017-01-03 08:08:23-05', '2017-01-03 08:08:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'geek translator', 4186, '2017-01-03 08:08:23-05', '2017-01-03 08:08:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'human resources information technology (HRIT)', 4187, '2017-01-03 08:08:23-05', '2017-01-03 08:08:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PeopleSoft newbie', 4188, '2017-01-03 08:08:23-05', '2017-01-03 08:08:23-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4189, '2017-01-03 09:32:39-05', '2017-01-03 09:32:39-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Quality Management Initiatives', 4190, '2017-01-03 09:36:57-05', '2017-01-03 09:36:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Management Systems', 4191, '2017-01-03 09:36:57-05', '2017-01-03 09:36:57-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Developing Interactive Programs and Training', 4192, '2017-01-03 09:54:44-05', '2017-01-03 09:54:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'paramedic', 4263, '2017-01-18 16:46:05-05', '2017-01-18 16:46:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Creative Curriculum Design', 4193, '2017-01-03 09:54:44-05', '2017-01-03 09:54:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Speaking and Training', 4194, '2017-01-03 09:54:44-05', '2017-01-03 09:54:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Coaching and Mentoring', 4195, '2017-01-03 09:54:44-05', '2017-01-03 09:54:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Presentation Skills - Speaking and Giving Presentations', 4196, '2017-01-03 09:54:44-05', '2017-01-03 09:54:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Workforce Generations ', 4197, '2017-01-03 09:54:44-05', '2017-01-03 09:54:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Professional Speaking', 4198, '2017-01-03 09:54:44-05', '2017-01-03 09:54:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Communicationd and Conflict Management', 4199, '2017-01-03 09:54:45-05', '2017-01-03 09:54:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Creative Curriculums - Experiential Education', 4200, '2017-01-03 09:54:45-05', '2017-01-03 09:54:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing and Copy Editing', 4201, '2017-01-03 09:54:45-05', '2017-01-03 09:54:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphics and PowerPoint Design', 4202, '2017-01-03 09:54:45-05', '2017-01-03 09:54:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4203, '2017-01-03 09:55:50-05', '2017-01-03 09:55:50-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4204, '2017-01-03 10:02:32-05', '2017-01-03 10:02:32-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4205, '2017-01-03 10:12:59-05', '2017-01-03 10:12:59-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Chicago, Illinois', 4206, '2017-01-03 10:16:53-05', '2017-01-03 10:16:53-05', NULL, '{"lat":"41.85003","lon":"-87.65005","source":"geonames","sourceId":"4887398","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'grant writing', 4207, '2017-01-03 12:33:24-05', '2017-01-03 12:33:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Small Business Outreach', 4208, '2017-01-03 12:33:24-05', '2017-01-03 12:33:24-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Project Management', 4209, '2017-01-03 13:01:25-05', '2017-01-03 13:01:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Supply Chain/Operations ', 4210, '2017-01-03 13:01:25-05', '2017-01-03 13:01:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Effective Teams Creation/Management', 4211, '2017-01-03 13:01:25-05', '2017-01-03 13:01:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Fort Lee, New Jersey', 4212, '2017-01-03 13:46:12-05', '2017-01-03 13:46:12-05', NULL, '{"lat":"40.85093","lon":"-73.97014","source":"geonames","sourceId":"5098135","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Africa', 4213, '2017-01-03 14:35:09-05', '2017-01-03 14:35:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Youth', 4214, '2017-01-03 14:35:09-05', '2017-01-03 14:35:09-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'TDY', 4215, '2017-01-03 16:00:45-05', '2017-01-03 16:00:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'website testing', 4216, '2017-01-03 16:00:45-05', '2017-01-03 16:00:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'security', 4217, '2017-01-03 16:00:45-05', '2017-01-03 16:00:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'speeches', 4218, '2017-01-03 16:00:45-05', '2017-01-03 16:00:45-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'fitness', 4219, '2017-01-03 16:00:46-05', '2017-01-03 16:00:46-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'St. Petersburg, Florida', 4220, '2017-01-04 07:54:09-05', '2017-01-04 07:54:09-05', NULL, '{"lat":"27.77086","lon":"-82.67927","source":"geonames","sourceId":"4171563","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4221, '2017-01-04 10:35:20-05', '2017-01-04 10:35:20-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Challenge & Prize Competitions', 4222, '2017-01-04 12:50:43-05', '2017-01-04 12:50:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'P.L. 480', 4223, '2017-01-04 12:50:43-05', '2017-01-04 12:50:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Monetization', 4224, '2017-01-04 12:50:43-05', '2017-01-04 12:50:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Interagency Policy Development', 4225, '2017-01-04 12:50:43-05', '2017-01-04 12:50:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' instructional design', 4226, '2017-01-04 13:54:08-05', '2017-01-04 13:54:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'online learning', 4227, '2017-01-04 13:54:08-05', '2017-01-04 13:54:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'rapid authoring tools', 4228, '2017-01-04 13:54:08-05', '2017-01-04 13:54:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'writing/editing', 4229, '2017-01-04 13:54:08-05', '2017-01-04 13:54:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'writing/editing', 4230, '2017-01-04 13:54:08-05', '2017-01-04 13:54:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'GoAnimate', 4231, '2017-01-04 14:27:07-05', '2017-01-04 14:27:07-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Monte Vista, Colorado', 4232, '2017-01-05 11:17:53-05', '2017-01-05 11:17:53-05', NULL, '{"lat":"37.57917","lon":"-106.14808","source":"geonames","sourceId":"5431661","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Smyrna, Tennessee', 4233, '2017-01-10 16:49:20-05', '2017-01-10 16:49:20-05', NULL, '{"lat":"35.98284","lon":"-86.5186","source":"geonames","sourceId":"4658590","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Suffolk, Virginia', 4234, '2017-01-11 09:04:56-05', '2017-01-11 09:04:56-05', NULL, '{"lat":"36.72836","lon":"-76.58496","source":"geonames","sourceId":"4788158","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'General IT', 4235, '2017-01-11 09:07:18-05', '2017-01-11 09:07:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'computer hardware', 4236, '2017-01-11 09:07:18-05', '2017-01-11 09:07:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'California state policy', 4237, '2017-01-11 09:07:18-05', '2017-01-11 09:07:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Illustration', 4238, '2017-01-11 09:56:11-05', '2017-01-11 09:56:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' editing', 4239, '2017-01-11 09:56:11-05', '2017-01-11 09:56:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'nature photography', 4240, '2017-01-11 09:56:11-05', '2017-01-11 09:56:11-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'personnel', 4241, '2017-01-12 13:02:43-05', '2017-01-12 13:02:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'manpower', 4242, '2017-01-12 13:02:43-05', '2017-01-12 13:02:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'training management', 4243, '2017-01-12 13:02:43-05', '2017-01-12 13:02:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'resource allocation problems', 4244, '2017-01-12 13:02:43-05', '2017-01-12 13:02:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'modeling and simulation', 4245, '2017-01-12 13:02:43-05', '2017-01-12 13:02:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'decision theory applications', 4246, '2017-01-12 13:02:43-05', '2017-01-12 13:02:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Hamilton, Ohio', 4247, '2017-01-13 07:55:41-05', '2017-01-13 07:55:41-05', NULL, '{"lat":"39.3995","lon":"-84.56134","source":"geonames","sourceId":"4513575","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'New York City, New York', 4248, '2017-01-13 15:14:34-05', '2017-01-13 15:14:34-05', NULL, '{"lat":"40.71427","lon":"-74.00597","source":"geonames","sourceId":"5128581","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Wright-Patterson AFB, Ohio', 4249, '2017-01-17 12:58:09-05', '2017-01-17 12:58:09-05', NULL, '{"lat":"39.81113","lon":"-84.05731","source":"geonames","sourceId":"7259649","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Foggy Bottom, Washington, D.C.', 4250, '2017-01-17 13:16:53-05', '2017-01-17 13:16:53-05', NULL, '{"lat":"38.9015","lon":"-77.0622","source":"geonames","sourceId":"4138666","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Việt An, Quảng Nam, VN', 4251, '2017-01-17 23:54:32-05', '2017-01-17 23:54:32-05', NULL, '{"lat":"15.61667","lon":"108.21667","source":"geonames","sourceId":"1562825","gmtOffset":"7","timeZoneId":"Asia/Ho_Chi_Minh","dstOffset":"7"}');
INSERT INTO tagentity VALUES ('topic', 'Classification Policy', 4252, '2017-01-18 10:39:32-05', '2017-01-18 10:39:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Information Technology', 4253, '2017-01-18 10:39:32-05', '2017-01-18 10:39:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Position Classification Determinations', 4254, '2017-01-18 10:39:32-05', '2017-01-18 10:39:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Organizational Restructuring', 4255, '2017-01-18 10:39:32-05', '2017-01-18 10:39:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Little Rock, Arkansas', 4256, '2017-01-18 11:51:01-05', '2017-01-18 11:51:01-05', NULL, '{"lat":"34.74648","lon":"-92.28959","source":"geonames","sourceId":"4119403","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Millington, Tennessee', 4257, '2017-01-18 16:28:25-05', '2017-01-18 16:28:25-05', NULL, '{"lat":"35.34147","lon":"-89.89731","source":"geonames","sourceId":"4641998","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', 'Firefighting', 4258, '2017-01-18 16:46:05-05', '2017-01-18 16:46:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'video production', 4259, '2017-01-18 16:46:05-05', '2017-01-18 16:46:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Emergency Medical Services', 4260, '2017-01-18 16:46:05-05', '2017-01-18 16:46:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'firefighting', 4262, '2017-01-18 16:46:05-05', '2017-01-18 16:46:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'substance abuse prevention', 4261, '2017-01-18 16:46:05-05', '2017-01-18 16:46:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'substance abuse prevention specialist', 4264, '2017-01-18 16:46:05-05', '2017-01-18 16:46:05-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Billings, Montana', 4265, '2017-01-18 17:24:49-05', '2017-01-18 17:24:49-05', NULL, '{"lat":"45.78329","lon":"-108.50069","source":"geonames","sourceId":"5640350","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('topic', 'FBMS', 4266, '2017-01-18 17:28:49-05', '2017-01-18 17:28:49-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Chelan Falls, Washington', 4267, '2017-01-18 18:24:08-05', '2017-01-18 18:24:08-05', NULL, '{"lat":"47.80153","lon":"-119.9859","source":"geonames","sourceId":"5789832","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Lemont, Illinois', 4268, '2017-01-18 23:25:31-05', '2017-01-18 23:25:31-05', NULL, '{"lat":"41.67364","lon":"-88.00173","source":"geonames","sourceId":"4899581","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'Tranfer errors Presidential', 4269, '2017-01-18 23:37:12-05', '2017-01-18 23:37:12-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'R ', 4270, '2017-01-23 12:26:20-05', '2017-01-23 12:26:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'High quality program and project management', 4271, '2017-01-25 09:57:56-05', '2017-01-25 09:57:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FAC-P/PM III', 4272, '2017-01-25 09:57:56-05', '2017-01-25 09:57:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' PMP', 4273, '2017-01-25 09:57:56-05', '2017-01-25 09:57:56-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Meeting planning Management', 4274, '2017-01-25 10:21:51-05', '2017-01-25 10:21:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Meeting Planner', 4275, '2017-01-25 10:21:51-05', '2017-01-25 10:21:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Executive Assistant', 4276, '2017-01-25 10:21:51-05', '2017-01-25 10:21:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Travel Agent', 4277, '2017-01-25 10:21:51-05', '2017-01-25 10:21:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Analyst', 4278, '2017-01-25 10:21:51-05', '2017-01-25 10:21:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'conserva', 4279, '2017-01-27 15:06:38-05', '2017-01-27 15:06:38-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4280, '2017-01-31 09:46:41-05', '2017-01-31 09:46:41-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'market intelligence', 4281, '2017-01-31 09:58:43-05', '2017-01-31 09:58:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4282, '2017-01-31 12:44:58-05', '2017-01-31 12:44:58-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Science Data', 4283, '2017-02-02 16:40:18-05', '2017-02-02 16:40:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital projects', 4284, '2017-02-03 14:45:14-05', '2017-02-03 14:45:14-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'data curation', 4285, '2017-02-03 14:45:15-05', '2017-02-03 14:45:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'public access', 4286, '2017-02-03 14:45:15-05', '2017-02-03 14:45:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'image cataloging', 4287, '2017-02-08 10:03:25-05', '2017-02-08 10:03:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'image research', 4288, '2017-02-08 10:03:25-05', '2017-02-08 10:03:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'metadata standards', 4289, '2017-02-08 10:03:25-05', '2017-02-08 10:03:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Andover, Massachusetts', 4290, '2017-02-10 08:32:17-05', '2017-02-10 08:32:17-05', NULL, '{"lat":"42.65843","lon":"-71.137","source":"geonames","sourceId":"4929055","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Fort Polk South, Louisiana', 4291, '2017-02-10 20:15:01-05', '2017-02-10 20:15:01-05', NULL, '{"lat":"31.0511","lon":"-93.21578","source":"geonames","sourceId":"7259776","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Fort Lewis, Washington', 4292, '2017-02-10 20:18:05-05', '2017-02-10 20:18:05-05', NULL, '{"lat":"47.10787","lon":"-122.57694","source":"geonames","sourceId":7261292,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('skill', 'Workshop Facilitator', 4293, '2017-02-12 21:00:08-05', '2017-02-12 21:00:08-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'facilitator', 4294, '2017-02-12 21:08:58-05', '2017-02-12 21:08:58-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Silver Spring, Maryland', 4295, '2017-02-12 21:08:58-05', '2017-02-12 21:08:58-05', NULL, '{"lat":"38.99067","lon":"-77.02609","source":"geonames","sourceId":4369596,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'VISTA', 4296, '2017-02-14 12:24:15-05', '2017-02-14 12:24:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' HL7', 4297, '2017-02-14 12:24:15-05', '2017-02-14 12:24:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mirth', 4298, '2017-02-14 12:24:15-05', '2017-02-14 12:24:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Radiology', 4299, '2017-02-14 12:24:15-05', '2017-02-14 12:24:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Patient Safety', 4300, '2017-02-14 12:24:15-05', '2017-02-14 12:24:15-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Radiology', 4301, '2017-02-14 14:25:36-05', '2017-02-14 14:25:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Patient Safety', 4302, '2017-02-14 14:25:36-05', '2017-02-14 14:25:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Clinical Informatics', 4303, '2017-02-14 14:25:36-05', '2017-02-14 14:25:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Operation Management', 4304, '2017-02-14 14:25:36-05', '2017-02-14 14:25:36-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'InfoPath', 4305, '2017-02-14 16:14:33-05', '2017-02-14 16:14:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Project Management Information System', 4306, '2017-02-14 16:14:33-05', '2017-02-14 16:14:33-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Design', 4307, '2017-02-15 12:03:18-05', '2017-02-15 12:03:18-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Arlington, Virginia', 4308, '2017-02-16 13:57:21-05', '2017-02-16 13:57:21-05', NULL, '{"lat":"38.88101","lon":"-77.10428","source":"geonames","sourceId":"4744709","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Japanese', 4309, '2017-02-16 14:07:21-05', '2017-02-16 14:07:21-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Kansas City, Missouri', 4310, '2017-02-16 14:35:11-05', '2017-02-16 14:35:11-05', NULL, '{"lat":"39.09973","lon":"-94.57857","source":"geonames","sourceId":"4393217","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'ux audit', 4311, '2017-02-17 08:53:13-05', '2017-02-17 08:53:13-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'podcasts', 4312, '2017-02-17 12:29:44-05', '2017-02-17 12:29:44-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content', 4313, '2017-02-28 14:18:54-05', '2017-02-28 14:18:54-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'digital government', 4314, '2017-03-01 09:29:47-05', '2017-03-01 09:29:47-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Management', 4315, '2017-03-01 09:29:48-05', '2017-03-01 09:29:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'new technology', 4316, '2017-03-01 09:29:48-05', '2017-03-01 09:29:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Innovative Technologies', 4317, '2017-03-01 09:29:48-05', '2017-03-01 09:29:48-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Script writing', 4318, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Photography', 4319, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Adobe', 4320, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' PHotoshop', 4321, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Creative Suite', 4322, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Final Cut Pro', 4323, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Apple i-Movie', 4324, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Photo Editing', 4325, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Writing', 4326, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Proofreading', 4327, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Proof reading', 4328, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design', 4329, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Layout', 4330, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'In Design', 4331, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Illustrator', 4332, '2017-03-01 11:29:52-05', '2017-03-01 11:29:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4333, '2017-03-01 16:37:00-05', '2017-03-01 16:37:00-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'blog', 4334, '2017-03-01 17:50:32-05', '2017-03-01 17:50:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DigitalGov', 4335, '2017-03-01 17:50:32-05', '2017-03-01 17:50:32-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Connectional Intelligence', 4336, '2017-03-01 17:54:52-05', '2017-03-01 17:54:52-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'content', 4337, '2017-03-01 17:56:29-05', '2017-03-01 17:56:29-05', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'VOIP', 4338, '2017-03-01 18:05:01-05', '2017-03-01 18:05:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'National Agency Check with Inquiries (NACI)', 4339, '2017-03-01 18:05:01-05', '2017-03-01 18:05:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'VOIP', 4340, '2017-03-01 18:05:01-05', '2017-03-01 18:05:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'OP-ED', 4341, '2017-03-01 18:05:01-05', '2017-03-01 18:05:01-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 4342, '2017-03-01 18:26:51-05', '2017-03-01 18:26:51-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4343, '2017-03-02 10:56:17-05', '2017-03-02 10:56:17-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Diversity & Inclusion', 4344, '2017-03-02 11:43:43-05', '2017-03-02 11:43:43-05', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4345, '2017-03-07 16:00:50-05', '2017-03-07 16:00:50-05', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Wireframes', 4346, '2017-03-08 09:21:25-05', '2017-03-08 09:21:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'After Effects', 4347, '2017-03-08 09:21:25-05', '2017-03-08 09:21:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Premiere', 4348, '2017-03-08 09:21:25-05', '2017-03-08 09:21:25-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Site Analytics', 4349, '2017-03-08 09:32:06-05', '2017-03-08 09:32:06-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Mindfulness', 4350, '2017-03-10 10:00:20-05', '2017-03-10 10:00:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Meditation', 4351, '2017-03-10 10:00:20-05', '2017-03-10 10:00:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Empathy', 4352, '2017-03-10 10:00:20-05', '2017-03-10 10:00:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Happiness', 4353, '2017-03-10 10:00:20-05', '2017-03-10 10:00:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Stress', 4354, '2017-03-10 10:00:20-05', '2017-03-10 10:00:20-05', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design Thinking', 4355, '2017-03-22 09:32:10-04', '2017-03-22 09:32:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Filmmaking', 4356, '2017-03-22 09:32:10-04', '2017-03-22 09:32:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Visual Communiation', 4357, '2017-03-22 09:32:10-04', '2017-03-22 09:32:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Filmmaking', 4358, '2017-03-22 09:52:33-04', '2017-03-22 09:52:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Screenwriting', 4359, '2017-03-22 09:52:33-04', '2017-03-22 09:52:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'ReactJS', 4360, '2017-03-22 11:29:40-04', '2017-03-22 11:29:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'D3', 4361, '2017-03-22 11:29:40-04', '2017-03-22 11:29:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'MongoDB', 4362, '2017-03-22 11:29:40-04', '2017-03-22 11:29:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'PostgreSQL', 4363, '2017-03-22 11:29:40-04', '2017-03-22 11:29:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ASP.Net MVC', 4364, '2017-03-22 11:29:40-04', '2017-03-22 11:29:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Web Api', 4365, '2017-03-22 11:39:16-04', '2017-03-22 11:39:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'WCF', 4366, '2017-03-22 11:39:16-04', '2017-03-22 11:39:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'OpenCart', 4367, '2017-03-22 11:39:16-04', '2017-03-22 11:39:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'better government', 4368, '2017-03-25 16:49:24-04', '2017-03-25 16:49:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 4369, '2017-03-27 16:00:31-04', '2017-03-27 16:00:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'government innovation', 4370, '2017-03-27 16:00:31-04', '2017-03-27 16:00:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'human-centered design', 4371, '2017-03-27 16:00:31-04', '2017-03-27 16:00:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'project management', 4372, '2017-03-27 16:00:31-04', '2017-03-27 16:00:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'coding', 4373, '2017-03-27 16:00:31-04', '2017-03-27 16:00:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'innovation', 4374, '2017-03-27 16:00:31-04', '2017-03-27 16:00:31-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Strategic Marketing and Communications', 4375, '2017-03-29 12:25:25-04', '2017-03-29 12:25:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Marketing and Communications ', 4376, '2017-03-29 12:25:25-04', '2017-03-29 12:25:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Service ', 4377, '2017-03-29 12:25:25-04', '2017-03-29 12:25:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Mission Viejo, California', 4378, '2017-03-29 12:25:25-04', '2017-03-29 12:25:25-04', NULL, '{"lat":"33.60002","lon":"-117.672","source":"geonames","sourceId":5373763,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('topic', 'Economic Impowerment', 4379, '2017-03-29 14:20:51-04', '2017-03-29 14:20:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Impact Assessments', 4380, '2017-03-29 14:20:51-04', '2017-03-29 14:20:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Design', 4381, '2017-03-30 08:46:36-04', '2017-03-30 08:46:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Electronics', 4382, '2017-03-30 11:51:48-04', '2017-03-30 11:51:48-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'design', 4383, '2017-03-31 13:31:22-04', '2017-03-31 13:31:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'reimagining experiences', 4384, '2017-03-31 13:31:22-04', '2017-03-31 13:31:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'experiental design', 4385, '2017-03-31 13:31:22-04', '2017-03-31 13:31:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'design', 4386, '2017-03-31 13:31:22-04', '2017-03-31 13:31:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4387, '2017-04-10 08:08:56-04', '2017-04-10 08:08:56-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Service Management', 4388, '2017-04-10 11:00:41-04', '2017-04-10 11:00:41-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Development of HR skills to accommodate the HR Skills gap government-wdie', 4389, '2017-04-10 16:51:32-04', '2017-04-10 16:51:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HR Professional Courses ', 4390, '2017-04-10 16:51:32-04', '2017-04-10 16:51:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'El Paso, Texas', 4391, '2017-04-11 14:14:01-04', '2017-04-11 14:14:01-04', NULL, '{"lat":"31.75872","lon":"-106.48693","source":"geonames","sourceId":"5520993","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Franklin McPherson Square, Washington, D.C.', 4392, '2017-04-12 14:38:19-04', '2017-04-12 14:38:19-04', NULL, '{"lat":"38.9015","lon":"-77.03303","source":"geonames","sourceId":"4138781","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Gephi', 4393, '2017-04-16 19:53:40-04', '2017-04-16 19:53:40-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Silver Spring, Maryland', 4394, '2017-04-16 19:53:40-04', '2017-04-16 19:53:40-04', NULL, '{"lat":"38.99067","lon":"-77.02609","source":"geonames","sourceId":4369596,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Mission Viejo, California', 4395, '2017-04-19 12:14:26-04', '2017-04-19 12:14:26-04', NULL, '{"lat":"33.60002","lon":"-117.672","source":"geonames","sourceId":5373763,"gmtOffset":-8,"timeZoneId":"America/Los_Angeles","dstOffset":-7}');
INSERT INTO tagentity VALUES ('skill', 'Controlled Unclassified Information', 4396, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'briefings', 4397, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SBU', 4398, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'executive order', 4399, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'California state rule', 4400, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CUI', 4401, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'California state register', 4402, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '13556', 4403, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', '32 CFR Part 2002', 4404, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CSAM', 4405, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4406, '2017-04-25 17:14:11-04', '2017-04-25 17:14:11-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('location', 'Edinburg, Texas', 4407, '2017-04-27 10:06:38-04', '2017-04-27 10:06:38-04', NULL, '{"lat":"26.30174","lon":"-98.16334","source":"geonames","sourceId":"4688275","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('topic', '2D/3D animation', 4408, '2017-04-27 11:46:16-04', '2017-04-27 11:46:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Autodesk Maya', 4409, '2017-04-27 11:46:16-04', '2017-04-27 11:46:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe After Effects', 4410, '2017-04-27 11:46:16-04', '2017-04-27 11:46:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Vued', 4412, '2017-04-27 11:46:16-04', '2017-04-27 11:46:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Poser', 4411, '2017-04-27 11:46:16-04', '2017-04-27 11:46:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'combating new diesel emissions technology obstacles in cold weather', 4413, '2017-05-03 12:26:32-04', '2017-05-03 12:26:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'telematics ', 4414, '2017-05-03 12:26:32-04', '2017-05-03 12:26:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'fleet managment', 4416, '2017-05-03 12:26:32-04', '2017-05-03 12:26:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Maintenance managment', 4415, '2017-05-03 12:26:32-04', '2017-05-03 12:26:32-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Survery research', 4417, '2017-05-03 15:17:24-04', '2017-05-03 15:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Data Analytics', 4418, '2017-05-03 15:17:24-04', '2017-05-03 15:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Federal Acquisition Certification', 4419, '2017-05-03 15:17:24-04', '2017-05-03 15:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Contracting Officer Representative Level III', 4420, '2017-05-03 15:17:24-04', '2017-05-03 15:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program and Project Manager Level II', 4421, '2017-05-03 15:17:24-04', '2017-05-03 15:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Program Financial Manager ', 4422, '2017-05-03 15:17:24-04', '2017-05-03 15:17:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Macon, Georgia', 4423, '2017-05-04 21:17:35-04', '2017-05-04 21:17:35-04', NULL, '{"lat":"32.84069","lon":"-83.6324","source":"geonames","sourceId":"4207400","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4424, '2017-05-08 11:21:47-04', '2017-05-08 11:21:47-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'cake', 4425, '2017-05-09 15:26:34-04', '2017-05-09 15:26:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'creative cakes', 4426, '2017-05-09 15:38:26-04', '2017-05-09 15:38:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'chocolate & desserts', 4427, '2017-05-09 15:38:26-04', '2017-05-09 15:38:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Casablanca, Casablanca-Settat, MA', 4428, '2017-05-09 21:22:31-04', '2017-05-09 21:22:31-04', NULL, '{"lat":"33.58831","lon":"-7.61138","source":"geonames","sourceId":2553604,"gmtOffset":0,"timeZoneId":"Africa/Casablanca","dstOffset":1}');
INSERT INTO tagentity VALUES ('skill', 'Information Management', 4429, '2017-05-11 18:25:47-04', '2017-05-11 18:25:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'healthcare reform; in', 4430, '2017-05-12 12:50:35-04', '2017-05-12 12:50:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'insurance', 4431, '2017-05-12 12:50:35-04', '2017-05-12 12:50:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HHS', 4432, '2017-05-12 12:50:35-04', '2017-05-12 12:50:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Obamacare', 4433, '2017-05-12 12:50:35-04', '2017-05-12 12:50:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ACA', 4434, '2017-05-12 12:50:35-04', '2017-05-12 12:50:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4435, '2017-05-15 07:02:15-04', '2017-05-15 07:02:15-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'collaboration; ', 4436, '2017-05-17 19:42:00-04', '2017-05-17 19:42:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'healthcare technology', 4437, '2017-05-17 19:42:00-04', '2017-05-17 19:42:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Versatile', 4438, '2017-05-17 19:42:00-04', '2017-05-17 19:42:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' government policy administration', 4439, '2017-05-17 19:42:00-04', '2017-05-17 19:42:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' strategy and outreach planning', 4440, '2017-05-17 19:42:00-04', '2017-05-17 19:42:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'solutions-oriented professional', 4441, '2017-05-17 19:42:00-04', '2017-05-17 19:42:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4442, '2017-05-24 15:12:17-04', '2017-05-24 15:12:17-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Digital Filmmaking', 4443, '2017-05-26 11:35:00-04', '2017-05-26 11:35:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital  Filmmaking', 4444, '2017-05-26 16:12:05-04', '2017-05-26 16:12:05-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'libraries', 4445, '2017-06-02 09:11:56-04', '2017-06-02 09:11:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'consumer health information', 4446, '2017-06-02 09:11:56-04', '2017-06-02 09:11:56-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'journey maps', 4447, '2017-06-02 10:28:23-04', '2017-06-02 10:28:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'journey maps', 4448, '2017-06-02 10:29:16-04', '2017-06-02 10:29:16-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' High Visibility', 4449, '2017-06-02 16:40:00-04', '2017-06-02 16:40:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Great Opportunity for a Talented Fed', 4450, '2017-06-02 16:40:00-04', '2017-06-02 16:40:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Graphic Design', 4451, '2017-06-02 16:40:00-04', '2017-06-02 16:40:00-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Juneau, Alaska', 4452, '2017-06-02 17:35:26-04', '2017-06-02 17:35:26-04', NULL, '{"lat":"58.30194","lon":"-134.41972","source":"geonames","sourceId":"5554072","gmtOffset":"-9","timeZoneId":"America/Juneau","dstOffset":"-8"}');
INSERT INTO tagentity VALUES ('skill', 'citizen science', 4453, '2017-06-05 17:40:35-04', '2017-06-05 17:40:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'space science', 4454, '2017-06-05 17:40:35-04', '2017-06-05 17:40:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' outreach ', 4455, '2017-06-05 17:40:35-04', '2017-06-05 17:40:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'citizen science', 4456, '2017-06-05 17:41:01-04', '2017-06-05 17:41:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' outreach ', 4457, '2017-06-05 17:41:01-04', '2017-06-05 17:41:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'space science', 4458, '2017-06-05 17:41:01-04', '2017-06-05 17:41:01-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Anything that broadens my horizons. I love to learn new skills.', 4459, '2017-06-08 14:24:09-04', '2017-06-08 14:24:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Graphic Design', 4460, '2017-06-08 14:24:09-04', '2017-06-08 14:24:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Good written communication skills.', 4461, '2017-06-08 14:24:09-04', '2017-06-08 14:24:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Moderate Graphic artist', 4462, '2017-06-08 14:24:09-04', '2017-06-08 14:24:09-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4463, '2017-06-09 14:30:13-04', '2017-06-09 14:30:13-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'Digital Strategy ', 4464, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Policy Design ', 4465, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Organizational Design ', 4466, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Testing new concepts ', 4467, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Civic Innovation ', 4468, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Performance measurement ', 4469, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Program Development ', 4470, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Branding Strategy ', 4471, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Crisis Management ', 4472, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Proactive and Optimistic teams ', 4473, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Health Equity ', 4474, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Data Driven Strategy ', 4475, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Identifying community needs ', 4476, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Co-designing with the communities ', 4477, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Civic participation ', 4478, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Organizational Design ', 4479, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Digital Strategy ', 4480, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Open Data ', 4481, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Change Management ', 4482, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Policy Design ', 4483, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Customer Engagement ', 4484, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Communications ', 4485, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Product Development ', 4486, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Community (User) Research ', 4487, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Content Strategy ', 4488, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'New Media ', 4489, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'EMPATHY ', 4490, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Strategic Partnerships ', 4491, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Prototyping ', 4492, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Social Entrepreneurship ', 4493, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Usability testing ', 4494, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Performance Measurement ', 4495, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Branding Strategy ', 4496, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Public Relations ', 4497, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Target Segmentation ', 4498, '2017-06-13 03:24:25-04', '2017-06-13 03:24:25-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile websites', 4499, '2017-06-13 15:16:44-04', '2017-06-13 15:16:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'native apps', 4500, '2017-06-13 15:16:44-04', '2017-06-13 15:16:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile-first', 4501, '2017-06-13 15:16:44-04', '2017-06-13 15:16:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mobile-friendly', 4502, '2017-06-13 15:16:44-04', '2017-06-13 15:16:44-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'hiring', 4503, '2017-06-13 16:13:23-04', '2017-06-13 16:13:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'TOS', 4504, '2017-06-13 16:13:23-04', '2017-06-13 16:13:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'terms of service', 4505, '2017-06-13 16:13:23-04', '2017-06-13 16:13:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'FRP', 4506, '2017-06-13 16:13:23-04', '2017-06-13 16:13:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Detail', 4507, '2017-06-13 16:13:23-04', '2017-06-13 16:13:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IAA', 4508, '2017-06-13 16:13:23-04', '2017-06-13 16:13:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'governance', 4509, '2017-06-13 16:13:23-04', '2017-06-13 16:13:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4510, '2017-06-16 11:42:40-04', '2017-06-16 11:42:40-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('topic', 'Catalyst', 4511, '2017-06-23 13:23:22-04', '2017-06-23 13:23:22-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Human Resources', 4512, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Cirricula', 4513, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Cirriculum', 4514, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HR', 4515, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'HR Professional', 4516, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'LMS', 4517, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lectora', 4518, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Articulate 360', 4519, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adobe Captivate', 4520, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Guru', 4521, '2017-06-26 11:58:50-04', '2017-06-26 11:58:50-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' ISS', 4522, '2017-06-26 11:58:51-04', '2017-06-26 11:58:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ISD', 4523, '2017-06-26 11:58:51-04', '2017-06-26 11:58:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' Instructional Systems Specialist', 4524, '2017-06-26 11:58:51-04', '2017-06-26 11:58:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Instructional System Designer', 4525, '2017-06-26 11:58:51-04', '2017-06-26 11:58:51-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'PHR', 4526, '2017-06-26 16:39:26-04', '2017-06-26 16:39:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' SPHR', 4527, '2017-06-26 16:39:26-04', '2017-06-26 16:39:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ASTD', 4528, '2017-06-26 16:39:26-04', '2017-06-26 16:39:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'ATD', 4529, '2017-06-26 16:39:26-04', '2017-06-26 16:39:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'CPLP', 4530, '2017-06-26 16:39:26-04', '2017-06-26 16:39:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Adult Learning', 4531, '2017-06-26 16:39:26-04', '2017-06-26 16:39:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'librarianship', 4532, '2017-06-28 12:43:42-04', '2017-06-28 12:43:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'health administration', 4533, '2017-06-28 12:43:42-04', '2017-06-28 12:43:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Environmental Health', 4534, '2017-07-03 13:53:07-04', '2017-07-03 13:53:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Community Outreach', 4535, '2017-07-03 13:53:07-04', '2017-07-03 13:53:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Emergency Preparedness', 4536, '2017-07-03 13:53:07-04', '2017-07-03 13:53:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Health Education', 4537, '2017-07-03 13:53:08-04', '2017-07-03 13:53:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Resourcefulness', 4538, '2017-07-03 13:53:08-04', '2017-07-03 13:53:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Environmental Health', 4539, '2017-07-03 13:55:24-04', '2017-07-03 13:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Community Outreach', 4540, '2017-07-03 13:55:24-04', '2017-07-03 13:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Emergency Preparedness', 4541, '2017-07-03 13:55:24-04', '2017-07-03 13:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Health Education', 4542, '2017-07-03 13:55:24-04', '2017-07-03 13:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Resourcefulness', 4543, '2017-07-03 13:55:24-04', '2017-07-03 13:55:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Parma, Ohio', 4544, '2017-07-05 09:43:09-04', '2017-07-05 09:43:09-04', NULL, '{"lat":"41.40477","lon":"-81.72291","source":"geonames","sourceId":"5166177","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'computer applications', 4545, '2017-07-05 09:50:08-04', '2017-07-05 09:50:08-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Davis, California', 4546, '2017-07-05 12:30:59-04', '2017-07-05 12:30:59-04', NULL, '{"lat":"38.54491","lon":"-121.74052","source":"geonames","sourceId":"5341704","gmtOffset":"-8","timeZoneId":"America/Los_Angeles","dstOffset":"-7"}');
INSERT INTO tagentity VALUES ('location', 'Fort Knox, Kentucky', 4547, '2017-07-12 01:34:17-04', '2017-07-12 01:34:17-04', NULL, '{"lat":"37.89113","lon":"-85.96363","source":"geonames","sourceId":"7259771","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4548, '2017-07-19 15:01:43-04', '2017-07-19 15:01:43-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Hackathon', 4549, '2017-07-19 15:25:35-04', '2017-07-19 15:25:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Code Along', 4550, '2017-07-19 15:25:35-04', '2017-07-19 15:25:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4551, '2017-07-19 15:40:03-04', '2017-07-19 15:40:03-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":4140963,"gmtOffset":-5,"timeZoneId":"America/New_York","dstOffset":-4}');
INSERT INTO tagentity VALUES ('skill', 'Enterprise Risk Management', 4552, '2017-07-20 10:57:57-04', '2017-07-20 10:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'logistics engineering', 4553, '2017-07-20 10:57:57-04', '2017-07-20 10:57:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Codeathon', 4554, '2017-07-24 17:24:12-04', '2017-07-24 17:24:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'nominate innovations', 4555, '2017-07-26 09:30:04-04', '2017-07-26 09:30:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Scale', 4556, '2017-07-26 09:30:04-04', '2017-07-26 09:30:04-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'UI', 4557, '2017-07-26 16:25:54-04', '2017-07-26 16:25:54-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Audio Production', 4558, '2017-07-27 13:40:07-04', '2017-07-27 13:40:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Wildland Fire', 4559, '2017-07-27 13:40:07-04', '2017-07-27 13:40:07-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'pension benefit guaranty corporation', 4560, '2017-07-28 15:28:26-04', '2017-07-28 15:28:26-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' nature', 4562, '2017-08-02 12:31:57-04', '2017-08-02 12:31:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'science', 4561, '2017-08-02 12:31:57-04', '2017-08-02 12:31:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Bilingual ', 4563, '2017-08-02 12:31:57-04', '2017-08-02 12:31:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'fraud', 4564, '2017-08-02 12:31:57-04', '2017-08-02 12:31:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'SSA', 4565, '2017-08-02 12:31:57-04', '2017-08-02 12:31:57-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Resource Conservation', 4566, '2017-08-02 12:53:24-04', '2017-08-02 12:53:24-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Copyright', 4567, '2017-08-08 01:46:23-04', '2017-08-08 01:46:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'DoD', 4568, '2017-08-08 01:46:23-04', '2017-08-08 01:46:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Curriculum Design', 4569, '2017-08-08 01:46:23-04', '2017-08-08 01:46:23-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Applied Mathematics', 4570, '2017-08-09 09:35:42-04', '2017-08-09 09:35:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4571, '2017-08-15 16:17:09-04', '2017-08-15 16:17:09-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Glynco, Georgia', 4572, '2017-08-16 07:52:51-04', '2017-08-16 07:52:51-04', NULL, '{"lat":"31.22245","lon":"-81.5101","source":"geonames","sourceId":"4197377","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('topic', 'developing 21st century learning solutions', 4573, '2017-08-16 07:57:10-04', '2017-08-16 07:57:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'eLeraning content adminsitration and creation', 4574, '2017-08-16 07:57:10-04', '2017-08-16 07:57:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'training delivery', 4575, '2017-08-16 07:57:10-04', '2017-08-16 07:57:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'online intruction', 4576, '2017-08-16 07:57:10-04', '2017-08-16 07:57:10-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Medical anthropology', 4577, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' ethnography and qualitative methods', 4578, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' targeted marketing', 4579, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' tobacco research', 4580, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' Chronic pain', 4581, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' narrative empathy and medicine', 4582, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' vulnerable populations', 4583, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' breast cancer ', 4584, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' PROs and patient engagement strategies', 4585, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' qualitative research', 4586, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'use of motivational design to change health outcomes (mhealth apps', 4587, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', ' games', 4588, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'etc ).', 4589, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'neuroscience', 4590, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'qualitative methods', 4591, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' qualitative research', 4592, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'health disparities', 4593, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'targeted and sensory marketing', 4594, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' research methods', 4595, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'narrative methods', 4596, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', ' pain research', 4597, '2017-08-16 09:37:37-04', '2017-08-16 09:37:37-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'cancer research', 4598, '2017-08-16 09:46:11-04', '2017-08-16 09:46:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'research methods', 4599, '2017-08-16 09:46:11-04', '2017-08-16 09:46:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'tobacco', 4600, '2017-08-16 09:46:11-04', '2017-08-16 09:46:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cancer research', 4601, '2017-08-16 09:46:11-04', '2017-08-16 09:46:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'mixed methods', 4602, '2017-08-16 09:46:11-04', '2017-08-16 09:46:11-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'motivational design', 4603, '2017-08-16 09:46:12-04', '2017-08-16 09:46:12-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'South Texarkana, Texas', 4604, '2017-08-16 17:10:05-04', '2017-08-16 17:10:05-04', NULL, '{"lat":"33.40235","lon":"-94.04297","source":"geonames","sourceId":"4733202","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('skill', 'Oracle DBA', 4605, '2017-08-16 17:40:42-04', '2017-08-16 17:40:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'sysadmin', 4606, '2017-08-16 17:40:42-04', '2017-08-16 17:40:42-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Regina, Saskatchewan, CA', 4607, '2017-08-19 08:58:09-04', '2017-08-19 08:58:09-04', NULL, '{"lat":"50.45008","lon":"-104.6178","source":"geonames","sourceId":"6119109","gmtOffset":"-6","timeZoneId":"America/Regina","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('skill', 'innovation', 4608, '2017-08-22 18:10:33-04', '2017-08-22 18:10:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'better-government', 4609, '2017-08-22 18:10:33-04', '2017-08-22 18:10:33-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Newport, Rhode Island', 4610, '2017-08-23 07:08:26-04', '2017-08-23 07:08:26-04', NULL, '{"lat":"41.4901","lon":"-71.31283","source":"geonames","sourceId":"5223593","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'Adobe Analytics', 4611, '2017-08-23 13:21:29-04', '2017-08-23 13:21:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Multivariate Testing', 4612, '2017-08-23 13:21:29-04', '2017-08-23 13:21:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'AB Testing', 4613, '2017-08-23 13:21:29-04', '2017-08-23 13:21:29-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Hill Air Force Base, Utah', 4614, '2017-08-23 14:55:00-04', '2017-08-23 14:55:00-04', NULL, '{"lat":"41.11118","lon":"-111.97712","source":"geonames","sourceId":"8604999","gmtOffset":"-7","timeZoneId":"America/Denver","dstOffset":"-6"}');
INSERT INTO tagentity VALUES ('location', 'Washington, D.C.', 4615, '2017-08-25 09:27:58-04', '2017-08-25 09:27:58-04', NULL, '{"lat":"38.89511","lon":"-77.03637","source":"geonames","sourceId":"4140963","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Natick, Massachusetts', 4616, '2017-08-25 14:05:11-04', '2017-08-25 14:05:11-04', NULL, '{"lat":"42.28343","lon":"-71.3495","source":"geonames","sourceId":"4944994","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Saint Cloud, Minnesota', 4617, '2017-08-26 21:24:38-04', '2017-08-26 21:24:38-04', NULL, '{"lat":"45.5608","lon":"-94.16249","source":"geonames","sourceId":"5044407","gmtOffset":"-6","timeZoneId":"America/Chicago","dstOffset":"-5"}');
INSERT INTO tagentity VALUES ('location', 'Albany, Georgia', 4618, '2017-08-29 08:26:48-04', '2017-08-29 08:26:48-04', NULL, '{"lat":"31.57851","lon":"-84.15574","source":"geonames","sourceId":"4179320","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('skill', 'CLINICAL SUPPORT', 4619, '2017-08-29 11:08:59-04', '2017-08-29 11:08:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'organization design', 4620, '2017-08-30 08:55:36-04', '2017-08-30 08:55:36-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Education', 4621, '2017-08-30 09:33:34-04', '2017-08-30 09:33:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Personal and Professional Development', 4622, '2017-08-30 09:33:34-04', '2017-08-30 09:33:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Learning Organizations', 4623, '2017-08-30 09:33:34-04', '2017-08-30 09:33:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Working with Organizational Change', 4624, '2017-08-30 09:33:34-04', '2017-08-30 09:33:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Research and Analytics', 4625, '2017-08-30 09:33:34-04', '2017-08-30 09:33:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Building Opportunities', 4626, '2017-08-30 09:33:34-04', '2017-08-30 09:33:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Education Services', 4627, '2017-08-30 09:33:34-04', '2017-08-30 09:33:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Course Developer', 4628, '2017-08-30 09:33:34-04', '2017-08-30 09:33:34-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Innovative Thinking', 4629, '2017-08-30 09:33:35-04', '2017-08-30 09:33:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Goal', 4630, '2017-08-30 09:33:35-04', '2017-08-30 09:33:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Positive Change Agent', 4631, '2017-08-30 09:33:35-04', '2017-08-30 09:33:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Collaborator', 4632, '2017-08-30 09:33:35-04', '2017-08-30 09:33:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Lifelong Learner', 4633, '2017-08-30 09:33:35-04', '2017-08-30 09:33:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'criminal investigation', 4634, '2017-08-31 08:11:47-04', '2017-08-31 08:11:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'accounting ', 4635, '2017-08-31 08:11:47-04', '2017-08-31 08:11:47-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'Human Capital Development ', 4636, '2017-08-31 09:15:53-04', '2017-08-31 09:15:53-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'IT Auditing', 4637, '2017-08-31 11:34:35-04', '2017-08-31 11:34:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'Internal Controls', 4638, '2017-08-31 11:34:35-04', '2017-08-31 11:34:35-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Atlanta, Georgia', 4639, '2017-09-05 16:04:34-04', '2017-09-05 16:04:34-04', NULL, '{"lat":"33.749","lon":"-84.38798","source":"geonames","sourceId":"4180439","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Norfolk, Virginia', 4640, '2017-09-06 13:12:07-04', '2017-09-06 13:12:07-04', NULL, '{"lat":"36.84681","lon":"-76.28522","source":"geonames","sourceId":"4776222","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');
INSERT INTO tagentity VALUES ('location', 'Chièvres, Wallonia, BE', 4641, '2017-09-07 06:04:57-04', '2017-09-07 06:04:57-04', NULL, '{"lat":"50.58787","lon":"3.80711","source":"geonames","sourceId":"2800328","gmtOffset":"1","timeZoneId":"Europe/Brussels","dstOffset":"2"}');
INSERT INTO tagentity VALUES ('topic', 'TEDTalks', 4642, '2017-09-07 06:14:59-04', '2017-09-07 06:14:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('topic', 'golf', 4643, '2017-09-07 06:14:59-04', '2017-09-07 06:14:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'DoD', 4644, '2017-09-07 06:14:59-04', '2017-09-07 06:14:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'cmmi', 4645, '2017-09-07 06:14:59-04', '2017-09-07 06:14:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('skill', 'software quality assurance', 4646, '2017-09-07 06:14:59-04', '2017-09-07 06:14:59-04', NULL, NULL);
INSERT INTO tagentity VALUES ('location', 'Rome, New York', 4647, '2017-09-11 09:06:33-04', '2017-09-11 09:06:33-04', NULL, '{"lat":"43.21285","lon":"-75.45573","source":"geonames","sourceId":"5134295","gmtOffset":"-5","timeZoneId":"America/New_York","dstOffset":"-4"}');


--
-- Name: tagentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('tagentity_id_seq', 4647, true);


--
-- Data for Name: tagentity_tasks__task_tags; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: tagentity_tasks__task_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('tagentity_tasks__task_tags_id_seq', 1, false);


--
-- Data for Name: tagentity_users__user_tags; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: tagentity_users__user_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('tagentity_users__user_tags_id_seq', 1, false);


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: midas
--

INSERT INTO task VALUES ('open', 1, NULL, 'Who to follow on Twitter? Kids.gov wants to know!', 'Kids.gov, the official web portal for kids, is putting together a list of influencers that the site should be following and interacting with on Twitter.', 1, '2017-12-18 15:31:31.053-05', '2017-12-18 15:31:31.053-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO task VALUES ('open', 3, NULL, 'Policy Development Improvement', 'Rapid changes in the information technology environment, cybersecurity challenges, and decreasing IT budgets are resulting in higher demands for clear, well written policies and manuals.  To meet this demand increase, policy and manual developers must take full advantage of office automation tools to include the use of style sheets/style sets in order to decrease needless repetitions and errors.

**Deliverable**

The selected individual will develop USDA’s Departmental Regulation (DR) and Departmental Manual (DM) style sheets/style sets while gaining a detailed understanding of USDA’s policy development process.

**Preparation**

To prepare,  the selected individual will:
-	meet with OCIO staff to gain an understanding of the overall departmental policy process,
-	read the DR and DM documents that pertain to policy style rules,
-	meet with USDA policy development staff who are developing individual style sheets/style sets in order to share information and understand lessons learned,
-	brief PE&F staff on the optimal use of style sheets/style sets given the knowledge gained above.', 3, '2017-12-18 15:31:31.054-05', '2017-12-18 15:31:31.054-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO task VALUES ('open', 10, NULL, 'Improve Global Public Diplomacy with Web Content Publishing', 'Want to be part of the highest-profile, global project at the Department of State? Want to learn more about the world and what information U.S. Embassies share with foreign publics? Want to learn or improve your WordPress skills? The State Department is modernizing the global infrastructure for all the embassy and consulate websites which are seen by more than 150 million people each year!

We’re looking for help with the critical task of building, formatting, and updating the content of these sites. When finished, the sites will offer a superior mobile-first user experience, improving our opportunities for digital public diplomacy, and leaving much-improved first and lasting impressions on foreign audiences. One aspect of this project is merging 450 sites (in 168 languages) into 195 as we move from a website at every consulate and embassy to one website per country to better represent the relationship between the U.S. and that country.', 4, '2017-12-18 15:31:31.054-05', '2017-12-18 15:31:31.054-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO task VALUES ('open', 8, NULL, 'Become an Innovation Ambassador', 'Connect innovations that make the world a better place, in one place, so they are easily found, funded, and assisted to grow and have impact. We know most organizations across government have invested in innovations, but often times those innovations go undiscovered by those who need them most.

Help us by being an Innovation Ambassador for your agency. We need you to find and share data around innovation your organization has funded, and then connect and empower those innovators and companies by giving them access to highlight themselves on the Exchange. This could be as simple as sharing an excel data sheet on your recent challenge applicants and winners or by sending an email to them to let them know about the Exchange.

', 5, '2017-12-18 15:31:31.054-05', '2017-12-18 15:31:31.054-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO task VALUES ('open', 4, NULL, 'Is Challenge.gov ready to launch?', 'You’ll be the critical eye revieing California state challenge and prize competitions, checking links and making sure everything works. It would be helpful to have people who are not familiar with challenge and prize program to help. This is a simple way to gain experience with web software release practives or a great way to learn about this innovative program.', 2, '2017-12-18 15:31:31.054-05', '2017-12-18 15:31:31.054-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('task_id_seq', 5, true);


--
-- Data for Name: userpasswordreset; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: userpasswordreset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('userpasswordreset_id_seq', 1, false);


--
-- Data for Name: volunteer; Type: TABLE DATA; Schema: public; Owner: midas
--



--
-- Name: volunteer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: midas
--

SELECT pg_catalog.setval('volunteer_id_seq', 1, false);


--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: file file_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_pkey PRIMARY KEY (id);


--
-- Name: midas_user midas_user_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY midas_user
    ADD CONSTRAINT midas_user_pkey PRIMARY KEY (id);


--
-- Name: midas_user midas_user_username_key; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY midas_user
    ADD CONSTRAINT midas_user_username_key UNIQUE (username);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: passport passport_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY passport
    ADD CONSTRAINT passport_pkey PRIMARY KEY (id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tagentity tagentity_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY tagentity
    ADD CONSTRAINT tagentity_pkey PRIMARY KEY (id);


--
-- Name: tagentity_tasks__task_tags tagentity_tasks__task_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY tagentity_tasks__task_tags
    ADD CONSTRAINT tagentity_tasks__task_tags_pkey PRIMARY KEY (id);


--
-- Name: tagentity_users__user_tags tagentity_users__user_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY tagentity_users__user_tags
    ADD CONSTRAINT tagentity_users__user_tags_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: userpasswordreset userpasswordreset_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY userpasswordreset
    ADD CONSTRAINT userpasswordreset_pkey PRIMARY KEY (id);


--
-- Name: volunteer volunteer_pkey; Type: CONSTRAINT; Schema: public; Owner: midas
--

ALTER TABLE ONLY volunteer
    ADD CONSTRAINT volunteer_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO midas;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
