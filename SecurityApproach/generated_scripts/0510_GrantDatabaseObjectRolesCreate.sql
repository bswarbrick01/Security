/*********************************************************************************************************************************************/
/*  Create Database Level Create across all schemas                                                                                          /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Read Privileges                                               */
/************************************************************************/

use role <SCOPE>_<ENV>_ADMIN;

use database <DBNAME>_<ENV>;

/*****************************/
/*  DB/Schema Usage          */
/*****************************/

grant usage on database                   <DBNAME>_<ENV>                              						to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant usage on all schemas    in database <DBNAME>_<ENV>                              						to role <SCOPE>_<ENV>_<DBNAME>_CREATE;

grant usage on future schemas in database <DBNAME>_<ENV>                              						to role <SCOPE>_<ENV>_<DBNAME>_CREATE;

/*****************************/
/*  Current Privileges       */
/*****************************/

grant create table      				 on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create external table      on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create view      					 on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create materialized view   on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create file format         on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create sequence            on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create function            on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create procedure           on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create pipe                on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create stream              on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create tag                 on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
--grant create task                on    all schemas in database            	 <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;

/*****************************/
/*  Future Privileges        */
/*****************************/

grant create table      				 on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create external table      on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create view      					 on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create materialized view   on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create file format         on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create sequence            on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create function            on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create procedure           on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create pipe                on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create stream              on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
grant create tag                 on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
--grant create task                on    future schemas in database            <DBNAME>_<ENV>       to role <SCOPE>_<ENV>_<DBNAME>_CREATE;
