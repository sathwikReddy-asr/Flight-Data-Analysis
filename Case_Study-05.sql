--Platform used:Mode.com
--Tables used:tutorial.excel_sql_inventory_data       and            tutorial.excel_sql_transaction_data
--Date:05-07-2025

--Q1: Write a query to join the above tables. Use left join ?
select *                                                                                         --selecting every thing from the tables
from tutorial.excel_sql_inventory_data as a                                                      --giving alias name,table 1
left join tutorial.excel_sql_transaction_data as b                                               --joining(left join) the table and giving alias name,table 2
on a.product_id=b.product_id;                                                                    --giving similar columns in both tables to perform join

--Q2: Find the product which does not sell a single unit ?
select a.*                                                                                       --selecting all data from table 1
from tutorial.excel_sql_inventory_data as a                                                      --giving alias name,table 1
left join tutorial.excel_sql_transaction_data as b                                               --joining(left join) the table and giving alias name,table 2
on a.product_id=b.product_id                                                                     --giving similar columns in both tables to perform join
where b.product_id is null;                                                                      --checking condition for product id is null in table 2

--Q3: Write a query to find how many units are sold per product. Sort the data in terms of unit sold(descending order) ?
select a.product_name,b.product_id, count(*) as units_sold                                        --selecting multiple columns from both the tables and counting the records and giving alias name
from tutorial.excel_sql_inventory_data as a                                                       --giving alias name,table 1
left join tutorial.excel_sql_transaction_data as b                                                --joining(left join) the table and giving alias name,table 2
on a.product_id=b.product_id                                                                      --giving similar columns in both tables to perform join
group by 1,2                                                                                      --grouping the result by product name and product id
order by units_sold desc;                                                                         --arranging the result in descending order

--Q4: Write a query to return product_type and units_sold where product_type is sold more than 50 times ?
select a.product_type,count(b.product_id) as units_sold                                          --selecting the column from table 1 and counting the records in table 2 and giving alias name
from tutorial.excel_sql_inventory_data as a                                                      --giving alias name,table 1
left join tutorial.excel_sql_transaction_data as b                                               --joining(left join) the table and giving alias name,table 2
on a.product_id=b.product_id                                                                     --giving similar columns in both tables to perform join
group by 1                                                                                       --grouping the result by product type
having count(b.product_id)>50;                                                                   --getting the result for product id count is greater than 50 

--Q5: Write a query to return the total revenue generated ?
select a.product_name,a.product_id,a.price_unit,count(b.transaction_id) as units_sold,a.price_unit*count(b.transaction_id) as revenue        --selecting multiple columns from table 1 and counting the records in table 2 and creating the new column and giving alias name
from tutorial.excel_sql_inventory_data as a                                                                                                  --giving alias name,table 1
left join tutorial.excel_sql_transaction_data as b                                                                                           --joining(left join) the table and giving alias name,table 2
on a.product_id=b.product_id                                                                                                                 --giving similar columns in both tables to perform join
where a.price_unit is not null                                                                                                               --checking condition for price unit is not null
group by 1,2,3                                                                                                                               --grouping the result by a.product_name,a.product_id,a.price_unit 
order by revenue desc;                                                                                                                       --sorting the result in descending order

--Q6: Write a query to return the most selling product under product_type = ‘dry goods’ ?
select a.product_type,a.product_name,count(*) as total_count                                    --selecting multile columns from table 1,counting the records and giving alias name
from tutorial.excel_sql_inventory_data as a                                                     --giving alias name,table 1
left join tutorial.excel_sql_transaction_data as b                                              --joining(left join) the table and giving alias name,table 2
on a.product_id=b.product_id                                                                    --giving similar columns in both tables to perform join
where a.product_type='dry_goods'                                                                --checking condition for product  type is equal to dry goods
group by 1,2                                                                                    --grouping the data by product type and product name
order by total_count                                                                            --sorting the result
limit 1;                                                                                        --limiting the output by 1 row

--Q7: Write a query to find the difference between inventory and total sales per product_type ?
select a.product_type,sum(a.current_inventory) as total_inventory,a.price_unit*count(b.transaction_id) as total_sales,sum(a.current_inventory)-count(b.transaction_id) as difference      --selecting columns from table 1 and getting the sum of current inventory and creating new columns and giving alias names
from tutorial.excel_sql_inventory_data as a                                                                                                                                               --giving alias name,table 1
left join tutorial.excel_sql_transaction_data as b                                                                                                                                        --joining(left join) the table and giving alias name,table 2
on a.product_id=b.product_id                                                                                                                                                              --giving similar columns in both tables to perform join
group by 1,a.price_unit;                                                                                                                                                                  --grouping the data by product type and unit price

--Q8: Find the product-wise sales for product_type =’dairy’ ?
select a.product_name,a.product_id,a.price_unit*count(b.transaction_id) as total_sales                    --selecting multiple columns from table 1 and creating the new column and giving alias name
from tutorial.excel_sql_inventory_data as a                                                               --giving alias name,table 1
left join tutorial.excel_sql_transaction_data as b                                                       --joining(left join) the table and giving alias name,table 2
on a.product_id=b.product_id                                                                             --giving similar columns in both tables to perform join
where a.product_type='dairy'                                                                             --checking condition for product  type is equal to dairy
group by 1,2,a.price_unit                                                                                --grouping the result by product name and id and unit price
order by total_sales desc;                                                                               --sorting the data in descending order
