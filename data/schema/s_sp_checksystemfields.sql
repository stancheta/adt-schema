CREATE OR REPLACE FUNCTION public.s_sp_checksystemfields()
 RETURNS void
 LANGUAGE plpgsql
AS $function$

DECLARE
   rec     RECORD;
   query   text;
BEGIN
   FOR rec
      IN SELECT t.table_name,
                tt.has_create,
                tt.has_update,
                tt.has_user
           FROM s_table t
                JOIN s_table_type tt ON t.id_tabletype = tt.id_tabletype
   LOOP
      RAISE NOTICE 'STARTING WORK ON: %', rec.table_name;

      -- S_CREATE field
      IF     (rec.has_create)
         AND ( (SELECT COUNT (*)
                  FROM information_schema.columns
                 WHERE     table_schema = 'public'
                       AND table_name = rec.table_name
                       AND column_name = 's_create') = 0)
      THEN
         query :=
               'ALTER TABLE '
            || rec.table_Name
            || ' ADD COLUMN s_create timestamp DEFAULT now();';
         RAISE NOTICE '    EXECUTING: %', query;

         EXECUTE query;
      ELSE
         RAISE NOTICE '    %.s_create already exists', rec.table_name;
      END IF;

      -- S_USER FIELD
      IF     (rec.has_user)
         AND ( (SELECT COUNT (*)
                  FROM information_schema.columns
                 WHERE     table_schema = 'public'
                       AND table_name = rec.table_name
                       AND column_name = 's_user') = 0)
      THEN
         query :=
               'ALTER TABLE '
            || rec.table_Name
            || ' ADD COLUMN s_user integer ;';
         RAISE NOTICE '    EXECUTING: %', query;

         EXECUTE query;
      ELSE
         RAISE NOTICE '    %.s_user already exists', rec.table_name;
      END IF;

      -- s_update field
      IF (rec.has_update)
      THEN
         -- check to see if the field exists
         IF ( (SELECT COUNT (*)
                 FROM information_schema.columns
                WHERE     table_schema = 'public'
                      AND table_name = rec.table_name
                      AND column_name = 's_update') = 0)
         THEN
            query :=
                  'ALTER TABLE '
               || rec.table_Name
               || ' ADD COLUMN s_update timestamp DEFAULT now();';
            RAISE NOTICE '    EXECUTING: %', query;

            EXECUTE query;
         ELSE
            RAISE NOTICE '    % already has an update field', rec.table_name;
         END IF;

         -- create a trigger to update the s_update field on update ... update update update
         IF ( (SELECT COUNT (*)
                 FROM information_schema.triggers
                WHERE     event_object_table = rec.table_name
                      AND event_manipulation = 'UPDATE'
                      AND action_timing = 'BEFORE') = 0)
         THEN
            query := 'CREATE TRIGGER s_tru_' || rec.table_name || '_s_update';
            query :=
                  query
               || ' BEFORE UPDATE ON '
               || rec.table_name
               || ' FOR EACH ROW ';
            query := query || ' EXECUTE PROCEDURE s_f_update() ;';
            RAISE NOTICE '    EXECUTING: %', query;

            EXECUTE query;
         ELSE
            RAISE NOTICE '    % already has a before update trigger',
            rec.table_name;
         END IF;
      ELSE
         RAISE NOTICE '    % does not get an update field', rec.table_name;
      END IF;
   END LOOP;
END;
$function$
