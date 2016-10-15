CREATE TABLE public.adt_coaching (
    id_coaching integer DEFAULT nextval('adt_coaching_id_coaching_seq'::regclass) NOT NULL,
    id_app integer  NOT NULL,
    id_coachee integer  NOT NULL,
    location character varying(150)  NULL,
    script text  NULL,
    feedback text  NULL,
    rubric_tags text  NULL,
    private_notes text  NULL,
    agreements text  NULL,
    CONSTRAINT adt_coaching_pkey PRIMARY KEY (id_coaching),
    CONSTRAINT adt_coaching_id_app_fkey FOREIGN KEY (id_app) REFERENCES ads_app(id_app) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ) WITHOUT OIDS;