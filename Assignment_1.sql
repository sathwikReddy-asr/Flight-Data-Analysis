--Platform used:Mode.com
--Table used:tutorial.crunchbase_companies 
--Date:07-06-2025

--Q1: Find the list of unique country codes in the data ?
select distinct (country_code) as unique_country_code                                                   --selecting unique country codes and giving alias name
from tutorial.crunchbase_companies;

--Q2: Find the list of all the companies funded on or after 2009 ?
select *                                                                                                --selecting all columns
from tutorial.crunchbase_companies 
where founded_year>=2009;                                                                                --companies founded on and after 2009

--Q3 : Find the list of all the companies founded before 2015 and have received funding of at least 1 Mn USD or after 2009 ?
select *                                                                                               --selecting all columns
from tutorial.crunchbase_companies 
where founded_year<2015 and (funding_total_usd >=1000000 or founded_year >2009);                       --companies founded before 2015 and received funding atleast 1Mn after 2009

--Q4:	Find the list of all the companies that has funding between 3 to 6 rounds ?
select *                                                                                                --selecting all columns
from tutorial.crunchbase_companies 
where funding_rounds between 3 and 6;                                                                 --companies has funding rounda between 3 and 6

--Q5 : Find the list of all the companies founded in India(IN), the USA(USA), and the Great Britain(GBR) ?
select *                                                                                               --selecting all columns
from tutorial.crunchbase_companies 
where country_code in ('IND','USA','GBR');                                                             --companies founded in IND,USA,GBR using in clause

--Q6: Find the list of all the companies which are either acquired or operating ?
select *                                                                                                 --selecting all columns
from tutorial.crunchbase_companies 
where status='operating' or status= 'acquired';                                                         --companies which are acquired or operating 

select *                                                                                                 --selecting all columns
from tutorial.crunchbase_companies 
where status in ('operating','acquired');                                                                --companies which are acquired or operating using in clause

--Q7: Find the list of all the companies starting with the letter S ?
select *                                                                                               --selecting all columns
from tutorial.crunchbase_companies 
where name like 'S%';                                                                                  --companies starting with letter s

--Q8: Find the list of all the companies founded in the city containing word ‘Park’ ?
select *                                                                                                  --selecting all columns
from tutorial.crunchbase_companies 
where city like '%Park%';                                                                                --company founded city name containg park

--Q9: Find the list of all the companies which are operated outside the USA(USA), Australia(AUS), and Argentina(ARG) ?
select *                                                                                               --selecting all columns
from tutorial.crunchbase_companies 
where country_code not in ('USA','AUS','ARG');                                                         --companies operated outside  USA,AUS,ARG

--Q10: Find the list of all the companies founded after 2015 or have received funding of at least 1 Mn USD ?
select *                                                                                              --selecting all columns
from tutorial.crunchbase_companies 
where founded_year<2015 or funding_total_usd >=1000000;                                               --companies founded after 2015 or received funding atleast 1 Mn usd

--Q11: Find the list of unique country codes in the data excluding the null values ?
select distinct (country_code) as unique_country_code                                                 --selecting unique country codes       
from tutorial.crunchbase_companies
where country_code is not null and country_code<>'';                                                  --country codes with no empty cells and null values
