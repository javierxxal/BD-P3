-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3-beta1
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: PECL1 | type: DATABASE --
-- DROP DATABASE IF EXISTS PECL1;
--CREATE DATABASE PECL1;
-- ddl-end --


-- object: public.CLIENTE | type: TABLE --
-- DROP TABLE IF EXISTS public.CLIENTE CASCADE;
CREATE TABLE public.CLIENTE (
	codigo_cliente char(10) NOT NULL,
	nombre character varying(40),
	direccion character varying(200),
	telefono integer,
	persona_de_contacto character varying(40),
	actividad char(1),
	CONSTRAINT CLIENTE_pk PRIMARY KEY (codigo_cliente)

);
-- ddl-end --
COMMENT ON COLUMN public.CLIENTE.codigo_cliente IS E'Es un código único del cliente y se utiliza para identicarlo.';
-- ddl-end --
COMMENT ON COLUMN public.CLIENTE.direccion IS E'Provincia/Ciudad/Calle/Número de calle';
-- ddl-end --
COMMENT ON COLUMN public.CLIENTE.actividad IS E'Solo es posible que la actividad que realiza el cliente sea: Publicidad y cine , o Moda.';
-- ddl-end --
ALTER TABLE public.CLIENTE OWNER TO postgres;
-- ddl-end --

-- object: public.CASTING | type: TABLE --
-- DROP TABLE IF EXISTS public.CASTING CASCADE;
CREATE TABLE public.CASTING (
	codigo_casting char(10) NOT NULL,
	nombre character varying(40),
	descripcion character varying(1000),
	fecha_de_contratacion date,
	codigo_cliente char(10),
	coste smallint,
	CONSTRAINT CASTING_pk PRIMARY KEY (codigo_casting)

);
-- ddl-end --
COMMENT ON COLUMN public.CASTING.codigo_casting IS E'Código identificatorio del casting';
-- ddl-end --
COMMENT ON COLUMN public.CASTING.nombre IS E'Nombre del casting';
-- ddl-end --
COMMENT ON COLUMN public.CASTING.descripcion IS E'Descrípción general de las carácteristicas y contenidos del casting';
-- ddl-end --
COMMENT ON COLUMN public.CASTING.fecha_de_contratacion IS E'Fecha en la que se contrató el servicio de casting.';
-- ddl-end --
ALTER TABLE public.CASTING OWNER TO postgres;
-- ddl-end --

-- object: public.ONLINE | type: TABLE --
-- DROP TABLE IF EXISTS public.ONLINE CASCADE;
CREATE TABLE public.ONLINE (
	numero_de_personas smallint,
	fecha date,
	plataforma_web character varying(100),
	codigo_casting char(10) NOT NULL,
	CONSTRAINT ONLINE_pk PRIMARY KEY (codigo_casting)

);
-- ddl-end --
COMMENT ON COLUMN public.ONLINE.numero_de_personas IS E'Número de personas que participan en el casting';
-- ddl-end --
COMMENT ON COLUMN public.ONLINE.fecha IS E'Fecha de realización del casting';
-- ddl-end --
COMMENT ON COLUMN public.ONLINE.plataforma_web IS E'Enlace a la platorma web del casting online';
-- ddl-end --
ALTER TABLE public.ONLINE OWNER TO postgres;
-- ddl-end --

-- object: public.PRESENCIAL | type: TABLE --
-- DROP TABLE IF EXISTS public.PRESENCIAL CASCADE;
CREATE TABLE public.PRESENCIAL (
	numero_de_personas smallint,
	codigo_casting char(10) NOT NULL,
	DNI char(9) NOT NULL,
	CONSTRAINT PRESENCIAL_pk PRIMARY KEY (codigo_casting)

);
-- ddl-end --
COMMENT ON COLUMN public.PRESENCIAL.numero_de_personas IS E'Número de personas que participan en el casting presencial';
-- ddl-end --
ALTER TABLE public.PRESENCIAL OWNER TO postgres;
-- ddl-end --

