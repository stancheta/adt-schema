CREATE TABLE public.ads_user (
    id_user integer DEFAULT nextval('ads_user_id_user_seq'::regclass) NOT NULL,
    id_app integer  NOT NULL,
    user_name character varying(100)  NOT NULL,
    first_name character varying(50)  NULL,
    last_name character varying(50)  NULL,
    user_email character varying(150)  NULL,
    id_role integer  NULL,
    CONSTRAINT ads_user_pkey PRIMARY KEY (id_user),
    CONSTRAINT ads_user_id_role_fkey FOREIGN KEY (id_role) REFERENCES ads_role(id_role) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ) WITHOUT OIDS;