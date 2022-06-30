/*********************************************************************************************************************************************/
/*  Create Database Level Create across all schemas                                                                                          /*
/*********************************************************************************************************************************************/

/************************************************************************/
/*  Apply Read Privileges                                               */
/************************************************************************/

use role SIP_DEV_ADMIN;

use database SALES_DEV;
use schema   STAGING;

grant create task                on    schema            	 STAGING      to role SIP_DEV_SALES_STAGING_CREATE;
grant monitor                on    all tasks in schema            	 STAGING      to role SIP_DEV_SALES_STAGING_CREATE;


use role securityadmin;
drop database sales_dev;


-- as developer create tables and tests

use role sip_developer;

create or replace table sales_dev.data.t1 (col1 text);


create or replace task sales_dev.data.mytask
warehouse = sip_compute_developer_dflt_whse
  SCHEDULE = '1 minute'

AS
insert into sales_dev.data.t1 values ('XXXXX');

show tasks;

desc task sales_dev.data.mytask;

select get_ddl('task','sales_dev.staging.mytask');

-- try execute

execute task sales_dev.data.mytask;

-- try start task

alter task sales_dev.data.mytask resume;
alter task sales_dev.data.mytask suspend;

-- add permissions to task owner

use role accountadmin;
grant execute task on account to role sip_developer;

select *
  from table(information_schema.task_history())
  order by scheduled_time;



select * from sales_dev.data.t1

-- operator

use role securityadmin;
create role sip_dev_task_operator;
grant role sip_dev_task_operator to user bswarbrick;

use role SIP_DEV_ADMIN;

grant usage on database sales_dev to role sip_dev_task_operator;
grant usage on schema sales_dev.staging to role sip_dev_task_operator;


grant monitor                on    all tasks in schema            	 STAGING      to role sip_dev_task_operator;
grant operate                on    all tasks in schema            	 STAGING      to role sip_dev_task_operator;


-- try execute

use role sip_dev_task_operator;

execute task sales_dev.data.mytask;

-- try start task

alter task sales_dev.data.mytask resume;
alter task sales_dev.data.mytask suspend;

show tasks;
