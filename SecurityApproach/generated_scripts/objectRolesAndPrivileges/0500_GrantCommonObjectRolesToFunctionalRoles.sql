use role SECURITYADMIN;

/************************************************************************/
/*  grant DB object Role to Functional Role                             */
/************************************************************************/
grant role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_READ  to role <SCOPE>_<ROLENAME>			;
grant role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_WRITE to role <SCOPE>_<ROLENAME>			;
grant role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_DML   to role <SCOPE>_<ROLENAME>			;