-- object: public.FASE | type: TABLE --
-- DROP TABLE IF EXISTS public.FASE CASCADE;
CREATE TABLE public.FASE (
	codigo_fase char(10) NOT NULL,
	fecha_de_inicio date,
	codigo_casting char(10) NOT NULL,
	CONSTRAINT FASES_pk PRIMARY KEY (codigo_fase,codigo_casting)

);
-- ddl-end --
COMMENT ON TABLE public.FASE IS E'Fases de casting presencial.';
-- ddl-end --
COMMENT ON COLUMN public.FASE.codigo_fase IS E'Número que contabiliza la fase en la que se encuentra el casting';
-- ddl-end --
COMMENT ON COLUMN public.FASE.fecha_de_inicio IS E'Fecha de inicio de la fase';
-- ddl-end --
ALTER TABLE public.FASE OWNER TO postgres;
-- ddl-end --

-- object: public.PRUEBA INDIVIDUAL | type: TABLE --
-- DROP TABLE IF EXISTS public.PRUEBA INDIVIDUAL CASCADE;
CREATE TABLE public.PRUEBA_INDIVIDUAL (
	numero smallint NOT NULL,
	fecha date,
	sala_de_celebracion character varying(200),
	descripcion character varying(1000),
	coste smallint,
	codigo_fase char(10) NOT NULL,
	codigo_casting char(10) NOT NULL,
	CONSTRAINT PRUEBAS_INDIVIDUALES_pk PRIMARY KEY (numero,codigo_fase,codigo_casting)

);
-- ddl-end --
COMMENT ON TABLE public.PRUEBA_INDIVIDUAL IS E'Pruebas a cada uno de los participantes de un casting dentro de una o varias fases determinadas.';
-- ddl-end --
COMMENT ON COLUMN public.PRUEBA_INDIVIDUAL.numero IS E'Número de prueba dentro de cada fase';
-- ddl-end --
COMMENT ON COLUMN public.PRUEBA_INDIVIDUAL.fecha IS E'Fecha de realización de la prueba individual';
-- ddl-end --
COMMENT ON COLUMN public.PRUEBA_INDIVIDUAL.sala_de_celebracion IS E'Lugar de realización de la prueba individual';
-- ddl-end --
ALTER TABLE public.PRUEBA_INDIVIDUAL OWNER TO postgres;
-- ddl-end --

-- object: public.AGENTE | type: TABLE --
-- DROP TABLE IF EXISTS public.AGENTE CASCADE;
CREATE TABLE public.AGENTE (
	DNI char(9) NOT NULL,
	nombre character varying(40),
	direccion character varying(300),
	CONSTRAINT AGENTE_pk PRIMARY KEY (DNI)

);
-- ddl-end --
COMMENT ON TABLE public.AGENTE IS E'Agente que dirige un casting';
-- ddl-end --
COMMENT ON COLUMN public.AGENTE.nombre IS E'Nombre del agente';
-- ddl-end --
COMMENT ON COLUMN public.AGENTE.direccion IS E'Lugar de residencia de un agente\nProvincia/Ciudad/Calle/Número';
-- ddl-end --
ALTER TABLE public.AGENTE OWNER TO postgres;
-- ddl-end --

-- object: public.CANDIDATOS | type: TABLE --
-- DROP TABLE IF EXISTS public.CANDIDATOS CASCADE;
CREATE TABLE public.CANDIDATOS (
	codigo_candidato char(10) NOT NULL,
	nombre character varying(40),
	direccion character varying(300),
	telefono integer,
	fecha_de_nacimiento date,
	importe_total smallint DEFAULT 0,
	nif_representante char(9),
	codigo_de_perfil char(10) NOT NULL,
	CONSTRAINT CANDIDATOS_pk PRIMARY KEY (codigo_candidato)

);
-- ddl-end --
COMMENT ON COLUMN public.CANDIDATOS.direccion IS E'Lugar de residencia de un candidato\nProvincia/Ciudad/Calle/Número';
-- ddl-end --
COMMENT ON COLUMN public.CANDIDATOS.telefono IS E'Teléfono de contacto del candidatop';
-- ddl-end --
COMMENT ON COLUMN public.CANDIDATOS.fecha_de_nacimiento IS E'Fecha de nacimiento del candidato';
-- ddl-end --
COMMENT ON COLUMN public.CANDIDATOS.importe_total IS E'Dinero total pagado por el candidato por todas las pruebas que ha realizado.';
-- ddl-end --
ALTER TABLE public.CANDIDATOS OWNER TO postgres;
-- ddl-end --

