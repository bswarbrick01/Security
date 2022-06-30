--0100 functional roles

/*********************************************************************************************************************************************/
/*  Create Functional Roles that span multiple Environents                                                                                   /*
/*********************************************************************************************************************************************/
use ROLE SECURITYADMIN;
/************************************************************************/
/*  Role - DROP TESTING ONLY                                            */
/************************************************************************/
-- drop role if exists SIP_ADMIN											;
-- drop role if exists SIP_DEV_ADMIN									;
-- drop role if exists SIP_CONSUMER									;
-- drop role if exists SIP_DEVELOPER  								;
-- drop role if exists SIP_DEV_TASK_OPERATOR         ;

/************************************************************************/
/*  Role - Overall Administrator                                        */
/************************************************************************/

create role if not exists 					SIP_ADMIN
	comment = 'This functional role has administrtor privileges across all environments and inherits environment specific privileges';

/************************************************************************/
/*  Role - Environment Administrator                                    */
/************************************************************************/

create role if not exists 					SIP_DEV_ADMIN
	comment = 'This functional role has administrtor privileges in Development';

/************************************************************************/
/*  Role - Task Operator                                                */
/************************************************************************/

create role if not exists 					SIP_DEV_TASK_OPERATOR
	comment = 'This functional role has task operator privileges in Development';

/************************************************************************/
/*  Schema owners will need Managed Grants                              */
/************************************************************************/

grant MANAGE GRANTS on account to role SIP_DEV_ADMIN;

/************************************************************************/
/*  Role - Consumer Read All                                            */
/************************************************************************/

create role if not exists 					SIP_CONSUMER
	comment = 'This functional role has read access across all objects in all environments';

/************************************************************************/
/*  Role - Developer                                                    */
/************************************************************************/

create role if not exists 					SIP_DEVELOPER
	comment = 'This functional role has development access in the Development environment';


/************************************************************************/
/*  Build Role Hierahcy                                                 */
/************************************************************************/

grant role SIP_ADMIN       										to role SYSADMIN;
grant role SIP_DEV_ADMIN      								to role SIP_ADMIN;

grant role SIP_CONSUMER                 			to role SIP_ADMIN;
grant role SIP_DEVELOPER                			to role SIP_DEV_ADMIN;
grant role SIP_DEV_TASK_OPERATOR              to role SIP_DEV_ADMIN;

-- 0150 assign compute permissions

/************************************************************************/
/*  Give ADMIN Compute Ownership Privileges                             */
/************************************************************************/

use role SYSADMIN;

grant create warehouse on account to role SIP_ADMIN;

-- 0150 assign global privileges

/*********************************************************************************************************************************************/
/*  Create Functional Roles that span multiple Environents                                                                                   /*
/*********************************************************************************************************************************************/
use ROLE ACCOUNTADMIN;

/************************************************************************/
/*  Grant Execute Task                                                  */
/************************************************************************/

grant execute task 					on account to role SIP_DEV_ADMIN;
grant execute managed task 	on account to role SIP_DEV_ADMIN;

grant execute task 					on account to role SIP_DEVELOPER;
grant execute managed task 	on account to role SIP_DEVELOPER;

-- 0200 create compute roles

/*********************************************************************************************************************************************/
/*  Create Functional Roles that span multiple Environents                                                                                   /*
/*********************************************************************************************************************************************/
use ROLE SIP_ADMIN;

/************************************************************************/
/*  Role - DROP TESTING ONLY                                            */
/************************************************************************/
drop warehouse if exists SIP_COMPUTE_ADMIN_DFLT_WHSE										;
drop warehouse if exists SIP_COMPUTE_DEV_ADMIN_DFLT_WHSE								;
drop warehouse if exists SIP_COMPUTE_CONSUMER_DFLT_WHSE									;
drop warehouse if exists SIP_COMPUTE_DEVELOPER_DFLT_WHSE  							;

