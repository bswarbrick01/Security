/************************************************************************/
/*  Give ADMIN Compute Ownership Privileges                             */
/************************************************************************/

use role SYSADMIN;

grant create warehouse on account to role SIP_ADMIN;
