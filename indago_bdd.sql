--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-07-02 22:43:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2036 (class 1262 OID 12029)
-- Dependencies: 2035
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 191 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 191
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 190 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 190
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 16393)
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE articles (
    id_article bigint NOT NULL,
    titre_article character varying(200),
    contenu_article text,
    couv_article text,
    description text,
    id_auteur integer,
    id_categorie integer,
    url character varying(500),
    creation_date timestamp with time zone DEFAULT now(),
    publication_date character varying(30),
    sources text
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16399)
-- Name: Articles_id_articles_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Articles_id_articles_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Articles_id_articles_seq" OWNER TO postgres;

--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 171
-- Name: Articles_id_articles_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Articles_id_articles_seq" OWNED BY articles.id_article;


--
-- TOC entry 172 (class 1259 OID 16401)
-- Name: Auteur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Auteur" (
    id_auteur bigint NOT NULL,
    nom_auteur character varying(100),
    prenom_auteur character varying(100),
    email_auteur character varying(100),
    sit_auteur character varying(100),
    compte_auteur character varying(100)
);


ALTER TABLE public."Auteur" OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16407)
-- Name: Auteur_id_auteur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Auteur_id_auteur_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Auteur_id_auteur_seq" OWNER TO postgres;

--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 173
-- Name: Auteur_id_auteur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Auteur_id_auteur_seq" OWNED BY "Auteur".id_auteur;


--
-- TOC entry 174 (class 1259 OID 16409)
-- Name: Categorie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Categorie" (
    id_categorie bigint NOT NULL,
    libelle_categorie character varying(100)
);


ALTER TABLE public."Categorie" OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16412)
-- Name: Categorie_idcategorie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Categorie_idcategorie_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Categorie_idcategorie_seq" OWNER TO postgres;

--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 175
-- Name: Categorie_idcategorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Categorie_idcategorie_seq" OWNED BY "Categorie".id_categorie;


--
-- TOC entry 176 (class 1259 OID 16414)
-- Name: Commentaire; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Commentaire" (
    id_commentaire bigint NOT NULL,
    "Commentaire" text,
    "idArticles" integer,
    iduser integer
);


ALTER TABLE public."Commentaire" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16420)
-- Name: Commentaire_idCommentaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Commentaire_idCommentaire_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Commentaire_idCommentaire_seq" OWNER TO postgres;

--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 177
-- Name: Commentaire_idCommentaire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Commentaire_idCommentaire_seq" OWNED BY "Commentaire".id_commentaire;


--
-- TOC entry 178 (class 1259 OID 16422)
-- Name: Flux_rss; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Flux_rss" (
    id_flux_rss bigint NOT NULL,
    xpath_flux_rss character varying(200),
    lien_flux_rss character varying(200),
    id_site_ref integer
);


ALTER TABLE public."Flux_rss" OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16425)
-- Name: Flux_rss_id_flux_rss_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Flux_rss_id_flux_rss_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Flux_rss_id_flux_rss_seq" OWNER TO postgres;

--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 179
-- Name: Flux_rss_id_flux_rss_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Flux_rss_id_flux_rss_seq" OWNED BY "Flux_rss".id_flux_rss;


--
-- TOC entry 180 (class 1259 OID 16427)
-- Name: SiteReferent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "SiteReferent" (
    id_site_ref bigint NOT NULL,
    nom_site_ref character varying(200),
    lien_site_ref character varying(200),
    id_articles integer,
    id_user integer
);


ALTER TABLE public."SiteReferent" OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16430)
-- Name: SiteReferent_id_site_ref_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "SiteReferent_id_site_ref_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SiteReferent_id_site_ref_seq" OWNER TO postgres;

--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 181
-- Name: SiteReferent_id_site_ref_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "SiteReferent_id_site_ref_seq" OWNED BY "SiteReferent".id_site_ref;


