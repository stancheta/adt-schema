CREATE OR REPLACE FUNCTION public.s_sp_update_s_table()
 RETURNS void
 LANGUAGE plpgsql
AS $function$ 

BEGIN
    RAISE NOTICE 'CHECKING DATABSE FOR NEW TABLES';
	
	INSERT INTO s_table ( table_name ) 
	SELECT table_name from information_schema.tables 
		WHERE table_schema = 'public' and table_type='BASE TABLE' AND  table_name NOT IN (SELECT table_name from s_table);
		
	
	RAISE NOTICE 'UPDATING s_table with table type info';
	UPDATE s_table 
		SET id_tabletype = s_table_type.id_tabletype, 
			type_name = s_table_type.type_name  
		FROM s_table_type 
		where s_table_type.prefix = left(s_table.table_name, LENGTH(s_table_type.prefix));
END;

$function$