-- object: public.PERFIL | type: TABLE --
-- DROP TABLE IF EXISTS public.PERFIL CASCADE;
CREATE TABLE public.PERFIL (
	codigo_de_perfil char(10) NOT NULL,
	provincia character varying(40),
	sexo char(1),
	altura smallint,
	edad smallint,
	color_del_pelo character varying(20),
	color_de_ojos character varying(20),
	especialidad character varying(6),
	experiencia boolean,
	CONSTRAINT PERFIL_pk PRIMARY KEY (codigo_de_perfil)

);
-- ddl-end --
COMMENT ON COLUMN public.PERFIL.codigo_de_perfil IS E'Código de identificación del perfil';
-- ddl-end --
COMMENT ON COLUMN public.PERFIL.provincia IS E'Provincia en la que reside el candidato';
-- ddl-end --
COMMENT ON COLUMN public.PERFIL.sexo IS E'Género del candidato\n[M: Maculino,F: Femenino,N: No binario]';
-- ddl-end --
COMMENT ON COLUMN public.PERFIL.color_del_pelo IS E'Color del pelo del candidato.';
-- ddl-end --
COMMENT ON COLUMN public.PERFIL.especialidad IS E'Puede ser : modelo o actor.';
-- ddl-end --
COMMENT ON COLUMN public.PERFIL.experiencia IS E'Si tiene experienca o no el candidato';
-- ddl-end --
ALTER TABLE public.PERFIL OWNER TO postgres;
-- ddl-end --

-- object: public.ADULTOS | type: TABLE --
-- DROP TABLE IF EXISTS public.ADULTOS CASCADE;
CREATE TABLE public.ADULTOS (
	DNI char(9) NOT NULL,
	codigo_candidato char(10) NOT NULL,
	CONSTRAINT ADULTOS_pk PRIMARY KEY (DNI)

);
-- ddl-end --
ALTER TABLE public.ADULTOS OWNER TO postgres;
-- ddl-end --

-- object: public.niño | type: TABLE --
-- DROP TABLE IF EXISTS public.NIÑO CASCADE;
CREATE TABLE public.niño (
	nombre_tutor character varying(40),
	codigo_candidato char(10) NOT NULL,
	CONSTRAINT niño_pk PRIMARY KEY (codigo_candidato)

);
-- ddl-end --
COMMENT ON COLUMN public.niño.nombre_tutor IS E'Nombre del tutor legal del menor.';
-- ddl-end --
ALTER TABLE public.niño OWNER TO postgres;
-- ddl-end --

-- object: public.REPRESENTANTE | type: TABLE --
-- DROP TABLE IF EXISTS public.REPRESENTANTE CASCADE;
CREATE TABLE public.REPRESENTANTE (
	NIF char(9) NOT NULL,
	nombre character varying(40),
	telefono integer,
	direccion character varying(300),
	CONSTRAINT REPRESENTANTE_pk PRIMARY KEY (NIF)

);
-- ddl-end --
COMMENT ON COLUMN public.REPRESENTANTE.direccion IS E'Lugar de residencia de un representante\nProvincia/Ciudad/Calle/Número';
-- ddl-end --
ALTER TABLE public.REPRESENTANTE OWNER TO postgres;
-- ddl-end --

