CREATE TABLE public.s_table (
    id integer DEFAULT nextval('s_table_id_seq'::regclass) NOT NULL,
    table_name character varying(150)  NOT NULL,
    type_name character varying(150)  NULL,
    id_tabletype integer  NULL,
    table_description text  NULL,
    s_create timestamp(6) without time zone DEFAULT now() NULL,
    s_update timestamp(6) without time zone DEFAULT now() NULL,
    CONSTRAINT s_table_pkey PRIMARY KEY (id),
    CONSTRAINT s_table_id_tabletype_fkey FOREIGN KEY (id_tabletype) REFERENCES s_table_type(id_tabletype) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ) WITHOUT OIDS;