CREATE TABLE public.s_table_type (
    id_tabletype integer DEFAULT nextval('s_table_type_id_tabletype_seq'::regclass) NOT NULL,
    type_name character varying(150)  NOT NULL,
    type_description text  NULL,
    has_create boolean DEFAULT false NULL,
    has_update boolean DEFAULT false NULL,
    prefix character varying(20)  NULL,
    has_user boolean DEFAULT false NULL,
    s_create timestamp(6) without time zone DEFAULT now() NULL,
    s_update timestamp(6) without time zone DEFAULT now() NULL,
    CONSTRAINT s_table_type_pkey PRIMARY KEY (id_tabletype)) WITHOUT OIDS;