--
-- PostgreSQL database dump
--

\restrict 9jh7IJAyAbVS6oXRuFwPWJINXQnGwgo6XlZUs2jp4aVZcaHehnprBgNkrfzNbMX

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
    serie character varying(10) NOT NULL
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
-- Name: item_restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_restricao (
    id_restricao integer NOT NULL,
    id_estoque integer NOT NULL
);


ALTER TABLE public.item_restricao OWNER TO postgres;

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
1	Aluno A	1ºA-DS
2	Aluno B	1ºB-DS
3	Aluno C	2ºA-DS
5	Ana Clara Silva	6º ano A
6	Bruno Henrique Santos	6º ano A
7	Carla Mendes Oliveira	6º ano B
8	Daniel Costa Ribeiro	6º ano B
9	Eduarda Lima Martins	7º ano A
10	Felipe Gabriel Souza	7º ano A
11	Gabriela Fernandes Lima	7º ano B
12	Heitor Alves Pereira	7º ano B
13	Isabela Rocha Nascimento	8º ano A
14	João Pedro Carvalho	8º ano A
15	Kauan Dias Barbosa	8º ano B
16	Lara Beatriz Castro	8º ano B
17	Lucas Gabriel Araújo	9º ano A
18	Mariana Cardoso Freitas	9º ano A
19	Nicolas Moreira Machado	9º ano B
20	Olivia Monteiro Ramos	9º ano B
21	Paulo Roberto Teixeira	1º EM A
22	Rafaela Gomes Vieira	1º EM A
23	Samuel Victor Correia	1º EM B
24	Sofia Helena Duarte	1º EM B
25	Thiago Augusto Nunes	2º EM A
26	Valentina Soares Campos	2º EM A
27	Vinicius Eduardo Marques	2º EM B
28	Yasmin Alessandra Lopes	2º EM B
29	Arthur Guilherme Santana	3º EM A
30	Beatriz Vitoria Medeiros	3º EM A
31	Caio Felipe Andrade	3º EM B
32	David Lucca Silveira	3º EM B
33	Emma Carolina Farias	6º ano A
34	Enzo Gabriel Guimaraes	6º ano A
35	Fernanda Luisa Peixoto	6º ano B
36	Gabriel Vinicius Franco	6º ano B
37	Giovanna Maria Aguiar	7º ano A
38	Guilherme Henrique Fonseca	7º ano A
39	Igor Matheus Prado	7º ano B
40	Julia Eduarda Xavier	7º ano B
41	Leonardo Augusto Resende	8º ano A
42	Livia Maria Borges	8º ano A
43	Luiz Felipe Monteiro	8º ano B
44	Manuela Vitoria Assis	8º ano B
45	Matheus Henrique Bueno	9º ano A
46	Natalia Cristina Antunes	9º ano A
47	Pedro Henrique Camargo	9º ano B
48	Rebeca Sofia Sales	9º ano B
49	Rodrigo Emanuel Nogueira	1º EM A
50	Sarah Regina Pires	1º EM B
51	Vitor Hugo Barreto	2º EM A
4	Godofredo	1oIA
\.