--
-- TOC entry 182 (class 1259 OID 16432)
-- Name: Utilisateur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Utilisateur" (
    id_utilisateur bigint NOT NULL,
    nom_utisateur character varying(100),
    prenom_utilisateur character varying(100),
    email_utilisateur character varying(100),
    salt character varying(40),
    mot_passe character varying(200)
);


ALTER TABLE public."Utilisateur" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16438)
-- Name: Ulisateur_id_utilisateur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Ulisateur_id_utilisateur_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ulisateur_id_utilisateur_seq" OWNER TO postgres;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 183
-- Name: Ulisateur_id_utilisateur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Ulisateur_id_utilisateur_seq" OWNED BY "Utilisateur".id_utilisateur;


--
-- TOC entry 184 (class 1259 OID 16440)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu (
    menu_id bigint NOT NULL,
    nom_menu character varying(100),
    route character varying(200)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16443)
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO postgres;

--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 185
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.menu_id;


--
-- TOC entry 189 (class 1259 OID 24704)
-- Name: scraping_job; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE scraping_job (
    started_time timestamp with time zone,
    updated_time timestamp with time zone,
    id character varying(150) NOT NULL,
    spider character varying(80)
);


ALTER TABLE public.scraping_job OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16445)
-- Name: source; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE source (
    id_source bigint NOT NULL,
    nom_source character varying(100),
    url_source character varying(200),
    id_articles integer
);


ALTER TABLE public.source OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16448)
-- Name: source_id_source_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE source_id_source_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_id_source_seq OWNER TO postgres;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 187
-- Name: source_id_source_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE source_id_source_seq OWNED BY source.id_source;


--
-- TOC entry 188 (class 1259 OID 24699)
-- Name: spider; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spider (
    spider character varying(80) NOT NULL
);


ALTER TABLE public.spider OWNER TO postgres;

--
-- TOC entry 1886 (class 2604 OID 16512)
-- Name: id_auteur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Auteur" ALTER COLUMN id_auteur SET DEFAULT nextval('"Auteur_id_auteur_seq"'::regclass);


--
-- TOC entry 1887 (class 2604 OID 16513)
-- Name: id_categorie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Categorie" ALTER COLUMN id_categorie SET DEFAULT nextval('"Categorie_idcategorie_seq"'::regclass);


--
-- TOC entry 1888 (class 2604 OID 16514)
-- Name: id_commentaire; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Commentaire" ALTER COLUMN id_commentaire SET DEFAULT nextval('"Commentaire_idCommentaire_seq"'::regclass);


--
-- TOC entry 1889 (class 2604 OID 16515)
-- Name: id_flux_rss; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Flux_rss" ALTER COLUMN id_flux_rss SET DEFAULT nextval('"Flux_rss_id_flux_rss_seq"'::regclass);


--
-- TOC entry 1890 (class 2604 OID 16516)
-- Name: id_site_ref; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SiteReferent" ALTER COLUMN id_site_ref SET DEFAULT nextval('"SiteReferent_id_site_ref_seq"'::regclass);


--
-- TOC entry 1891 (class 2604 OID 16517)
-- Name: id_utilisateur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Utilisateur" ALTER COLUMN id_utilisateur SET DEFAULT nextval('"Ulisateur_id_utilisateur_seq"'::regclass);


--
-- TOC entry 1884 (class 2604 OID 16518)
-- Name: id_article; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles ALTER COLUMN id_article SET DEFAULT nextval('"Articles_id_articles_seq"'::regclass);


--
-- TOC entry 1892 (class 2604 OID 16519)
-- Name: menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN menu_id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- TOC entry 1893 (class 2604 OID 16520)
-- Name: id_source; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY source ALTER COLUMN id_source SET DEFAULT nextval('source_id_source_seq'::regclass);


--
-- TOC entry 1901 (class 2606 OID 16460)
-- Name: commentaire_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Commentaire"
    ADD CONSTRAINT commentaire_primary_key PRIMARY KEY (id_commentaire);


