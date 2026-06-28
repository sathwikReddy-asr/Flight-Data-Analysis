--Platform used:Mode.com
--Table used:tutorial.crunchbase_companies
--Date:24-06-2025

--Q1: Find the top 5 countries(country code) with the highest number of operating companies. Ensure the country code is not null ?
select country_code,count(*) as total_count                                                                                --selecting a column and counting all records in data and giving alias name 
from tutorial.crunchbase_companies 
where status='operating' and country_code is not null                                                                       --checking condition for status is equal to operating and country_code is not null
group by 1                                                                                                                   --grouping by country_code
order by total_count desc                                                                                                    --sorting the output in descending order
limit 5;                                                                                                                      --limiting the output for 5 rows

--Q2: How many companies have no country code available in the dataset ?
select count(*) as total_companies_with_no_country_code                                                                       --counting all records in table and giving alias name
from tutorial.crunchbase_companies 
where country_code is null;                                                                                                     --checking condition for country_code is null

--Q3: Find the number of companies starting with letter ‘g’ founded in France(FRA) and still operational(status = operating) ?
select count(*) as total_no_of_companies                                                                                       --counting all records in table and giving alias name
from tutorial.crunchbase_companies 
where name like 'g%' and status='operating' and country_code='FRA';                                                             --checking condition for name starts with g and status is equal to operating and country_code is equal to fra

--Q4: How many advertising, founded after 2003, are acquired ?
select count(*) as total_count                                                                                                       --counting all records in table and giving alias name
from tutorial.crunchbase_companies
where status='acquired' and founded_year>2003 and category_code='advertising';                                                        --checking condition for status is equal to operating and founded year is greter than 2003 and category is equal to advertising

--Q5: Calculated the average funding_total_usd per company for the companies founded in the software, education, and analytics category ?
select category_code,avg(funding_total_usd) as average_funding_total_usd                                                         --selecting a column and average of fundinf total usd and giving alias name
from tutorial.crunchbase_companies
where category_code in ('software','education','analytics') and funding_total_usd is not null                                    --checking condition for country code is equal to software,education and analytics and funding total usd is not null
group by 1;                                                                                                                       --grouping by category code

--Q6: Find the city having more than 50 closed companies. Return the city and number of companies closed ?
select city,count(*) as total_companies_closed                                                                                 --selecting a column and counting all records in table
from tutorial.crunchbase_companies
where status='closed'                                                                                                           --checking condition for status is equal to closed
group by 1                                                                                                                      --grouping the data by city
having count(*)>50;                                                                                                             --getting the data where count is greater than 50

--Q7: Find the number of bio-tech companies who are founded after 2000 and either have more than 1Mn funding or have ipo and secured more than 1 round of funding ?
select count(*) as total_count                                                                                                  --counting all records in table and giving alias name
from tutorial.crunchbase_companies
where category_code='biotech' and founded_year>2000 and (funding_total_usd >1000000 or (status='ipo' and funding_rounds>1));      --checking condition for category code is equal to biotech and founded year is greater than 2000 and either have more than 1Mn funding or have ipo and secured more than 1 round of funding

--Q8: Find all number of all acquired companies founded between 1980 and 2005 and founded in the city ending with the word ‘city’. Return the city name and number of acquired companies ?
select city,count(*) as total_count                                                                                              --selecting city and counting all records and giving alias name
from tutorial.crunchbase_companies
where status='acquired' and founded_year between 1980 and 2005 and lower(city) like '%city'                                      --checking condition for status is equal to acquired and founded year between 1980 and 2005 and name containing city
group by 1;                                                                                                                      --grouping by city

--Q9: Find the number of ‘hardware’ companies founded outside ‘USA’ and did not take any funding. Return the country code and number of hardware companies in descending order ?
select country_code,count(*) as total_count                                                                                     --selecting a column and counting all records and giving alias name
from tutorial.crunchbase_companies
where category_code='hardware' and country_code not in ('USA') and (funding_total_usd is null or funding_total_usd=0)           --checking condition for category code is equal to hardware and outside usa nd did not take any funding
group by 1                                                                                                                      --grouping by country code
order by total_count desc;                                                                                                      --sorting the data in descending order

--Q10: Find the 5 most popular company category(category with highest companies) across the city Singapore, Shanghai, and Bangalore. Return category code and number of companies ?
select category_code,count(*) as total_count                                                                                     --selecting category code and counting all recods and giving alias name
from tutorial.crunchbase_companies 
where city in('Singapore','Shanghai','Bangalore')                                                                                --checking condition for city is equal to singapore,shanghai and bangalore
group by 1                                                                                                                       --grouping by category code
order by total_count desc                                                                                                        --sorting the data in descending order
limit 5;                                                                                                                         --limiting the output for 5 rows
