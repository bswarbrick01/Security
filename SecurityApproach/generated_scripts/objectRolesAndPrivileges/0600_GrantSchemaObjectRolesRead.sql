/*********************************************************************************************************************************************/
/*  Create Database Level Read across all schemas                                                                                             /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Read Privileges                                               */
/************************************************************************/

use role <SCOPE>_<ENV>_ADMIN;

use database <DBNAME>_<ENV>;

use schema   <SCHEMANAME>;

/*****************************/
/*  DB/Schema Usage          */
/*****************************/

grant usage on database                   <DBNAME>_<ENV>                          to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant usage on schema                     <SCHEMANAME>                            to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

/*****************************/
/*  Current Privileges       */
/*****************************/

grant select      on    all tables in schema                   <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant references  on    all tables in schema                   <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant select      on    all views in schema                    <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant references  on    all views in schema                    <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant select      on    all materialized views in schema       <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant references  on    all materialized views in schema       <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant select      on    all external tables in schema          <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant references  on    all external tables in schema          <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant select      on    all streams in schema                  <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant usage       on    all functions in schema                 <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

/*****************************/
/*  Future Privileges        */
/*****************************/

grant select      on    future tables in schema                <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant references  on    future tables in schema                <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant select      on    future views in schema                 <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant references  on    future views in schema                 <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant select      on    future materialized views in schema    <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant references  on    future materialized views in schema    <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant select      on    future external tables in schema       <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
grant references  on    future external tables in schema       <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant select      on    future streams in schema               <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;

grant usage       on    future functions in schema             <SCHEMANAME>       to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ;
