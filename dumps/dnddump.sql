--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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

--
-- Name: kursach; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE kursach WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE kursach OWNER TO postgres;

\connect kursach

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

--
-- Name: deletecharacter(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.deletecharacter(IN integer)
    LANGUAGE sql
    AS $_$DELETE FROM public.characters WHERE character_id = $1;$_$;


ALTER PROCEDURE public.deletecharacter(IN integer) OWNER TO postgres;

--
-- Name: findbyemail(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.findbyemail(text) RETURNS boolean
    LANGUAGE sql
    AS $_$SELECT count(*)>0 FROM public.users WHERE $1 = public.users.email;$_$;


ALTER FUNCTION public.findbyemail(text) OWNER TO postgres;

--
-- Name: savenewcharacter(integer, integer, integer, integer, integer, integer, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.savenewcharacter(IN integer, IN integer, IN integer, IN integer, IN integer, IN integer, IN text)
    LANGUAGE sql
    AS $_$INSERT INTO public.characters(user_id, class_id, race_id, subrace_id,
	weapon_id, armour_id, character_name) VALUES($1, $2, $3, $4, $5, $6, $7);$_$;


ALTER PROCEDURE public.savenewcharacter(IN integer, IN integer, IN integer, IN integer, IN integer, IN integer, IN text) OWNER TO postgres;

--
-- Name: savenewuser(text, text, text, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.savenewuser(IN text, IN text, IN text, IN text)
    LANGUAGE sql
    AS $_$INSERT INTO public.users(user_name, nick_name, email, password) VALUES($1, $2, $3, $4);$_$;


ALTER PROCEDURE public.savenewuser(IN text, IN text, IN text, IN text) OWNER TO postgres;

--
-- Name: updatepassword(text, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.updatepassword(IN text, IN integer)
    LANGUAGE sql
    AS $_$UPDATE public.users SET password = $1 WHERE users.user_id = $2;$_$;


ALTER PROCEDURE public.updatepassword(IN text, IN integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: armour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armour (
    armour_id bigint NOT NULL,
    armour_class_id bigint,
    armour_name character varying(255),
    armour_points integer,
    armour_price double precision
);


ALTER TABLE public.armour OWNER TO postgres;

--
-- Name: armour_armour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.armour_armour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.armour_armour_id_seq OWNER TO postgres;

--
-- Name: armour_armour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.armour_armour_id_seq OWNED BY public.armour.armour_id;


--
-- Name: armours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armours (
    armour_id integer NOT NULL,
    armour_name text NOT NULL,
    armour_points integer NOT NULL,
    armour_price numeric NOT NULL,
    armour_class_id integer NOT NULL
);


ALTER TABLE public.armours OWNER TO postgres;

--
-- Name: TABLE armours; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.armours IS 'Таблица, в которой хранится информация о существующих доспехах.';


--
-- Name: armours_armour_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.armours_armour_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.armours_armour_class_id_seq OWNER TO postgres;

--
-- Name: armours_armour_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.armours_armour_class_id_seq OWNED BY public.armours.armour_class_id;


--
-- Name: armours_armour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.armours_armour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.armours_armour_id_seq OWNER TO postgres;

--
-- Name: armours_armour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.armours_armour_id_seq OWNED BY public.armours.armour_id;


--
-- Name: character_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_card (
    id bigint NOT NULL,
    character_name character varying(255),
    class_name character varying(255),
    race_name character varying(255),
    subrace_name character varying(255),
    user_id bigint,
    armour_name character varying(255),
    armour_points integer,
    armour_price real,
    class_attribute character varying(255),
    hp integer,
    mp integer,
    race_attribute character varying(255),
    subrace_attribute character varying(255),
    weapon_dmg integer,
    weapon_mana_cost integer,
    weapon_name character varying(255),
    weapon_price real
);


ALTER TABLE public.character_card OWNER TO postgres;

--
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    character_id integer NOT NULL,
    user_id integer NOT NULL,
    class_id integer NOT NULL,
    race_id integer NOT NULL,
    subrace_id integer NOT NULL,
    weapon_id integer NOT NULL,
    armour_id integer NOT NULL,
    character_name text NOT NULL
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- Name: TABLE characters; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.characters IS 'Таблица, в которой хранятся персонажи пользователей приложения.';


--
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    class_id integer NOT NULL,
    class_name text NOT NULL,
    class_hp integer NOT NULL,
    class_mp integer NOT NULL,
    class_attribute text NOT NULL
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- Name: TABLE classes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.classes IS 'Таблица, в которой хранятся данные о классах.';


--
-- Name: races; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.races (
    race_id integer NOT NULL,
    race_name text NOT NULL,
    race_description text NOT NULL,
    race_attribute text NOT NULL,
    race_hp integer NOT NULL,
    race_mp integer NOT NULL
);


ALTER TABLE public.races OWNER TO postgres;

--
-- Name: TABLE races; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.races IS 'Таблица, в которой хранятся данные о расах.';


--
-- Name: subraces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subraces (
    subrace_id integer NOT NULL,
    race_id integer NOT NULL,
    subrace_name text NOT NULL,
    subrace_attribute text NOT NULL
);


ALTER TABLE public.subraces OWNER TO postgres;

--
-- Name: TABLE subraces; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.subraces IS 'Таблица, в которой хранятся подрасы основных рас.';


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name text NOT NULL,
    nick_name text NOT NULL,
    email character varying(30) NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.users IS 'Таблица, в которой храняться все данные о пользователях приложения: их имя, почта, зашифрованный пароль. Айдишники генирируются автоматически.';


--
-- Name: weapons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weapons (
    weapon_id integer NOT NULL,
    weapon_name text NOT NULL,
    weapon_dmg integer NOT NULL,
    weapon_mana_cost integer NOT NULL,
    weapon_price numeric NOT NULL,
    weapon_class_id integer NOT NULL
);


ALTER TABLE public.weapons OWNER TO postgres;

--
-- Name: TABLE weapons; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.weapons IS 'Таблица, в которой хранятся данные об существующем оружии.';


--
-- Name: charactercard; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.charactercard AS
 SELECT characters.character_id AS id,
    characters.character_name,
    classes.class_name,
    classes.class_attribute,
    (classes.class_hp + races.race_hp) AS hp,
    (classes.class_mp + races.race_mp) AS mp,
    races.race_name,
    races.race_attribute,
    subraces.subrace_name,
    subraces.subrace_attribute,
    characters.user_id,
    weapons.weapon_name,
    weapons.weapon_dmg,
    weapons.weapon_mana_cost,
    weapons.weapon_price,
    armours.armour_name,
    armours.armour_points,
    armours.armour_price
   FROM ((((((public.characters
     JOIN public.classes ON ((characters.class_id = classes.class_id)))
     JOIN public.races ON ((characters.race_id = races.race_id)))
     JOIN public.subraces ON ((characters.subrace_id = subraces.subrace_id)))
     JOIN public.users ON ((characters.user_id = users.user_id)))
     JOIN public.weapons ON ((characters.weapon_id = weapons.weapon_id)))
     JOIN public.armours ON ((characters.armour_id = armours.armour_id)));


ALTER TABLE public.charactercard OWNER TO postgres;

--
-- Name: characters_armour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_armour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_armour_id_seq OWNER TO postgres;

--
-- Name: characters_armour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_armour_id_seq OWNED BY public.characters.armour_id;


--
-- Name: characters_character_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_character_id_seq OWNER TO postgres;

--
-- Name: characters_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_character_id_seq OWNED BY public.characters.character_id;


--
-- Name: characters_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_class_id_seq OWNER TO postgres;

--
-- Name: characters_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_class_id_seq OWNED BY public.characters.class_id;


--
-- Name: characters_race_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_race_id_seq OWNER TO postgres;

--
-- Name: characters_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_race_id_seq OWNED BY public.characters.race_id;


--
-- Name: characters_subrace_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_subrace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_subrace_id_seq OWNER TO postgres;

--
-- Name: characters_subrace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_subrace_id_seq OWNED BY public.characters.subrace_id;


--
-- Name: characters_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_user_id_seq OWNER TO postgres;

--
-- Name: characters_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_user_id_seq OWNED BY public.characters.user_id;


--
-- Name: characters_weapon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_weapon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_weapon_id_seq OWNER TO postgres;

--
-- Name: characters_weapon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_weapon_id_seq OWNED BY public.characters.weapon_id;


--
-- Name: classes_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classes_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classes_class_id_seq OWNER TO postgres;

--
-- Name: classes_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classes_class_id_seq OWNED BY public.classes.class_id;


--
-- Name: races_race_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.races_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.races_race_id_seq OWNER TO postgres;

--
-- Name: races_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.races_race_id_seq OWNED BY public.races.race_id;


--
-- Name: subraces_race_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subraces_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subraces_race_id_seq OWNER TO postgres;

--
-- Name: subraces_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subraces_race_id_seq OWNED BY public.subraces.race_id;


--
-- Name: subraces_subrace_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subraces_subrace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subraces_subrace_id_seq OWNER TO postgres;

--
-- Name: subraces_subrace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subraces_subrace_id_seq OWNED BY public.subraces.subrace_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: weapons_weapon_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weapons_weapon_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weapons_weapon_class_id_seq OWNER TO postgres;

--
-- Name: weapons_weapon_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapons_weapon_class_id_seq OWNED BY public.weapons.weapon_class_id;


--
-- Name: weapons_weapon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weapons_weapon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weapons_weapon_id_seq OWNER TO postgres;

--
-- Name: weapons_weapon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weapons_weapon_id_seq OWNED BY public.weapons.weapon_id;


--
-- Name: armour armour_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armour ALTER COLUMN armour_id SET DEFAULT nextval('public.armour_armour_id_seq'::regclass);


--
-- Name: armours armour_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armours ALTER COLUMN armour_id SET DEFAULT nextval('public.armours_armour_id_seq'::regclass);


--
-- Name: armours armour_class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armours ALTER COLUMN armour_class_id SET DEFAULT nextval('public.armours_armour_class_id_seq'::regclass);


--
-- Name: characters character_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN character_id SET DEFAULT nextval('public.characters_character_id_seq'::regclass);


--
-- Name: characters user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN user_id SET DEFAULT nextval('public.characters_user_id_seq'::regclass);


--
-- Name: characters class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN class_id SET DEFAULT nextval('public.characters_class_id_seq'::regclass);


--
-- Name: characters race_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN race_id SET DEFAULT nextval('public.characters_race_id_seq'::regclass);


--
-- Name: characters subrace_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN subrace_id SET DEFAULT nextval('public.characters_subrace_id_seq'::regclass);


--
-- Name: characters weapon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN weapon_id SET DEFAULT nextval('public.characters_weapon_id_seq'::regclass);


--
-- Name: characters armour_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN armour_id SET DEFAULT nextval('public.characters_armour_id_seq'::regclass);


--
-- Name: classes class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes ALTER COLUMN class_id SET DEFAULT nextval('public.classes_class_id_seq'::regclass);


--
-- Name: races race_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races ALTER COLUMN race_id SET DEFAULT nextval('public.races_race_id_seq'::regclass);


--
-- Name: subraces subrace_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subraces ALTER COLUMN subrace_id SET DEFAULT nextval('public.subraces_subrace_id_seq'::regclass);


--
-- Name: subraces race_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subraces ALTER COLUMN race_id SET DEFAULT nextval('public.subraces_race_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: weapons weapon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons ALTER COLUMN weapon_id SET DEFAULT nextval('public.weapons_weapon_id_seq'::regclass);


--
-- Name: weapons weapon_class_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons ALTER COLUMN weapon_class_id SET DEFAULT nextval('public.weapons_weapon_class_id_seq'::regclass);


--
-- Data for Name: armour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armour (armour_id, armour_class_id, armour_name, armour_points, armour_price) FROM stdin;
\.


--
-- Data for Name: armours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armours (armour_id, armour_name, armour_points, armour_price, armour_class_id) FROM stdin;
1	Легкий кожанный нагрудник	3	30.00	3
2	Кольчужный нагрудник	5	40.00	3
3	Ряса колегии Винтерхолда	2	40.00	1
4	Защищённая ряса колегии Винтерхолда	4	100.00	1
5	Тяжелый наплечник ярости	6	60.00	2
6	Тяжелый нагрудник адской боли	10	300.00	2
\.


--
-- Data for Name: character_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_card (id, character_name, class_name, race_name, subrace_name, user_id, armour_name, armour_points, armour_price, class_attribute, hp, mp, race_attribute, subrace_attribute, weapon_dmg, weapon_mana_cost, weapon_name, weapon_price) FROM stdin;
\.


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (character_id, user_id, class_id, race_id, subrace_id, weapon_id, armour_id, character_name) FROM stdin;
1	1	2	3	6	2	6	Реходон
2	1	1	1	2	3	3	Мировиз
3	2	3	3	5	7	1	Алдуин
13	1	2	1	2	1	5	Висимир
14	5	1	2	4	4	4	Геральт
15	5	3	2	4	7	1	Анатолий
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes (class_id, class_name, class_hp, class_mp, class_attribute) FROM stdin;
1	Чародей	5	10	Проверки интеллекта +2
2	Берсерк	10	0	Проверки к телосложению +4
3	Вор	6	3	Проверки атлетики +3
\.


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.races (race_id, race_name, race_description, race_attribute, race_hp, race_mp) FROM stdin;
1	Эльф	Эльфы — это волшебный народ, \n\t обладающий неземным изяществом, живущий в мире,\n\t но не являющийся его частью. \n\t Они живут в местах, наполненных воздушной красотой, \n\t в глубинах древних лесов или в серебряных жилищах, \n\t увенчанных сверкающими шпилями и переливающихся волшебным светом. \n\t Там лёгкие дуновения ветра разносят обрывки тихих мелодий и нежные ароматы. \n\t Эльфы любят природу и магию, музыку и поэзию, и всё прекрасное, что есть в мире.	Проверки к броскам попадания + 2	5	6
2	Человек	В большинстве миров люди — это самая молодая из распространённых рас.\n\t Они поздно вышли на мировую сцену и живут намного меньше, чем дварфы, эльфы и драконы.\n\t Возможно, именно краткость их жизней заставляет их стремиться достигнуть\n\t как можно большего в отведённый им срок.\n\t А быть может, они хотят что-то доказать старшим расам,\n\t и поэтому создают могучие империи, основанные на завоеваниях и торговле. \n\t Что бы ни двигало ими, люди всегда были инноваторами и пионерами во всех мирах.	Красноречие +4	5	2
3	Полурослик	Крошечные полурослики выживают в мире,\n\t полном более крупных существ, \n\t стараясь избегать внимания, а если это оказывается невозможным, \n\t то избегая враждебности. Имея рост около 3 футов (90 сантиметров),\n\t они кажутся относительно безвредными, \n\t и благодаря этому успешно существуют столетиями, \n\t оставаясь в тени империй, войн и политической борьбы. \n\t Они склонны к полноте, и весят от 40 до 45 фунтов (от 18 до 20 килограмм).	Скрытность + 4	3	3
\.


--
-- Data for Name: subraces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subraces (subrace_id, race_id, subrace_name, subrace_attribute) FROM stdin;
1	1	Лесной эльф	Вы лучше стреляете из лука
2	1	Тёмный эльф	В тёмных пространствах вас труднее заметить
3	2	Имперец	При старте у вас появляется кошель с 100 серебра
4	2	Норд	У вас есть утойчивость: вам надо выкинуть только два положительных спасброска от смерти
5	3	Легконогий	Вы можете скрыться, даже если вас заметили в бою
6	3	Коренастый	У вас есть сопротивление ядам
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_name, nick_name, email, password) FROM stdin;
1	Иванов Сергей Константинович	SeiTheEnjoyer	sergeykonstwork@gmail.com	$2a$12$pl0R4VubCkwWz3AFrfRnGeiF5J2NBOFl8LNj6sy.yIzlRXfWnaFj.
2	Денега Артём Петрович	4rutemu	artemkathebest@gmail.com	$2a$12$fnagscSWcy/DlM6leY10VOM.Va6gzBhJvdjJk94vJOu5dFxvmTQKa
3	Котилевец Игорь Денисович	katyaLeviS	igorlevis@gmail.com	$2a$12$tGceyFaEpXJIME6ZuZtn1utYWFCG1.0dwDvBcg668H5/3OI4hLIeG
5	Иванов Иван Иванович	IvanOK	rfunk@jast.com	$2a$12$Ii4Ah9VlZop8sVeA/oqjpeBL69MgEi.aBgV/h2qnsa31o6bVKbbJG
17	Hui Zalupa Pupa	ZalupOK	hui@gmail.com	$2a$12$rE7oA9N2XvG3yTCBhtLWYOHbK5arYsXZG7hD4mcX6G7SHjXOJpbRu
18	Николай	kseoni4	kseno@gmail.com	$2a$12$dqflD9a9YssecfofprLIY.5qBwBCMGdftm3XL1Io/nztU3xgIlar6
\.


--
-- Data for Name: weapons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weapons (weapon_id, weapon_name, weapon_dmg, weapon_mana_cost, weapon_price, weapon_class_id) FROM stdin;
1	Секира тёмного пламени	10	0	100.00	2
2	Топор адского милосердия	15	0	300.00	2
3	Посох вечной зимы	7	3	100.00	1
4	Палочка-выручалочка	20	10	5000.00	1
5	Длинный лук спокойствия	5	0	50.00	3
6	Длинный лук истощения	7	3	150.00	3
7	Кинжал тысячелетия боли	5	0	99.99	3
\.


--
-- Name: armour_armour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.armour_armour_id_seq', 1, false);


--
-- Name: armours_armour_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.armours_armour_class_id_seq', 1, false);


--
-- Name: armours_armour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.armours_armour_id_seq', 6, true);


--
-- Name: characters_armour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_armour_id_seq', 1, false);


--
-- Name: characters_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_character_id_seq', 17, true);


--
-- Name: characters_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_class_id_seq', 1, false);


--
-- Name: characters_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_race_id_seq', 1, false);


--
-- Name: characters_subrace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_subrace_id_seq', 1, false);


--
-- Name: characters_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_user_id_seq', 1, false);


--
-- Name: characters_weapon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_weapon_id_seq', 1, false);


--
-- Name: classes_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classes_class_id_seq', 3, true);


--
-- Name: races_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.races_race_id_seq', 3, true);


--
-- Name: subraces_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subraces_race_id_seq', 1, false);


--
-- Name: subraces_subrace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subraces_subrace_id_seq', 7, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: weapons_weapon_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapons_weapon_class_id_seq', 1, false);


--
-- Name: weapons_weapon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weapons_weapon_id_seq', 7, true);


--
-- Name: armour armour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armour
    ADD CONSTRAINT armour_pkey PRIMARY KEY (armour_id);


--
-- Name: armours armours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armours
    ADD CONSTRAINT armours_pkey PRIMARY KEY (armour_id);


--
-- Name: character_card character_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_card
    ADD CONSTRAINT character_card_pkey PRIMARY KEY (id);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (character_id);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (class_id);


--
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (race_id);


--
-- Name: subraces subraces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subraces
    ADD CONSTRAINT subraces_pkey PRIMARY KEY (subrace_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: weapons weapons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT weapons_pkey PRIMARY KEY (weapon_id);


--
-- Name: characters armour_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT armour_id FOREIGN KEY (armour_id) REFERENCES public.armours(armour_id) NOT VALID;


--
-- Name: characters class_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT class_id FOREIGN KEY (class_id) REFERENCES public.classes(class_id) NOT VALID;


--
-- Name: weapons class_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weapons
    ADD CONSTRAINT class_id FOREIGN KEY (weapon_class_id) REFERENCES public.classes(class_id) NOT VALID;


--
-- Name: armours class_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armours
    ADD CONSTRAINT class_id FOREIGN KEY (armour_class_id) REFERENCES public.classes(class_id) NOT VALID;


--
-- Name: characters race_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT race_id FOREIGN KEY (race_id) REFERENCES public.races(race_id) NOT VALID;


--
-- Name: subraces race_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subraces
    ADD CONSTRAINT race_id FOREIGN KEY (race_id) REFERENCES public.races(race_id) NOT VALID;


--
-- Name: characters subrace_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT subrace_id FOREIGN KEY (subrace_id) REFERENCES public.subraces(subrace_id) NOT VALID;


--
-- Name: characters user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;


--
-- Name: characters weapon_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT weapon_id FOREIGN KEY (weapon_id) REFERENCES public.weapons(weapon_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