-- object: CLIENTE_fk | type: CONSTRAINT --
-- ALTER TABLE public.CASTING DROP CONSTRAINT IF EXISTS CLIENTE_fk CASCADE;
ALTER TABLE public.CASTING ADD CONSTRAINT CLIENTE_fk FOREIGN KEY (codigo_cliente)
REFERENCES public.CLIENTE (codigo_cliente) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: CASTING_fk | type: CONSTRAINT --
-- ALTER TABLE public.ONLINE DROP CONSTRAINT IF EXISTS CASTING_fk CASCADE;
ALTER TABLE public.ONLINE ADD CONSTRAINT CASTING_fk FOREIGN KEY (codigo_casting)
REFERENCES public.CASTING (codigo_casting) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: CASTING_fk | type: CONSTRAINT --
-- ALTER TABLE public.PRESENCIAL DROP CONSTRAINT IF EXISTS CASTING_fk CASCADE;
ALTER TABLE public.PRESENCIAL ADD CONSTRAINT CASTING_fk FOREIGN KEY (codigo_casting)
REFERENCES public.CASTING (codigo_casting) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: PRESENCIAL_fk | type: CONSTRAINT --
-- ALTER TABLE public.FASE DROP CONSTRAINT IF EXISTS PRESENCIAL_fk CASCADE;
ALTER TABLE public.FASE ADD CONSTRAINT PRESENCIAL_fk FOREIGN KEY (codigo_casting)
REFERENCES public.PRESENCIAL (codigo_casting) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: FASE_fk | type: CONSTRAINT --
-- ALTER TABLE public.PRUEBA INDIVIDUAL DROP CONSTRAINT IF EXISTS FASE_fk CASCADE;
ALTER TABLE public.PRUEBA_INDIVIDUAL ADD CONSTRAINT FASE_fk FOREIGN KEY (codigo_fase,codigo_casting)
REFERENCES public.FASE (codigo_fase,codigo_casting) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.candidato_realiza_prueba | type: TABLE --
-- DROP TABLE IF EXISTS public.candidato_realiza_prueba CASCADE;
CREATE TABLE public.candidato_realiza_prueba (
	codigo_candidato char(10) NOT NULL,
	numero smallint NOT NULL,
	codigo_fase char(10) NOT NULL,
	codigo_casting char(10) NOT NULL,
	resultado_prueba bool,
	CONSTRAINT candidato_realiza_prueba_pk PRIMARY KEY (codigo_candidato,numero,codigo_fase,codigo_casting)

);
-- ddl-end --

-- object: CANDIDATOS_fk | type: CONSTRAINT --
-- ALTER TABLE public.candidato_realiza_prueba DROP CONSTRAINT IF EXISTS CANDIDATOS_fk CASCADE;
ALTER TABLE public.candidato_realiza_prueba ADD CONSTRAINT CANDIDATOS_fk FOREIGN KEY (codigo_candidato)
REFERENCES public.CANDIDATOS (codigo_candidato) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PRUEBA INDIVIDUAL_fk | type: CONSTRAINT --
-- ALTER TABLE public.candidato_realiza_prueba DROP CONSTRAINT IF EXISTS PRUEBA INDIVIDUAL_fk CASCADE;
ALTER TABLE public.candidato_realiza_prueba ADD CONSTRAINT PRUEBA_INDIVIDUAL_fk FOREIGN KEY (numero,codigo_fase,codigo_casting)
REFERENCES public.PRUEBA_INDIVIDUAL (numero,codigo_fase,codigo_casting) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: REPRESENTANTE_fk | type: CONSTRAINT --
-- ALTER TABLE public.CANDIDATOS DROP CONSTRAINT IF EXISTS REPRESENTANTE_fk CASCADE;
ALTER TABLE public.CANDIDATOS ADD CONSTRAINT REPRESENTANTE_fk FOREIGN KEY (nif_representante)
REFERENCES public.REPRESENTANTE (NIF) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: CANDIDATOS_fk | type: CONSTRAINT --
-- ALTER TABLE public.ADULTOS DROP CONSTRAINT IF EXISTS CANDIDATOS_fk CASCADE;
ALTER TABLE public.ADULTOS ADD CONSTRAINT CANDIDATOS_fk FOREIGN KEY (codigo_candidato)
REFERENCES public.CANDIDATOS (codigo_candidato) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: ADULTOS_uq | type: CONSTRAINT --
-- ALTER TABLE public.ADULTOS DROP CONSTRAINT IF EXISTS ADULTOS_uq CASCADE;
ALTER TABLE public.ADULTOS ADD CONSTRAINT ADULTOS_uq UNIQUE (codigo_candidato);
-- ddl-end --

