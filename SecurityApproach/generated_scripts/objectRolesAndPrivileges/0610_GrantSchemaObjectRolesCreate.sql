/*********************************************************************************************************************************************/
/*  Create Database Level Create across all schemas                                                                                          /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Write Privileges                                              */
/************************************************************************/

use role <SCOPE>_<ENV>_ADMIN;

use database <DBNAME>_<ENV>;
use schema   <SCHEMANAME>;

/*****************************/
/*  DB/Schema Usage          */
/*****************************/

grant usage on database                   <DBNAME>_<ENV>         						to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant usage on schema                     <SCHEMANAME>                      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;

/*****************************/
/*  Base Privileges          */
/*****************************/

grant create table      				 on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant create external table      on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant create view      					 on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant create materialized view   on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant create file format         on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant create sequence            on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant create function            on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant create procedure           on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant create stream              on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;

/*****************************/
/*  Task Privileges          */
/*****************************/

grant create task                on    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant monitor on all tasks       in    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
grant monitor on future tasks    in    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML;