--
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cardapio (id, data, descricao, itens_utilizados) FROM stdin;
1	2026-06-25	macarronada	macarrão, massa de tomate, carne moída
2	2026-06-26	arroz carreteiro	arroz, carne seca, legumes e verduras
3	2026-06-29	sopa	macarrao, legumes, salsicha
4	2026-08-03	Arroz integral, feijão carioca, peito de frango grelhado e salada de alface com tomate.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Alface Crespa, Tomate, Óleo de Soja, Sal Refinado
5	2026-08-04	Macarrão espaguete ao molho bolonhesa e banana de sobremesa.	Macarrão Espaguete, Carne Moída (Patinho), Extrato de Tomate, Cebola, Alho Descascado, Banana Prata
6	2026-08-05	Arroz, feijão preto, omelete com queijo e salada de repolho.	Arroz Integral, Feijão Preto, Ovos Brancos (Dúzias), Queijo Mussarela, Repolho Verde, Azeite de Oliva Extra Virgem
7	2026-08-06	Sopa de legumes com frango desfiado e pão de forma integral.	Batata Inglesa, Cenoura fresca, Chuchu, Peito de Frango Congelado, Pão de Forma Integral, Sal Refinado
8	2026-08-07	Galinhada caipira, salada de beterraba e suco de acerola.	Arroz Integral, Peito de Frango Congelado, Cebola, Alho Descascado, Beterraba, Polpa de Acerola, Açúcar Refinado
9	2026-08-10	Arroz, feijão carioca, carne moída ensopada com batata e maçã.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Batata Inglesa, Maçã Gala
10	2026-08-11	Macarrão penne integral ao molho de tomate com atum e salada.	Macarrão Penne Integral, Atum em Conserva, Extrato de Tomate, Alface Crespa, Tomate
11	2026-08-12	Arroz, feijão preto, frango assado ao forno e purê de mandioca.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Farinha de Mandioca, Manteiga com Sal
12	2026-08-13	Risoto de frango com milho e ervilha e suco de caju.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Suco de Caju Concentrado
13	2026-08-14	Cachorro quente escolar com suco de maracujá e melancia.	Pão Francês (kg), Salsicha para Cachorro Quente, Extrato de Tomate, Polpa de Maracujá, Melancia (kg)
14	2026-08-17	Arroz, feijão carioca, iscas de frango acebolado e salada de cenoura.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Cebola, Cenoura fresca
15	2026-08-18	Carne moída com milho, arroz, feijão e laranja pera.	Carne Moída (Patinho), Milho Verde em Conserva, Arroz Integral, Feijão Carioca, Laranja Pera
16	2026-08-19	Sopa de feijão com macarrão e legumes.	Feijão Carioca, Macarrão Espaguete, Batata Inglesa, Cenoura fresca, Cebola
17	2026-08-20	Arroz, feijão preto, fricassê de frango e salada de alface.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Milho Verde em Conserva, Alface Crespa
18	2026-08-21	Mingau de aveia com banana e biscoito maria no lanche da manhã.	Leite Desnatado (Litros), Aveia em Flocos, Banana Prata, Biscoito Maria, Açúcar Refinado
19	2026-08-24	Arroz integral, feijão, ovos cozidos ao molho e salada de tomate.	Arroz Integral, Feijão Carioca, Ovos Brancos (Dúzias), Extrato de Tomate, Tomate
20	2026-08-25	Macarrão ao alho e óleo com frango em cubos e salada de repolho.	Macarrão Espaguete, Alho Descascado, Azeite de Oliva Extra Virgem, Peito de Frango Congelado, Repolho Verde
21	2026-08-26	Escondidinho de carne moída com purê de batata e melão.	Carne Moída (Patinho), Batata Inglesa, Manteiga com Sal, Leite Desnatado (Litros), Melão Amarelo
22	2026-08-27	Arroz, feijão preto, peito de frango grelhado e abóbora refogada.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá, Alho Descascado
23	2026-08-28	Pão com pate de atum, iogurte natural e maçã.	Pão de Forma Integral, Atum em Conserva, Iogurte Natural, Maçã Gala
24	2026-08-31	Arroz, feijão, estrogonofe de frango leve e salada verde.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Extrato de Tomate, Alface Crespa
25	2026-09-01	Sopa de fubá com carne moída e couve refogada.	Farinha de Mandioca, Carne Moída (Patinho), Alho Descascado, Sal Refinado
26	2026-09-02	Arroz, feijão preto, omelete de vegetais e salada de beterraba.	Arroz Integral, Feijão Preto, Ovos Brancos (Dúzias), Cenoura fresca, Beterraba
27	2026-09-03	Macarrão penne com molho branco e frango desfiado.	Macarrão Penne Integral, Leite Desnatado (Litros), Farinha de Trigo, Manteiga com Sal, Peito de Frango Congelado
28	2026-09-04	Vitamina de banana com aveia e biscoito cream cracker.	Leite Desnatado (Litros), Banana Prata, Aveia em Flocos, Biscoito Cream Cracker
29	2026-09-08	Arroz, feijão carioca, frango xadrez escolar e salada de pepino.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Cebola, Tomate
30	2026-09-09	Arroz de forno com legumes, frango e queijo mussarela.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Queijo Mussarela
31	2026-09-10	Sopa de mandioca com carne moída e cheiro verde.	Farinha de Mandioca, Carne Moída (Patinho), Cebola, Alho Descascado
32	2026-09-11	Lanche especial: pão francês com queijo quente e suco de acerola.	Pão Francês (kg), Queijo Mussarela, Manteiga com Sal, Polpa de Acerola, Açúcar Refinado
33	2026-09-14	Arroz, feijão preto, carne moída refogada e salada de chuchu.	Arroz Integral, Feijão Preto, Carne Moída (Patinho), Chuchu, Azeite de Oliva Extra Virgem
34	2026-09-15	Macarrão espaguete ao molho de tomate com sardinha e salada.	Macarrão Espaguete, Sardinha em Conserva, Extrato de Tomate, Alface Crespa
35	2026-09-16	Arroz, feijão, frango ensopado com batata e maçã.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Batata Inglesa, Maçã Gala
36	2026-09-17	Canja de galinha com arroz e legumes cortados em cubos.	Peito de Frango Congelado, Arroz Integral, Cenoura fresca, Batata Inglesa, Cebola
37	2026-09-18	Iogurte natural com banana picada e biscoito maria.	Iogurte Natural, Banana Prata, Biscoito Maria
38	2026-09-21	Arroz, feijão preto, peito de frango grelhado e purê de abóbora.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá, Manteiga com Sal
39	2026-09-22	Arroz colorido com legumes, ovos cozidos e salada de tomate.	Arroz Integral, Cenoura fresca, Ervilha em Conserva, Ovos Brancos (Dúzias), Tomate
40	2026-09-23	Sopa de legumes com carne moída e torradas de pão francês.	Batata Inglesa, Cenoura fresca, Chuchu, Carne Moída (Patinho), Pão Francês (kg)
41	2026-09-24	Macarrão penne integral ao molho suíço com frango.	Macarrão Penne Integral, Leite Desnatado (Litros), Peito de Frango Congelado, Queijo Mussarela
42	2026-09-25	Bolo caseiro simples com suco de maracujá no lanche.	Farinha de Trigo, Ovos Brancos (Dúzias), Açúcar Refinado, Polpa de Maracujá
43	2026-09-28	Arroz, feijão carioca, carne moída acebolada e salada de repolho com cenoura.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Cebola, Repolho Verde, Cenoura fresca
44	2026-09-29	Arroz, feijão preto, frango xadrez leve e banana de sobremesa.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Cebola, Banana Prata
45	2026-09-30	Sopa de canjiquinha com frango desfiado e legumes.	Peito de Frango Congelado, Cenoura fresca, Batata Inglesa, Sal Refinado
46	2026-10-01	Arroz integral, feijão, omelete de queijo e salada de alface.	Arroz Integral, Feijão Carioca, Ovos Brancos (Dúzias), Queijo Mussarela, Alface Crespa
47	2026-10-02	Pão de forma integral com patê de frango e suco de caju.	Pão de Forma Integral, Peito de Frango Congelado, Suco de Caju Concentrado
48	2026-10-05	Arroz, feijão preto, iscas de peito de frango e abóbora cozida.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá
49	2026-10-06	Macarrão espaguete à bolonhesa e melancia cortada.	Macarrão Espaguete, Carne Moída (Patinho), Extrato de Tomate, Melancia (kg)
50	2026-10-07	Arroz, feijão carioca, picadinho de carne com legumes e maçã.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Cenoura fresca, Batata Inglesa, Maçã Gala
\.


