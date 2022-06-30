/*********************************************************************************************************************************************/
/*  Create Task Level privileges in specified schemas                                                                                        /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Task Privileges                                               */
/************************************************************************/

use role <SCOPE>_<ENV>_ADMIN;

use database <DBNAME>_<ENV>;
use schema   <SCHEMANAME>;

/*****************************/
/*  DB/Schema Usage          */
/*****************************/

grant usage on database                   <DBNAME>_<ENV>         						 to role <SCOPE>_<ENV>_TASK_OPERATOR;
grant usage on schema                     <SCHEMANAME>                       to role <SCOPE>_<ENV>_TASK_OPERATOR;

/*****************************/
/*  Task Privileges          */
/*****************************/

grant monitor on all tasks       in    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_TASK_OPERATOR;
grant monitor on future tasks    in    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_TASK_OPERATOR;

grant operate on all tasks       in    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_TASK_OPERATOR;
grant operate on future tasks    in    schema            	 <SCHEMANAME>      to role <SCOPE>_<ENV>_TASK_OPERATOR;
