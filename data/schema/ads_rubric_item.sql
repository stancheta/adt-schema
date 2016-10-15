CREATE TABLE public.ads_rubric_item (
    id_item integer DEFAULT nextval('ads_rubric_item_id_item_seq'::regclass) NOT NULL,
    id_app integer  NOT NULL,
    id_rubric integer  NOT NULL,
    title character varying(100)  NOT NULL,
    description text  NULL,
    CONSTRAINT ads_rubric_item_pkey PRIMARY KEY (id_item),
    CONSTRAINT ads_rubric_item_id_app_fkey FOREIGN KEY (id_app) REFERENCES ads_app(id_app) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ,
    CONSTRAINT ads_rubric_item_id_rubric_fkey FOREIGN KEY (id_rubric) REFERENCES ads_rubric(id_rubric) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ) WITHOUT OIDS;