--
-- Data for Name: desperdicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desperdicio (id_cardapio, dt_merenda, peso_descartado, item_mais_rejeitado) FROM stdin;
1	2025-06-23 11:00:00	5.20	salada
2	2025-06-24 11:00:00	8.10	macarrao
1	2025-06-25 11:00:00	4.90	\N
4	2025-06-26 11:00:00	6.30	legumes
5	2025-06-27 11:00:00	3.80	arroz integral
6	2025-06-30 11:00:00	7.50	salada de beterraba
7	2025-07-01 11:00:00	5.10	atum
8	2025-07-02 11:00:00	4.20	pure de mandioca
9	2025-07-03 11:00:00	3.90	ervilha
10	2025-07-04 11:00:00	9.40	salsicha
11	2025-07-07 11:00:00	5.80	salada de cenoura
12	2025-07-08 11:00:00	4.60	carne moida
13	2025-07-09 11:00:00	6.10	sopa de feijao
14	2025-07-10 11:00:00	3.50	fricasse
15	2025-07-11 11:00:00	2.90	mingau de aveia
16	2025-07-14 11:00:00	5.30	ovos cozidos
17	2025-07-15 11:00:00	4.70	repolho verde
18	2025-07-16 11:00:00	3.20	escondidinho
19	2025-07-17 11:00:00	6.80	abobora refogada
20	2025-07-18 11:00:00	2.10	\N
21	2025-07-21 11:00:00	5.50	estrogonofe
22	2025-07-22 11:00:00	6.00	couve refogada
23	2025-07-23 11:00:00	4.30	omelete
24	2025-07-24 11:00:00	5.90	molho branco
25	2025-07-25 11:00:00	3.10	vitamina de banana
26	2025-07-28 11:00:00	4.80	pepino
27	2025-07-29 11:00:00	3.70	arroz de forno
28	2025-07-30 11:00:00	6.40	sopa de mandioca
29	2025-07-31 11:00:00	2.50	\N
30	2025-08-01 11:00:00	5.00	chuchu
31	2025-08-04 11:00:00	4.40	sardinha
32	2025-08-05 11:00:00	5.60	frango ensopado
33	2025-08-06 11:00:00	6.20	canja de galinha
34	2025-08-07 11:00:00	1.80	\N
35	2025-08-08 11:00:00	4.10	pure de abobora
36	2025-08-11 11:00:00	3.60	arroz colorido
37	2025-08-12 11:00:00	5.70	torradas
38	2025-08-13 11:00:00	4.50	macarrao penne
39	2025-08-14 11:00:00	2.80	\N
40	2025-08-15 11:00:00	5.40	salada de repolho
41	2025-08-18 11:00:00	4.00	frango xadrez
42	2025-08-19 11:00:00	6.50	canjiquinha
43	2025-08-20 11:00:00	3.30	omelete de queijo
44	2025-08-21 11:00:00	2.70	\N
45	2025-08-22 11:00:00	4.90	abobora cozida
46	2025-08-25 11:00:00	5.20	macarrao a bolonhesa
47	2025-08-26 11:00:00	3.80	picadinho de carne
\.


