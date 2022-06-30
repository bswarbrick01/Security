/*********************************************************************************************************************************************/
/*  Create Functional Roles that span multiple Environents                                                                                   /*
/*********************************************************************************************************************************************/
-- use ROLE SIP_ADMIN;
--
-- /************************************************************************/
-- /*  Role - DROP TESTING ONLY                                            */
-- /************************************************************************/
drop warehouse if exists SIP_COMPUTE_ADMIN_DFLT_WHSE										;
drop warehouse if exists SIP_COMPUTE_DEV_ADMIN_DFLT_WHSE								;
drop warehouse if exists SIP_COMPUTE_QA_ADMIN_DFLT_WHSE									;
drop warehouse if exists SIP_COMPUTE_PROD_ADMIN_DFLT_WHSE								;
drop warehouse if exists SIP_COMPUTE_CONSUMER_DFLT_WHSE									;
drop warehouse if exists SIP_COMPUTE_DOMAIN_ANALYST_DFLT_WHSE						;
drop warehouse if exists SIP_COMPUTE_DEVELOPER_DFLT_WHSE  							;
drop warehouse if exists SIP_COMPUTE_SALES_ANALYST_DFLT_WHSE						;
drop warehouse if exists SIP_COMPUTE_HR_ANALYST_DFLT_WHSE								;
drop warehouse if exists SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA_DFLT_WHSE	;
drop warehouse if exists SIP_COMPUTE_QA_SVC_ETL_INFORMATICA_DFLT_WHSE		;
drop warehouse if exists SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA_DFLT_WHSE	;
drop warehouse if exists SIP_COMPUTE_DEV_SVC_RPT_POWERBI_DFLT_WHSE 			;
drop warehouse if exists SIP_COMPUTE_QA_SVC_RPT_POWERBI_DFLT_WHSE       ;
drop warehouse if exists SIP_COMPUTE_PROD_SVC_RPT_POWERBI_DFLT_WHSE     ;

use ROLE SECURITYADMIN;
/************************************************************************/
/*  Role - DROP TESTING ONLY                                            */
/************************************************************************/
-- drop role if exists SIP_COMPUTE_ADMIN											;
-- drop role if exists SIP_COMPUTE_DEV_ADMIN									;
-- drop role if exists SIP_COMPUTE_QA_ADMIN									;
-- drop role if exists SIP_COMPUTE_PROD_ADMIN								;
-- drop role if exists SIP_COMPUTE_CONSUMER									;
-- drop role if exists SIP_COMPUTE_DOMAIN_ANALYST						;
-- drop role if exists SIP_COMPUTE_DEVELOPER  								;
-- drop role if exists SIP_COMPUTE_SALES_ANALYST							;
-- drop role if exists SIP_COMPUTE_HR_ANALYST								;
-- drop role if exists SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA		;
-- drop role if exists SIP_COMPUTE_QA_SVC_ETL_INFORMATICA		;
-- drop role if exists SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA	;
-- drop role if exists SIP_COMPUTE_DEV_SVC_RPT_POWERBI 			;
-- drop role if exists SIP_COMPUTE_QA_SVC_RPT_POWERBI        ;
-- drop role if exists SIP_COMPUTE_PROD_SVC_RPT_POWERBI      ;

/************************************************************************/
/*  Create Compute Roles                                                */
/************************************************************************/
create role if not exists SIP_COMPUTE_ADMIN
	comment = 'Default compute role for SIP_COMPUTE_ADMIN'        						;

create role if not exists SIP_COMPUTE_DEV_ADMIN
	comment = 'Default compute role for SIP_COMPUTE_DEV_ADMIN'        				;

create role if not exists SIP_COMPUTE_QA_ADMIN
	comment = 'Default compute role for SIP_COMPUTE_QA_ADMIN'        					;

create role if not exists SIP_COMPUTE_PROD_ADMIN
	comment = 'Default compute role for SIP_COMPUTE_PROD_ADMIN'        				;

create role if not exists SIP_COMPUTE_CONSUMER
	comment = 'Default compute role for SIP_COMPUTE_CONSUMER'        					;

create role if not exists SIP_COMPUTE_DOMAIN_ANALYST
	comment = 'Default compute role for SIP_COMPUTE_DOMAIN_ANALYST'  					;

