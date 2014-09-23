--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-07-02 21:06:13

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
-- TOC entry 2039 (class 0 OID 0)
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
-- TOC entry 2040 (class 0 OID 0)
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
    id_article bigserial,
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

--
-- TOC entry 172 (class 1259 OID 16401)
-- Name: Auteur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auteur (
    id_auteur bigserial,
    nom_auteur character varying(100),
    prenom_auteur character varying(100),
    email_auteur character varying(100),
    sit_auteur character varying(100),
    compte_auteur character varying(100)
);

--
-- TOC entry 174 (class 1259 OID 16409)
-- Name: Categorie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categorie (
    id_categorie bigserial,
    libelle_categorie character varying(100)
);

CREATE TABLE commentaire (
    id_commentaire bigserial,
    commentaire text,
    "idArticles" integer,
    iduser integer
);


CREATE TABLE "Flux_rss" (
    id_flux_rss bigserial,
    xpath_flux_rss character varying(200),
    lien_flux_rss character varying(200),
    id_site_ref integer
);

--
-- TOC entry 180 (class 1259 OID 16427)
-- Name: SiteReferent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE site_referent (
    id_site_ref bigserial,
    nom_site_ref character varying(200),
    lien_site_ref character varying(200),
    id_articles integer,
    id_user integer
);

CREATE TABLE utilisateur (
    id_utilisateur bigserial,
    nom_utisateur character varying(100),
    prenom_utilisateur character varying(100),
    email_utilisateur character varying(100),
    salt character varying(40),
    mot_passe character varying(200)
);

CREATE TABLE menu (
    menu_id bigserial,
    nom_menu character varying(100),
    route character varying(200)
);

CREATE TABLE scraping_job (
    started_time date,
    updated_time date,
    id character varying(150) NOT NULL,
    spider character varying(80)
);


CREATE TABLE source (
    id_source bigserial,
    nom_source character varying(100),
    url_source character varying(200),
    id_articles integer
);


CREATE TABLE spider (
    spider character varying(80) NOT NULL
);

--
-- TOC entry 1901 (class 2606 OID 16460)
-- Name: commentaire_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY commentaire
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

ALTER TABLE ONLY site_referent
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

ALTER TABLE ONLY auteur
    ADD CONSTRAINT pk_auteur PRIMARY KEY (id_auteur);


--
-- TOC entry 1899 (class 2606 OID 16468)
-- Name: pk_categorie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categorie
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

ALTER TABLE ONLY utilisateur
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

ALTER TABLE ONLY site_referent
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
    ADD CONSTRAINT fk_auteur_article FOREIGN KEY (id_auteur) REFERENCES auteur(id_auteur);


--
-- TOC entry 1917 (class 2606 OID 16492)
-- Name: fk_categorie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT fk_categorie FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie);


--
-- TOC entry 1919 (class 2606 OID 16497)
-- Name: fk_flux_site_referent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Flux_rss"
    ADD CONSTRAINT fk_flux_site_referent FOREIGN KEY (id_site_ref) REFERENCES site_referent(id_site_ref);


--
-- TOC entry 1918 (class 2606 OID 16502)
-- Name: fk_user_commentaire; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY commentaire
    ADD CONSTRAINT fk_user_commentaire FOREIGN KEY (iduser) REFERENCES utilisateur(id_utilisateur);


--
-- TOC entry 1921 (class 2606 OID 16507)
-- Name: fk_user_site; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY site_referent
    ADD CONSTRAINT fk_user_site FOREIGN KEY (id_user) REFERENCES utilisateur(id_utilisateur);


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-07-02 21:06:14

--
-- PostgreSQL database dump complete
--

