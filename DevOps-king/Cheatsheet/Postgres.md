__Connecting to Postgres__

    psql -h hostname -u username -p<password>

__Changing Table OWNER__

    SELECT 'ALTER TABLE \"'|| schemaname || '.' || tablename ||'\" OWNER TO my_new_owner;'
    FROM pg_tables WHERE NOT schemaname IN ('pg_catalog', 'information_schema')
    ORDER BY schemaname, tablename;

__Changing Sequences OWNER__

    SELECT 'ALTER SEQUENCE \"'|| sequence_schema || '.' || sequence_name ||'\" OWNER TO my_new_owner;'
    FROM information_schema.sequences WHERE NOT sequence_schema IN ('pg_catalog', 'information_schema')
    ORDER BY sequence_schema, sequence_name;

__Changing Views OWNER__

    SELECT 'ALTER VIEW \"'|| table_schema || '.' || table_name ||'\" OWNER TO my_new_owner;'
    FROM information_schema.views WHERE NOT table_schema IN ('pg_catalog', 'information_schema')
    ORDER BY table_schema, table_name;


* List of database: `\l`
* List of database: `SELECT datname FROM pg_database;`
* List table: `\dt`

__Active Connections Postgres__

    select pid as process_id, 
        usename as username, 
        datname as database_name, 
        client_addr as client_address, 
        application_name,
        backend_start,
        state,
        state_change
    from pg_stat_activity;

__Postgres user creation__

    create database treequester;
    create user treequester with encrypted password 'sIXLsajuuQmiMcP0';
    grant all privileges on database treequester to treequester;