create role if not exists SIP_COMPUTE_DEVELOPER
	comment = 'Default compute role for SIP_COMPUTE_DEVELOPER'        				;

create role if not exists SIP_COMPUTE_SALES_ANALYST
	comment = 'Default compute role for SIP_COMPUTE_SALES_ANALYST'        		;

create role if not exists SIP_COMPUTE_HR_ANALYST
	comment = 'Default compute role for SIP_COMPUTE_HR_ANALYST'        				;

create role if not exists SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA
	comment = 'Default compute role for SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA'  ;

create role if not exists SIP_COMPUTE_QA_SVC_ETL_INFORMATICA
	comment = 'Default compute role for SIP_COMPUTE_QA_SVC_ETL_INFORMATICA'   ;

create role if not exists SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA
	comment = 'Default compute role for SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA' ;

create role if not exists SIP_COMPUTE_DEV_SVC_RPT_POWERBI
	comment = 'Default compute role for SIP_COMPUTE_DEV_SVC_RPT_POWERBI'      ;

create role if not exists SIP_COMPUTE_QA_SVC_RPT_POWERBI
	comment = 'Default compute role for SIP_COMPUTE_QA_SVC_RPT_POWERBI'       ;

create role if not exists SIP_COMPUTE_PROD_SVC_RPT_POWERBI
	comment = 'Default compute role for SIP_COMPUTE_PROD_SVC_RPT_POWERBI'     ;

/************************************************************************/
/*  Assign warehouse roles to functional roles                          */
/************************************************************************/
grant role SIP_COMPUTE_ADMIN	                            to role SIP_ADMIN;
grant role SIP_COMPUTE_DEV_ADMIN	                        to role SIP_DEV_ADMIN;
grant role SIP_COMPUTE_QA_ADMIN	                          to role SIP_QA_ADMIN;
grant role SIP_COMPUTE_PROD_ADMIN	                        to role SIP_PROD_ADMIN;
grant role SIP_COMPUTE_CONSUMER	                          to role SIP_CONSUMER;
grant role SIP_COMPUTE_DOMAIN_ANALYST	                    to role SIP_DOMAIN_ANALYST;
grant role SIP_COMPUTE_DEVELOPER	                        to role SIP_DEVELOPER;
grant role SIP_COMPUTE_SALES_ANALYST	                    to role SIP_SALES_ANALYST;
grant role SIP_COMPUTE_HR_ANALYST	                        to role SIP_HR_ANALYST;
grant role SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA	          to role SIP_DEV_SVC_ETL_INFORMATICA;
grant role SIP_COMPUTE_QA_SVC_ETL_INFORMATICA	            to role SIP_QA_SVC_ETL_INFORMATICA;
grant role SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA	          to role SIP_PROD_SVC_ETL_INFORMATICA;
grant role SIP_COMPUTE_DEV_SVC_RPT_POWERBI	              to role SIP_DEV_SVC_RPT_POWERBI;
grant role SIP_COMPUTE_QA_SVC_RPT_POWERBI	                to role SIP_QA_SVC_RPT_POWERBI;
grant role SIP_COMPUTE_PROD_SVC_RPT_POWERBI	              to role SIP_PROD_SVC_RPT_POWERBI;


use role SIP_ADMIN;

/************************************************************************/
/*  Create Default Warehouses                                           */
/************************************************************************/

create warehouse if not exists SIP_COMPUTE_ADMIN_DFLT_WHSE 											    with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default warehouse role for SIP_COMPUTE_ADMIN'        					;

create warehouse if not exists SIP_COMPUTE_DEV_ADMIN_DFLT_WHSE 											with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_DEV_ADMIN'        				;

create warehouse if not exists SIP_COMPUTE_QA_ADMIN_DFLT_WHSE 											with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_QA_ADMIN'        					;

create warehouse if not exists SIP_COMPUTE_PROD_ADMIN_DFLT_WHSE 										with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_PROD_ADMIN'        				;

create warehouse if not exists SIP_COMPUTE_CONSUMER_DFLT_WHSE 											with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_CONSUMER'        					;

create warehouse if not exists SIP_COMPUTE_DOMAIN_ANALYST_DFLT_WHSE 				  			with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_DOMAIN_ANALYST'       		;

create warehouse if not exists SIP_COMPUTE_DEVELOPER_DFLT_WHSE 											with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_DEVELOPER'        				;

