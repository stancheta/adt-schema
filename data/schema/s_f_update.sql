CREATE OR REPLACE FUNCTION public.s_f_update()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
   NEW.s_update = now ();
   RETURN NEW;
END;
$function$
