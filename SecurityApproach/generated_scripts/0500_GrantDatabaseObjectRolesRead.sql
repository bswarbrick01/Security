/*********************************************************************************************************************************************/
/*  Create Database Level Read across all schemas                                                                                             /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Read Privileges                                               */
/************************************************************************/

use role <SCOPE>_<ENV>_ADMIN;

use database <DBNAME>_<ENV>;

/*****************************/
/*  DB/Schema Usage          */
/*****************************/

grant usage on database                   <DBNAME>_<ENV>                              to role <SCOPE>_<ENV>_<DBNAME>_READ;
grant usage on all schemas    in database <DBNAME>_<ENV>                              to role <SCOPE>_<ENV>_<DBNAME>_READ;

grant usage on future schemas in database <DBNAME>_<ENV>                              to role <SCOPE>_<ENV>_<DBNAME>_READ;

/*****************************/
/*  Current Privileges       */
/*****************************/

grant select      on    all tables in database                   <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_READ;
grant references  on    all tables in database                   <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_READ;

grant select      on    all views in database                    <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_READ;
grant references  on    all views in database                    <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_READ;

grant select      on    all external tables in database          <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_READ;
grant references  on    all external tables in database          <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_READ;


/*****************************/
/*  Future Privileges        */
/*****************************/

grant select      on     future tables in database            <DBNAME>_<ENV>          to role <SCOPE>_<ENV>_<DBNAME>_READ;
grant references  on     future tables in database            <DBNAME>_<ENV>          to role <SCOPE>_<ENV>_<DBNAME>_READ;

grant select      on     future views in database             <DBNAME>_<ENV>          to role <SCOPE>_<ENV>_<DBNAME>_READ;
grant references  on     future views in database             <DBNAME>_<ENV>          to role <SCOPE>_<ENV>_<DBNAME>_READ;

grant select      on     future external tables in database   <DBNAME>_<ENV>          to role <SCOPE>_<ENV>_<DBNAME>_READ;
grant references  on     future external tables in database   <DBNAME>_<ENV>          to role <SCOPE>_<ENV>_<DBNAME>_READ;
