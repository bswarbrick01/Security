use role SECURITYADMIN;

/************************************************************************/
/*  grant DB object Role to Functional Role                             */
/************************************************************************/
grant role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_TASK  to role <SCOPE>_DEV_TASK_OPERATOR			;
grant role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_TASK  to role <SCOPE>_QA_TASK_OPERATOR			  ;
grant role <SCOPE>_<ENV>_<DBNAME>_<SCHEMANAME>_TASK  to role <SCOPE>_PROD_TASK_OPERATOR			;
