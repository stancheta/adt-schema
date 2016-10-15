CREATE TABLE public.ads_role (
    id_role integer DEFAULT nextval('ads_role_id_role_seq'::regclass) NOT NULL,
    title character varying(100)  NOT NULL,
    visible_private_notes boolean DEFAULT false NOT NULL,
    visible_agreements boolean DEFAULT false NOT NULL,
    template_script text  NULL,
    template_feedback text  NULL,
    template_private_notes text  NULL,
    template_agreements text  NULL,
    id_app integer  NULL,
    CONSTRAINT ads_role_pkey PRIMARY KEY (id_role)) WITHOUT OIDS;