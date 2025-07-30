--Platform used:Mode.com
--Tables used:tutorial.playbook_users    and   tutorial.sales_performance
--Date:28-07-2025

--Q1: What percentage of users are in ‘pending’ state ?
select
round(100.0*count(case when state='pending' then 1 end)/count(*),2) as pending_percentage                 --using case when statements and rounding to get the percentage of users are in pending state
from tutorial.playbook_users;

--Q2: Find the language with the maximum ‘active’ state percentage ?
select language,round(100.0*count(case when state='acive' then 1 end)/count(*),2) as active_percentage   --selecting the column and using case when statement and rounding to get language with maximum active state
from tutorial.playbook_users
group by 1                                                                                               --grouping the data by language
order by active_percentage                                                                               --sorting the data by active_percentage in ascending order
limit 1;                                                                                                 --limiting the output by one 

--Q3: Find the percentage of user(out of total dataset) per company ?
select company_id,round(100.0*count(*)/(select count(*) from tutorial.playbook_users),2) as user_percentage  --selecting a column and using case when statement and rounding to get percentage of user per company
from tutorial.playbook_users
group by 1;                                                                                                  --grouping the result by company_id

--Q4: Write a query to return all the records where sales_revenue is less than the average sales_revenue made by salesperson whose name starts with T. Output should not contain the records of salesperson whose name starts with T ?
select *                                                                                                    --selecting everything from data
from tutorial.sales_performance
where sales_revenue <                                                                                       --giving condition using sub-query to find the sales_revenue is less than avg_sales_revenue
(select avg(sales_revenue) 
from tutorial.sales_performance
where salesperson like 'T%');                                                                               --giving condition in sub-query that salesperson name starts with T