--
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estoque (id, item, quantidade, validade) FROM stdin;
1	arroz	25.80	2026-10-25
2	feijão	45.68	2026-11-05
3	macarrao	56.40	2027-01-15
4	Arroz Integral	150.00	2026-10-15
5	Feijão Carioca	120.50	2026-09-30
6	Feijão Preto	80.00	2026-11-05
7	Peito de Frango Congelado	95.00	2026-08-20
8	Carne Moída (Patinho)	60.00	2026-08-15
9	Óleo de Soja	45.00	2027-02-10
10	Açúcar Refinado	70.00	2027-05-01
11	Sal Refinado	30.00	2028-01-01
12	Macarrão Espaguete	110.00	2026-12-18
13	Macarrão Penne Integral	50.00	2026-11-22
14	Leite Desnatado (Litros)	200.00	2026-09-10
15	Farinha de Trigo	65.00	2026-10-01
16	Farinha de Mandioca	40.00	2026-12-01
17	Polpa de Acerola	35.00	2026-11-15
18	Polpa de Maracujá	30.00	2026-11-20
19	Banana Prata	85.50	2026-08-05
20	Maçã Gala	90.00	2026-08-10
21	Laranja Pera	120.00	2026-08-12
22	Cenoura fresca	45.00	2026-08-08
23	Batata Inglesa	130.00	2026-08-18
24	Cebola	55.00	2026-08-25
25	Alho Descascado	15.00	2026-09-01
26	Tomate	65.00	2026-08-06
27	Alface Crespa	25.00	2026-08-02
28	Repolho Verde	30.00	2026-08-10
29	Ovos Brancos (Dúzias)	40.00	2026-08-28
30	Queijo Mussarela	25.50	2026-08-30
31	Manteiga com Sal	18.00	2026-10-10
32	Iogurte Natural	80.00	2026-08-22
33	Aveia em Flocos	35.00	2027-01-15
34	Pão Francês (kg)	40.00	2026-07-28
35	Pão de Forma Integral	30.00	2026-08-04
36	Extrato de Tomate	50.00	2027-03-30
37	Milho Verde em Conserva	40.00	2027-06-15
38	Ervilha em Conserva	35.00	2027-06-15
39	Salsicha para Cachorro Quente	40.00	2026-09-05
40	Biscoito Cream Cracker	60.00	2026-12-01
41	Biscoito Maria	55.00	2026-12-05
42	Suco de Caju Concentrado	40.00	2027-01-20
43	Azeite de Oliva Extra Virgem	12.00	2027-08-10
44	Abóbora Cabotiá	35.00	2026-08-20
45	Chuchu	25.00	2026-08-08
46	Beterraba	40.00	2026-08-15
47	Melancia (kg)	75.00	2026-08-03
48	Melão Amarelo	40.00	2026-08-07
49	Atum em Conserva	45.00	2027-10-10
50	Sardinha em Conserva	50.00	2027-11-01
\.