--
-- TOC entry 1915 (class 2606 OID 24708)
-- Name: cp_job_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY scraping_job
    ADD CONSTRAINT cp_job_id PRIMARY KEY (id);


--
-- TOC entry 1905 (class 2606 OID 16462)
-- Name: fk_site_ref; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "SiteReferent"
    ADD CONSTRAINT fk_site_ref PRIMARY KEY (id_site_ref);


--
-- TOC entry 1895 (class 2606 OID 16464)
-- Name: pk_article; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT pk_article PRIMARY KEY (id_article);


--
-- TOC entry 1897 (class 2606 OID 16466)
-- Name: pk_auteur; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Auteur"
    ADD CONSTRAINT pk_auteur PRIMARY KEY (id_auteur);


--
-- TOC entry 1899 (class 2606 OID 16468)
-- Name: pk_categorie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Categorie"
    ADD CONSTRAINT pk_categorie PRIMARY KEY (id_categorie);


--
-- TOC entry 1903 (class 2606 OID 16470)
-- Name: pk_flux_rss; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Flux_rss"
    ADD CONSTRAINT pk_flux_rss PRIMARY KEY (id_flux_rss);


--
-- TOC entry 1909 (class 2606 OID 16472)
-- Name: pk_menu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (menu_id);


--
-- TOC entry 1911 (class 2606 OID 16474)
-- Name: pk_source; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY source
    ADD CONSTRAINT pk_source PRIMARY KEY (id_source);


--
-- TOC entry 1913 (class 2606 OID 24703)
-- Name: pk_spider_name; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spider
    ADD CONSTRAINT pk_spider_name PRIMARY KEY (spider);


--
-- TOC entry 1907 (class 2606 OID 16476)
-- Name: pk_utilisateur; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Utilisateur"
    ADD CONSTRAINT pk_utilisateur PRIMARY KEY (id_utilisateur);


--
-- TOC entry 1923 (class 2606 OID 24709)
-- Name: ce_job_spider; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scraping_job
    ADD CONSTRAINT ce_job_spider FOREIGN KEY (spider) REFERENCES spider(spider);


--
-- TOC entry 1920 (class 2606 OID 16477)
-- Name: fk_article_site_ref; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SiteReferent"
    ADD CONSTRAINT fk_article_site_ref FOREIGN KEY (id_articles) REFERENCES articles(id_article);


--
-- TOC entry 1922 (class 2606 OID 16482)
-- Name: fk_article_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY source
    ADD CONSTRAINT fk_article_source FOREIGN KEY (id_articles) REFERENCES articles(id_article);


--
-- TOC entry 1916 (class 2606 OID 16487)
-- Name: fk_auteur_article; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT fk_auteur_article FOREIGN KEY (id_auteur) REFERENCES "Auteur"(id_auteur);


--
-- TOC entry 1917 (class 2606 OID 16492)
-- Name: fk_categorie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT fk_categorie FOREIGN KEY (id_categorie) REFERENCES "Categorie"(id_categorie);


--
-- TOC entry 1919 (class 2606 OID 16497)
-- Name: fk_flux_site_referent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Flux_rss"
    ADD CONSTRAINT fk_flux_site_referent FOREIGN KEY (id_site_ref) REFERENCES "SiteReferent"(id_site_ref);


--
-- TOC entry 1918 (class 2606 OID 16502)
-- Name: fk_user_commentaire; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Commentaire"
    ADD CONSTRAINT fk_user_commentaire FOREIGN KEY (iduser) REFERENCES "Utilisateur"(id_utilisateur);


--
-- TOC entry 1921 (class 2606 OID 16507)
-- Name: fk_user_site; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "SiteReferent"
    ADD CONSTRAINT fk_user_site FOREIGN KEY (id_user) REFERENCES "Utilisateur"(id_utilisateur);


-- Completed on 2014-07-02 22:43:46

--
-- PostgreSQL database dump complete
--