use ROLE SECURITYADMIN;
/************************************************************************/
/*  Role - DROP TESTING ONLY                                            */
/************************************************************************/
-- drop role if exists SIP_COMPUTE_ADMIN											;
-- drop role if exists SIP_COMPUTE_DEV_ADMIN									;
-- drop role if exists SIP_COMPUTE_CONSUMER									;
-- drop role if exists SIP_COMPUTE_DEVELOPER  								;

/************************************************************************/
/*  Create Compute Roles                                                */
/************************************************************************/
create role if not exists SIP_COMPUTE_ADMIN
	comment = 'Default compute role for SIP_COMPUTE_ADMIN'        						;

create role if not exists SIP_COMPUTE_DEV_ADMIN
	comment = 'Default compute role for SIP_COMPUTE_DEV_ADMIN'        				;

create role if not exists SIP_COMPUTE_CONSUMER
	comment = 'Default compute role for SIP_COMPUTE_CONSUMER'        					;

create role if not exists SIP_COMPUTE_DEVELOPER
	comment = 'Default compute role for SIP_COMPUTE_DEVELOPER'        				;

/************************************************************************/
/*  Assign warehouse roles to functional roles                          */
/************************************************************************/
grant role SIP_COMPUTE_ADMIN	                            to role SIP_ADMIN;
grant role SIP_COMPUTE_DEV_ADMIN	                        to role SIP_DEV_ADMIN;
grant role SIP_COMPUTE_CONSUMER	                          to role SIP_CONSUMER;
grant role SIP_COMPUTE_DEVELOPER	                        to role SIP_DEVELOPER;

use role SIP_ADMIN;

/************************************************************************/
/*  Create Default Warehouses                                           */
/************************************************************************/

create warehouse if not exists SIP_COMPUTE_ADMIN_DFLT_WHSE 											    with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default warehouse role for SIP_COMPUTE_ADMIN'        					;

create warehouse if not exists SIP_COMPUTE_DEV_ADMIN_DFLT_WHSE 											with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_DEV_ADMIN'        				;

create warehouse if not exists SIP_COMPUTE_CONSUMER_DFLT_WHSE 											with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_CONSUMER'        					;

create warehouse if not exists SIP_COMPUTE_DEVELOPER_DFLT_WHSE 											with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_DEVELOPER'        				;

/************************************************************************/
/*  Assign default warehouses to roles                                  */
/************************************************************************/
grant usage, operate, monitor on warehouse SIP_COMPUTE_ADMIN_DFLT_WHSE				              to role SIP_COMPUTE_ADMIN		  							;
grant usage, operate, monitor on warehouse SIP_COMPUTE_DEV_ADMIN_DFLT_WHSE									to role SIP_COMPUTE_DEV_ADMIN								;
grant usage, operate, monitor on warehouse SIP_COMPUTE_CONSUMER_DFLT_WHSE									  to role SIP_COMPUTE_CONSUMER								;
grant usage, operate, monitor on warehouse SIP_COMPUTE_DEVELOPER_DFLT_WHSE  								to role SIP_COMPUTE_DEVELOPER								;

-- 0300 creates databases

/*********************************************************************************************************************************************/
/*  Create Databases based on new requests                                                                                                   /*
/*********************************************************************************************************************************************/
use role SIP_DEV_ADMIN;

/************************************************************************/
/*  Drop - testing Only                                                 */
/************************************************************************/

drop database if exists SALES_DEV;

use role SYSADMIN;

/************************************************************************/
/*  DEV                                                               */
/************************************************************************/

create database if not exists SALES_DEV DATA_RETENTION_TIME_IN_DAYS=1;

grant ownership  on database SALES_DEV      to role SIP_DEV_ADMIN copy current grants;

-- 0400 create schemas

/*********************************************************************************************************************************************/
/*  Create Privileges based on new requests                                                                                                  /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  DEV                                                               */
/************************************************************************/
use role      SIP_DEV_ADMIN;