--
-- Data for Name: item_restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_restricao (id_restricao, id_estoque) FROM stdin;
1	1
2	2
3	3
1	11
1	27
1	28
1	29
2	9
2	10
2	12
2	31
2	32
2	37
2	38
3	26
4	26
4	27
4	36
5	6
5	40
1	2
1	3
2	4
2	5
3	7
3	8
4	13
4	14
4	15
5	16
5	17
5	18
1	19
1	20
2	21
2	22
3	23
3	24
4	25
4	30
5	33
5	34
1	35
2	39
3	41
4	42
5	43
1	46
2	47
\.


--
-- Data for Name: merenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merenda (id_cardapio, dt_merenda, qtd_produzida) FROM stdin;
1	2025-06-23 11:00:00	120.00
2	2025-06-24 11:00:00	115.50
1	2025-06-25 11:00:00	118.00
4	2025-06-26 11:00:00	122.00
5	2025-06-27 11:00:00	110.00
6	2025-06-30 11:00:00	125.00
7	2025-07-01 11:00:00	117.50
8	2025-07-02 11:00:00	119.00
9	2025-07-03 11:00:00	121.00
10	2025-07-04 11:00:00	130.00
11	2025-07-07 11:00:00	114.00
12	2025-07-08 11:00:00	116.00
13	2025-07-09 11:00:00	108.50
14	2025-07-10 11:00:00	123.00
15	2025-07-11 11:00:00	105.00
16	2025-07-14 11:00:00	118.50
17	2025-07-15 11:00:00	120.00
18	2025-07-16 11:00:00	112.00
19	2025-07-17 11:00:00	119.50
20	2025-07-18 11:00:00	102.00
21	2025-07-21 11:00:00	124.00
22	2025-07-22 11:00:00	110.00
23	2025-07-23 11:00:00	116.50
24	2025-07-24 11:00:00	121.50
25	2025-07-25 11:00:00	106.00
26	2025-07-28 11:00:00	122.50
27	2025-07-29 11:00:00	128.00
28	2025-07-30 11:00:00	111.00
29	2025-07-31 11:00:00	115.00
30	2025-08-01 11:00:00	117.00
31	2025-08-04 11:00:00	119.00
32	2025-08-05 11:00:00	120.50
33	2025-08-06 11:00:00	113.00
34	2025-08-07 11:00:00	104.00
35	2025-08-08 11:00:00	121.00
36	2025-08-11 11:00:00	118.00
37	2025-08-12 11:00:00	109.50
38	2025-08-13 11:00:00	122.00
39	2025-08-14 11:00:00	110.00
40	2025-08-15 11:00:00	116.00
41	2025-08-18 11:00:00	114.50
42	2025-08-19 11:00:00	107.00
43	2025-08-20 11:00:00	123.50
44	2025-08-21 11:00:00	108.00
45	2025-08-22 11:00:00	117.00
46	2025-08-25 11:00:00	125.00
47	2025-08-26 11:00:00	119.00
3	2025-06-25 11:00:00	100.00
\.


