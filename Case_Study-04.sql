--Platform used:Mode.com
--Tables used:benn.college_football_players   and       benn.college_football_teams 
--Date:28-06-2025

--Q1: Write a query to return player_name, school_name, position, conference from the above dataset ?
select a.player_name,a.school_name,a.position,b.conference                                     --selecting multiple columns from two tables
from benn.college_football_players as a                                                         --giving alias name,table 1
join benn.college_football_teams as b                                                          -- joining the table and giving alias name,table 2
on a.school_name=b.school_name;                                                                --giving similar columns in both tables to perform join

--Q2: Write a query to find the total number of players playing in each conference.Order the output in the descending order of number of players ?
select b.conference,count(*) as total_players                                                    --selecting a column from table 2 and counting all records and giving alias name
from benn.college_football_players as a                                                          --giving alias name,table 1
join benn.college_football_teams as b                                                            --joining the table and giving alias name,table 2
on a.school_name=b.school_name                                                                   --giving similar columns in both tables to perform join
group by 1                                                                                        --grouping the data by conference 
order by total_players desc;                                                                      --sorting the data in descending order

--Q3: Write a query to find the average height of players per division ?
select b.division,avg(height) as average_height                                                    --selecting a column from table 2 and average of height and giving alias name
from benn.college_football_players as a                                                           --giving alias name,table 1
join benn.college_football_teams as b                                                               --joining the table and giving alias name,table 2
on a.school_name=b.school_name                                                                      --giving similar columns in both tables to perform join
group by 1;                                                                                          --grouping the data by division

--Q4: Write a query to return to the conference where average weight is more than 210. Order the output in the descending order of average weight ?
select b.conference,avg(a.weight) as average_weight                                              --selecting a column from table 2 and average weight and giving alias name
from benn.college_football_players as a                                                          --giving alias name,table 1
join benn.college_football_teams as b                                                            --joining the table and giving alias name,table 2
on a.school_name=b.school_name                                                                   --giving similar columns in both tables to perform join
group by 1                                                                                       --grouping the data by conference
having avg(a.weight)>210                                                                          --getting the data of having aberage height is greater than 210
order by average_weight desc;                                                                      --sorting the data in descending order

--Q5: Write a query to return to the top 3 conference with the highest BMI (weight/height) ratio ?
select b.conference,avg(a.weight/a.height) as BMI                                                 --selecting a column from table 2 and average of weight/height and giving alias name
from benn.college_football_players as a                                                          --giving alias name,table 1
join benn.college_football_teams as b                                                            --joining the table and giving alias name,table 2
on a.school_name=b.school_name                                                                   --giving similar columns in both tables to perform join
where a.height is not null and a.height>0                                                        --checking condition for height is not null and greater than 0
group by 1                                                                                       --grouping the data by conference
order by BMI desc                                                                                 --sorting the data in descending order
limit 3;                                                                                           --limiting the output to 3 rows
