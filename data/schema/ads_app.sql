CREATE TABLE public.ads_app (
    id_app integer DEFAULT nextval('ads_app_id_app_seq'::regclass) NOT NULL,
    version character varying(10)  NOT NULL,
    title character varying(100)  NOT NULL,
    description text  NULL,
    CONSTRAINT ads_app_pkey PRIMARY KEY (id_app)) WITHOUT OIDS;