use database  SALES_DEV;

create schema if not exists DATA with MANAGED ACCESS;

-- 0450 create common object roles

/*********************************************************************************************************************************************/
/*  Create Database Level Read across all schemas                                                                                             /*
/*********************************************************************************************************************************************/
use role SECURITYADMIN;
/************************************************************************/
/*  Role - DROP TESTING ONLY                                            */
/************************************************************************/
drop role if exists SIP_DEV_SALES_DATA_READ											;
drop role if exists SIP_DEV_SALES_DATA_WRITE										;
drop role if exists SIP_DEV_SALES_DATA_DML 											;

/************************************************************************/
/*  Create <type> Role READ, WRITE, DML                                 */
/************************************************************************/

/**********************/
/* Read               */
/**********************/

create role if not exists 					SIP_DEV_SALES_DATA_READ
	comment = 'This object role has read privileges in the specified schema and database';

/**********************/
/* Write              */
/**********************/

create role if not exists 					SIP_DEV_SALES_DATA_WRITE
	comment = 'This object role has write privileges in the specified schema and database';

/**********************/
/* DML                */
/**********************/

create role if not exists 					SIP_DEV_SALES_DATA_DML
	comment = 'This object role has DML privileges in the specified schema and database';


/************************************************************************/
/*  Create Object Role Hierarchy                                        */
/************************************************************************/
grant role SIP_DEV_SALES_DATA_READ			to role  SIP_DEV_SALES_DATA_WRITE			;
grant role SIP_DEV_SALES_DATA_WRITE    to role  SIP_DEV_SALES_DATA_DML        ;

-- 0500 grant object roles to functional roles

use role SECURITYADMIN;

/************************************************************************/
/*  grant DB object Role to Functional Role                             */
/************************************************************************/
grant role SIP_DEV_SALES_DATA_READ  to role SIP_CONSUMER			;
grant role SIP_DEV_SALES_DATA_WRITE to role SIP_DEVELOPER			;
grant role SIP_DEV_SALES_DATA_DML   to role SIP_DEVELOPER			;


--0550 create task object Roles
/*********************************************************************************************************************************************/
/*  Create Database Level Read across all schemas                                                                                             /*
/*********************************************************************************************************************************************/
use role SECURITYADMIN;
/************************************************************************/
/*  Role - DROP TESTING ONLY                                            */
/************************************************************************/
drop role if exists SIP_DEV_SALES_DATA_TASK											;

/************************************************************************/
/*  Create Task Roles                                                   */
/************************************************************************/


create role if not exists 					            SIP_DEV_SALES_DATA_TASK
	comment = 'This object role has Task privileges in the specified schema and database';

-- 0570 grant task object roles to functional Roles
use role SECURITYADMIN;

/************************************************************************/
/*  grant DB object Role to Functional Role                             */
/************************************************************************/
grant role SIP_DEV_SALES_DATA_TASK  to role SIP_DEV_TASK_OPERATOR			;

-- 0600 create read privileges

/*********************************************************************************************************************************************/
/*  Create Database Level Read across all schemas                                                                                             /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Read Privileges                                               */
/************************************************************************/

use role SIP_DEV_ADMIN;

use database SALES_DEV;

use schema   DATA;

/*****************************/
/*  DB/Schema Usage          */
/*****************************/

grant usage on database                   SALES_DEV                          to role SIP_DEV_SALES_DATA_READ;
grant usage on schema                     DATA                            to role SIP_DEV_SALES_DATA_READ;

/*****************************/
/*  Current Privileges       */
/*****************************/

grant select      on    all tables in schema                   DATA       to role SIP_DEV_SALES_DATA_READ;
grant references  on    all tables in schema                   DATA       to role SIP_DEV_SALES_DATA_READ;

