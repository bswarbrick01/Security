/*********************************************************************************************************************************************/
/*  Create Functional Roles that span multiple Environents                                                                                   /*
/*********************************************************************************************************************************************/
use ROLE ACCOUNTADMIN;

/************************************************************************/
/*  Grant Execute Task                                                  */
/************************************************************************/

grant execute task 					on account to role SIP_DEV_ADMIN;
grant execute managed task 	on account to role SIP_DEV_ADMIN;

grant execute task 					on account to role SIP_QA_ADMIN;
grant execute managed task 	on account to role SIP_QA_ADMIN;

grant execute task 					on account to role SIP_PROD_ADMIN;
grant execute managed task 	on account to role SIP_PROD_ADMIN;

grant execute task 					on account to role SIP_DEVELOPER;
grant execute managed task 	on account to role SIP_DEVELOPER;