--
-- Data for Name: participacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participacao (id_aluno, id_cardapio, dt_merenda) FROM stdin;
1	1	2025-06-23 11:00:00
2	1	2025-06-23 11:00:00
3	1	2025-06-23 11:00:00
1	2	2025-06-24 11:00:00
2	2	2025-06-24 11:00:00
4	3	2025-06-25 11:00:00
5	3	2025-06-25 11:00:00
6	4	2025-06-26 11:00:00
7	4	2025-06-26 11:00:00
8	5	2025-06-27 11:00:00
9	6	2025-06-30 11:00:00
10	6	2025-06-30 11:00:00
11	7	2025-07-01 11:00:00
12	7	2025-07-01 11:00:00
13	8	2025-07-02 11:00:00
14	9	2025-07-03 11:00:00
15	10	2025-07-04 11:00:00
16	10	2025-07-04 11:00:00
17	11	2025-07-07 11:00:00
18	12	2025-07-08 11:00:00
19	13	2025-07-09 11:00:00
20	14	2025-07-10 11:00:00
21	15	2025-07-11 11:00:00
22	16	2025-07-14 11:00:00
23	17	2025-07-15 11:00:00
24	18	2025-07-16 11:00:00
25	19	2025-07-17 11:00:00
26	20	2025-07-18 11:00:00
27	21	2025-07-21 11:00:00
28	22	2025-07-22 11:00:00
29	23	2025-07-23 11:00:00
30	24	2025-07-24 11:00:00
31	25	2025-07-25 11:00:00
32	26	2025-07-28 11:00:00
33	27	2025-07-29 11:00:00
34	28	2025-07-30 11:00:00
35	29	2025-07-31 11:00:00
36	30	2025-08-01 11:00:00
37	31	2025-08-04 11:00:00
38	32	2025-08-05 11:00:00
39	33	2025-08-06 11:00:00
40	34	2025-08-07 11:00:00
41	35	2025-08-08 11:00:00
42	36	2025-08-11 11:00:00
43	37	2025-08-12 11:00:00
44	38	2025-08-13 11:00:00
45	39	2025-08-14 11:00:00
\.


--
-- Data for Name: restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao (id, descricao) FROM stdin;
1	lactose
2	glutem
3	amendoim
4	ovo
5	leite
6	soja
7	castanhas
8	nozes
9	peixe
10	frutos do mar
11	gergilim
12	milho
13	corantes
14	conservantes
\.


--
-- Data for Name: restricao_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao_aluno (id_aluno, id_restricao) FROM stdin;
1	1
1	2
2	3
3	1
4	4
5	2
6	1
7	5
8	3
9	2
10	4
11	1
12	1
12	3
13	2
14	5
15	4
16	1
17	3
18	2
19	1
20	5
21	2
22	4
23	1
24	3
25	1
25	2
26	5
27	4
28	2
29	1
30	3
31	5
32	2
33	4
34	1
35	3
36	2
37	1
38	5
39	4
40	2
41	1
42	3
43	5
44	2
\.


--
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_seq', 51, true);


--
-- Name: cardapio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_id_seq', 50, true);


--
-- Name: estoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estoque_id_seq', 50, true);


--
-- Name: restricao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restricao_id_seq', 14, true);


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
-- Name: item_restricao pk_item_restricao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT pk_item_restricao PRIMARY KEY (id_restricao, id_estoque);


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
-- Name: idx_ir_restricao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ir_restricao ON public.item_restricao USING btree (id_restricao);


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
-- Name: item_restricao fk_ir_estoque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_estoque FOREIGN KEY (id_estoque) REFERENCES public.estoque(id) ON DELETE CASCADE;


--
-- Name: item_restricao fk_ir_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id) ON DELETE CASCADE;


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

\unrestrict 9jh7IJAyAbVS6oXRuFwPWJINXQnGwgo6XlZUs2jp4aVZcaHehnprBgNkrfzNbMX

