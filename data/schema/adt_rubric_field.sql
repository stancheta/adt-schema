CREATE TABLE public.adt_rubric_field (
    id_rubric_field integer DEFAULT nextval('adt_rubric_field_id_rubric_field_seq'::regclass) NOT NULL,
    id_app integer  NOT NULL,
    id_rubric integer  NOT NULL,
    id_item integer  NULL,
    id_coaching integer  NOT NULL,
    title character varying(100)  NULL,
    score integer  NULL,
    CONSTRAINT adt_rubric_field_pkey PRIMARY KEY (id_rubric_field),
    CONSTRAINT adt_rubric_field_id_app_fkey FOREIGN KEY (id_app) REFERENCES ads_app(id_app) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ) WITHOUT OIDS;