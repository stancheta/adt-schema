CREATE TABLE public.ads_rubric (
    id_rubric integer DEFAULT nextval('ads_rubric_id_rubric_seq'::regclass) NOT NULL,
    id_app integer  NOT NULL,
    title character varying(100)  NOT NULL,
    description text  NULL,
    tags text  NULL,
    CONSTRAINT ads_rubric_pkey PRIMARY KEY (id_rubric)) WITHOUT OIDS;