CREATE TABLE public.adt_evidence (
    id_evidence integer DEFAULT nextval('adt_evidence_id_evidence_seq'::regclass) NOT NULL,
    id_app integer  NOT NULL,
    id_coaching integer  NOT NULL,
    title character varying(100)  NULL,
    url_path character varying(250)  NULL,
    CONSTRAINT adt_evidence_pkey PRIMARY KEY (id_evidence),
    CONSTRAINT adt_evidence_id_coaching_fkey FOREIGN KEY (id_coaching) REFERENCES adt_coaching(id_coaching) MATCH SIMPLE 
        ON UPDATE NO ACTION ON DELETE NO ACTION ) WITHOUT OIDS;