grant select      on    all views in schema                    DATA       to role SIP_DEV_SALES_DATA_READ;
grant references  on    all views in schema                    DATA       to role SIP_DEV_SALES_DATA_READ;

grant select      on    all materialized views in schema       DATA       to role SIP_DEV_SALES_DATA_READ;
grant references  on    all materialized views in schema       DATA       to role SIP_DEV_SALES_DATA_READ;

grant select      on    all external tables in schema          DATA       to role SIP_DEV_SALES_DATA_READ;
grant references  on    all external tables in schema          DATA       to role SIP_DEV_SALES_DATA_READ;

grant select      on    all streams in schema                  DATA       to role SIP_DEV_SALES_DATA_READ;

grant usage       on    all functions in schema                 DATA       to role SIP_DEV_SALES_DATA_READ;

/*****************************/
/*  Future Privileges        */
/*****************************/

grant select      on    future tables in schema                DATA       to role SIP_DEV_SALES_DATA_READ;
grant references  on    future tables in schema                DATA       to role SIP_DEV_SALES_DATA_READ;

grant select      on    future views in schema                 DATA       to role SIP_DEV_SALES_DATA_READ;
grant references  on    future views in schema                 DATA       to role SIP_DEV_SALES_DATA_READ;

grant select      on    future materialized views in schema    DATA       to role SIP_DEV_SALES_DATA_READ;
grant references  on    future materialized views in schema    DATA       to role SIP_DEV_SALES_DATA_READ;

grant select      on    future external tables in schema       DATA       to role SIP_DEV_SALES_DATA_READ;
grant references  on    future external tables in schema       DATA       to role SIP_DEV_SALES_DATA_READ;

grant select      on    future streams in schema               DATA       to role SIP_DEV_SALES_DATA_READ;

grant usage       on    future functions in schema             DATA       to role SIP_DEV_SALES_DATA_READ;

-- 0610 create dml privileges

/*********************************************************************************************************************************************/
/*  Create Database Level Create across all schemas                                                                                          /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Read Privileges                                               */
/************************************************************************/

use role SIP_DEV_ADMIN;

use database SALES_DEV;
use schema   DATA;

/*****************************/
/*  DB/Schema Usage          */
/*****************************/

grant usage on database                   SALES_DEV         				to role SIP_DEV_SALES_DATA_DML;
grant usage on schema                     DATA                      to role SIP_DEV_SALES_DATA_DML;

/*****************************/
/*  Base Privileges          */
/*****************************/

grant create table      				 on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant create external table      on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant create view      					 on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant create materialized view   on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant create file format         on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant create sequence            on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant create function            on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant create procedure           on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant create stream              on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;

/*****************************/
/*  Task Privileges          */
/*****************************/

grant create task                on    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant monitor on all tasks       in    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;
grant monitor on future tasks    in    schema            	 DATA      to role SIP_DEV_SALES_DATA_DML;

-- 0700 create task privileges

/*********************************************************************************************************************************************/
/*  Create Task Level privileges in specified schemas                                                                                        /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Task Privileges                                               */
/************************************************************************/

use role SIP_DEV_ADMIN;

use database SALES_DEV;
use schema   DATA;

/*****************************/
/*  DB/Schema Usage          */
/*****************************/

grant usage on database                   SALES_DEV         				 to role SIP_DEV_TASK_OPERATOR;
grant usage on schema                     DATA                       to role SIP_DEV_TASK_OPERATOR;

/*****************************/
/*  Task Privileges          */
/*****************************/

grant monitor on all tasks       in    schema            	 DATA      to role SIP_DEV_TASK_OPERATOR;
grant monitor on future tasks    in    schema            	 DATA      to role SIP_DEV_TASK_OPERATOR;

grant operate on all tasks       in    schema            	 DATA      to role SIP_DEV_TASK_OPERATOR;
grant operate on future tasks    in    schema            	 DATA      to role SIP_DEV_TASK_OPERATOR;
