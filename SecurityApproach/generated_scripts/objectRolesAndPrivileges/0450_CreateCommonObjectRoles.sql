/*********************************************************************************************************************************************/
/*  Create Database Level Read across all schemas                                                                                             /*
/*********************************************************************************************************************************************/
use role SECURITYADMIN;
/************************************************************************/
/*  Role - DROP TESTING ONLY                                            */
/************************************************************************/
drop role if exists <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ											;
drop role if exists <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_WRITE											;
drop role if exists <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML   										;

/************************************************************************/
/*  Create <type> Role READ, WRITE, DML                                 */
/************************************************************************/

/**********************/
/* Read               */
/**********************/

create role if not exists 					<SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ
	comment = 'This object role has read privileges in the specified schema and database';

/**********************/
/* Write              */
/**********************/

create role if not exists 					<SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_WRITE
	comment = 'This object role has write privileges in the specified schema and database';

/**********************/
/* DML                */
/**********************/

create role if not exists 					<SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML
	comment = 'This object role has DML privileges in the specified schema and database';


/************************************************************************/
/*  Create Object Role Hierarchy                                        */
/************************************************************************/
grant role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ			to role  <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_WRITE			;
grant role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_WRITE    to role  <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML        ;