-- object: CANDIDATOS_fk | type: CONSTRAINT --
-- ALTER TABLE public.niño DROP CONSTRAINT IF EXISTS CANDIDATOS_fk CASCADE;
ALTER TABLE public.niño ADD CONSTRAINT CANDIDATOS_fk FOREIGN KEY (codigo_candidato)
REFERENCES public.CANDIDATOS (codigo_candidato) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: PERFIL_fk | type: CONSTRAINT --
-- ALTER TABLE public.CANDIDATOS DROP CONSTRAINT IF EXISTS PERFIL_fk CASCADE;
ALTER TABLE public.CANDIDATOS ADD CONSTRAINT PERFIL_fk FOREIGN KEY (codigo_de_perfil)
REFERENCES public.PERFIL (codigo_de_perfil) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: CANDIDATOS_uq | type: CONSTRAINT --
-- ALTER TABLE public.CANDIDATOS DROP CONSTRAINT IF EXISTS CANDIDATOS_uq CASCADE;
ALTER TABLE public.CANDIDATOS ADD CONSTRAINT CANDIDATOS_uq UNIQUE (codigo_de_perfil);
-- ddl-end --

-- object: public.casting_necesita_perfil | type: TABLE --
-- DROP TABLE IF EXISTS public.casting_necesita_perfil CASCADE;
CREATE TABLE public.casting_necesita_perfil (
	codigo_casting char(10) NOT NULL,
	codigo_de_perfil char(10) NOT NULL,
	CONSTRAINT casting_necesita_perfil_pk PRIMARY KEY (codigo_casting,codigo_de_perfil)

);
-- ddl-end --

-- object: CASTING_fk | type: CONSTRAINT --
-- ALTER TABLE public.casting_necesita_perfil DROP CONSTRAINT IF EXISTS CASTING_fk CASCADE;
ALTER TABLE public.casting_necesita_perfil ADD CONSTRAINT CASTING_fk FOREIGN KEY (codigo_casting)
REFERENCES public.CASTING (codigo_casting) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PERFIL_fk | type: CONSTRAINT --
-- ALTER TABLE public.casting_necesita_perfil DROP CONSTRAINT IF EXISTS PERFIL_fk CASCADE;
ALTER TABLE public.casting_necesita_perfil ADD CONSTRAINT PERFIL_fk FOREIGN KEY (codigo_de_perfil)
REFERENCES public.PERFIL (codigo_de_perfil) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: AGENTE_fk | type: CONSTRAINT --
-- ALTER TABLE public.PRESENCIAL DROP CONSTRAINT IF EXISTS AGENTE_fk CASCADE;
ALTER TABLE public.PRESENCIAL ADD CONSTRAINT AGENTE_fk FOREIGN KEY (DNI)
REFERENCES public.AGENTE (DNI) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.CONTRATA | type: TABLE --
-- DROP TABLE IF EXISTS public.CONTRATA CASCADE;
CREATE TABLE public.CONTRATA (
	codigo_casting char(10) NOT NULL,
	codigo_candidato char(10) NOT NULL,
	CONSTRAINT contrata_pk PRIMARY KEY (codigo_casting,codigo_candidato)

);
-- ddl-end --
ALTER TABLE public.CONTRATA OWNER TO postgres;
-- ddl-end --
