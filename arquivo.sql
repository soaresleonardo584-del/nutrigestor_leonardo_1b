--
-- PostgreSQL database dump
--

\restrict PyDbl9zCx56EoLvKK7UK1kygJa0GMYdRjqM4MrXfc6uWIsAIE6xuWiCnQjdWdbt

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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
-- Name: alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    serie character varying(100) NOT NULL
);


ALTER TABLE public.alunos OWNER TO postgres;

--
-- Name: alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_seq OWNER TO postgres;

--
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- Name: cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio (
    id integer NOT NULL,
    data date NOT NULL,
    descricao character varying(200) NOT NULL,
    itens_utilizados text
);


ALTER TABLE public.cardapio OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cardapio_id_seq OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cardapio_id_seq OWNED BY public.cardapio.id;


--
-- Name: desperdicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desperdicio (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    peso_descartado numeric(8,2) NOT NULL,
    item_mais_rejeitado character varying(100)
);


ALTER TABLE public.desperdicio OWNER TO postgres;

--
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque (
    id integer NOT NULL,
    item character varying(100) NOT NULL,
    quantidade numeric(8,2) NOT NULL,
    validade date NOT NULL
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estoque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estoque_id_seq OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estoque_id_seq OWNED BY public.estoque.id;


--
-- Name: merenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merenda (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    qtd_produzida numeric(8,2) NOT NULL
);


ALTER TABLE public.merenda OWNER TO postgres;

--
-- Name: participacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participacao (
    id_aluno integer NOT NULL,
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL
);


ALTER TABLE public.participacao OWNER TO postgres;

--
-- Name: restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao (
    id integer NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE public.restricao OWNER TO postgres;

--
-- Name: restricao_aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao_aluno (
    id_aluno integer NOT NULL,
    id_restricao integer NOT NULL
);


ALTER TABLE public.restricao_aluno OWNER TO postgres;

--
-- Name: restricao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restricao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restricao_id_seq OWNER TO postgres;

--
-- Name: restricao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restricao_id_seq OWNED BY public.restricao.id;


--
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- Name: cardapio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio ALTER COLUMN id SET DEFAULT nextval('public.cardapio_id_seq'::regclass);


--
-- Name: estoque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque ALTER COLUMN id SET DEFAULT nextval('public.estoque_id_seq'::regclass);


--
-- Name: restricao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao ALTER COLUMN id SET DEFAULT nextval('public.restricao_id_seq'::regclass);


--
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alunos (id, nome, serie) FROM stdin;
\.


--
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cardapio (id, data, descricao, itens_utilizados) FROM stdin;
\.


--
-- Data for Name: desperdicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desperdicio (id_cardapio, dt_merenda, peso_descartado, item_mais_rejeitado) FROM stdin;
\.


--
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estoque (id, item, quantidade, validade) FROM stdin;
\.


--
-- Data for Name: merenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merenda (id_cardapio, dt_merenda, qtd_produzida) FROM stdin;
\.


--
-- Data for Name: participacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participacao (id_aluno, id_cardapio, dt_merenda) FROM stdin;
\.


--
-- Data for Name: restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao (id, descricao) FROM stdin;
1	lactose
2	gluten
3	amendoim
4	ovo
\.


--
-- Data for Name: restricao_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao_aluno (id_aluno, id_restricao) FROM stdin;
\.


--
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_seq', 1, false);


--
-- Name: cardapio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_id_seq', 1, false);


--
-- Name: estoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estoque_id_seq', 1, false);


--
-- Name: restricao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restricao_id_seq', 19, true);


--
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- Name: cardapio cardapio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_pkey PRIMARY KEY (id);


--
-- Name: estoque estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id);


--
-- Name: desperdicio pk_desperdicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT pk_desperdicio PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: merenda pk_merenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT pk_merenda PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: participacao pk_participacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT pk_participacao PRIMARY KEY (id_aluno, id_cardapio, dt_merenda);


--
-- Name: restricao_aluno pk_restricao_aluno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT pk_restricao_aluno PRIMARY KEY (id_aluno, id_restricao);


--
-- Name: restricao restricao_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_descricao_key UNIQUE (descricao);


--
-- Name: restricao restricao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_pkey PRIMARY KEY (id);


--
-- Name: idx_desp_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_desp_merenda ON public.desperdicio USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_part_aluno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_aluno ON public.participacao USING btree (id_aluno);


--
-- Name: idx_part_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_merenda ON public.participacao USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_ra_aluno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ra_aluno ON public.restricao_aluno USING btree (id_aluno);


--
-- Name: desperdicio fk_desp_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT fk_desp_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: merenda fk_merenda_cardapio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT fk_merenda_cardapio FOREIGN KEY (id_cardapio) REFERENCES public.cardapio(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_aluno FOREIGN KEY (id_aluno) REFERENCES public.alunos(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_aluno FOREIGN KEY (id_aluno) REFERENCES public.alunos(id) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict PyDbl9zCx56EoLvKK7UK1kygJa0GMYdRjqM4MrXfc6uWIsAIE6xuWiCnQjdWdbt

