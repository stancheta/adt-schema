CREATE TABLE public.ads_rubric_link (
    id integer DEFAULT nextval('ads_rubric_link_id_seq'::regclass) NOT NULL,
    id_role integer  NOT NULL,
    id_rubric integer  NOT NULL,
    CONSTRAINT ads_rubric_link_pkey PRIMARY KEY (id),
    CONSTRAINT ads_rubric_link_id_role_fkey FOREIGN KEY (id_role) REFERENCES ads_role(id_role) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ,
    CONSTRAINT ads_rubric_link_id_rubric_fkey FOREIGN KEY (id_rubric) REFERENCES ads_rubric(id_rubric) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ) WITHOUT OIDS;