/*********************************************************************************************************************************************/
/*  Create Functional Roles that span multiple Environents                                                                                   /*
/*********************************************************************************************************************************************/
use ROLE SECURITYADMIN;
/************************************************************************/
/*  Role - DROP TESTING ONLY                                            */
/************************************************************************/
-- drop role if exists SIP_ADMIN											;
-- drop role if exists SIP_DEV_ADMIN									;
-- drop role if exists SIP_QA_ADMIN									;
-- drop role if exists SIP_PROD_ADMIN								;
-- drop role if exists SIP_CONSUMER									;
-- drop role if exists SIP_DOMAIN_ANALYST						;
-- drop role if exists SIP_DEVELOPER  								;
-- drop role if exists SIP_SALES_ANALYST							;
-- drop role if exists SIP_HR_ANALYST								;
-- drop role if exists SIP_DEV_SVC_ETL_INFORMATICA		;
-- drop role if exists SIP_QA_SVC_ETL_INFORMATICA		;
-- drop role if exists SIP_PROD_SVC_ETL_INFORMATICA	;
-- drop role if exists SIP_DEV_SVC_RPT_POWERBI 			;
-- drop role if exists SIP_QA_SVC_RPT_POWERBI        ;
-- drop role if exists SIP_PROD_SVC_RPT_POWERBI      ;
-- drop role if exists SIP_DEV_TASK_OPERATOR         ;
-- drop role if exists SIP_QA_TASK_OPERATOR          ;
-- drop role if exists SIP_PROD_TASK_OPERATOR        ;

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

create role if not exists 					SIP_QA_ADMIN
	comment = 'This functional role has administrtor privileges in QA';

create role if not exists 					SIP_PROD_ADMIN
	comment = 'This functional role has administrtor privileges in Production';

/************************************************************************/
/*  Role - Task Operator                                                */
/************************************************************************/

create role if not exists 					SIP_DEV_TASK_OPERATOR
	comment = 'This functional role has task operator privileges in Development';

create role if not exists 					SIP_QA_TASK_OPERATOR
	comment = 'This functional role has task operator privileges in QA';

create role if not exists 					SIP_PROD_TASK_OPERATOR
	comment = 'This functional role has task operator privileges in Production';

/************************************************************************/
/*  Schema owners will need Managed Grants                              */
/************************************************************************/

grant MANAGE GRANTS on account to role SIP_DEV_ADMIN;
grant MANAGE GRANTS on account to role SIP_QA_ADMIN;
grant MANAGE GRANTS on account to role SIP_PROD_ADMIN;

/************************************************************************/
/*  Role - Consumer Read All                                            */
/************************************************************************/

create role if not exists 					SIP_CONSUMER
	comment = 'This functional role has read access across all objects in all environments';

/************************************************************************/
/*  Role - Domain Read All  - Example                                    */
/************************************************************************/

create role if not exists 					SIP_DOMAIN_ANALYST
	comment = 'This functional role has read access across all objects in data schemas in all environments';

/************************************************************************/
/*  Role - Developer                                                    */
/************************************************************************/

create role if not exists 					SIP_DEVELOPER
	comment = 'This functional role has development access in the Development environment';

/********************************************************************************************************************************************/
/*  Domain Specific Roles - modify as new roles are added                                                                                    /*
/********************************************************************************************************************************************/

create role if not exists 					SIP_SALES_ANALYST
	comment = 'This functional role has read access to Sales Domain data all environments';

create role if not exists 					SIP_HR_ANALYST
	comment = 'This functional role has read access to HR Domain data all environments';

/********************************************************************************************************************************************/
/*  Service Account Specific Roles - modify as new roles are added                                                                          /*
/********************************************************************************************************************************************/

create role if not exists 					SIP_DEV_SVC_ETL_INFORMATICA
	comment = 'This functional role has ETL access in the development environment';

create role if not exists 					SIP_QA_SVC_ETL_INFORMATICA
	comment = 'This functional role has ETL access in the QA environment';

create role if not exists 					SIP_PROD_SVC_ETL_INFORMATICA
	comment = 'This functional role has ETL access in the production environment';



create role if not exists 					SIP_DEV_SVC_RPT_POWERBI
	comment = 'This functional role has read access in the development environment';

create role if not exists 					SIP_QA_SVC_RPT_POWERBI
	comment = 'This functional role has read access in the QA environment';

create role if not exists 					SIP_PROD_SVC_RPT_POWERBI
	comment = 'This functional role has read access in the production environment';


/************************************************************************/
/*  Build Role Hierahcy                                                 */
/************************************************************************/

grant role SIP_ADMIN       										to role SYSADMIN;
grant role SIP_DEV_ADMIN      								to role SIP_ADMIN;
grant role SIP_QA_ADMIN      									to role SIP_ADMIN;
grant role SIP_PROD_ADMIN     								to role SIP_ADMIN;

grant role SIP_DOMAIN_ANALYST           			to role SIP_ADMIN;
grant role SIP_CONSUMER                 			to role SIP_ADMIN;

grant role SIP_DEVELOPER                			to role SIP_DEV_ADMIN;

grant role SIP_DEV_TASK_OPERATOR              to role SIP_DEV_ADMIN;
grant role SIP_QA_TASK_OPERATOR               to role SIP_QA_ADMIN;
grant role SIP_PROD_TASK_OPERATOR             to role SIP_PROD_ADMIN;

-- Domain Roles - modify as new roles are added

grant role SIP_SALES_ANALYST                  to role SIP_DOMAIN_ANALYST;
grant role SIP_HR_ANALYST                     to role SIP_DOMAIN_ANALYST;

-- Service Account Roles  - modify as new roles are added

grant role SIP_DEV_SVC_ETL_INFORMATICA        to role SIP_DEV_ADMIN;
grant role SIP_QA_SVC_ETL_INFORMATICA         to role SIP_QA_ADMIN;
grant role SIP_PROD_SVC_ETL_INFORMATICA       to role SIP_PROD_ADMIN;

grant role SIP_DEV_SVC_RPT_POWERBI            to role SIP_DEV_ADMIN;
grant role SIP_QA_SVC_RPT_POWERBI             to role SIP_QA_ADMIN;
grant role SIP_PROD_SVC_RPT_POWERBI           to role SIP_PROD_ADMIN;