create warehouse if not exists SIP_COMPUTE_SALES_ANALYST_DFLT_WHSE 									with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_SALES_ANALYST'        		;

create warehouse if not exists SIP_COMPUTE_HR_ANALYST_DFLT_WHSE 										with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_HR_ANALYST'        				;

create warehouse if not exists SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA_DFLT_WHSE 				with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA'  ;

create warehouse if not exists SIP_COMPUTE_QA_SVC_ETL_INFORMATICA_DFLT_WHSE 				with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_QA_SVC_ETL_INFORMATICA'   ;

create warehouse if not exists SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA_DFLT_WHSE 			with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA' ;

create warehouse if not exists SIP_COMPUTE_DEV_SVC_RPT_POWERBI_DFLT_WHSE 				    with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_DEV_SVC_RPT_POWERBI'      ;

create warehouse if not exists SIP_COMPUTE_QA_SVC_RPT_POWERBI_DFLT_WHSE 				    with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_QA_SVC_RPT_POWERBI'       ;

create warehouse if not exists SIP_COMPUTE_PROD_SVC_RPT_POWERBI_DFLT_WHSE 				  with warehouse_size='X-SMALL', initially_suspended=TRUE, auto_suspend=1, auto_resume=TRUE
	comment = 'Default compute role for SIP_COMPUTE_PROD_SVC_RPT_POWERBI'     ;

/************************************************************************/
/*  Assign default warehouses to roles                                  */
/************************************************************************/
grant usage, operate, monitor on warehouse SIP_COMPUTE_ADMIN_DFLT_WHSE				              to role SIP_COMPUTE_ADMIN		  							;
grant usage, operate, monitor on warehouse SIP_COMPUTE_DEV_ADMIN_DFLT_WHSE									to role SIP_COMPUTE_DEV_ADMIN								;
grant usage, operate, monitor on warehouse SIP_COMPUTE_QA_ADMIN_DFLT_WHSE									  to role SIP_COMPUTE_QA_ADMIN								;
grant usage, operate, monitor on warehouse SIP_COMPUTE_PROD_ADMIN_DFLT_WHSE								  to role SIP_COMPUTE_PROD_ADMIN							;
grant usage, operate, monitor on warehouse SIP_COMPUTE_CONSUMER_DFLT_WHSE									  to role SIP_COMPUTE_CONSUMER								;
grant usage, operate, monitor on warehouse SIP_COMPUTE_DOMAIN_ANALYST_DFLT_WHSE						  to role SIP_COMPUTE_DOMAIN_ANALYST					;
grant usage, operate, monitor on warehouse SIP_COMPUTE_DEVELOPER_DFLT_WHSE  								to role SIP_COMPUTE_DEVELOPER								;
grant usage, operate, monitor on warehouse SIP_COMPUTE_SALES_ANALYST_DFLT_WHSE							to role SIP_COMPUTE_SALES_ANALYST						;
grant usage, operate, monitor on warehouse SIP_COMPUTE_HR_ANALYST_DFLT_WHSE								  to role SIP_COMPUTE_HR_ANALYST							;
grant usage, operate, monitor on warehouse SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA_DFLT_WHSE		to role SIP_COMPUTE_DEV_SVC_ETL_INFORMATICA	;
grant usage, operate, monitor on warehouse SIP_COMPUTE_QA_SVC_ETL_INFORMATICA_DFLT_WHSE		  to role SIP_COMPUTE_QA_SVC_ETL_INFORMATICA	;
grant usage, operate, monitor on warehouse SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA_DFLT_WHSE	  to role SIP_COMPUTE_PROD_SVC_ETL_INFORMATICA;
grant usage, operate, monitor on warehouse SIP_COMPUTE_DEV_SVC_RPT_POWERBI_DFLT_WHSE 			  to role SIP_COMPUTE_DEV_SVC_RPT_POWERBI			;
grant usage, operate, monitor on warehouse SIP_COMPUTE_QA_SVC_RPT_POWERBI_DFLT_WHSE         to role SIP_COMPUTE_QA_SVC_RPT_POWERBI			;
grant usage, operate, monitor on warehouse SIP_COMPUTE_PROD_SVC_RPT_POWERBI_DFLT_WHSE       to role SIP_COMPUTE_PROD_SVC_RPT_POWERBI		;
