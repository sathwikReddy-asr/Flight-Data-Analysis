--Platform used:Mode.com
--Table used:tutorial.oscar_nominees
--Date:17 jun 2025

--Q1: Write a query to display all the records in the table tutorial.oscar_nominees ?
select * from tutorial.oscar_nominees;                                                                                                        --selecting all records from table                   

--Q2: Write a query to find the distinct values in the ‘year’ column ?
select distinct (year) as distinct_values                                                                                                     --selecting unique years and giving alias name
from tutorial.oscar_nominees;

--Q3: Write a query to filter the records from year 1999 to year 2006 ?
select *                                                                                                                                     --selecting all records from table  
from tutorial.oscar_nominees
where year between 1999 and 2006;                                                                                                            --years  between 1999 and 2006

--Q4: Write a query to filter the records for either year 1991 or 1998 ?
select *                                                                                                                                      --selecting all records from table  
from tutorial.oscar_nominees 
where year =1991 or year=1998;                                                                                                              --year is 1991 or 1998

select *                                                                                                                                     --selecting all records from table  
from tutorial.oscar_nominees 
where year in (1991,1998);                                                                                                                     --using in clause for year is 1991 (or)1998

--Q5: Write a query to return the winner movie name for the year of 1997 ?
select movie                                                                                                                                 --selecting movie column from table
from tutorial.oscar_nominees 
where year=1997 and winner=true;                                                                                                              --checking condition for year is equal to 1997 and winner iis true

--Q6: Write a query to return the winner in the ‘actor in a leading role’ and ‘actress in a leading role’ category for the year of 1994,1980, and 2008 ?
select year,category,nominee                                                                                                                     --selecting year,category and nominee columns from table
from tutorial.oscar_nominees 
where year in (1994,1980,2008) and category in ('actor in a leading role','actress in a leading role') and winner=True;                          --checking conditions for winner is true and using in clause for years 1994,1980 and 2008 and for 'actor in a leading role','actress in a leading role' 

--Q7: Write a query to return the name of the movie starting from letter ‘A’ ?
select movie                                                                                                                                     --selecting movie column from table
from tutorial.oscar_nominees 
where movie like 'A%';                                                                                                                           --selecting movies starts with 'A'

--Q8: Write a query to return the name of movies containing the word ‘the’ ?
select movie                                                                                                                                     --selecting movie column from table
from tutorial.oscar_nominees 
where movie like '%the%';                                                                                                                        --selecting movie name containing 'the'  

--Q9: Write a query to return all the records where the nominee name starts with “C” and ends with “r” ?
select nominee                                                                                                                                 --selecting nominee column from table
from tutorial.oscar_nominees 
where nominee like 'C%r';                                                                                                                     --selecting nominee name that starts with 'C' and ends with 'r'

--Q10: Write a query to return all the records where the movie was released in 2005 and movie name does not start with ‘a’ and ‘c’ and nominee was a winner ?
select *                                                                                                                                     --selecting all columns from table
from tutorial.oscar_nominees 
where year=2005 and winner='true'and movie not like 'A%' and movie not like 'C%';                                                           --checking conditions for year iq equal to 2005 and winner is equal to true and movie names not start with 'A' AND 'C'
